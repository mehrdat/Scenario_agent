---
description: تصویر — Visual hub. Builds the Visual Bible (style/palette/light/cast locked once for the whole film), schematic SVG storyboard, drawn HTML studio, and the comprehensive prompts bundle (scene + sequence + shot + video + audio + comparison guide). Subcommands or `all`.
argument-hint: <subcommand> <project-slug> [args...]  ·  subcommands: bible | bord | negaareh | prompts | video | all
---

# /tasvir — visual production hub

This command produces every visual artifact your project needs: the Visual Bible that locks consistency, the schematic SVG storyboard for planning, the drawn HTML studio for presentation, and the comprehensive prompts bundle that lets you compare your existing footage to the planned shots.

Parse `$ARGUMENTS` as `<subcommand> <slug> [args...]`. If first token isn't a known subcommand, default to `all`. If `<slug>` is missing, ask via `AskUserQuestion`.

## The Visual Bible — why everything starts here

**Critical concept**: For your film to *look* like one film (not 18 disconnected scenes), every prompt must share the same visual DNA. The Visual Bible is that DNA, locked once.

It lives at `output/visual-bible/<slug>/` and contains:
- **01-style.md** — chosen style key + style fragment (the exact ~30–50-word phrase injected into every image prompt).
- **02-palette.md** — color palette per act (3–4 hex codes), color arc across the film.
- **03-light.md** — key direction, light quality (hard/soft/diffuse), color temperature per scene-cluster.
- **04-lens.md** — focal length plan (which scenes use 24/35/50/85/135 mm).
- **05-aspect.md** — aspect ratio + framing rules.
- **06-cast-visual.md** — for each character, the locked prompt-phrase (byte-identical across every panel/shot).
- **07-locations.md** — for each location, the locked description phrase.
- **08-mood.md** — overall atmospheric tone per act.
- **09-references.md** — list of `raw/` reference images and external film references the bible draws from.

**Every subsequent subcommand reads the Visual Bible first** and injects the locked phrases into prompts. That's how consistency happens.

---

## Subcommands

### `bible <slug> [style-key]` — build / update the Visual Bible
1. Read `output/senaario/<slug>/` (full scenario), `output/shakhsiat/<slug>.md`, `danesh/<slug>-research.md`, `salighe/profile.md`.
2. If `style-key` is missing, present the 20-preset picker via `AskUserQuestion` (comic / real / noir / anime / ghibli / watercolor / pencil / graphic-novel / pixar / wes-anderson / kiarostami / farhadi / kubrick / fincher / wong-kar-wai / deakins / del-toro / lynch / marvel / bw-photo / custom). Default first option to the user's taste-profile preference.
3. Write all nine `0N-*.md` files. The style fragment from the picker is locked into `01-style.md` and will be the *first sentence* of every image prompt this project produces.
4. For each named character in the scenario, write a locked "prompt phrase" in `06-cast-visual.md`. Once locked, this phrase appears byte-identical in every panel/shot prompt that includes the character — Flux / DALL·E 3 / SDXL will then produce a consistent likeness.
5. For each location, write a locked description phrase in `07-locations.md`.
6. Surface `01-style.md` via `SendUserFile` and ask: *"Locking this Visual Bible. Run `tasvir bord <slug>` next for the planning board, or `tasvir all <slug>` to produce everything."*

**Re-run rules**: Running `tasvir bible` again will *update* not overwrite. The locked phrases stay unless the user explicitly asks to change the style. If they change the style, all downstream artifacts (storyboards, prompts) become out-of-date — the agent flags this and offers to re-generate them.

### `bord <slug> [scope] [aspect] [ink-style]` — schematic SVG storyboard
For planning the shoot. Low credit, clean ink lines, opens in any browser. Delegates to **pardeh-negaar**.
- `scope` — required, ask via `AskUserQuestion` if missing. Options: `sample` (recommended default — 1 page) · `key` (the spine) · `scene N` · `scene N-M` · `sequence N` · `act N` · `all`.
- `aspect` — `16x9` (default) / `9x16` / `1x1` / `2.39x1`.
- `ink-style` — optional. `clean` (default) / `sketchy` (hand-drawn wobble) / `cinematic` (toned + shaded).
- Hard cap: 4 pages (24 panels) per call.
- Reads the Visual Bible if present (for aspect default, character silhouette hints).
- Output: `output/storybord/<slug>/board-NN.svg` + `shotlist.md` + `timeline.md`.

### `negaareh <slug> [%] [style-key] [aspect]` — drawn HTML studio
For pitch deck / festival / portfolio. Delegates to **negaaregar**.
- `%` — percentage of runtime to board (1–100). Scenes selected by dramatic weight. Ask via `AskUserQuestion` if missing (default 25%).
- `style-key` — must match the Visual Bible's locked style. If the user passes a different one, the agent **warns** that this breaks consistency and asks: "Override the Visual Bible style for just this board, or update the Bible to the new style?"
- `aspect` — matches Visual Bible by default.
- Hard cap: 36 panels per call.
- Output: `output/negaareh/<slug>/studio.html` (multi-backend interactive page) + `prompts.tsv` + `prompts.md` + `_cast-map.md` + `shotlist.md` + `coverage.md`.

### `prompts <slug>` — **the comprehensive prompts bundle** (NEW)
This is the file set that lets you compare your finished footage to the planned shots — even if the video is already shot.

Reads the Visual Bible + scenario + storyboard data (if present). Writes to `output/prompt/<slug>/`:

| File | What it contains |
|---|---|
| `00-bible-summary.md` | One-page distillation of the Visual Bible. Read this first when comparing footage. |
| `01-sequence-prompts.md` | One image prompt per **sequence** (groups of scenes that flow together). Describes the sequence's overall feel — color, light, mood. Useful for comparing "does my Act-2 opener feel like this?". |
| `02-scene-prompts.md` | One image prompt per **scene** — a key-frame description of what the scene should look like as a whole. With locked cast/location/style phrases injected. |
| `03-shot-prompts.md` | One image prompt per **shot** (every shot in the film). Each shot inherits the scene's prompt but adds shot-specific framing (size, lens, angle, movement). |
| `04-video-prompts.md` | AI-video generation prompts per shot, optimized for free engines (Hailuo / Kling / Pika / Runway free / Luma / Sora-via-Bing / Veo / Wan / Pixverse). Each block lists engine-specific tweaks. |
| `05-audio-prompts.md` | Per scene: music description, ambient SFX list, dialogue tonal markers, silence beats. For free music generators (Suno free / Udio free / MusicGen on HF / ElevenLabs free). |
| `06-comparison-guide.md` | **How to compare your footage to the plan.** For each shot: the prompt + 5-question rubric (Does the framing match? Does the light direction match? Does the color palette hold? Is the character's bearing right? Does the duration feel earned?). Includes a markdown checklist the user can tick. |
| `_consistency.md` | An audit report: which prompts share the same locked phrases (cast/location/style), where the locked phrases drifted, and what the user should re-lock in the Bible. |

The point: you can flip through `06-comparison-guide.md` while watching your own footage on the other monitor and tick off whether each shot lands. If a shot fails, the corresponding `03-shot-prompts.md` entry tells you what to re-shoot or what to ask a colorist to fix.

### `video <slug> [engine]` — alias for `tasvir prompts <slug>` then surface `04-video-prompts.md`
For users who only want the AI-video generation prompts (skip storyboards). Still builds the Visual Bible first if missing.

### `all <slug>` — runs everything in order (default)
Full visual workflow:
1. `bible` (if `01-style.md` doesn't exist; otherwise read existing).
2. `bord <slug> key` (the spine, schematic — cheap planning board).
3. `negaareh <slug> 25` (25% drawn — pitch board).
4. `prompts <slug>` (the comprehensive bundle).
Reports each step's output as it completes.

---

## Consistency contract — how the Visual Bible flows through every prompt

Every prompt in the bundle has this anatomy:

```
{STYLE_FRAGMENT from 01-style.md}: {CAST_PHRASE from 06-cast-visual.md}
{ACTION_VERB} {OBJECT/INTERACTION} in {LOCATION_PHRASE from 07-locations.md},
{PERIOD/CULTURE} {ATMOSPHERE from 08-mood.md}. {SHOT_SIZE} shot,
{LENS from 04-lens.md} perspective, {CAMERA_HEIGHT/ANGLE},
{LIGHT_DIRECTION from 03-light.md} {COLOR_TEMP}, palette
{PALETTE from 02-palette.md}. {GENRE_TONE}. {ASPECT_TAG from 05-aspect.md},
professional composition, no text overlay, no watermark.
```

The bracketed phrases are **byte-identical** across every prompt in the project. That is the consistency contract. If the user wants to change anything across the whole film, they update one file in the Bible and re-run `tasvir prompts <slug>` to re-emit all prompts with the new locked phrase.

---

## Output structure

```
output/visual-bible/<slug>/
  01-style.md   02-palette.md   03-light.md   04-lens.md   05-aspect.md
  06-cast-visual.md   07-locations.md   08-mood.md   09-references.md

output/storybord/<slug>/
  board-NN.svg   shotlist.md   timeline.md   coverage.md

output/negaareh/<slug>/
  studio.html   prompts.tsv   prompts.md   _cast-map.md   shotlist.md   coverage.md
  panels/

output/prompt/<slug>/
  00-bible-summary.md   01-sequence-prompts.md   02-scene-prompts.md
  03-shot-prompts.md   04-video-prompts.md   05-audio-prompts.md
  06-comparison-guide.md   _consistency.md
```

---

## Reporting

After `all`, report ≤8 lines:
- Visual Bible: locked style + cast/location phrases count.
- Schematic board: pages + panels.
- Drawn board: panels at X% scope.
- Prompts bundle: number of sequence / scene / shot prompts written.
- Next step: open `output/prompt/<slug>/06-comparison-guide.md` to audit your footage.

Use the **daastansaraa** sub-agent as orchestrator. Delegates to **pardeh-negaar** for SVG and **negaaregar** for the HTML studio.
