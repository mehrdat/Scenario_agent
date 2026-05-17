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

## Extreme-detail prompt anatomy (both tracks)

Every prompt in both tracks is composed from **five inputs**:
1. **The style fragment** (Visual Bible `01-style.md` for Track 1; video-style package for Track 2).
2. **The Visual Bible locks** (`06-cast-visual.md` phrase per character byte-identical; `07-locations.md` phrase per location; `02-palette.md` per act; `03-light.md` key direction; `04-lens.md` plan; `05-aspect.md`).
3. **Detail packs from `templates/detail-packs.md`** — see below. Pick the right packs based on scene location, character culture, motion notes, time/weather, and camera move.
4. **Critique constraints from `output/naghd/<slug>/round-*.md`** — if a critique point demanded "Maryam's solitude must read in every wide shot", that phrase becomes a constraint in every wide-shot prompt featuring her.
5. **The shot-level specifics** from the scene/shot list.

### Detail pack categories (from `templates/detail-packs.md`)

| Pack type | Examples | When to inject |
|---|---|---|
| **Geography** | `iran-isfahan`, `iran-tehran`, `iran-shiraz`, `iran-tabriz`, `iran-yazd`, `iran-rasht-caspian`, `iran-ahvaz-khuzestan`, `iran-kurdistan-sanandaj`, `paris-1970s`, `nyc-brooklyn`, `generic-iran-rural` | Per scene location |
| **Culture** | `iranian-traditional-religious-female`, `iranian-secular-urban-female-young`, `iranian-traditional-religious-male`, `iranian-secular-urban-male-young`, `iranian-elderly-rural`, `iranian-diaspora-westernized`, `kurdish-traditional`, `azeri-iranian` | Per character (matches the cast phrase from `06-cast-visual.md`) |
| **Motion** | `slow-motion-cinematic-120fps`, `slow-motion-extreme-480fps`, `real-time-natural-24fps`, `time-lapse`, `whip-pan-kinetic`, `slow-and-steady`, `frantic-handheld`, `floating-steadicam` | Per shot's motion behavior |
| **Sensory atmosphere** | `dusty-afternoon-iran`, `bazaar-press-isfahan`, `caspian-mist-rasht`, `desert-night-yazd`, `sandstorm-ahvaz`, `nowruz-air`, `cafe-interior-tehran-modern`, `mosque-silence`, `bazaar-tehran-grand` | Per scene's time/weather/setting |
| **Light** | `golden-hour-iranian-courtyard`, `blue-hour-tehran-rooftop`, `noon-harsh-bazaar-exit`, `window-shaft-interior-isfahan`, `practical-only-night-cafe`, `overcast-rasht-soft`, `magic-hour-mountain`, `dappled-cypress-garden` | Per shot's lighting (matches Visual Bible `03-light.md`) |
| **Camera language** | `kiarostami-observational-static`, `farhadi-handheld-intimate`, `slow-push-in-cinematic`, `crane-up-reveal-elegiac`, `whip-pan-edgar-wright`, `dolly-zoom-hitchcock`, `steadicam-long-take-cuaron`, `drone-aerial-establish`, `handheld-vérité-immediate`, `arc-orbit-obsessive` | Per shot's camera movement |

Open `templates/detail-packs.md` for the full inject phrases.

### Full prompt anatomy (Track 1 — storyboard, single frozen image)

```
{STORYBOARD_STYLE_FRAGMENT from Visual Bible 01-style.md}:

{CULTURE_PACK matching this character}: {CAST_PHRASE locked from 06-cast-visual.md}
{POSTURE: standing/sitting/walking/leaning, weight distribution, facial expression}.

{ACTION_VERB} {OBJECT/INTERACTION} — present tense, what this one frozen frame captures.

{GEOGRAPHY_PACK for the scene's location}.
{PERIOD: year, season, time-of-day specific (4:45pm late afternoon)}.

{SENSORY_PACK for atmosphere}.

{LIGHT_PACK for this scene's light setup} — direction angle, quality, temperature, shadow length and color, contrast ratio.

{FOREGROUND/MIDGROUND/BACKGROUND description: depth layers, what's happening in each, implied motion via blur or pose}.

{SHOT_SIZE} shot, {LENS}mm perspective ({LENS_PACK}: e.g. "shot on 85mm portrait lens, shallow depth of field, classical composition"),
{CAMERA_HEIGHT}/{ANGLE}, rule-of-thirds composition, headroom and lead room according to gaze.

{GENRE/MOOD_TONE from Visual Bible 08-mood.md}.

{CRITIQUE_CONSTRAINTS from latest critique round — if any apply}.

{ASPECT_TAG from 05-aspect.md}, professional composition, no text overlay, no watermark.
```

### Full prompt anatomy (Track 2 — video, motion over time)

```
{VIDEO_STYLE_PACKAGE from templates/video-styles.md — default photoreal-cinema}.

{CULTURE_PACK}: {CAST_PHRASE locked from 06-cast-visual.md}.

{ACTION_VERB + MANNER} ({MOTION_PACK} — slow-motion 120fps / real-time / time-lapse / etc., speed indicator, weight, hesitation, frame rate hint).
Start position: {...}. End position: {...}. Motivation: {emotional or narrative reason for the motion}.

{GEOGRAPHY_PACK} {PERIOD}.

{SENSORY_PACK} — wind direction and intensity (3mph from west / dust stirred), fog level 0-5, smell (jasmine / hot stone / wet earth / petrol / saffron), atmospheric particles (dust motes in sunbeam / smoke).

{LIGHT_PACK} — key direction with angle, quality, color temperature, shadow length and color, contrast ratio.
Light dynamics over the shot: does light shift? cloud passes? subject moves through a light pool? practicals visible (candle flicker, neon hum)?

{FG/MG/BG MOTION}:
- FG: what's moving in foreground (hair shifts in wind, hand traveling).
- MG: subject's motion through the frame.
- BG: what's happening behind (someone passes, vehicle moves, curtains stir).
- Parallax: faster foreground motion than background as camera moves.

{BODY LANGUAGE OVER THE SHOT}: how does posture change? micro-expressions? breath visible? hands during the action?

{SHOT_SIZE} shot, {LENS}mm at {APERTURE} f/{f-stop}, {CAMERA_HEIGHT}/{ANGLE},
{CAMERA_LANGUAGE_PACK} — movement type, speed (slow/medium/fast/whip), start framing → end framing, easing (linear/ease-in/ease-out/hold-then-move), motivation.

{FOCUS}: plane of focus (subject's eyes / hands / background detail), depth of field (shallow f/1.8 / medium f/4 / deep f/11), rack focus moves during shot (focus pulls from A to B at second N), focus breathing acknowledged.

{SOUND DESIGN (if engine generates audio — Veo 3, Sora 2)}:
- Ambient bed with specifics.
- Diegetic sounds with distance (footsteps near / azan distant / paper rustle close).
- Off-screen sound if it motivates action.
- Dialogue only if the exact line matters; otherwise reserved for `05-audio/narration.md`.

{CRITIQUE_CONSTRAINTS} from latest critique round.

Frame rate: {24fps cinematic / 30fps smooth / 60fps slo-mo}. Duration: {N} seconds.
{ASPECT_TAG}. {UNIVERSAL_NEGATIVE_PROMPT from templates/video-styles.md}.
```

Both prompt types deliver **extreme detail**: every visible element, every sensory layer, every motion vector named explicitly so the AI generator has the information it needs to render with specificity.

### Critique propagation into prompts

When `/eslaah` produces a critique with points marked `[C-N.k]`, each must-fix point that is **visually expressible** gets recorded in `output/visual-bible/<slug>/10-critique-constraints.md` during `/tasvir bible`:

```markdown
# Critique-derived visual constraints — <slug>

Constraints that every prompt for this project must honor:

- **[from C-2.3]** Maryam's solitude must read in every wide shot — frame her alone in vast architectural space, never with a busy crowd unless ironically.
- **[from C-2.5]** The letter (story object) must be visible or its absence felt in every scene after Sc 4.
- **[from C-3.1]** No shot using the right-side OTS — the critique flagged that pattern as flattening the geometry.
```

`/tasvir prompts <slug>` reads this file and injects the relevant constraint into the prompts that match (e.g. all wide shots featuring Maryam, all scenes after Scene 4).

This is how the critique propagates: not just into the script, but into the visual artifacts.

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
