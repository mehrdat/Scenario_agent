---
description: نگاره — Comic-book / Hollywood storyboard. Produces an HTML "studio" page; the browser fetches each panel from your choice of free image generator (Bing Image Creator, Mage, NightCafe, Stable Horde, local SD, …). Scope is percentage of runtime. Style picker is mandatory.
argument-hint: [project-slug] [percentage 1-100] [style: comic | real | noir | anime | ghibli | watercolor | pencil | graphic-novel | pixar | wes-anderson | kiarostami | farhadi | kubrick | fincher | wong-kar-wai | deakins | del-toro | lynch | marvel | bw-photo | custom] [aspect: 16x9 | 9x16 | 1x1 | 2.39x1]
---

Invoke **negaaregar** to build a storyboard studio for `output/senaario/$1/`.

**What this produces:** `output/negaareh/$1/studio.html` — an interactive HTML page you open in your browser. Each panel has buttons to render in **Bing Image Creator (DALL·E 3)**, **Microsoft Designer**, **Mage.space**, **NightCafe**, **Ideogram**, **Leonardo**, **HuggingFace Flux**, plus an in-browser **Stable Horde** generator and drag-and-drop image upload. Images persist in your browser's localStorage. Multiple backends mean something always works.

Claude does NOT draw the images. Negaaregar plans the panels, writes optimized comic-book prompts, and assembles the HTML. The browser (or your local Stable Diffusion install via `tools/render-local.py`) renders the images.

## Inputs (`$ARGUMENTS`)

- Slug: `$1` (required).
- Percentage: `$2` — integer 1–100. Fraction of total runtime to board. Scenes are picked by dramatic weight (climax/midpoint/inciting/all-is-lost first).
- Style: `$3` — one of the keys below. **If missing, ask via `AskUserQuestion`.** Default the question to whatever the user's `salighe/profile.md` says, or `comic` if no profile yet.
- Aspect: `$4` — `16x9` (default) · `9x16` · `1x1` · `2.39x1`.

## Style picker (always ask if `$3` is missing)

Read `salighe/profile.md`. If the user has a default visual style there, surface it as the recommended option.

Present this picker via `AskUserQuestion`:

| Key | Look | Best for |
|---|---|---|
| `comic` | Hollywood storyboard pencil-and-ink, dynamic linework, dramatic shading | Default, action / drama, pitches |
| `real` | Photorealistic cinematic still, 35mm, natural light | Realism, documentary look |
| `noir` | High-contrast B&W, chiaroscuro, Sin City inspired | Thriller, crime, mystery |
| `anime` | Anime production cel, expressive characters | Stylized, fantasy, youth-targeted |
| `ghibli` | Studio Ghibli, painterly backgrounds, soft pastel | Magical realism, family, period |
| `watercolor` | Loose washes, ink over wet paint, paper texture | Period drama, romance, literary |
| `pencil` | Graphite sketch, cross-hatching, value studies | Loose preproduction feel |
| `graphic-novel` | Bold linework, cel-shaded blocks, Mignola/Miller | Genre, neo-noir, sci-fi |
| `pixar` | 3D animation still, vibrant, global illumination | Family, animation, comedy |
| `wes-anderson` | Symmetrical, pastel, dollhouse production design | Quirky comedy, ensemble, deadpan |
| `kiarostami` | Iranian neorealism, naturalistic light, dust palette | Iranian art-cinema, observational |
| `farhadi` | Contemporary Tehran realism, ensemble framing, restrained color | Moral-dilemma drama, family |
| `kubrick` | Symmetric one-point perspective, monumentalism, cool palette | Sci-fi, period, psychological |
| `fincher` | Desaturated green-yellow cast, precise framing, dark moody | Crime, thriller, procedural |
| `wong-kar-wai` | Saturated jewel tones, step-printed motion, neon practicals | Romance, atmospheric urban |
| `deakins` | Painterly natural light, environmental depth, restrained color | Drama, Western, prestige |
| `del-toro` | Fairy-tale gothic, warm amber + teal, creature-feature textures | Fantasy, horror, period gothic |
| `lynch` | Dreamlike surreal, red + electric blue, harsh practicals | Mystery, surreal, psychological |
| `marvel` | Dynamic action, bold primaries, foreshortening | Action, superhero, energy |
| `bw-photo` | B&W documentary photography, high contrast, photojournalism | Realism, documentary, biopic |
| `custom` | User types a free-text style brief | Anything not above |

Tell the user: *"You can change the style later by re-running `/negaareh` with a different style key. Each style produces a distinct visual feel — same prompts, different render."*

## Steps

1. Verify `output/senaario/$1/05-scenes.md` and `04-beats.md` exist. If not, halt → tell the user to run `/senaario` first.
2. **Read `salighe/profile.md`** if it exists. Apply user preferences.
3. If percentage missing, ask via `AskUserQuestion`: 10% (key beats) · 25% (recommended, spine) · 50% (extended spine) · 100% (whole film — confirm page count).
4. If style missing, present the picker above.
5. Pass to **negaaregar**.
6. Negaaregar:
   - Selects scenes by dramatic weight to hit the percentage target.
   - Builds `_cast-map.md` with fixed character-phrase per role for face continuity.
   - Writes 60–120-word style-locked prompts per panel (the style fragment from the picker is injected into every prompt).
   - URL-encodes prompts and assembles `studio.html` (multi-backend, drag-drop, Stable Horde live button, localStorage persistence).
   - Writes `prompts.tsv` (for bulk offline rendering via `tools/render-panels.sh`).
   - Writes `shotlist.md`, `coverage.md`, `prompts.md` (human-readable + paste-in fallback instructions).
7. **Hard caps**: max 36 panels per call. Above that, halt and confirm.
8. After completion, surface `studio.html` via `SendUserFile`. Tell the user: *"Open `studio.html` in your browser. For each panel, click 'Bing IC' (highest quality, free DALL·E 3) or 'Try Stable Horde' (in-browser, no clicks elsewhere). Drag generated images onto panels to save them."*

## Bulk render path (for users with GPU / restricted browser)

```bash
tools/render-panels.sh output/negaareh/$1/prompts.tsv auto 1024 576
```
Tries Stable Horde → local Automatic1111 → Pollinations in order. Saves JPGs to `output/negaareh/$1/panels/`. Then open `studio.html` and use the Upload button on each panel to load the JPGs.

Or with a local GPU + diffusers:
```bash
python tools/render-local.py output/negaareh/$1/prompts.tsv black-forest-labs/FLUX.1-schnell
```

Use the **negaaregar** sub-agent. Claude doesn't draw; the chosen image service does. We orchestrate.
