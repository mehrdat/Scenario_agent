# Visual Bible — {{TITLE}}
*Locked: {{DATE}}  ·  Style: {{STYLE_KEY}}*

> The Visual Bible is the consistency contract for this project. Every image prompt, every storyboard panel, every AI-video generation prompt reads from here. **Locked phrases are byte-identical across every prompt.**
>
> Change the Bible → re-run `/tasvir prompts <slug>` to re-emit every prompt with the updated phrases. Don't edit individual prompts by hand; edit the Bible.

---

## 01 — Style fragment

This is the exact text injected at the **start of every image prompt**:

> {{STYLE_FRAGMENT}}

Style key: `{{STYLE_KEY}}` (`comic` · `real` · `noir` · `anime` · `ghibli` · `watercolor` · `pencil` · `graphic-novel` · `pixar` · `wes-anderson` · `kiarostami` · `farhadi` · `kubrick` · `fincher` · `wong-kar-wai` · `deakins` · `del-toro` · `lynch` · `marvel` · `bw-photo` · `custom`).

Negative prompt (appended to every prompt):

> {{NEGATIVE_PROMPT}}

---

## 02 — Palette (per act + color arc)

| Act | Dominant | Accent | Avoid |
|---|---|---|---|
| I  | `#xxxxxx` warm/cool/desaturated | `#xxxxxx` | `#xxxxxx` |
| II-A | `#xxxxxx` | `#xxxxxx` | `#xxxxxx` |
| II-B | `#xxxxxx` | `#xxxxxx` | `#xxxxxx` |
| III | `#xxxxxx` | `#xxxxxx` | `#xxxxxx` |

Color arc (one sentence): {{COLOR_ARC}}

Inject into prompts: `palette dominated by {act color}, accents of {accent}`.

---

## 03 — Light direction & quality

Default key direction: {{KEY_DIRECTION}} (e.g. "upper-left, 35° from horizontal").
Quality: {{LIGHT_QUALITY}} (hard / soft / diffuse / mixed).
Color temperature: {{COLOR_TEMP}} (warm 2700–3500K / neutral 5000–5500K / cool 6500–8000K).
Practical sources visible: {{PRACTICALS}}.

Per-scene-cluster overrides:
- Exterior day: {{...}}
- Exterior night: {{...}}
- Interior day: {{...}}
- Interior night: {{...}}
- Special (golden hour / blue hour / magic hour): {{...}}

Inject into prompts: `{key direction} {quality} key, {color temp} ambient`.

---

## 04 — Lens plan

| Scene type | Default lens | Use |
|---|---|---|
| Wide establishing | 24mm | spatial scope |
| Master / dialogue MS | 35mm | natural "street" feel |
| Conversation MCU | 50mm | neutral classical |
| Intimacy / portrait | 85mm | desire, admiration |
| Telephoto compression | 135mm | isolation, surveillance |

Project-specific lens emphasis: {{LENS_EMPHASIS}}.

Inject into prompts: `{lens}mm perspective`.

---

## 05 — Aspect & framing

Aspect ratio: `{{ASPECT}}` (`16:9` / `9:16` / `1:1` / `2.39:1`).
Framing rules: {{FRAMING}}.
Inject into prompts: `{aspect} {framing} cinematic framing`.

---

## 06 — Cast visual (locked character phrases)

> **The phrase in each "**Prompt phrase**" block below is pasted byte-identical into every panel/shot prompt that includes the character.** That's how Flux / DALL·E / SDXL produce a consistent likeness across the whole storyboard.

### {{CHARACTER_NAME}}
- **Age**: {{...}}
- **Face**: {{...}}  *(skin tone, eye color, hair, distinguishing features)*
- **Costume**: {{...}}
- **Bearing**: {{...}}
- **Prompt phrase**:
  > {{LOCKED_PHRASE}}

*(One block per named character.)*

---

## 07 — Locations (locked location phrases)

### {{LOCATION_NAME}}
- **Setting**: {{...}}
- **Period detail**: {{...}}
- **Atmosphere**: {{...}}
- **Prompt phrase**:
  > {{LOCKED_PHRASE}}

*(One block per location.)*

---

## 08 — Mood (per act)

| Act | Tone | Atmosphere | Reference |
|---|---|---|---|
| I | {{...}} | {{...}} | {{film/director ref}} |
| II-A | {{...}} | {{...}} | {{...}} |
| II-B | {{...}} | {{...}} | {{...}} |
| III | {{...}} | {{...}} | {{...}} |

---

## 09 — References

External film / photo / painting references this bible draws from:
- {{...}}

Files in `raw/<slug>/` that informed the bible:
- {{...}}

---

## Consistency check

When the agent generates `output/prompt/<slug>/`, it audits every prompt against this bible and writes `_consistency.md` listing any prompts that drift from the locked phrases. If you see drift, **edit the bible, don't edit individual prompts** — then re-run `/tasvir prompts <slug>`.
