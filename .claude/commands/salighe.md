---
description: سلیقه — View or update your personal taste profile. The agents use this to adapt every output (style, tone, voice, themes) to you.
argument-hint: [view | update | reset | learn] [optional: free-text preferences to add]
---

Manage `salighe/profile.md` — the user's personal taste profile that all agents read before producing any work.

## What this is
Your taste profile is a persistent file the agents consult on **every command** so the work always reflects:
- The genres you gravitate to.
- The visual styles you prefer (e.g. Kiarostami realism, noir, Wes Anderson pastel).
- The directors / writers you admire (so the agents lean in that direction).
- Your tone preferences (literary vs. colloquial; restrained vs. florid; ironic vs. earnest).
- Recurring themes you return to (e.g. grief, exile, generational silence, Iran 1357).
- Things to avoid (genres / topics / styles you dislike).
- Your spoken language register (formal Farsi / Tehrani colloquial / Finglish / English).

This profile is the difference between generic output and output that feels written *for you*.

## Modes (`$1`)

### `view` (default if no arg)
Read `salighe/profile.md` and present it as a clean summary in chat. Bullet-list each section. If the file doesn't exist, say so and offer to start one with `/salighe update`.

### `update`
Take `$ARGUMENTS` (everything after `update`) as free-text user preferences. Parse them and merge into the existing profile under the appropriate section. Examples:
- `/salighe update "I love Farhadi-style moral dilemmas, hate slapstick comedy, always Persian-language."`
- `/salighe update "Favorite directors: Kiarostami, Farhadi, Beyzaie, Lynch, del Toro."`
- `/salighe update "Visual style: noir or Kiarostami realism. Never Pixar."`

If the user hasn't passed text, ask via `AskUserQuestion`:

> "What would you like to update?"
> 1. Favorite directors / writers
> 2. Visual style preferences
> 3. Genres I gravitate to
> 4. Themes I'm drawn to
> 5. Tone / voice preference
> 6. Things to avoid
> 7. Language register

Then collect the answer and merge.

### `learn`
Run the **salighe-shenas** sub-agent. It reads every prior output in `output/` and infers patterns:
- Which genres has the user worked in?
- Which structural models do their scripts use?
- Which character archetypes recur?
- Which visual styles have they requested for storyboards?
- Which directors / works have they cited as references?

It then **proposes** updates to the profile and asks the user to confirm before writing. Never overwrites silently.

### `reset`
Archive the existing profile to `salighe/_archive/profile-<date>.md`, then start fresh.

## File structure for `salighe/profile.md`

```markdown
# سلیقه‌ی <user-name or "the user"> · Personal Taste Profile
*Last updated: <ISO date>. Maintained by /salighe and salighe-shenas.*

## Language & register
- Primary language(s): …
- Register: …
- Vocabulary preference: …

## Genres I gravitate to
- …

## Genres / topics to avoid
- …

## Directors & writers I admire (and what I take from each)
- …

## Visual style preferences for storyboards
- Default style for /negaareh: …
- Reference works for color, framing, light: …

## Tonal preferences
- …

## Recurring themes / subjects
- …

## Structural preferences
- Preferred structural model: 3-act / kishōtenketsu / Story Circle / Hero's Journey / mixed
- Typical runtime / format: feature / short / YouTube / series / documentary

## Notes from prior work (auto-observed)
*Populated by `/salighe learn`. The user can edit or remove.*
- …

## Explicit constraints (always)
*Hard rules the user has set.*
- …

## Last 5 commands run
*Maintained automatically — gives agents context on what the user is in the middle of.*
- …
```

## After every update
- Save with the new ISO date.
- Print a 3-line summary of what changed.
- Remind the user: *"From now on, every command (`/senaario`, `/storybord`, `/negaareh`, `/behtar`, …) will consult this profile."*

## On `learn`
Use the **salighe-shenas** sub-agent (defined in `.claude/agents/salighe-shenas.md`). Pass it the project slugs to analyze (or `all` for everything in `output/`). It returns a proposed set of profile updates; this command then asks the user to accept / reject / edit before merging.

Use the **daastansaraa** sub-agent for the orchestration.
