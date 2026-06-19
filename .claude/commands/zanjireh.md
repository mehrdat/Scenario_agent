---
description: زنجیره — Full pipeline. Runs tahghigh → senaario → shakhsiat → behtar → storybord → prompt-video → prompt-storyboard → naghd end-to-end on a project. AUTO-RESUMES — if any step's artifact already exists on disk, that step is skipped. To force a clean re-run, pass --restart.
argument-hint: [project-slug] [optional: pipeline variant: kaameleh | documentary | tabligh | bazneveshtan] [optional: --restart | --force-from <step>]
---

Invoke **daastansaraa** to run a full pipeline. **Auto-resume is on by default** — a re-run picks up from the first missing artifact, never re-doing finished steps. Pass `--restart` only when you want to throw away existing artifacts and start over.

Inputs:
- Slug: `$1`.
- Variant: `$2` (default `kaameleh`):
  - `kaameleh` — fiction full chain.
  - `documentary` — replaces dialog with interview-design + B-roll list.
  - `tabligh` — short / ad / music-video chain (60–90s, 9:16 default).
  - `bazneveshtan` — rewrite an existing scenario the user already has under `output/senaario/$1/`.
- `--restart` (optional): ignore existing artifacts and re-run every step.
- `--force-from <step>` (optional): re-run from the named step onward. Step names: `tahghigh | senaario | shakhsiat | behtar | storybord | prompt-video | prompt-storyboard | naghd`.

### Step 0 — Resume audit (BEFORE running anything)

Check each step's artifact on disk and post a punch list. This is identical to `/edaameh`'s audit.

| Step | Done if this exists |
|---|---|
| `tahghigh` | `danesh/$1-research.md` |
| `senaario` | `output/senaario/$1/06-filmnaameh.md` |
| `shakhsiat` | `output/shakhsiat/$1.md` |
| `behtar` | `06-filmnaameh.md` contains `<!-- بهبود — ... -->` |
| `storybord` | `output/storybord/$1/shotlist.md` AND ≥1 `board-*.svg` |
| `prompt-video` | `output/prompt/$1-video-prompts.md` |
| `prompt-storyboard` | `output/prompt/$1-storyboard-prompts.md` |
| `naghd` | `output/naghd/$1.md` |

Post the punch list (`✅ Done` / `🔄 Remaining`) before doing any work. If everything is done, ask the user whether to re-run anything or stop. If `--restart` is set, ignore done state and warn the user before overwriting.

### Steps (kaameleh)

1. **tahghigh** — `pajooheshgar` reads `raw/` → `danesh/$1-research.md`. Skip if already exists.
2. **senaario** — `daastansaraa` produces logline → synopsis → treatment → beats → scenes → script. Skip if `06-filmnaameh.md` already exists.
3. **shakhsiat** — `shakhsiat-pardaaz` builds character bible. Run in parallel with step 4 when possible.
4. **behtar** — `daastansaraa` story-doctors the draft. Skip if a `<!-- بهبود ... -->` changelog line is already in `06-filmnaameh.md`.
5. **storybord** — `pardeh-negaar` draws SVG storyboard + shotlist. Skip if `shotlist.md` AND ≥1 `board-*.svg` already exist for this slug.
6. **prompt-video** — `daastansaraa` writes per-shot video-generation prompts to `output/prompt/$1-video-prompts.md`. **THIS IS THE FINAL AND MOST IMPORTANT DELIVERABLE OF THE ENTIRE CHAIN.** Quality bar is enforced — every shot block must include camera position, lens, move, light, palette, textures, must / must-not be visible, engine-specific tips, and continuity anchors. See `/prompt-video` for the full schema.
7. **prompt-storyboard** — `daastansaraa` writes per-shot still-image storyboard prompts to `output/prompt/$1-storyboard-prompts.md`. **Secondary deliverable** — pencil-and-ink panel prompts for Bing / Leonardo / Krea / Flux / Ideogram. See `/prompt-storyboard`.
8. **naghd** — `daastansaraa` writes final critique to `output/naghd/$1.md`.

Run sub-agents in parallel whenever steps are independent (e.g. shakhsiat alongside behtar, prompt-storyboard alongside naghd). `prompt-video` must finish before `prompt-storyboard` and `naghd` start, because both reference the locked-down shotlist + scene functions.

After each step, post a one-line status update so the user can see progress.

### Final surface (order matters — primary first)

When the chain finishes, send the deliverables in this exact order:

```
🎬 PRIMARY (paste these into any free AI video generator):
    output/prompt/<slug>-video-prompts.md

🖼  Secondary (storyboard stills for previz / pitch deck):
    output/prompt/<slug>-storyboard-prompts.md

📐 Supporting:
    output/storybord/<slug>/shotlist.md
    output/storybord/<slug>/board-01.svg
    output/senaario/<slug>/06-filmnaameh.md
    output/shakhsiat/<slug>.md
    output/naghd/<slug>.md
```

`SendUserFile` the **video-prompts** file FIRST and headline it as *"THE FINAL & MOST IMPORTANT FILE — paste these into any free AI video generator."* Then surface the storyboard-prompts file as *"Secondary — storyboard image prompts for previz."* Then the supporting files.

### Documentary variant
Skip the dialogue step. **Do NOT generate interview material by default** — many documentary modes (observational, poetic, archival, essay) don't use interviews. Instead, after the scenario step, post a one-paragraph **suggestion** noting:
- Whether interviews would suit the chosen documentary mode.
- If yes, suggest the user run `/mosaahebeh $1` to design them.
- If the user explicitly asks for interviews in the brief, then include the interview-design step.

Always include the **B-roll** step for documentary — it's useful in every mode.

### Tabligh variant
Clamp runtime to 60–90s, default aspect 9:16, default to 3-act-in-60s structure.

### Bazneveshtan variant
Skip tahghigh + senaario, start at naghd → behtar → storybord update → prompt-video update → prompt-storyboard update.

### When to use /edaameh vs /zanjireh
- **`/zanjireh`** — first run on a project, or when you want the full audit + chain in one go (now auto-resumes too).
- **`/edaameh`** — pure resume; never re-audits the early steps verbosely, never asks about variant, just continues from where you stopped.

Both end with the same primary-first surface above.

Use the **daastansaraa** sub-agent as the orchestrator.
