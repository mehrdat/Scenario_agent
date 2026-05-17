---
description: تصویر — Visual hub. Builds Visual Bible (consistency contract), schematic SVG storyboard, drawn HTML studio, and TWO prompt tracks — storyboard prompts (in chosen artistic style) and video prompts (photorealistic, YouTube-ready).
argument-hint: <subcommand> <project-slug> [args...]  ·  subcommands: bible | bord | negaareh | prompts | video | storyboard-prompts | all
---

# /tasvir — visual production hub (two prompt tracks)

This command produces everything visual: the Visual Bible (consistency), the schematic SVG planning board, the drawn HTML presentation studio, and **two distinct prompt tracks** — one for storyboard visualization, one for the final YouTube-ready video.

Parse `$ARGUMENTS` as `<subcommand> <slug> [args...]`. Default subcommand: `all`. If `<slug>` is missing, ask via `AskUserQuestion`.

---

## The Visual Bible — read by every prompt this command writes

Lives at `output/visual-bible/<slug>/`. Nine locked files: `01-style.md` (style fragment for storyboard track), `02-palette.md` (color per act), `03-light.md` (key direction + temperature), `04-lens.md` (focal-length plan), `05-aspect.md`, `06-cast-visual.md` (one prompt-phrase per character, byte-identical across every prompt), `07-locations.md`, `08-mood.md`, `09-references.md`.

**Both prompt tracks share the cast / location / palette / light / lens locks** — that's how a character looks the same in the storyboard AND the final video. **Only the style fragment differs** between the two tracks:
- Storyboard track style = the Visual Bible's `01-style.md` (e.g. comic, noir, kiarostami, ghibli).
- Video track style = a separate **video-style package** (default `photoreal-cinema`) from `templates/video-styles.md`.

---

## Subcommands

### `bible <slug> [storyboard-style-key]` — lock the Visual Bible
1. Read `output/senaario/<slug>/`, `output/shakhsiat/<slug>.md`, `danesh/<slug>-research.md`, `salighe/profile.md`.
2. Pick storyboard style via `AskUserQuestion` if not given (20-preset library: comic / real / noir / anime / ghibli / watercolor / pencil / graphic-novel / pixar / wes-anderson / kiarostami / farhadi / kubrick / fincher / wong-kar-wai / deakins / del-toro / lynch / marvel / bw-photo / custom).
3. Write 9 files from `templates/visual-bible.md`. Lock character/location phrases.
4. Surface `01-style.md` via `SendUserFile`.

### `bord <slug> [scope] [aspect] [ink-style]` — schematic SVG storyboard
Planning fidelity. Delegates to **pardeh-negaar**. Hard cap 4 pages. See template `storyboard.svg`.

### `negaareh <slug> [%] [style-key] [aspect]` — drawn HTML studio
Presentation fidelity. Delegates to **negaaregar**. Hard cap 36 panels. Multi-backend (Bing IC / Mage / NightCafe / Stable Horde / local SD).

### `storyboard-prompts <slug>` (alias `sb-prompts`) — Track 1 only
Just the storyboard prompts (no video prompts). Useful when you only need preproduction visualization.

### `video <slug> [video-style-key] [aspect]` — Track 2 only
Just the photorealistic video prompts (no storyboard prompts). For users who already have a board and need only the YouTube video prompts.
- `video-style-key` defaults to `photoreal-cinema`. Pick via `AskUserQuestion` if not given. See package list below.
- `aspect` defaults to Visual Bible's aspect, or 16:9 for YouTube.

### `prompts <slug> [video-style-key]` — BOTH tracks
Writes the comprehensive prompts bundle below. **This is the primary deliverable for production planning.**

### `all <slug>` — full visual workflow
1. `bible` (if not exists).
2. `bord <slug> key` (schematic — planning board, fast).
3. `negaareh <slug> 25` (drawn HTML studio — pitch board).
4. `prompts <slug>` (both tracks).

---

## TWO PROMPT TRACKS — what `prompts` writes

```
output/prompt/<slug>/
├── 00-bible-summary.md              ← one-page Visual Bible distillation (read first)
│
├── storyboard/                      ★ TRACK 1: STORYBOARD PROMPTS
│   │                                    Aesthetic = Visual Bible's chosen style
│   │                                    For free IMAGE generators
│   │                                    Use to preview / pitch / portfolio
│   ├── 01-sequence-prompts.md       one image prompt per sequence (overall feel)
│   ├── 02-scene-prompts.md          one image prompt per scene (key-frame)
│   ├── 03-shot-prompts.md           one image prompt per shot
│   ├── paste-targets.md             where to paste (Bing IC, Mage, NightCafe, ...)
│   └── prompts.tsv                  bulk-render input for tools/render-panels.sh
│
├── video/                           ★ TRACK 2: PHOTOREALISTIC VIDEO PROMPTS
│   │                                    Aesthetic = photoreal-cinema (default) or chosen package
│   │                                    For free AI VIDEO generators
│   │                                    For the actual final YouTube video
│   ├── 01-scene-establishing.md     one establishing video prompt per scene
│   ├── 02-shot-videos.md            per-shot photoreal video prompts (the main file)
│   ├── 03-engine-variants/
│   │   ├── sora.md                  Sora 2 (via ChatGPT/Bing) — natural language tweaks
│   │   ├── veo.md                   Veo 3 (Google AI Studio) — with audio cues
│   │   ├── kling.md                 Kling 2 — motion-heavy
│   │   ├── hailuo.md                Hailuo MiniMax 2 — short-prompt optimized
│   │   ├── pika.md                  Pika 2.2
│   │   ├── luma.md                  Luma Dream Machine — physics-aware
│   │   ├── runway.md                Runway Gen-4 — cinema-term-heavy
│   │   ├── wan.md                   Wan 2.2 (open-source, local)
│   │   └── pixverse.md              Pixverse
│   ├── 04-negative-prompts.md       universal anti-AI-artifact negative
│   └── 05-audio/
│       ├── narration.md             ElevenLabs / Tortoise / coqui-TTS prompts per scene
│       ├── music.md                 Suno / Udio / MusicGen prompts per scene / sequence
│       └── sfx.md                   AudioGen / Freesound prompts per scene
│
├── 06-comparison-guide.md           AUDIT CHECKLIST — open while watching your edit
│                                    5-question rubric per shot:
│                                    framing? light? color? bearing? duration?
└── _consistency.md                  audit report — Visual Bible adherence
```

---

## Track 1 — Storyboard prompts (aesthetic, preproduction)

Each prompt uses the **Visual Bible style fragment** (e.g. "Hollywood storyboard panel, hand-drawn pencil-and-ink…") at the start. Optimized for free image generators that produce drawn/stylized output:
- **Bing Image Creator** (DALL·E 3, free with Microsoft account — best storyboard quality)
- **Mage.space**, **NightCafe**, **Ideogram**, **Leonardo**, **HuggingFace Flux Schnell**
- **Stable Horde** (in-browser, anonymous, free)
- Local Stable Diffusion via `tools/render-local.py`

Anatomy (per panel):
```
{STORYBOARD_STYLE from 01-style.md}: {CAST_PHRASE from 06-cast-visual.md}
{ACTION} {INTERACTION} in {LOCATION from 07-locations.md}, {PERIOD/MOOD}.
{SHOT_SIZE} shot, {LENS}mm perspective, {HEIGHT/ANGLE},
{LIGHT_DIRECTION from 03-light.md} {COLOR_TEMP}. {GENRE_TONE}.
{ASPECT_TAG from 05-aspect.md}, professional composition,
no text overlay, no watermark.
```

60–120 words. Cast phrase is byte-identical across every prompt featuring the character.

---

## Track 2 — Photorealistic video prompts (highest quality, YouTube-ready)

**Different optimization**: instead of the Visual Bible's aesthetic style, every prompt opens with a **video-style package** (from `templates/video-styles.md`) — a technical cinematography directive (film stock, camera body, lens, lighting motivation). The rest of the prompt (cast, location, action, palette, light direction) still reads from the Visual Bible, so consistency holds.

Default package: **`photoreal-cinema`**:
```
Cinematic film production, photorealistic, shot on Arri Alexa Mini LF with
anamorphic prime lens, 35mm large-format sensor, natural skin texture with
visible pores, shallow depth of field with creamy bokeh and natural lens
breathing, professional color grading, subtle organic film grain, 24fps
cinematic motion blur, IMAX-quality detail, director-of-photography aesthetic,
no stylization, no animation, fully photorealistic
```

Other available packages (see `templates/video-styles.md` for full text):
- `photoreal-cinema` (default — premium feature film)
- `photoreal-youtube-doc` (broadcast documentary)
- `photoreal-vlog` (YouTube vlog / personal channel)
- `photoreal-music-video` (cinematic music video)
- `photoreal-commercial` (commercial advertising)
- `photoreal-handheld-realism` (cinéma vérité)
- `photoreal-8k-prestige` (HBO/Apple TV+ aesthetic)
- `photoreal-archival` (period 35mm Kodak Vision3)
- Or any storyboard style key if user wants stylized video (anime, ghibli, comic, etc.)

Anatomy (per shot):
```
{VIDEO_STYLE_PACKAGE}: {CAST_PHRASE} {ACTION_VERB + manner} {OBJECT/INTERACTION}
in {LOCATION_PHRASE}, {PERIOD/CULTURE} {ATMOSPHERE}. {SHOT_SIZE} shot,
{LENS}mm {APERTURE if relevant}, {CAMERA_HEIGHT/ANGLE},
{CAMERA_MOVEMENT description with motion verbs},
{LIGHT_DIRECTION from 03-light.md} {LIGHT_QUALITY} {COLOR_TEMP},
palette {PALETTE_HEX from 02-palette.md}. {ASPECT}, {FPS}fps, {DURATION}s.

{UNIVERSAL_NEGATIVE_PROMPT}
```

150–250 words. Motion verbs are critical (Kling, Pika, Luma honor them).

### Per-engine variants
For every shot, the agent also writes a tweaked version for each engine that has notable behavior:
- **Sora**: natural-language version, with audio cues if dialogue/SFX matter.
- **Veo 3**: with explicit audio direction (Veo generates audio).
- **Kling**: motion-heavy version with detailed camera-move description.
- **Hailuo**: condensed under 150 words.
- **Pika**: focus on short-clip consistency.
- **Luma**: physics-explicit ("water falls naturally", "fabric moves with gravity").
- **Runway Gen-4**: heavy on cinematography terms (T-stop, ISO, focal length).
- **Wan**: detailed long-form (open-source, no length cap).
- **Pixverse**: explicit "photorealistic, no stylization" because Pixverse drifts toward anime.

### Universal negative prompt
Always appended at end of every video prompt:
```
low quality, blurry, watermark, text overlay, captions, subtitles, low resolution,
distorted faces, extra limbs, plastic skin, uncanny valley, anime, cartoon,
illustration, painting, drawing, 3D render, CGI, video game, oversaturated,
AI artifacts, deformed hands, missing fingers, melting faces, motion artifacts,
frame stuttering, jittery motion, fake-looking, mannequin, stylized
```

If the user explicitly picked a stylized video-style package (anime / ghibli / comic), drop the matching exclusions from the negative.

### Audio companion prompts (`video/05-audio/`)
Per scene, write:
- **Narration / dialogue** — for ElevenLabs / Tortoise / coqui-TTS. Speaker description, delivery direction, pacing, exact lines.
- **Music** — for Suno / Udio / MusicGen. Genre + tempo + mood matching `08-mood.md`. Cue points if syncing.
- **SFX** — for AudioGen / Freesound. Diegetic sounds + ambient bed + special punctuation per scene.

---

## How the user uses both tracks

**Storyboard track** (preproduction visualization):
1. Open `storyboard/03-shot-prompts.md`.
2. Per panel, click the "Bing IC" / "Mage" / "NightCafe" link or copy the prompt.
3. Generate the image. Drag back into `output/negaareh/<slug>/studio.html` (the multi-backend studio page).
4. Result: a drawn storyboard you can show producers / festival jury.

**Video track** (final YouTube video generation):
1. Open `video/02-shot-videos.md` (the main file with the photoreal version of every shot).
2. For each shot, decide which engine to use based on the per-engine variants in `video/03-engine-variants/`.
3. Paste the prompt into the chosen engine — Sora 2 via Bing, Veo 3 via Google AI Studio, Kling / Hailuo / Pika / Luma / Runway / Wan / Pixverse via their free tiers.
4. Download the rendered clip.
5. Cut together in your NLE (DaVinci Resolve free, CapCut, Premiere).
6. Use `video/05-audio/` prompts for narration (ElevenLabs free), music (Suno free), SFX (AudioGen free).

**Already have footage?** Open `06-comparison-guide.md` while watching your edit. 5-question rubric per shot tells you which to re-shoot / re-grade / re-cut.

---

## Reporting

After `prompts` or `all`, report ≤8 lines:
- Visual Bible: locked style + cast count + location count.
- Storyboard track: N sequence + N scene + N shot prompts written.
- Video track: N scene-establishing + N shot prompts + per-engine variants written.
- Audio track: N narration + N music + N SFX prompts written.
- Path to comparison guide.
- Next step: usually "open `studio.html` for the drawn board, then `video/02-shot-videos.md` for the final video generation."

Use the **daastansaraa** sub-agent as orchestrator. Delegate to **pardeh-negaar** (SVG board) and **negaaregar** (HTML studio + Track 1 prompts).
