---
description: نگاره — Comic-book / Hollywood storyboard with REAL drawn images via Pollinations.ai (free, no API key). Produces an HTML contact-sheet you open in your browser. Scope is percentage of runtime.
argument-hint: [project-slug] [percentage 1-100] [style: comic | realistic | anime | noir | watercolor | graphic-novel] [aspect: 16x9 | 9x16 | 1x1 | 2.39x1]
---

Invoke **negaaregar** to plan and prompt a comic-book-grade storyboard.

**What this produces:** An HTML contact sheet at `output/negaareh/$1/board.html`. Each panel is rendered as a real drawn image by **Pollinations.ai** (a free image API — no key required) when you open the HTML in any browser. Claude does *not* draw the images; it writes the prompts and assembles the page. The browser does the fetching.

This replaces the previous SVG-based `/negaareh`. For schematic planning boards (clean stick-figure SVGs, low credit), use `/storybord` instead.

Inputs (`$ARGUMENTS`):
- Slug: `$1` (required).
- Percentage: `$2` — integer 1–100. The fraction of total runtime to board. Scenes are picked by dramatic weight (climax/midpoint/inciting/all-is-lost first, then turning points, then setups) until cumulative duration ≥ target.
- Style: `$3` — `comic` (default) / `realistic` / `anime` / `noir` / `watercolor` / `graphic-novel`.
- Aspect: `$4` — `16x9` (default) / `9x16` / `1x1` / `2.39x1`.

Steps:
1. Verify `output/senaario/$1/05-scenes.md` and `04-beats.md` exist. If not, halt and direct the user to `/senaario` first — we cannot board what isn't written.
2. If percentage missing, ask via `AskUserQuestion` with options: 10% (key beats only) · 25% (recommended default — spine) · 50% (extended spine + secondaries) · 100% (whole film, confirm page count first).
3. Pass to **negaaregar**.
4. Negaaregar:
   - Selects scenes by dramatic weight to hit the percentage target.
   - Builds a `_cast-map.md` so character faces stay consistent across panels (Flux honors repeated character phrases).
   - Writes 60–120-word optimized comic-book prompts per panel.
   - URL-encodes each prompt and assembles `board.html` with `<img src="pollinations-url"/>` per panel.
   - Writes `prompts.tsv` for bulk offline rendering via `tools/render-panels.sh`.
   - Writes `prompts.md` (human-readable + Bing/Leonardo paste fallback), `shotlist.md`, `coverage.md`.
5. Hard caps: max **36 panels per call**. Beyond that, halt and confirm.
6. After completion, surface `board.html` via `SendUserFile`. Tell the user: *"Open board.html in your browser. Each panel loads from Pollinations.ai in 5–15 seconds."*

### How the user views it
- Open `output/negaareh/$1/board.html` in any modern browser (Chrome, Firefox, Safari, Edge). The browser fetches each image from `image.pollinations.ai` on first load.
- For an offline archive: run `tools/render-panels.sh output/negaareh/$1/prompts.tsv` to download all panels as JPGs.
- Fallback if Pollinations is unreachable from the user's network: paste the prompts from `prompts.md` into **Bing Image Creator** (free DALL·E 3), **Leonardo AI free**, or **Krea free**.

Use the **negaaregar** sub-agent. Claude doesn't draw; Pollinations.ai (Flux Schnell) does. We orchestrate.
