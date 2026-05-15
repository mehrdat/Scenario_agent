---
description: تحقیق — Read everything in `raw/` (books, PDFs, transcripts, image filenames, video filenames, notes) and produce a structured research note.
argument-hint: [project-slug]
---

Invoke **pajooheshgar** to scan `raw/` and build `danesh/$1-research.md`.

Steps:
1. `ls -R raw/`. If empty, tell the user how to drop research material in and halt.
2. Read every text-form file. PDFs in 20-page chunks. Images & videos: log filename + best guess.
3. Produce / update `danesh/$1-research.md` per the agent template.
4. Return a 5-bullet summary of the strongest findings + open questions.

Use the **pajooheshgar** sub-agent.
