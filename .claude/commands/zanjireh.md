---
description: زنجیره — End-to-end pipeline. Runs tahghigh → dastan new → eslaah loop (critique+fix) → tasvir bible → tasvir bord → tasvir negaareh → tasvir prompts. Variants for feature, documentary, short-form, ad, and rewrite.
argument-hint: <project-slug> [variant: kaameleh | documentary | koutaah | tabligh | bazneveshtan] [optional: free-text brief]
---

# /zanjireh — full pipeline

Run the whole chain on one project. The default variant `kaameleh` (کامله = "complete") includes a built-in critique-and-fix loop after the first scenario draft.

Parse `$ARGUMENTS` as `<slug> [variant] [brief...]`. Default variant: `kaameleh`. If `<slug>` missing → ask.

## Cross-cutting setup (every variant)

1. **Read `salighe/profile.md`** — apply user taste preferences.
2. **Check `raw/<slug>/`** — if non-empty and `danesh/<slug>-research.md` doesn't exist, run `/tahghigh <slug>` first.
3. After each major step, post a one-line status update so the user sees progress.
4. After the whole pipeline, surface key deliverables via `SendUserFile` and write a project dashboard at `output/_projects/<slug>.md` summarising what was produced.

---

## Variant: `kaameleh` (feature, default)

The full pipeline now includes a **planning gate** (`/tarh`) between research and scenario. The plan must be approved by the user before the scenario stage is unlocked. This prevents the system from writing a scenario before the writer has decided what film they are making.

```
1. /tahghigh <slug>                    (if raw/<slug>/ has material)

2. /tarh new <slug>                    ★ PLANNING GATE
                                       2a. Lock narrator personality
                                           (POV, reliability, voice register,
                                            emotional tone, cultural anchor,
                                            generation if Iran-set)
                                       2b. Style study — survey 3-5 popular
                                           reference works in the chosen format,
                                           identify what works
                                       2c. Build the plan: big idea, audience,
                                           genre/tone, structural model,
                                           geographic + cultural anchors,
                                           narrative spine, visual + video
                                           style directions

3. /tarh loop <slug> 2                 ★ CRITIQUE-FIX LOOP ON THE PLAN
                                       Round 1 critique → fix → Round 2 critique
                                       → fix. Each [CP-N.k] point ends as FIXED
                                       or DEFERRED.

4. ASK USER: "/tarh approve <slug>?"   Pipeline pauses here. User reviews the
                                       plan and explicitly approves. Without
                                       approval, the scenario stage does NOT run.

5. /dastan new <slug>                  (logline → synopsis → treatment → beats →
                                        scenes → script — informed by the
                                        approved plan)

6. /dastan char <slug>                 (character bible — parallel with step 7)

7. /eslaah loop <slug> 2               ★ CRITIQUE-FIX LOOP ON THE SCENARIO
                                       Round 1 → round 2. Each [C-N.k] point.

8. /tasvir bible <slug>                (Visual Bible inheriting from /tarh's
                                        locked anchors: narrator voice,
                                        geography, culture, visual style,
                                        video style — plus per-act palette,
                                        light, lens, locked cast phrases,
                                        locked location phrases. Also reads the
                                        critique log and writes
                                        10-critique-constraints.md)

9. /tasvir bord <slug> key             (schematic SVG of the spine)

10. /tasvir negaareh <slug> 25         (drawn HTML studio — 25% by weight)

11. /tasvir prompts <slug>             ★ EXTREME-DETAIL PROMPTS BUNDLE
                                       Track 1 storyboard prompts + Track 2
                                       photoreal video prompts, each composed
                                       from:
                                         • Visual Bible locks (cast / location
                                           / palette / light / lens)
                                         • Detail packs (geography, culture,
                                           motion, sensory, light, camera
                                           language)
                                         • Critique constraints from step 7
                                         • Shot-level specifics
                                       Per-engine variants for 9 free video
                                       generators (Sora 2, Veo 3, Kling, Hailuo,
                                       Pika, Luma, Runway, Wan, Pixverse).
                                       Audio companion (narration, music, SFX).

12. Final /eslaah naghd <slug>         (post-pipeline critique)
```

Run steps 6 + 7 in parallel where independent. Run step 9 + 10 in parallel.

**The planning gate is mandatory** in `kaameleh`. To skip it (e.g. you already have a finished plan or you trust the agent), pass the explicit flag `kaameleh-skip-plan`. Otherwise the pipeline halts at step 4 until the plan is approved.

## Variant: `documentary`

```
1. /tahghigh <slug>
2. /dastan gooneh <slug>               (pick a Nichols mode: expository / observational /
                                        poetic / archival / essay / participatory / hybrid)
3. /dastan new <slug>                  (scenario informed by mode choice)
4. /eslaah loop <slug> 2               (critique-fix loop — doc rubric)
5. /tasvir bible <slug>
6. Suggest: "Will this documentary use interviews? Run `/dastan mosaahebeh <slug>` if yes,
   otherwise we proceed with B-roll only." Wait for user.
7. Write `output/senaario/<slug>/broll.md` — B-roll plan: illustrative / counterpoint /
   question / answer shots per scene.
8. /tasvir bord <slug> all
9. /tasvir negaareh <slug> 25          (style picker — usually `real`, `bw-photo`, or `kiarostami`)
10. /tasvir prompts <slug>             (with audio prompts that emphasize voiceover + ambient)
```

**Do not auto-generate interview questions.** Only run `mosaahebeh` if the user explicitly asks.

## Variant: `koutaah` (short-form: YouTube Shorts / Reels / TikTok / Twitter)

Ask via `AskUserQuestion`: platform (youtube-shorts / youtube / reels / tiktok / twitter) and length.

```
1. (Brief lock — confirm platform/length/topic/audience/language)
2. /tahghigh <slug>                    (if raw/<slug>/ has material)
3. Write `output/senaario/<slug>/`:
   - 01-logline.md
   - 02-hook.md           ★ Three competing hook options for the first 3 seconds.
                          Agent picks one, justifies.
   - 03-retention-map.md  ★ Beat-by-beat map at 0:00 / 0:03 / 0:10 / 0:18 / 0:30 / 0:45 / 0:55.
                          Each beat: what's on screen + the "retention tug".
   - 04-script.md         Full script with second-by-second timestamps. Each line tagged
                          visual / dialogue / SFX / overlay-text / cut.
4. /eslaah loop <slug> 2 with short-form rubric:
   - Hook strength (would you keep watching at 0:03?)
   - Retention curve — every 5-7s beat has a "tug".
   - Payoff alignment — last 5s honors the hook.
   - Visual density — 2+ distinct visuals per 10s.
   - On-screen text plan.
   - Loop potential — does the last frame motivate a rewatch?
5. /tasvir bible <slug>                (style picker — ask user)
6. /tasvir bord <slug> all 9x16        (vertical schematic)
7. /tasvir negaareh <slug> 100 <style> 9x16    (full 100% drawn — short-form is short)
8. /tasvir prompts <slug>              (with engine recommendations: Hailuo/Pika/Luma
                                        handle 9:16 best)
```

Platform defaults (length in seconds, aspect):
- `youtube-shorts`: 60s 9:16 (hard cap 60 for monetization).
- `youtube`: any 16:9 (confirm length — long-form has different rules).
- `reels`: 90s 9:16 (hard cap 90).
- `tiktok`: 60s 9:16 (sweet spot 21-34s; up to 180s allowed).
- `twitter`: 140s 16:9 or 1:1.

## Variant: `tabligh` (ad / music-video)

```
1. Brief lock — product/song/intent/duration/audience.
2. /dastan new <slug>                  (3-act compressed: setup → conflict → resolve in 60-90s)
3. /eslaah loop <slug> 1
4. /tasvir bible <slug>
5. /tasvir bord <slug> all
6. /tasvir negaareh <slug> 100
7. /tasvir prompts <slug>
```

Default aspect 16:9 unless platform-bound.

## Variant: `bazneveshtan` (rewrite an existing scenario the user already has)

Skip the writing step; the user has already written something. Start the critique-fix loop:

```
1. /eslaah loop <slug> 3               (3 rounds for rewrites — round 3 polishes)
2. /tasvir bible <slug>                (or update if exists)
3. /tasvir prompts <slug>              (re-emit all prompts with the updated script)
4. /tasvir negaareh <slug> 25 <style>  (re-board if storyboard exists)
```

---

## Project dashboard

After the pipeline, write `output/_projects/<slug>.md`:

```markdown
# Project: <slug>
*Last run: <date>  ·  Variant: <variant>*

## Status
- Scenario: ✓ (output/senaario/<slug>/06-filmnaameh.md)
- Characters: ✓ (output/shakhsiat/<slug>.md)
- Visual Bible: ✓ locked (style: <style>)
- Critique rounds: <N> (last: output/naghd/<slug>/round-<N>.md)
- Storyboard schematic: ✓ <pages> pages (output/storybord/<slug>/)
- Storyboard drawn: ✓ <panels> panels at <%>% (output/negaareh/<slug>/studio.html)
- Prompts bundle: ✓ (output/prompt/<slug>/)
- Final critique: ✓ (output/naghd/<slug>/round-final.md)

## Open issues
<list of deferred critique points>

## Suggested next
<one-line recommendation>
```

---

## Reporting

End with ≤8 lines:
- Variant + slug.
- Rounds of critique-fix completed + #points addressed.
- Files written (count by type).
- Storyboard panels.
- Path to the project dashboard.
- Where to open first (usually `output/prompt/<slug>/06-comparison-guide.md` or the studio HTML).

Use the **daastansaraa** sub-agent as orchestrator. Run **pardeh-negaar**, **negaaregar**, **shakhsiat-pardaaz**, **pajooheshgar**, **salighe-shenas** in parallel where independent.
