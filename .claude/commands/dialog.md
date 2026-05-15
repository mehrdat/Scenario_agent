---
description: گفتگو — Rewrite dialogue: cut filler, sharpen subtext, differentiate voices, idiomatize for Farsi / English / hybrid.
argument-hint: [project-slug] [optional: scene-number or character name]
---

Invoke **daastansaraa** to dialogue-doctor.

Inputs:
- Slug: `$1`.
- Optional: scene number OR character name in `$2`.

Steps:
1. Read script + character bible.
2. Apply the dialogue checklist:
   - Cut first and last line of each scene unless functionally load-bearing.
   - Every line: reveals character OR advances plot (ideally both).
   - Subtext over text. Replace on-the-nose lines with deflections.
   - Voice differentiation: lexicon, length, idiolect markers from the bible.
   - Idiomatic Farsi: ta'arof, generational markers, regional dialect cues if relevant.
   - Strip exposition; convert to dramatized reveal.
3. Edit `06-filmnaameh.md` in place. Mark touched lines with a trailing `<!-- d -->` comment so the user can grep them.
4. Save a side-by-side diff at `output/naghd/$1-dialog-<scene>.md` for the user to review.
5. Summary ≤4 lines.

Use the **daastansaraa** sub-agent.
