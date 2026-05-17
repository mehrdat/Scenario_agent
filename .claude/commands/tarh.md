---
description: طرح — Planning stage. Determines narrator personality, studies popular styles in the chosen format, builds a plan, runs its own critique-fix loop, waits for your approval before the scenario stage begins.
argument-hint: <subcommand> <project-slug> [args...]  ·  subcommands: new | critique | fix | loop (default) | approve | show
---

# /tarh — planning blueprint (the gate between research and scenario)

The **planning gate**. Research is done, but no scenario yet. Before writing the script, the agent must:

1. Determine the **narrator's personality** (POV, voice, biases, register).
2. **Study popular styles** in the chosen format — what's working now and why.
3. Build a **plan** — big idea, audience, genre/tone/style, structural model, geographic + cultural anchors, narrative spine, visual + video style directions.
4. Run a **critique-fix loop on the plan itself**.
5. Wait for the user to **explicitly approve** the plan.
6. Only then does `/dastan new` get to write the scenario.

Without this gate, scenarios get written before the writer has decided what film they're making.

Parse `$ARGUMENTS` as `<subcommand> <slug> [args...]`. Default subcommand: `new` if no plan exists, otherwise `loop`. If `<slug>` missing, ask via `AskUserQuestion`.

---

## Subcommands

### `new <slug>` — build the initial plan

Pre-requisite: `danesh/<slug>-research.md` should exist if `raw/<slug>/` has material. If not, recommend `/tahghigh <slug>` first.

#### 1. Lock the narrator personality

Ask the user via `AskUserQuestion` — several dimensions, one question each (so the user can answer cleanly):

- **Person & POV**: 1st (I) / 2nd (you) / 3rd omniscient / 3rd limited / multiple POVs / documentary observer.
- **Reliability**: reliable / unreliable / dramatically ironic.
- **Voice register**: literary / colloquial / poetic / journalistic / academic / street.
- **Emotional tone**: detached / warm / acerbic / wondering / grieving / angry / reverent / ironic.
- **Cultural anchor**: insider / outsider / diaspora.
- **For Iranian work**: pre-revolutionary / war / post-revolution / digital / diaspora generation.

Save the answers + agent's analysis to `output/tarh/<slug>/01-narrator.md`:

```markdown
# Narrator Personality — <slug>

## Person & POV: ...
## Reliability: ...
## Voice register: ...
## Emotional tone: ...
## Cultural anchor: ...
## Generation: ...

## Three sample sentences in this narrator's voice
1. ...
2. ...
3. ...

## What this narrator CANNOT say
(the things the voice forbids — an Errol Morris narrator never explains an emotion directly; a Wiseman narrator never speaks at all; a digital-generation Iranian narrator never uses Pahlavi-era vocabulary)

## Reference works whose narrator this voice echoes
- ...
```

#### 2. Style study

Read `salighe/profile.md`, `danesh/<slug>-research.md`, and the chosen format. Ask: feature / YouTube long / YouTube short / Reels / TikTok / documentary / music video / advert.

Write `output/tarh/<slug>/02-style-study.md` — a survey of 3–5 currently popular reference works in that format, what each does well, what audiences in this format reward / reject, and a recommended direction synthesizing all of the above against the user's taste profile.

Structure:
```markdown
# Style Study — <slug>
## Format: ...
## What's working in this format right now

### Reference 1: {Title} ({director / channel}, {year})
- Why it works: ...
- Structural choice: ...
- Visual signature: ...
- Tonal choice: ...
- Audience-appeal mechanism: hook → retention → payoff pattern

### References 2-5: same structure.

## Patterns across the references
- Structural patterns: ...
- Visual patterns: ...
- Tonal patterns: ...
- What audiences reward: ...
- What audiences reject: ...

## Recommended direction
*One paragraph: what to borrow, what to reject, what to innovate. Cite the user's taste profile.*
```

#### 3. The plan itself

Write `output/tarh/<slug>/03-plan.md`:

```markdown
# Plan — <slug>

## The big idea (controlling idea, one sentence)
*"The story argues that X because Y."*

## Format & length
{feature 90min / YouTube short 60s 9:16 / documentary 22min / etc.}

## Target audience (specifically)
*Not "everyone". E.g. "Iranian diaspora 30-45 on YouTube who follow Mehrdad Oskouei or Mahnaz Afzali" — specific enough to make taste decisions against.*

## Genre / tone / register
{primary + hybrid + tonal register}

## Structural model
{3-act / Save the Cat / Story Circle / Hero's Journey / Kishōtenketsu / Sequence Approach / short-form hook-retention-payoff}

## Geographic anchor (read the relevant geography pack from templates/detail-packs.md)
- Country: ...
- City / region: ...
- Specific district / setting: ...
- Period: year, season, time of day pattern
- Architectural / material details: ...

## Cultural anchor (relevant culture pack from templates/detail-packs.md)
- Primary character culture: ...
- Specific markers: dress, register, gestures, taboo zones
- Generational positioning: ...
- Religious / political backdrop: ...

## Narrator personality
*Reference 01-narrator.md — restated here for plan coherence.*

## Visual style direction (storyboard track)
{which key from the 20-preset library: comic / noir / kiarostami / ghibli / etc.}

## Video style direction (final YouTube video track)
{which photoreal video style: photoreal-cinema / -doc / -vlog / etc.}

## Theme / controlling idea
{one-sentence argument the film makes}

## Narrative spine (8-12 beats)
1. Opening image: ...
2. Inciting incident: ...
3. Plot point 1: ...
4. Midpoint: ...
5. Pinch 2: ...
6. All-is-lost: ...
7. Break into 3: ...
8. Climax: ...
9. Final image: ...

## Sound direction
- Ambient bed: ...
- Music direction (instrument, mood, references): ...
- Dialogue language and register: ...

## What this project must NOT be
{lines that constrain — "not a generic Iran doc; not voiceover-heavy; not melodramatic; no Orientalist gaze"}

## What this project must DO
{obligations — "must portray Isfahan with architectural specificity; must give the elder dignity not pity; must end on a question not an answer"}

## Open questions for critique
{2-3 uncertainties for the critique loop to test}
```

#### 4. Auto-run critique loop
Immediately run `/tarh loop <slug>` (see below).

#### 5. Report
Tell the user: *"Plan drafted at `output/tarh/<slug>/03-plan.md`. Critique loop in progress. When complete, review and run `/tarh approve <slug>` to unlock the scenario stage."*

### `critique <slug>` — critique the current plan

Read all three plan files. Write `output/tarh/<slug>/critique-N.md` (auto-numbered):

- **Headline verdict** — is this a plan a strong film could grow from?
- **Strengths** — what's working with file:line refs.
- **Issues** — numbered `[CP-N.k]` (CP = critique-plan), each with severity (must-fix / should-fix / nice-to-have).
- **Plan-specific rubric**:
  - Is the controlling idea sharp, single-sentence, and testable?
  - Does the format match the idea? (a YouTube short isn't a feature.)
  - Is the target audience specific enough to make taste decisions against?
  - Does the narrator personality fit the material?
  - Are the geographic and cultural anchors specific enough to avoid generic clichés?
  - Does the visual-style direction match the tonal direction?
  - Does the narrative spine have a midpoint reversal? An earned climax? A final image that pays off the opening?
  - What popular-style patterns from `02-style-study.md` is the plan ignoring or contradicting?
  - What is the plan over-confident about?
  - What's missing entirely?
- **Recommended next move** — one concrete action.

### `fix <slug>` — apply critique fixes
Read latest `critique-N.md`. For each must-fix `[CP-N.k]`, edit the affected plan file. Mark `✓ FIXED in <file>:<section>` in the critique. Append to `output/tarh/<slug>/log.md`.

### `loop <slug> [rounds=2]` — critique → fix → critique → fix
Default 2 rounds. Round 1 critique → round 1 fix → round 2 critique on the fixed plan → round 2 fix. Each `[CP-N.k]` ends as `✓ FIXED`, `⏸ DEFERRED` (with reason), or `✗ REJECTED` (user-only).

### `approve <slug>` — mark plan as approved
Ask via `AskUserQuestion`:

> "Approving locks the plan as the contract for the scenario stage. Choose:
> 1. **Yes** — approve and unlock `/dastan new`
> 2. Show me the plan first
> 3. Run another critique round
> 4. Let me edit it myself"

On yes, create `output/tarh/<slug>/_approved.md`:

```markdown
# Plan approved — <slug>
*Date: <ISO>*
*Rounds: <N>  ·  Must-fix open: 0  ·  Deferred: <count>*

The plan at `03-plan.md` is locked.
```

Tell the user: *"Plan approved. Run `/dastan new <slug>` now to write the scenario, or `/zanjireh <slug>` to continue the full pipeline."*

### `show <slug>` — print current plan summary
Concise summary of `03-plan.md` + status ("Critique rounds: N. Approved: yes/no.")

---

## How this gates the rest of the pipeline

- `/dastan new <slug>` checks for `_approved.md`. If absent and the user hasn't explicitly waived planning, halt + recommend `/tarh new <slug>` first.
- `/zanjireh kaameleh <slug>` runs `/tarh` as a mandatory stage between `/tahghigh` and `/dastan new`.
- `/tasvir bible <slug>` reads `01-narrator.md` + `03-plan.md` so the Visual Bible inherits the locked anchors. No re-deciding mid-stream.
- `/tasvir prompts <slug>` reads `03-plan.md` for the narrator's voice (audio prompts), the geographic + cultural anchors (which detail-packs to inject), and the visual + video style directions.

Use the **daastansaraa** sub-agent.
