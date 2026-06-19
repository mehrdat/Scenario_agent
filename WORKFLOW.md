# WORKFLOW — Streamlined Brief (Iran Nature / Whistleblower Documentary Agent)

> This file is the **operating contract** for the agent in this project. It supersedes the
> older multi-command pipeline in `README.md`. When the user gives an idea + material, the
> agent follows this brief and produces **exactly three Markdown files** in `output/`.
> If anything is unclear or under-specified, **ask before producing** (`AskUserQuestion`).

---

## 0. Mission & editorial voice

The purpose of every video is to **show the outside world what is happening to Iran's nature
and wildlife, and to ring the bell** — a whistleblower's voice — so people pay attention to a
habitat that is being lost.

The voice blends three registers, in this priority:

1. **Informative** (highest priority) — concrete facts, numbers, names, places, causes. The
   viewer must *learn* something true and specific.
2. **Scientific** — accurate ecology, species biology, climate and conservation status.
   Sourced, not vague. No invented statistics.
3. **Sentimental** — emotionally resonant, but earned through the facts and the imagery, never
   melodrama for its own sake. This is **not** a music-video clip with no substance.

Woven throughout: **the connection to Iran** — its people, culture, history, and the land
itself. Periodically cut to **the beauty of Iran's scenery** as a deliberate device — "look
how beautiful this is, and look what we are losing."

The subject is **not only the cheetah or one animal.** It is Iran's nature broadly. Eligible
topics include (non-exhaustive): the **Asiatic/Persian cheetah**, the **Hyrcanian (Caspian)
forest**, **dragonflies and wetlands**, the **Asiatic black/brown bear**, Persian leopard,
Caspian seal, houbara, wild ass (gur), Lake Urmia, Zagros oak forests, qanats and water loss,
desertification of Kavir/Lut. The agent may **suggest** topics during research.

---

## 1. Output contract — exactly 3 files, Markdown, in `output/`

Per project (one topic), produce **only these three files**, named by topic slug:

| File | Slug pattern | Required? |
|---|---|---|
| **Prompts** ★ most important | `output/<slug>-prompts.md` | Always |
| **Scenario** | `output/<slug>-scenario.md` | Always |
| **Research** | `output/<slug>-research.md` | Conditional (see §3) |

- `<slug>` is kebab-case Latin, e.g. `persian-cheetah`, `hyrcanian-forest`, `dragonfly-wetlands`.
- **No other files.** No storyboards, character bibles, critique files, beats files. The old
  pipeline's intermediate artifacts stay *internal* (in the agent's reasoning), never written
  as separate files.
- Old `output/` subfolders from previous runs are legacy — do not touch them, do not add to them.

### Language (bilingual)
- **Narration**: written in **both English and Persian (Farsi)**. English first, Persian below.
- **Scenario prose / section descriptions**: English primary, with Persian where it adds clarity
  (key terms, place names in Persian script).
- **Video-generation prompts**: **English only** (AI video engines read English best).
- Place names: give both, e.g. *Lut Desert (دشت لوت / کویر لوت)*.

---

## 2. The pipeline (run internally; surface only the 3 files)

The agent still does all the rigorous work — it just doesn't emit a file for each stage.

```
idea + input material
   → research (own web research + user's files)           → may write research.md (§3)
   → topic suggestions + finalize the idea (ask user)
   → plan: story spine, the reasoning behind the story, the depth/why it matters
   → expand the plan to a long version
   → internal critique ↔ fix loop, repeated until acceptable
   → SCENARIO (sectioned, video-translated, extreme detail)  → write scenario.md
   → internal critique of scenario until acceptable
   → PROMPTS: slice every section into 5–8s shots, write extreme-detail prompt per shot,
     attach the narration for that sequence                  → write prompts.md  ★
```

Critique loops happen in the agent's head/notes, not as deliverables. Only escalate to the
user when a creative decision genuinely needs their call.

---

## 3. Research file logic

- **If the user provides files/research** (in `input/`): read and use them, **and still do the
  agent's own web research** to verify, update, and fill gaps. Compile a `research.md`.
- **If the user provides nothing**: do a **deep independent research pass** based on the request,
  and compile `research.md`.
- In practice `research.md` is almost always produced. It is the factual backbone the scenario
  and prompts must stay faithful to.
- `research.md` contains: species/biome facts, conservation status & numbers (with sources and
  dates), causes of habitat loss, cultural/historical ties to Iran, key locations with geography,
  notable quotes/experts, and a **source list with URLs and access dates**. Mark anything
  uncertain `[verify]`.

Material the user has gathered goes in **`input/`**. The agent reads everything there first.

---

## 4. Video length & shot-slicing rules

- Target runtime: **more than 15 minutes.**
- AI video generators produce only **~5–10 seconds per clip** (commonly 5 or 8s). So the whole
  film is built as a **chain of short shots**.
- **Default shot length: 5–8 seconds.** Flexible 5–10s+ when a scene needs it; the user will
  usually specify desired length before asking — honor that.
- A 15-minute film ≈ **110–180 shots**. Number them continuously and group them into
  **sequences** (a sequence = a narration beat / one idea, usually 3–10 shots).
- **Continuity is mandatory across consecutive shots**: matching light direction, color grade,
  time of day, weather, subject appearance, and screen-direction of movement, so separately
  generated clips edit together seamlessly. Each prompt states its continuity link.
- Plan deliberate **beauty interludes** (wide landscape sequences) spaced through the film.

---

## 5. SCENARIO file format (`<slug>-scenario.md`)

Sectioned so each section maps cleanly to a block of shots. Structure:

```
# <Title> — Scenario / سناریو
Logline (EN + FA). Runtime estimate. Topic, biome, region, season.
Editorial intent: what the viewer should learn + feel.

## Section 1 — <name>  (≈ mm:ss–mm:ss, N shots)
- Purpose / the idea this section delivers
- Narration (EN + FA) for the section
- Visual translation: what we SEE, in detail — locations, subjects, actions, camera
  language, light, palette, mood. Written so it can be sliced into shots.
- Facts anchored here (from research.md)
- Connection-to-Iran note (culture/people/land) and/or beauty-interlude flag

## Section 2 — ...
...
## Closing section — the bell / call to attention
```

Every section is **translated into concrete, filmable visual language** with extreme detail —
not abstract description. The prompts file is derived directly from these sections.

---

## 6. PROMPTS file format (`<slug>-prompts.md`) — ★ the most important deliverable

**Contains nothing except**: the per-shot prompts, the scene/context detail for each shot, and
the **narration tied to that sequence**. No essays, no methodology, no commentary.

### Per-sequence header, then one block per shot

```
## Sequence 4 — Cheetah in the Lut  (توالی ۴ — یوزپلنگ در لوت)
Narration (EN): "The Asiatic cheetah has become a symbol of ..."
Narration (FA): «یوزپلنگ آسیایی این روزها نمادی شده است از ...»

---
### Shot 4.1 — 6s
Scene: <one line: where, when, who, what beat this serves>
Prompt:
"<single dense English paragraph — see the detail checklist below>"
Continuity: <link to previous/next shot — light, grade, direction>
Negative / must-NOT show: <list>
---
### Shot 4.2 — 8s
...
```

### Extreme-detail checklist — every prompt must specify (when applicable)

A prompt is not done until it has directed the shot the way a DP + director would. Cover:

1. **Subject** — exact species (e.g., *Asiatic cheetah, Acinonyx jubatus venaticus*), count,
   age, sex, physical condition (lean, panting, scarred), behavior state.
2. **Action & motion** — precisely what the subject does; **motion speed**: slow-motion (give
   the feel, e.g. "120fps slow-mo"), real-time, or fast; direction of movement on screen.
3. **Location & geography** — named Iranian place + biome (Lut Desert salt plain, Hyrcanian
   broadleaf understory, Urmia salt flats), season, **time of day**.
4. **Camera** — shot size (ECU/CU/MCU/MS/WS/EWS), **lens** (e.g., 200mm telephoto, 24mm wide),
   **height** (ground-level, eye, high), **angle** (low/eye/high/overhead), **movement**
   (static, slow dolly-in, pan-left, tilt-up, crane-up, drone push-in, handheld, arc) and the
   **speed** of that move; **start framing → end framing**.
5. **Composition** — foreground / midground / background layers, rule-of-thirds placement,
   depth of field (e.g., shallow, subject sharp, background bokeh).
6. **Light** — key-light **direction**, quality (hard/soft), **golden hour / blue hour / harsh
   noon**, contrast, shadow shape, color temperature.
7. **Color palette & grade** — dominant colors, warm/cool, saturated/desaturated, the overall
   grade of the shot.
8. **Textures & materials** — fur, cracked salt, sand ripples, wet bark, moss, dust, water
   surface — name what must read on screen.
9. **Atmosphere** — weather, wind, haze, dust, heat shimmer, mist, floating particles.
10. **Cultural / architectural elements** when relevant — qanat, adobe village, badgir
    (windcatcher), cypress, dome — and how they sit in frame.
11. **Sound cue** (for the editor) — ambient + any narration timing reference. One line.
12. **Must be visible / must NOT be visible** — required elements; and negatives: no people
    (unless intended), no modern objects/vehicles/power lines, no on-screen text or watermark,
    no extra limbs/morphing, no cartoon look.
13. **Style & engine notes** — e.g., "natural-history documentary realism, photoreal, cinematic,
    film grain, 8K"; **aspect ratio** (default 16:9 unless told otherwise).
14. **Continuity link** — what carries over from the adjacent shot (light direction, grade,
    subject look, screen direction) so the generated clips cut together.

### Quality bar example (the agent should match or exceed this density)

```
### Shot 4.1 — 6s
Scene: Dawn, lone wild Asiatic cheetah scans the Lut salt plain; a distant gazelle moves; this
opens the sequence on the species as a fragile symbol.
Prompt:
"Natural-history documentary shot, photoreal, cinematic, 8K with fine film grain. A single lean
adult Asiatic cheetah (Acinonyx jubatus venaticus), ribs faintly visible, dust on its fur,
stands on a cracked salt-and-clay plain in the Lut Desert at first light. It slowly turns its
head from frame-left to frame-right, scanning, breathing fast as if it just stopped running,
small puffs of breath in the cold dawn air. In the deep background a single gazelle moves
right-to-left across a heat-haze horizon, soft and out of focus. Camera: 300mm telephoto,
ground-level, eye-line with the cheetah, extremely shallow depth of field — the cat's eyes
tack-sharp, background melting into warm bokeh. Slow, almost imperceptible dolly-in over 6
seconds. Low golden-hour sun from frame-right rakes across the fur and the cracked salt,
long blue shadows stretching frame-left, warm amber highlights against cool shadow. Palette:
amber, ochre, pale gold, desaturated blue shadow. Textures: individual fur hairs, fine wind
ripples and salt crust on the desert floor, faint airborne dust. Dry wind, light heat shimmer
building on the horizon. Must show: the cheetah's face lit, the distant gazelle. Must NOT show:
any people, vehicles, roads, fences, power lines, text, or watermark; no extra limbs or
morphing. 16:9."
Continuity: golden-hour key from frame-right and amber/blue grade carry into Shot 4.2; cheetah
faces right, gazelle screen-left.
Negative / must-NOT show: humans, modern objects, signage, watermark, deformed anatomy.
```

---

## 7. Defaults (locked from setup)

- **Format:** Markdown (`.md`).
- **Language:** bilingual — narration EN + FA; scenario EN-primary; **prompts English-only**.
- **Research file:** use user input if given **and** do own research; if no input, deep
  independent research. Almost always produce `research.md`.
- **Shot length:** default 5–8s, flexible 5–10s+; user usually specifies.
- **Aspect ratio:** 16:9 unless the user says otherwise.
- **Runtime:** 15+ minutes (≈110–180 shots).

## 8. When to ask the user

Ask (don't guess) when: the topic isn't chosen yet, runtime/aspect/language differ from
defaults, the emotional-vs-scientific balance for a specific film is unclear, or input material
is ambiguous. Otherwise proceed and surface the 3 files.
```
