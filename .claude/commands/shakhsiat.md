---
description: شخصیت — Build the character bible (psychology, voice, silhouette, relationships, arc) for a scenario.
argument-hint: [project-slug] [optional: focus character name]
---

Invoke **shakhsiat-pardaaz** for `output/senaario/$1/`.

Inputs:
- Slug: `$1` (required).
- Focus character: `$2` (optional — if given, deep-dive that one character only).

Steps:
1. Read the scenario files and `danesh/$1-research.md` if present.
2. Produce / update `output/shakhsiat/$1.md` per the agent's template.
3. If a focus character is given, append a `### Deep dive — <name>` section with extra detail.
4. Summary ≤4 lines.

Use the **shakhsiat-pardaaz** sub-agent.
