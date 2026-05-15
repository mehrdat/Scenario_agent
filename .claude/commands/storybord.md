---
description: استوری‌بورد — Generate a real SVG storyboard + markdown shot-list from a finished scene list. Six panels per page, stick-figure blocking, camera notation, durations.
argument-hint: [project-slug] [optional: aspect ratio: 16x9 | 9x16 | 1x1 | 2.39x1]
---

Invoke **pardeh-negaar** to draw the storyboard for `output/senaario/$1/`.

Inputs:
- Slug: `$1`. If missing, ask.
- Aspect ratio: `$2` (default `16x9`).

Steps:
1. Verify `output/senaario/$1/05-scenes.md` or `06-filmnaameh.md` exists. If neither, halt and tell the user to run `/senaario` first.
2. Read the script. Decide a shot count per scene (2–10).
3. Generate SVG pages at `output/storybord/$1/board-NN.svg` (6 panels per page). One scene may span multiple pages.
4. Generate `output/storybord/$1/shotlist.md` — a single table covering every panel.
5. Generate `output/storybord/$1/timeline.md` — a Mermaid Gantt-style timeline of scenes.
6. Report total panels, estimated runtime, and the list of file paths. Use `SendUserFile` to surface the first SVG and the shotlist.

Use the **pardeh-negaar** sub-agent. The storyboard is the most important deliverable — do not skip the SVG step.
