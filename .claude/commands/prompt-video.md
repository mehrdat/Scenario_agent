---
description: پرامپت ویدئو — THE FINAL & MOST IMPORTANT DELIVERABLE. Per-shot AI-video prompts in extreme detail (camera, lens, light, color, motion, subject blocking, what must / must-not be visible) for free generators (Hailuo, Kling, Pika, Runway free, Luma free, Sora-via-Bing, Veo limited, Wan, Pixverse).
argument-hint: [project-slug] [optional: target engine: hailuo | kling | pika | runway | luma | sora | veo | wan | pixverse | all]
---

Invoke **daastansaraa** to generate per-shot AI-video prompts. **This is the final and most important file in the entire chain.** Treat it accordingly — depth and discipline over speed.

Inputs:
- Slug: `$1`.
- Target engine: `$2` (default `all` — produce a portable prompt + per-engine tweaks).

Output file: **`output/prompt/$1-video-prompts.md`** (the single most important artifact of the project).

Steps:
1. Read the shotlist at `output/storybord/$1/shotlist.md`. If absent, halt and direct user to `/storybord` (or `/negaareh` if user prefers a drawn board first).
2. Read `output/senaario/$1/05-scenes.md` and `06-filmnaameh.md` for ground-truth action, dialogue, mood, and beat function.
3. Read `output/shakhsiat/$1.md` for silhouettes, wardrobe palettes, age, gait, distinguishing marks, dialect / speech rhythm.
4. Read `danesh/$1-research.md` for period, setting, architecture, props, lexicon, climate, light quality.
5. Read `output/storybord/$1/board-*.svg` (or `output/negaareh/$1/prompts.md`) to anchor framing decisions visually.
6. Generate `output/prompt/$1-video-prompts.md` with one **detailed block per shot** in the shotlist. Each block MUST include every item below — no skipping fields:

   ```markdown
   ## Shot NN — Scene M / Shot X
   **Scene function**: <one line — what this shot does for the story>
   **Duration**: <Ns>   **Aspect**: <16:9 / 9:16 / 2.39:1 / 1:1>

   ### PRIMARY VIDEO PROMPT (Universal / Portable)
   > <Subject (full character anchor phrase from shakhsiat) + wardrobe + period.>
   > <Action — exactly what they do, broken into temporal beats: at 0s …, at 3s …, at 6s …>
   > <Setting — period, location, architecture, key props in frame, what is in foreground / mid-ground / background.>
   > <Camera position — height (eye-level / low / overhead / dutch), distance, angle in degrees if relevant.>
   > <Lens — 24mm / 35mm / 50mm / 85mm / 135mm equivalent, depth of field shallow|deep.>
   > <Shot size — XLS / LS / MLS / MS / MCU / CU / ECU.>
   > <Camera move — static | pan L→R | tilt up | dolly in 1.5m over 6s | track lateral with subject | crane up | handheld breath | rack focus FG→BG.>
   > <Speed — real-time | slow-motion 1/2x | very slow 1/4x | slight fast 1.25x.>
   > <Light — direction (upper-left 30°), quality (hard sun / soft overcast / motivated oil-lamp / blue pre-dawn ambient), color temp (2700K / 5600K / mixed), key/fill ratio.>
   > <Color palette — explicit hex or named: "cool blue-grey shadows, warm amber lamp accent, deep black chador, weathered olive skin".>
   > <Textures — fabric (matte cotton / silk sheen / wool nap), surface (rough adobe, polished tile, dust on flagstone, peeling paint), grain (35mm film fine, 16mm coarser).>
   > <Subject motion — slow deliberate | trembling | held still | one slow blink | fingers tightening.>
   > <Atmosphere — dust in light shafts | breath visible | wind moving curtain at 1Hz | distant call to prayer (mood, not audio).>
   > <Mood / tonal direction in 1 phrase.>
   > <Style references — directors, painters, photographers, period of cinema. e.g. "in the style of Abbas Kiarostami composure, Vermeer interior light, Salgado tonal range".>
   > <Photoreal anchors — "photorealistic 4K, fine 35mm grain, cinematic depth of field, accurate skin pores, no plastic shading".>

   ### MUST BE VISIBLE
   - <Explicit items that have to land in frame — e.g. "the wooden chair empty in mid-ground", "the folded letter weighted by a grey river-stone", "the chador moving once in breeze">

   ### MUST NOT BE VISIBLE
   - <Forbidden items — e.g. "no modern clothing, no wristwatch, no phone, no car, no Latin signage, no Western architecture, no cartoon stylization">

   ### NEGATIVE PROMPT
   > watermark, text overlay, subtitles, distortion, deformed hands, extra fingers, plastic skin, CGI sheen, anime, cartoon, modern objects, bright saturated colors, lens flare, fish-eye, fast motion, motion blur on subject, jittery handheld, glamour lighting

   ### راهنمای فارسی (یادداشت کارگردانی)
   > <Farsi director's note — what the camera is doing, what the actor is doing, the light, the mood. 2-4 lines, conversational.>

   ### Engine-specific paste tips
   - **Hailuo MiniMax** (hailuoai.video): <how to set motion strength, what to put in optional motion field>
   - **Kling 1.6**: <Image-to-Video vs Text-to-Video, motion-strength setting, duration setting up to 10s>
   - **Pika 2.0**: <Pika Effect setting, prefix tokens like "[static camera]">
   - **Runway Gen-4**: <Camera Control selection — Static / Pan / Dolly / Track — and duration cap>
   - **Luma Dream Machine**: <how to phrase the move, any "no camera move" anchor>
   - **Sora (via Bing Video Creator)**: <paste primary as-is; any chunking note>
   - **Wan 2.1** (HuggingFace): <motion bucket id 5/10/20>
   - **Pixverse**: <which style preset to AVOID by default; how to neutralize default stylization>

   ### Seed / continuity anchors
   - **Character anchor phrase** (paste verbatim for face/silhouette continuity): <from shakhsiat>
   - **Location anchor phrase**: <from danesh>
   - **Recommended seed**: <integer; increment per shot for batch consistency>
   ```

7. **Top-of-file preamble** — required sections in this order:
   - **EN/FA "How to Use This File"** explaining the per-shot block structure and that the PRIMARY VIDEO PROMPT is the single field to paste into any generator.
   - **Free-credit reminder table** for all listed engines, each row marked `[verify current limits]`.
   - **Engine recommendation for THIS project** — pick primary + secondary based on the project's tempo (slow-cinema → Hailuo/Kling; action → Runway/Luma; vertical short → Pixverse/Sora).
   - **Continuity ledger** — the character anchor phrases, location anchor phrases, and palette to reuse across every shot so faces and places stay consistent.
   - **Aspect / runtime master table** — total seconds, count of shots, planned aspect.

8. **Bottom-of-file appendix** — required:
   - **Portable still-image keyframe prompts** for any shots the user wants as stills first (Bing Image Creator / Leonardo / Krea / Flux-on-HF / Ideogram), one block per pivotal shot.
   - **Batch render notes** — order of generation, which shots can be reused as image-to-video parents for the next shot to preserve continuity.
   - **Post-production note** — generate at 16:9, crop to project's intended aspect in NLE; loudness / pacing notes from `06-filmnaameh.md`.

9. Surface the file via `SendUserFile` so the user can open it directly. Headline it as **"THE FINAL & MOST IMPORTANT FILE — paste these into any free AI video generator"**.

10. Summary ≤4 lines (shot count, total runtime, primary engine recommendation, where the file is saved).

### Quality bar (non-negotiable)
- **No empty fields.** Every shot must specify camera position, lens, move, light, palette, textures, what must/must-not be visible, and engine tips. A "[verify]" tag is acceptable for engine free-tier limits; nothing else may be left blank.
- **Character consistency.** Paste the character anchor phrase from `output/shakhsiat/$1.md` verbatim into every shot where that character appears. Do not paraphrase — generators key on the exact phrase.
- **Period discipline.** Every shot lists at least one period anchor (architecture, prop, wardrobe, signage convention) and at least one MUST-NOT-BE-VISIBLE item to prevent anachronism.
- **Direct the camera.** The prompt is a directing brief, not a description. Tell the camera where to be, how to move, when to move, and at what speed.

Use the **daastansaraa** sub-agent.
