---
description: اصلاح — Critique-and-fix loop. Diagnoses the scenario, then applies fixes section-by-section to fulfill each critique point. Can run as critique-only, fix-only, or as an iterative loop (default).
argument-hint: <subcommand> <project-slug> [args...]  ·  subcommands: naghd | behtar | loop (default) | scene N | dialog
---

# /eslaah — critique-and-fix loop

This is the **story-doctor** command. Use it any time a scenario, draft, or finished script needs improvement. The default behaviour runs a full **critique → rewrite → re-critique → re-rewrite** loop, so each round's output is provably better than the last.

Parse `$ARGUMENTS` as `<subcommand> <slug> [args...]`. If first token isn't a known subcommand, treat it as `loop`. If `<slug>` is missing, ask via `AskUserQuestion`.

## Subcommands

### `loop <slug> [rounds=2] [focus]` — **the main mode** (default)
Iterative critique-and-fix. Repeats until rounds are exhausted **or** every critique point in the latest round has been addressed.

For each round N:
1. **Diagnose** — write a critique to `output/naghd/<slug>/round-N.md` with the full rubric (see `naghd` below). Number every critique point: `[C-N.1]`, `[C-N.2]`, …
2. **Plan the fix** — for each critique point, write a one-line plan: *which file, which section, what change.*
3. **Apply fixes** — edit the affected files (`05-scenes.md`, `06-filmnaameh.md`, `04-beats.md`, etc.) to address each `[C-N.k]`. Mark each addressed point in the critique file with `✓ FIXED in <file>:<scene/line ref>` and a one-line description of the change.
4. **Append a changelog block** at the top of `06-filmnaameh.md`:
   ```
   <!-- eslaah round N — <date> — fixed: [C-N.1] [C-N.2] [C-N.3] … -->
   ```
5. **Write `output/eslaah/<slug>/log.md`** appending: round number, critique points addressed, points deferred (with reason), date.
6. If `rounds` > 1 → go to round N+1, but the next critique starts from the *fixed* draft, so it can find new issues introduced by the rewrite or confirm the fixes hold.

**Default `rounds = 2`** — empirically the right number: round 1 catches structural failures, round 2 catches subtler issues introduced by the rewrite. More than 3 rounds gives diminishing returns and risks overcorrection.

`focus` (optional): restrict the loop to one of `structure`, `character`, `dialogue`, `pacing`, `ending`, `act-N`, `scene-N`. The critique still notes other issues but the fix step only touches the focus area.

### `naghd <slug>` — critique only (no rewriting)
Reads every file under `output/senaario/<slug>/`, `output/shakhsiat/<slug>.md`, `danesh/<slug>-research.md`. Writes `output/naghd/<slug>/round-0.md` (numbered 0 because it's a pre-fix baseline) with:

- **Headline verdict** (one paragraph).
- **Strengths** (3–5 bullets with file:line citations).
- **Structural issues** — beat-by-beat. Identify: missing inciting incident, weak midpoint, sagging Act II sequences (using the Frank Daniel 8-sequence test), unearned ending, broken setups/payoffs.
- **Character issues** — per character: want/need clarity, ghost dramatized?, voice differentiation, antagonist's moral argument.
- **Dialogue issues** — sample on-the-nose lines + suggested subtext rewrites.
- **Pacing / redundancy** — non-scenes (begin and end at same value charge), repeated value-charge runs.
- **Genre fit** — does it deliver the genre promise's obligatory scenes?
- **Audience appeal** — what hooks land / fail.
- **Risk register** — censorship, legal, production-feasibility, factual-accuracy flags.
- **Numbered critique points** `[C-0.1]`, `[C-0.2]`, … each with file:line ref + severity (must-fix / should-fix / nice-to-have) + one-line proposed direction.

Does **not** edit any script files. Pair with `behtar` or `loop` to apply fixes.

### `behtar <slug> [round=0]` — apply fixes from a critique without re-critiquing
Reads the latest `output/naghd/<slug>/round-N.md` (or specified round). For each unaddressed `[C-N.k]`, edits the affected file to fulfill it. Marks `✓ FIXED` in the critique file with file:line ref. Appends to `output/eslaah/<slug>/log.md`.

Use this when you want to drive the cycle manually: `eslaah naghd` → review critique → `eslaah behtar` → review fixes → optional next round.

### `scene <slug> <N>` — critique-fix loop scoped to one scene
Same as `loop` but only touches scene N in `05-scenes.md` and `06-filmnaameh.md`. Use when one scene is dragging the project down.

### `dialog <slug> [scope]` — critique-fix loop scoped to dialogue
Same as `loop` but only touches dialogue lines. Calls the dialogue rubric specifically.

---

## What "fulfilling the critique" means

For each numbered critique point, the rewrite must demonstrably address it. Specifically:

- If `[C-N.k]` says "inciting incident lands at page 22 — should be by page 12" → the fix must move it forward and the log records the new page.
- If `[C-N.k]` says "midpoint reversal absent in scene 18" → the fix must introduce a value-charge reversal at scene 18 and the log notes which scene now carries it.
- If `[C-N.k]` says "Maryam's want is vague" → the fix sharpens her want into a specific concrete sentence, and the cross-references are updated.
- If `[C-N.k]` is a "nice-to-have" → it can be deferred with a written reason in the log. Don't silently drop it.

The critique file becomes a **checklist**. Every point is either ✓ FIXED, ⏸ DEFERRED (with reason), or ✗ REJECTED (with reason — only the user can reject, not the agent).

---

## Output structure

```
output/
  naghd/<slug>/
    round-0.md         (initial critique, no rewriting)
    round-1.md         (after first rewrite)
    round-2.md         (after second rewrite)
    gooneh.md          (genre report if /dastan gooneh was run)
    dialog-diff-N.md   (dialogue diffs if /dastan dialog was run)
  eslaah/<slug>/
    log.md             (chronological record of every fix applied)
```

---

## Reporting

At end of each round, report ≤6 lines:
- Round N complete.
- Points addressed: `[C-N.1] [C-N.2] [C-N.3] …` (count).
- Points deferred: count + one-line summary.
- Files changed: list.
- Next step: usually `eslaah loop <slug> <N+1>` or `tasvir <slug> all` if happy with the script.

Use the **daastansaraa** sub-agent.
