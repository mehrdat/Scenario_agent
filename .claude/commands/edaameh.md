---
description: ادامه — Resume a partially-finished project. Detects which pipeline steps have artifacts on disk and runs ONLY the missing ones. Never re-runs completed steps. Use this instead of /zanjireh when you've already started a project and want to continue from where you left off.
argument-hint: [project-slug] [optional: variant: kaameleh | documentary | tabligh | bazneveshtan] [optional: --force-from <step>]
---

Invoke **daastansaraa** to resume the pipeline from the last completed step.

Inputs:
- Slug: `$1` (required).
- Variant: `$2` (default `kaameleh` — same set as `/zanjireh`).
- `--force-from <step>` (optional): if supplied, re-runs from that step onward even if the artifact exists. Step names: `tahghigh | senaario | shakhsiat | behtar | storybord | prompt-video | prompt-storyboard | naghd`.

### Step → artifact map (what counts as "done")

| Step | Artifact that proves it's done |
|---|---|
| `tahghigh` | `danesh/$1-research.md` exists and is non-empty |
| `senaario` | `output/senaario/$1/06-filmnaameh.md` exists |
| `shakhsiat` | `output/shakhsiat/$1.md` exists |
| `behtar` | `output/senaario/$1/06-filmnaameh.md` contains a `<!-- بهبود — … -->` changelog line |
| `storybord` | `output/storybord/$1/shotlist.md` exists AND at least one `board-*.svg` |
| `prompt-video` | `output/prompt/$1-video-prompts.md` exists |
| `prompt-storyboard` | `output/prompt/$1-storyboard-prompts.md` exists |
| `naghd` | `output/naghd/$1.md` exists |

### Procedure

1. **Audit.** Run the step→artifact check above. Build a punch list in this exact format and post it BEFORE doing any work:

   ```
   📋 Project: <slug>   Variant: <variant>

   ✅ Done
     - tahghigh          danesh/<slug>-research.md
     - senaario          output/senaario/<slug>/06-filmnaameh.md
     - shakhsiat         output/shakhsiat/<slug>.md

   🔄 Remaining
     - behtar
     - storybord
     - prompt-video      ← THE FINAL & MOST IMPORTANT FILE
     - prompt-storyboard (secondary)
     - naghd
   ```

2. **Confirm.** Ask the user with `AskUserQuestion`: *"Resume from `behtar` and run the remaining 5 steps? (Resume / Resume but stop after prompt-video / Cancel)"*. If `--force-from` was passed, skip this question and re-run from that step.

3. **Resume.** Run only the remaining steps, in the canonical order:
   1. `tahghigh`
   2. `senaario`
   3. `shakhsiat`
   4. `behtar`
   5. `storybord`
   6. **`prompt-video`** ← the final and most important deliverable
   7. `prompt-storyboard` ← secondary
   8. `naghd`

   Run sub-agents in parallel when their inputs are independent (e.g. `shakhsiat` alongside `behtar`, `prompt-storyboard` alongside `naghd`).

4. **Post a one-line status after each step.** Example:
   ```
   ▶ storybord (3/5)  — pardeh-negaar drawing 6 panels…
   ✓ storybord (3/5)  — output/storybord/<slug>/board-01.svg
   ```

5. **At the very end**, surface the deliverables in this exact order — primary first, secondary after:

   ```
   🎬 PRIMARY (paste these into any free AI video generator):
       output/prompt/<slug>-video-prompts.md

   🖼  Secondary (storyboard stills for previz / pitch deck):
       output/prompt/<slug>-storyboard-prompts.md

   📐 Supporting:
       output/storybord/<slug>/shotlist.md
       output/storybord/<slug>/board-01.svg
       output/senaario/<slug>/06-filmnaameh.md
       output/shakhsiat/<slug>.md
       output/naghd/<slug>.md
   ```

   Send the **video-prompts** file via `SendUserFile` first, then the rest. The user must always see the video prompts at the top.

### Edge cases

- **Nothing done yet.** If no artifacts exist, tell the user: *"Nothing started yet. Run `/zanjireh $1` to begin."* and stop.
- **Everything done.** If every artifact exists, tell the user: *"All steps complete. Run with `--force-from <step>` to redo a stage, or `/naghd $1` for a fresh critique, or `/behtar $1` to story-doctor again."*
- **Out-of-order resume.** If a later artifact exists but an earlier one is missing (e.g., user has a storyboard but no character bible), warn and ask whether to fill in the gap or skip it.
- **Variant change.** If the user passes a different variant than the one originally used, ask before proceeding — switching variants mid-project usually means restarting.

### Why this exists

`/zanjireh` runs the whole chain top-to-bottom. If you ran it once, paused, and want to keep going (or fix a single broken step), `/edaameh` is the safe way back in — it never overwrites finished work, never re-runs completed sub-agents, and always surfaces the video-prompts file as the headline deliverable at the end.

Use the **daastansaraa** sub-agent as the orchestrator.
