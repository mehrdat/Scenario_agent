---
description: سناریو — Develop a scenario from idea, brief, or raw research. Produces logline → synopsis → treatment → beat sheet → scene list → script.
argument-hint: [project-slug] [optional: free-text brief]
---

Invoke the **daastansaraa** agent to develop a scenario.

Inputs (`$ARGUMENTS` holds the full argument string):
- First whitespace-separated token = project slug (kebab-case Latin). If missing, ask.
- Everything after the first token = free-text brief. If empty, ask the user for one.

Steps the agent must take:
1. Run **pajooheshgar** first if `danesh/<slug>-research.md` does not yet exist and `raw/` is non-empty.
2. Confirm format / length / genre / language with one `AskUserQuestion`.
3. Propose **logline + 3 alternative angles** before going long.
4. On user approval, produce in order, each as its own file under `output/senaario/<slug>/`:
   - `01-logline.md`
   - `02-synopsis.md`
   - `03-treatment.md`
   - `04-beats.md` (Save-the-Cat or three-act, the agent picks)
   - `05-scenes.md` (numbered scene list, sluglines + 1-paragraph each)
   - `06-filmnaameh.md` (full script in standard format)
5. End with a ≤4-line summary and propose the next pipeline step (usually `/storybord`).

Use the **daastansaraa** sub-agent.
