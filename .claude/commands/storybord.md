---
description: استوری‌بورد — Schematic SVG storyboard for planning the shoot. Scope picker mandatory; ink style picker (clean / sketchy / cinematic) optional. Low credit cost, opens in any browser.
argument-hint: [project-slug] [scope: sample | key | scene N | scene N-M | sequence N | act N | all] [aspect: 16x9 | 9x16 | 1x1 | 2.39x1] [ink-style: clean | sketchy | cinematic]
---

Invoke **pardeh-negaar** to draw a schematic planning storyboard for `output/senaario/$1/`.

**Use this for:** planning the shoot, blocking the day, scratch notes for a director. Output is real SVG (text) drawn by Claude — clean ink lines, stick-figure-style blocking, frame composition, camera notation. Opens in any browser, costs minimal credit, no external services.

**For pitch-deck-quality drawn images** (comic book, real photo, Wes Anderson, Kiarostami etc.), use `/negaareh` instead — that pipeline calls free image generators (Bing IC, Stable Horde, etc.) and produces real raster art.

## Inputs (`$ARGUMENTS`)

- Slug: `$1` (required).
- Scope: `$2` — if missing, ask via `AskUserQuestion`. **Never default to "all"** — credit safety rail.
  - `sample` — 1 page (~6 panels) from the most visually rich scene. **Recommended default.**
  - `key` — the spine: opening, inciting incident, midpoint, all-is-lost, climax, final image. ~6 panels.
  - `scene N` — one scene only.
  - `scene N-M` — a range of scenes.
  - `sequence N` — one of the 8 sequences (Frank Daniel).
  - `act N` — act 1, 2, or 3.
  - `all` — whole script. Confirm page count first.
- Aspect: `$3` — `16x9` (default), `9x16`, `1x1`, `2.39x1`.
- Ink style: `$4` — optional, ask via `AskUserQuestion` only if the user wants a specific look:
  - `clean` (default) — sharp ink lines, white background, schematic.
  - `sketchy` — wobbly hand-drawn ink (via SVG `feTurbulence` displacement filter), gives a pencil-sketch feel.
  - `cinematic` — toned background (cream / blue / amber depending on shot's lighting), heavier shadow shading, more dramatic.

## Steps

1. Verify `output/senaario/$1/05-scenes.md` or `06-filmnaameh.md` exists. If neither, halt → tell user to run `/senaario` first.
2. **Read `salighe/profile.md`** if it exists. Use stored preferences.
3. If scope missing, ask via `AskUserQuestion` with options: Sample (Recommended) · Key beats · One scene · One sequence · One act · Full script.
4. If the resolved scope projects > **4 pages (24 panels)**, halt + confirm with `AskUserQuestion`.
5. Pass scope + aspect + ink-style to **pardeh-negaar**.
6. Pardeh-negaar reads the source, plans coverage, drafts `shotlist.md`, then SVG pages.
7. Surface `board-01.svg` + `shotlist.md` via `SendUserFile`.

## Hard caps

- 4 pages (24 panels) per call.
- Each SVG ≤ 25 KB.

## When to use this vs `/negaareh`

| You want | Use |
|---|---|
| Quick schematic to plan blocking & coverage | `/storybord` |
| Show producers / festival jury something *drawn* | `/negaareh` |
| Director's day-of reference printed on A4 | `/storybord` |
| Pitch deck / portfolio piece | `/negaareh` |
| Both | Run both — they write to different folders |

Use the **pardeh-negaar** sub-agent.
