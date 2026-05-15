---
description: زنجیره — Full pipeline. Runs tahghigh → senaario → shakhsiat → behtar → storybord → prompt-video → naghd end-to-end on a project.
argument-hint: [project-slug] [optional: pipeline variant: kaameleh | documentary | tabligh | bazneveshtan]
---

Invoke **daastansaraa** to run a full pipeline.

Inputs:
- Slug: `$1`.
- Variant: `$2` (default `kaameleh`):
  - `kaameleh` — fiction full chain.
  - `documentary` — replaces dialog with interview-design + B-roll list.
  - `tabligh` — short / ad / music-video chain (60–90s, 9:16 default).
  - `bazneveshtan` — rewrite an existing scenario the user already has under `output/senaario/$1/`.

Steps (kaameleh):
1. **tahghigh** — `pajooheshgar` reads `raw/` → `danesh/$1-research.md`.
2. **senaario** — `daastansaraa` produces logline → synopsis → treatment → beats → scenes → script.
3. **shakhsiat** — `shakhsiat-pardaaz` builds character bible (run in parallel with step 4 if possible).
4. **behtar** — `daastansaraa` story-doctors the draft.
5. **storybord** — `pardeh-negaar` draws SVG storyboard + shotlist.
6. **prompt-video** — `daastansaraa` generates per-shot prompts for free AI generators.
7. **naghd** — `daastansaraa` writes final critique.

Run sub-agents in parallel whenever steps are independent (e.g. shakhsiat alongside behtar, prompt-video alongside naghd).

After each step, post a one-line status update so the user can see progress. At the end, surface the storyboard SVGs and shotlist via `SendUserFile`.

Documentary variant: skip the dialogue step; insert an "interview-design" step that produces `output/senaario/$1/interviews.md` (question banks per subject) and a "b-roll" step that produces `output/senaario/$1/broll.md`.

Tabligh variant: clamp runtime to 60–90s, default aspect 9:16, default to 3-act-in-60s structure.

Bazneveshtan variant: skip tahghigh + senaario, start at naghd → behtar → storybord update → prompt-video update.

Use the **daastansaraa** sub-agent as the orchestrator.
