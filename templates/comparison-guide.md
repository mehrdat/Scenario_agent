# Comparison guide — {{TITLE}}
*Audit your existing footage against the planned shots. One shot per block. Tick the boxes while you watch.*

> **How to use this file**:
> 1. Open your edit on one monitor (or in a window beside this one).
> 2. Cue to the shot named in each block below.
> 3. Read the prompt — that's what the shot *should* look like according to the Visual Bible.
> 4. Tick the five-question rubric. If two or more fail, the shot needs a re-shoot, a re-grade, or a re-cut.
> 5. The summary at the bottom of this file aggregates your ticks into a "shots needing attention" list.

---

## Shot-by-shot audit

{{FOR EACH SHOT}}

### Shot {{SHOT_ID}} — Scene {{SCENE_NO}}, Shot {{SHOT_NO}}
**Slug**: {{SLUGLINE}} · **Time**: {{TIMECODE_IN}} – {{TIMECODE_OUT}} ({{DURATION}}s)
**Size · Lens · Height · Move**: {{SHOT_SIZE}} · {{LENS}}mm · {{HEIGHT}}/{{ANGLE}} · {{MOVEMENT}}

**Planned prompt** (from Visual Bible + scenario):
> {{FULL_PROMPT}}

**Rubric** (tick each):
- [ ] **Framing** matches: shot size, headroom, lead room, depth layering as specified?
- [ ] **Light direction** matches: key from the planned angle, ambient color temperature holds?
- [ ] **Color palette** holds: dominant + accents from the Bible's act palette?
- [ ] **Character bearing** is right: posture, expression, costume read as specified?
- [ ] **Duration earned**: does the shot's length feel justified by what's happening in it?

**Notes** (write what's off):
> 

**Fix** (if needed):
- [ ] Re-shoot
- [ ] Re-grade (LUT / color correction)
- [ ] Re-cut (different in/out point)
- [ ] Re-frame (crop / pan-scan)
- [ ] Accept as-is (it works for a different reason than planned)

---

{{END FOR EACH}}

---

## Summary — shots needing attention

After ticking the boxes above, list here the shots where 2+ rubric questions failed:

| Shot | Issues | Proposed fix |
|---|---|---|
| {{SHOT_ID}} | {{ISSUES}} | {{FIX}} |

## Pattern audit

If the same issue appears in 3+ shots, it's a Visual Bible problem, not a shot problem. Update the Bible and re-emit prompts:
- Light direction inconsistent across multiple shots → update `03-light.md`.
- Color palette drifting → update `02-palette.md`.
- Character looks different in different shots → audit the locked phrase in `06-cast-visual.md`.
- Style feels uneven → re-confirm `01-style.md`.

Then run `/tasvir prompts <slug>` again to regenerate this comparison guide with the updated Bible.
