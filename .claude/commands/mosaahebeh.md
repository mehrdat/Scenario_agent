---
description: مصاحبه — (Opt-in for documentary projects) Design an interview question bank and shot plan for documentary subjects. Run this only if your documentary uses interviews; many modes (observational, poetic, archival, essay) do not.
argument-hint: [project-slug] [optional: subject name]
---

Invoke **daastansaraa** to design documentary interviews.

**Use this command only when your documentary actually has interviews.** Observational (Wiseman), poetic (Reggio), archival-only (Kapadia), and essay (Marker / Varda) documentaries don't use interviews — for those, run `/storybord` and `/prompt-video` instead.

Inputs:
- Slug: `$1`.
- Subject name: `$2` (optional — if given, deep-design questions for that one subject only).

Steps:
1. Read `output/senaario/$1/01-logline.md`, `02-synopsis.md`, `03-treatment.md`, and the research at `danesh/$1-research.md`.
2. List the documentary subjects (real people to be interviewed). If unclear, ask the user.
3. For each subject, produce a question bank at `output/senaario/$1/mosaahebeh/<subject-slug>.md`:
   - **Pre-interview brief**: who they are, their role in the story, what arc they serve.
   - **Setup notes**: room, lens, eye-line, presence of family / colleagues.
   - **Opening questions** (5): low-stakes warm-ups — facts, dates, ordinary memories.
   - **Core questions** (10–15): "take me back to the day…", sensory anchoring, then/now splits.
   - **Hard questions** (3–5): the questions you actually need the answers to. Plan how to ask them, when in the interview to deploy them, and what to do if the subject deflects.
   - **The "impossible" question** (1): the one they can't answer simply — the struggle is the content.
   - **Cycling-back prompts**: "Earlier you said X, but later you said Y — how do those live in the same person?"
   - **The long-wait reminder**: after their answer, wait 8–10 seconds before the next question.
4. Produce a master index at `output/senaario/$1/mosaahebeh/_index.md` listing all subjects, suggested order of interviews, and which themes each subject illuminates.
5. **Do not** generate filler material for subjects the user did not name.
6. Summary ≤4 lines + a one-line note that the next step is usually `/storybord $1 key` to board the B-roll spine alongside the interview audio.

Use the **daastansaraa** sub-agent.
