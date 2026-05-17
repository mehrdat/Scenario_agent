---
description: کوتاه — Short-form pipeline optimised for YouTube / Shorts / Reels / TikTok. Hook in first 3s, retention beats every 5-7s, payoff in last 5s. Vertical or horizontal aspect, platform-specific structure.
argument-hint: [project-slug] [platform: youtube-shorts | youtube | reels | tiktok | twitter] [length-seconds] [style for storyboard]
---

Build a short-form video end-to-end, optimized for the platform's algorithm and retention curve.

Inputs (`$ARGUMENTS`):
- Slug: `$1` (required).
- Platform: `$2` — `youtube-shorts` (60s 9:16) · `youtube` (any 16:9) · `reels` (60–90s 9:16) · `tiktok` (15–180s 9:16) · `twitter` (140s 16:9 or 1:1).
- Length (seconds): `$3` — defaults per platform.
- Style for negaareh storyboard: `$4` — see style list (comic / real / noir / anime / ghibli / watercolor / kiarostami / wes-anderson / etc).

If any argument is missing, ask via `AskUserQuestion`. **Always confirm length** — many users misjudge.

## Why this command exists

A 60-second YouTube short is not a shrunken feature. It has its own structure:
- **First 3 seconds = the hook.** Audience decides to keep watching or swipe. Open with the strongest image, the strongest line, the strongest question.
- **Retention beats every 5–7 seconds.** A new visual, a new revelation, a new emotional charge. No flat stretches.
- **Pay off the hook in the last 5 seconds.** The promise the first 3 seconds made must resolve here — or open a loop that pulls them to a longer video.
- **Vertical aspect (9:16) for Shorts/Reels/TikTok.** Composition rules differ — subject usually centered, lots of headroom, on-screen text in the top third.

## Pipeline this command runs

1. **Brief lock** — confirm platform / length / topic / language / audience via one `AskUserQuestion`.
2. **Research** — if `raw/<slug>/` has material, run `pajooheshgar` to distill it.
3. **Hook-first scenario** — Write `output/senaario/$1/` with a short-form structure:
   - `01-logline.md`
   - `02-hook.md` — three competing hook options (0–3s), the agent picks one and explains why.
   - `03-retention-map.md` — a beat-by-beat map: time 0:00 / 0:03 / 0:10 / 0:18 / 0:30 / 0:45 / 0:55, what is on screen, what is the retention "tug" at this beat (revelation, reversal, escalation, visual surprise).
   - `04-script.md` — full short-form script with timestamps to the second. Each line tagged: visual / dialogue / SFX / overlay-text / cut.
5. **Characters** (if any) — single-paragraph mini-bible at `output/shakhsiat/$1.md`.
6. **Storyboard (both fidelities)**:
   - `/storybord $1 all 9x16` (or `16x9` for YouTube long) — the schematic planning board.
   - `/negaareh $1 100 $4 9x16` — the drawn pitch storyboard (100% because it's short — board the whole thing).
7. **AI-video prompts** — `/prompt-video $1 all` tuned to the platform aspect ratio. Each prompt notes which free video generator handles 9:16 best (Hailuo, Pika, Luma, etc).
8. **Critique** — `/naghd $1` with short-form-specific rubric: did the hook earn the keep-watching decision? Are there retention beats every 5–7s? Is the payoff in the last 5s?

## Short-form-specific rubric (used by `/naghd` in this pipeline)

The critique must address:
- **Hook strength** (0–10): would you keep watching at 0:03?
- **Retention curve** — list every 5–7s beat and the "why keep watching" tug.
- **Payoff alignment** — does the ending honor the hook?
- **Visual density** — how many distinct visuals per 10s window? <2 is too thin for short-form.
- **On-screen text plan** — Shorts/Reels/TikTok rely heavily on captions; the script should note where text overlays appear and what they say.
- **Loop potential** — does the last second cut back to a frame that motivates a rewatch?

## Output structure

```
output/senaario/<slug>/
  01-logline.md
  02-hook.md
  03-retention-map.md
  04-script.md
output/shakhsiat/<slug>.md          (if characters)
output/storybord/<slug>/             (schematic)
output/negaareh/<slug>/              (drawn, full 100%)
output/prompt/<slug>.md              (per-shot AI-video prompts at the right aspect)
output/naghd/<slug>.md               (short-form rubric)
```

## Defaults per platform

| Platform | Aspect | Default length | Notes |
|---|---|---|---|
| `youtube-shorts` | 9:16 | 60s | hard cap 60s for monetization eligibility |
| `youtube` | 16:9 | 600s (10min) | long-form; different rules — confirm |
| `reels` | 9:16 | 90s | hard cap 90s |
| `tiktok` | 9:16 | 60s | sweet spot 21-34s; up to 180s allowed |
| `twitter` | 16:9 or 1:1 | 140s | Twitter cuts attention faster than any other platform |

## Honour the user's taste profile

Before writing anything, `Read salighe/profile.md`. Apply the user's stated preferences (visual style, tone, themes, language). If the user has set a default storyboard style there, use it when `$4` is missing.

Use the **daastansaraa** sub-agent as orchestrator. It will delegate to **pardeh-negaar**, **negaaregar**, **shakhsiat-pardaaz**, and **pajooheshgar** as needed.
