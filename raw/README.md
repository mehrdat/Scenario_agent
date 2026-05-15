# raw — Research drop-folder

Drop **anything** in here that the agent should read before writing:

- Books / PDFs (`.pdf`)
- Articles, notes (`.md`, `.txt`)
- Transcripts, subtitle files (`.srt`, `.vtt`)
- Spreadsheets (`.csv`)
- Interview recordings — drop the *transcript*, not the audio (audio can't be read directly)
- Images — name them descriptively, e.g. `bazaar-tehran-1399-night.jpg`. The agent will read filenames; describe them in chat if a visual is critical.
- Video — same as images: descriptive filenames, plus a short description in chat.

## Folder conventions

Group by project slug if you have several stories going at once:

```
raw/
  pardeye-akhar/
    interview-grandmother.txt
    isfahan-1357.pdf
    family-photo-1.jpg
  kafe-tehran-1399/
    cafe-owners-log.md
    menu-photo.jpg
```

When you run `/tahghigh <slug>`, the agent will read the matching subfolder first, then the rest of `raw/` for shared context.

## Privacy note

The remote execution environment is ephemeral, but anything you `git push` lives on GitHub. Don't put **personal interview audio, private contracts, or unreleased footage** in `raw/` unless you're okay with it sitting in the repo. Add sensitive files to `.gitignore`.
