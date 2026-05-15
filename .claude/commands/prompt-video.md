---
description: پرامپت ویدئو — Generate AI-video prompts (EN + Farsi gloss) per shot for free generators (Hailuo, Kling, Pika, Runway free, Luma free, Sora-via-Bing, Veo limited, Wan, Pixverse).
argument-hint: [project-slug] [optional: target engine: hailuo | kling | pika | runway | luma | sora | veo | wan | pixverse | all]
---

Invoke **daastansaraa** to generate per-shot AI-video prompts.

Inputs:
- Slug: `$1`.
- Target engine: `$2` (default `all` — produce a portable prompt + per-engine tweaks).

Steps:
1. Read the shotlist at `output/storybord/$1/shotlist.md`. If absent, halt and direct user to `/storybord`.
2. Read character bible for silhouettes / costume palettes.
3. Read `danesh/$1-research.md` for setting & lexicon.
4. Generate `output/prompt/$1.md` with one block per shot:

   ```markdown
   ## Shot NN — Scene M / Panel P

   **EN prompt**
   > [Subject], [action], [setting + period], shot on [lens] [shot-size], [camera move], [light + colour palette], [mood], [style ref], aspect [16:9 / 9:16], duration [Ns].

   **Negative**
   > [watermark, text overlay, distortion, extra fingers, blurry, low-res, cartoonish-if-not-wanted].

   **فارسی (راهنما)**
   > <Farsi gloss of the same scene description for human reference>

   **Where to paste**
   - Hailuo:   <url + tip>
   - Kling:    <url + tip>
   - Pika:     <url + tip>
   - Runway:   <url + tip>
   - Luma:     <url + tip>
   - Sora:     via Bing Video Creator
   - Wan/Pixverse/Veo: <url + tip>
   ```

5. Top of file: a **"how to use" preamble** and a **free-credit reminder** ("Hailuo gives N free generations/day", etc.) — values approximate, mark `[verify current limits]`.
6. Bottom of file: a **portable still-image prompt set** for Bing Image Creator / Leonardo / Krea / Flux-on-HF for any shots the user wants as key frames instead of video.
7. Summary ≤4 lines.

Use the **daastansaraa** sub-agent.
