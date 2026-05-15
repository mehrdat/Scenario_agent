---
description: استوری‌بورد — Generate a professional SVG storyboard. Scope-aware: ask which portion of the script to board so credit isn't wasted on the whole film by default.
argument-hint: [project-slug] [scope: sample | key | scene N | scene N-M | sequence N | act N | all] [aspect: 16x9 | 9x16 | 1x1 | 2.39x1]
---

Invoke **pardeh-negaar** to draw a professional storyboard for `output/senaario/$1/`.

Inputs (`$ARGUMENTS`):
- Slug: `$1` (required).
- Scope: `$2` — if missing, **ask the user with `AskUserQuestion`** (do not default to "all"). Valid scopes:
  - `sample` — 1 page (~6 panels) from the most visually rich scene. **This is the recommended default — it lets the user preview quality before committing more credit.**
  - `key` — the spine of the film: opening image, inciting incident, midpoint, all-is-lost, climax, final image. ~6 panels total.
  - `scene N` — one scene only.
  - `scene N-M` — a range of scenes.
  - `sequence N` — one of the 8 sequences (Frank Daniel method).
  - `act N` — act 1, 2, or 3.
  - `all` — whole script. **Confirm page count with the user before drawing.**
- Aspect: `$3` — default `16x9`.

Steps:
1. Verify `output/senaario/$1/05-scenes.md` or `06-filmnaameh.md` exists. If neither, halt and tell the user to run `/senaario` first.
2. If scope (`$2`) is missing, ask via `AskUserQuestion` with options ordered: Sample · Key beats · One scene · One sequence · One act · Full script. **Sample first**, marked "(Recommended)".
3. Resolve scope to a concrete set of scenes.
4. If the resolved scope exceeds **4 pages (24 panels)**, halt and confirm with `AskUserQuestion` before proceeding — show the projected page count.
5. Pass scope + aspect ratio to **pardeh-negaar**.
6. Pardeh-negaar reads the source, plans coverage, generates `shotlist.md` first, then SVG pages.
7. After completion, surface the first page + the shotlist via `SendUserFile`.

Use the **pardeh-negaar** sub-agent. The storyboard is the highest-quality deliverable in this project — pardeh-negaar's quality bar (metadata, aspect-correct frames, proper composition, light direction, camera notation, ghost frames, continuity arrows) is enforced.
