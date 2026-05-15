---
description: بهتر — Improve / story-doctor an existing scenario. Diagnoses then prescribes; rewrites in place with the rationale logged.
argument-hint: [project-slug] [optional: focus area, e.g. "act-2", "dialogue", "ending"]
---

Invoke **daastansaraa** to story-doctor `output/senaario/$1/`.

Steps:
1. Read every file under `output/senaario/$1/`. If absent, error politely and offer `/senaario`.
2. Read `danesh/$1-research.md` and `output/shakhsiat/$1.md` if present.
3. Diagnose against the craft checklist:
   - Logline: protagonist + want + obstacle + stakes in ≤25 words?
   - Controlling idea explicit?
   - Inciting incident before page 12 / 10% of runtime?
   - Midpoint reversal present?
   - All-is-lost beat present?
   - Each scene has a value-charge shift?
   - Every character has Want + Need that conflict?
   - Setup → payoff pairs accounted for?
4. Produce `output/naghd/$1.md` — the diagnosis, with line/scene references.
5. Apply edits across the script files. Do not rewrite untouched scenes.
6. Append a changelog block at the top of `06-filmnaameh.md`:
   ```
   <!-- بهبود — <date> — <focus> -->
   ```
7. Summary ≤4 lines.

Focus area (optional): `$2` — restrict edits to that area when supplied.

Use the **daastansaraa** sub-agent.
