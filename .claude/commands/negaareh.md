---
description: نگاره — Hollywood-style drawn storyboard. Detailed figures with faces and clothing, Persian architectural detail, paper-toned hand-drawn aesthetic. Scope is percentage of runtime — say `/negaareh slug 50` for 50%.
argument-hint: [project-slug] [percentage 1-100] [optional aspect: 16x9 | 9x16 | 1x1 | 2.39x1]
---

Invoke **negaaregar** to draw a Hollywood-style storyboard for `output/senaario/$1/`.

This is the **presentation-fidelity** board — for pitch decks, festival packages, the director's portfolio. For a quick planning board with no drawn detail, use `/storybord` instead.

Inputs (`$ARGUMENTS`):
- Slug: `$1` (required).
- Percentage: `$2` — **integer 1–100**. The fraction of total video runtime to board. The agent selects the most dramatically important scenes whose combined duration adds up to that percentage. Example: `/negaareh pardeye-akhar 50` = board 50% of the film, chosen by dramatic weight.
- Aspect: `$3` — `16x9` (default), `9x16`, `1x1`, `2.39x1`.

Steps:
1. Verify `output/senaario/$1/05-scenes.md` (or `06-filmnaameh.md`) exists. If neither, halt and direct the user to `/senaario` first.
2. If percentage (`$2`) is missing, ask via `AskUserQuestion` with options: 10% (key beats), 25% (spine), 50% (extended spine), 100% (whole film). **Default to 25% — never auto-board the whole film.**
3. Pass percentage + aspect to **negaaregar**.
4. Negaaregar runs its scene-selection algorithm (score by dramatic weight, greedy-fill until cumulative duration ≥ target).
5. If projected page count > 4 pages, negaaregar halts and confirms with the user before drawing.
6. Hard cap: **6 pages (36 panels) per call**. Above that, negaaregar tells the user to lower the percentage.
7. Outputs:
   - `output/negaareh/$1/board-NN.svg` — one page per 6 panels.
   - `output/negaareh/$1/shotlist.md` — single master table.
   - `output/negaareh/$1/_cast-map.md` — which figure symbol represents which character (for consistency).
   - `output/negaareh/$1/ai-prompts.md` — companion file with prompts for Bing Image Creator / Leonardo / Flux Schnell if the user wants to upgrade panels to fully-illustrated keyframes via free generators.
   - `output/negaareh/$1/coverage.md` — what was boarded, what was skipped, the actual percentage achieved.
8. After completion, surface `board-01.svg` + `shotlist.md` via `SendUserFile`.

Use the **negaaregar** sub-agent. Quality bar is Hollywood-presentation grade — paper background, sketch-filtered linework, detailed character silhouettes with faces and clothing, Persian architectural detail (arches, dome, cypress), warm light washes, cross-hatched shadows.
