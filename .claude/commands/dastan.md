---
description: داستان — Story development. Subcommands write/refine the scenario, characters, individual scenes, dialogue, genre study, and documentary interviews.
argument-hint: <subcommand> <project-slug> [args...]  ·  subcommands: new | char | scene | dialog | gooneh | mosaahebeh
---

# /dastan — story development hub

Parse `$ARGUMENTS` as `<subcommand> <slug> [rest...]`. If the first token is not a known subcommand, treat the whole `$ARGUMENTS` as a brief and default to `new`. If `<slug>` is missing, ask via `AskUserQuestion`.

Subcommands:

## `new <slug> [free-text brief]` — write a new scenario
Develops a scenario from idea or research.
1. If `danesh/<slug>-research.md` does not exist and `raw/<slug>/` is non-empty → run **pajooheshgar** first.
2. **Read `salighe/profile.md`** for taste preferences.
3. Confirm format / length / genre / language via one `AskUserQuestion` (skip if obvious from the brief).
4. Propose **logline + 3 alternative angles**. Wait for the user's pick.
5. Produce in order under `output/senaario/<slug>/`:
   - `01-logline.md` · `02-synopsis.md` · `03-treatment.md` · `04-beats.md` · `05-scenes.md` · `06-filmnaameh.md`
6. End with a ≤4-line summary + propose the next step (usually `/eslaah <slug> loop` then `/tasvir <slug> all`).

## `char <slug> [character name]` — character bible
Delegates to **shakhsiat-pardaaz**. If a character name is given, deep-dive that one; otherwise build the full cast bible. Output: `output/shakhsiat/<slug>.md`.

## `scene <slug> <N>` — deep-design one scene
Reads `05-scenes.md`, locates scene `<N>`, writes `output/senaario/<slug>/07-sahneh/scene-<N>.md` with:
- Slugline, value charge entering/exiting, objectives per character.
- Beat list: objective → obstacle → tactic → outcome.
- Blocking diagram (Mermaid or ASCII overhead).
- Lens & camera plan per beat.
- Lighting plan (key/fill/back + practicals + colour temperature).
- Sound plan (diegetic / music / silence / off-screen).
- Props & wardrobe.
- Turning point explicitly marked.

## `dialog <slug> [scene-N or character-name]` — rewrite dialogue
Applies the dialogue rubric (5 functions, subtext, voice differentiation, Mamet's tactic-rule, Farsi-specific patterns: ta'arof, generational register, proverb-as-subtext). Edits `06-filmnaameh.md` in place; marks touched lines with `<!-- d -->`. Side-by-side diff at `output/naghd/<slug>/dialog-diff-<scene>.md`.

## `gooneh <slug or free-text idea>` — genre / category consultation
- For an existing project: read its logline + synopsis.
- For a free-text idea: treat the whole argument as the brief.
- Recommend **two genre placements** (primary + hybrid second) with one-paragraph justifications.
- For documentaries: pick a Nichols mode (expository / observational / participatory / reflexive / performative / poetic / essay / archival / re-enactment / hybrid).
- Map obligatory scenes, audience appeal mechanics.
- Suggest **5 reference works** (mix Iranian + international).
- Write report at `output/naghd/<slug>/gooneh.md` (or `output/naghd/_freeform/gooneh-<date>.md` if no slug).

## `mosaahebeh <slug> [subject]` — documentary interview question banks **(opt-in)**
Only run when the documentary actually uses interviews. Many modes don't (observational, poetic, archival/Kapadia, essay). For each named subject, produce `output/senaario/<slug>/08-mosaahebeh/<subject-slug>.md` with: pre-interview brief, setup notes, 5 opening warm-ups, 10–15 core questions (sensory anchoring, then/now splits), 3–5 hard questions, the "impossible" question, cycling-back prompts, long-wait reminder. Master index at `output/senaario/<slug>/08-mosaahebeh/_index.md`.

---

## Cross-cutting rules

- **Always read `salighe/profile.md` first.** Apply the user's preferred language register, genre, themes, tone. The explicit request overrides; the profile shapes ambiguity.
- **Append a one-line observation** to `salighe/_observations.md` after major work (the user runs `/salighe learn` later to fold these into the profile).
- **Speak Farsi when the user does; English when they do; bilingual when useful.**
- **Cite craft** when making structural choices ("midpoint reversal", "ta'arof beat", "Kuleshov cut").

Use the **daastansaraa** sub-agent as orchestrator. It delegates to **shakhsiat-pardaaz**, **pajooheshgar**, etc. as needed.
