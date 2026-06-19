---
description: پرامپت استوری‌بورد — Secondary deliverable. Per-shot STILL-IMAGE prompts (pencil/ink storyboard panels) for Bing Image Creator, Leonardo, Krea, Flux, Ideogram. Less important than /prompt-video — these are storyboard frames, not the final film.
argument-hint: [project-slug] [optional: style: pencil-ink | comic | noir | watercolor | graphic-novel | realistic]
---

Invoke **daastansaraa** to generate per-shot **storyboard image** prompts. This is a **secondary** deliverable. The most important file is the one written by `/prompt-video`. This file produces a storyboard's-worth of stills for previz, pitch decks, and key-frames — it does NOT generate the final video prompts.

Inputs:
- Slug: `$1`.
- Style: `$2` (default `pencil-ink` — Hollywood preproduction sketch look).

Output file: **`output/prompt/$1-storyboard-prompts.md`** (secondary, paired with the primary `$1-video-prompts.md`).

Steps:
1. Read the shotlist at `output/storybord/$1/shotlist.md`. If absent, halt and direct user to `/storybord`.
2. Read `output/shakhsiat/$1.md` for the **character anchor phrase** (paste verbatim per panel for face continuity across stills).
3. Read `danesh/$1-research.md` for period anchors.
4. Generate `output/prompt/$1-storyboard-prompts.md` with one **still-image prompt block per shot**:

   ```markdown
   ## Shot NN — Scene M / Shot X

   ### Storyboard Image Prompt (EN)
   > <Style prefix — e.g. "Hollywood storyboard panel, hand-drawn pencil-and-ink comic book art, dramatic shading, professional film preproduction sketch:">
   > <Shot size + framing> <character anchor phrase verbatim> <action posture, frozen moment> <setting + period anchors> <light direction + quality> <lens equivalent, depth> <mood in one phrase> <style refs: Kiarostami, Vermeer, Salgado, etc.> <aspect>, no text overlay, no watermark.

   **Seed**: <integer, increment per shot>
   **راهنمای فارسی**: <2-line Farsi description of what the panel shows>

   **Where to paste** (free still-image generators):
   - Bing Image Creator (DALL·E 3) — copilot.microsoft.com/images
   - Leonardo AI free — storyboard style preset works well
   - Krea AI free
   - Flux Schnell on HuggingFace Spaces
   - Ideogram — handles Persian script in panels acceptably
   ```

5. **Top-of-file preamble**: style choice, character anchor phrase (paste verbatim), aspect, seed range, brief 3-line "how to use" in EN + FA.
6. **Bottom-of-file note**: which engines render Persian calligraphy best (Bing, Ideogram), recommended generation size (1920x1080 then crop to 2.39:1 in post), and a reminder that these are STORYBOARD STILLS — for the actual video, use the prompts in `output/prompt/$1-video-prompts.md`.
7. Surface the file via `SendUserFile`. Headline it as: **"Storyboard image prompts (secondary). The primary file is `$1-video-prompts.md`."**
8. Summary ≤3 lines.

### Quality bar
- Every panel includes the character anchor phrase verbatim — generators key on the exact wording for face continuity.
- Style prefix is identical across all panels so the storyboard reads as one artist's hand.
- Period anchors prevent anachronism (no modern objects, no Latin signage if period is pre-1979 Iran, etc.).
- The style is **drawing**, not photo — explicitly request "hand-drawn pencil-and-ink", "no photorealism", "comic book line art" so stills don't drift into photo realism (that's the video file's job).

Use the **daastansaraa** sub-agent.
