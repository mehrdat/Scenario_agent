#!/usr/bin/env python3
"""
render-local.py — render storyboard panels locally with Stable Diffusion.

Uses HuggingFace `diffusers` (free Python library, no API key) and a free
open-weight model. Runs on your own GPU (or slow on CPU).

Setup (one-time, in a fresh venv):
    pip install diffusers transformers accelerate torch pillow

Usage:
    python tools/render-local.py <prompts.tsv> [model] [width] [height]

Models (any HuggingFace model id):
    black-forest-labs/FLUX.1-schnell    (default, fast Flux, ~12GB VRAM)
    stabilityai/stable-diffusion-xl-base-1.0    (SDXL, ~10GB VRAM)
    runwayml/stable-diffusion-v1-5      (SD1.5, ~4GB VRAM, low VRAM fallback)

Input TSV:
    panel_id<TAB>prompt<TAB>seed

Output:
    <dir>/panels/panel-NN.jpg
"""

import sys
import os
import csv
from pathlib import Path

def main():
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)

    prompts_file = Path(sys.argv[1])
    model_id = sys.argv[2] if len(sys.argv) > 2 else "black-forest-labs/FLUX.1-schnell"
    width = int(sys.argv[3]) if len(sys.argv) > 3 else 1024
    height = int(sys.argv[4]) if len(sys.argv) > 4 else 576

    if not prompts_file.exists():
        print(f"ERROR: {prompts_file} not found", file=sys.stderr)
        sys.exit(1)

    out_dir = prompts_file.parent / "panels"
    out_dir.mkdir(exist_ok=True)

    try:
        import torch
        from diffusers import DiffusionPipeline
    except ImportError:
        print("ERROR: missing dependencies. Install with:")
        print("  pip install diffusers transformers accelerate torch pillow")
        sys.exit(2)

    device = "cuda" if torch.cuda.is_available() else ("mps" if torch.backends.mps.is_available() else "cpu")
    dtype = torch.float16 if device != "cpu" else torch.float32

    print(f"Loading {model_id} on {device}...", flush=True)
    pipe = DiffusionPipeline.from_pretrained(model_id, torch_dtype=dtype)
    pipe = pipe.to(device)
    if device == "cuda":
        try: pipe.enable_xformers_memory_efficient_attention()
        except Exception: pass

    rows = []
    with open(prompts_file) as f:
        for line in f:
            line = line.rstrip("\n")
            if not line or line.startswith("#"): continue
            parts = line.split("\t")
            if len(parts) < 2: continue
            panel_id = parts[0]
            prompt = parts[1]
            seed = int(parts[2]) if len(parts) > 2 and parts[2] else 42
            rows.append((panel_id, prompt, seed))

    print(f"Rendering {len(rows)} panels at {width}x{height}...")
    for i, (panel_id, prompt, seed) in enumerate(rows, 1):
        out_path = out_dir / f"panel-{panel_id}.jpg"
        if out_path.exists() and out_path.stat().st_size > 5000:
            print(f"[{i}/{len(rows)}] panel-{panel_id} already exists, skipping")
            continue

        print(f"[{i}/{len(rows)}] panel-{panel_id} ...", flush=True)
        generator = torch.Generator(device=device).manual_seed(seed)
        try:
            kwargs = {"prompt": prompt, "width": width, "height": height, "generator": generator}
            # Flux schnell uses fewer steps
            if "schnell" in model_id.lower():
                kwargs["num_inference_steps"] = 4
                kwargs["guidance_scale"] = 0.0
            else:
                kwargs["num_inference_steps"] = 28
                kwargs["guidance_scale"] = 7.0
                kwargs["negative_prompt"] = "low quality, blurry, watermark, text, signature, distorted faces, extra limbs"
            image = pipe(**kwargs).images[0]
            image.save(out_path, "JPEG", quality=88)
            print(f"    saved {out_path.name} ({out_path.stat().st_size // 1024} KB)")
        except Exception as e:
            print(f"    FAILED: {e}", file=sys.stderr)

    print("Done.")

if __name__ == "__main__":
    main()
