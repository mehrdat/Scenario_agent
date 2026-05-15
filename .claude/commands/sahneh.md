---
description: صحنه — Design a single scene in depth: blocking, lensing, lighting, sound, props, beat-by-beat objective-obstacle-tactic.
argument-hint: [project-slug] [scene-number]
---

Invoke **daastansaraa** to deep-design a single scene.

Inputs:
- Slug: `$1`.
- Scene number: `$2` (matches the numbering in `04-scenes.md`).

Steps:
1. Read `output/senaario/$1/05-scenes.md` or `06-filmnaameh.md`. Locate scene `$2`.
2. Read `output/shakhsiat/$1.md` for character context.
3. Write `output/senaario/$1/sahneh/scene-$2.md` with:
   - **Slugline** (INT./EXT. LOCATION — TIME).
   - **Value charge** entering / exiting (+ / − / question-mark).
   - **Objectives** per character.
   - **Beat list** — each beat: objective → obstacle → tactic → outcome.
   - **Blocking diagram** (Mermaid or ASCII overhead).
   - **Lens & camera plan** per beat.
   - **Lighting plan** — key/fill/back + practicals + colour temperature.
   - **Sound plan** — diegetic, music, silence, off-screen cues.
   - **Props & wardrobe notes**.
   - **Turning point** — explicitly marked.
4. Summary ≤4 lines + a one-line invitation to run `/storybord` to redraw just this scene's panels.

Use the **daastansaraa** sub-agent.
