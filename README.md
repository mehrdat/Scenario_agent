# Daastansaraa — داستان‌سرا

> A Claude Code agent system that turns an idea into a scenario, critiques and rewrites it until it works, locks visual consistency in a Visual Bible, and produces every artifact you need to shoot the film or compare to existing footage — all in **seven commands**, **no paid API**.

---

## بزن بریم / Quick start

```bash
git clone https://github.com/<you>/Scenario_agent.git
cd Scenario_agent
claude
```

Then in Claude Code:
```
/rahnama tutorial          # full walkthrough of the system
/salighe update "..."      # tell the agents your taste, once
/zanjireh my-slug          # the whole pipeline on a new project
```

---

## فقط هفت دستور / Just seven commands

| Command | Meaning | What it does |
|---|---|---|
| **`/rahnama`** | راهنما · guide | Tutorial, decision-tree routing, topic deep-dives. Run with no args for a quick decision tree; `tutorial` for the full walkthrough; `<topic>` for deep dives on Visual Bible / critique loop / storyboards / prompts / taste / YouTube / documentary. |
| **`/salighe`** | سلیقه · taste | Persistent memory of who you are as a creator — genres, directors, themes, language register, visual style defaults. Read by every other command. Subcommands: `view` · `update` · `learn` · `reset`. |
| **`/tahghigh`** | تحقیق · research | Distills `raw/<slug>/` (PDFs, photos, transcripts) into `danesh/<slug>-research.md`. |
| **`/dastan`** | داستان · story | All story development. Subcommands: `new` (scenario), `char` (characters), `scene N` (deep-design one scene), `dialog`, `gooneh` (genre / category), `mosaahebeh` (documentary interviews — opt-in). |
| **`/eslaah`** | اصلاح · fix | **Critique-and-fix loop.** Default mode runs critique → rewrite → re-critique → re-rewrite. Numbered critique points get marked `✓ FIXED` / `⏸ DEFERRED` / `✗ REJECTED`. Subcommands: `loop` (default) · `naghd` · `behtar` · `scene N` · `dialog`. |
| **`/tasvir`** | تصویر · visual | Visual hub. Subcommands: `bible` (lock style/palette/light/cast for consistency), `bord` (schematic SVG storyboard), `negaareh` (drawn HTML studio via Bing IC / NightCafe / Mage / Stable Horde / local SD), `prompts` (comprehensive prompts bundle), `all`. |
| **`/zanjireh`** | زنجیره · pipeline | End-to-end pipeline. Variants: `kaameleh` (feature, default — includes critique-fix loop), `documentary`, `koutaah` (YouTube/Shorts/Reels/TikTok), `tabligh` (ad/music-video), `bazneveshtan` (rewrite existing). |

Down from 16 commands → 7 with subcommands. Every function preserved.

---

## "What do I run?" — quick decision tree

| Your situation | Command |
|---|---|
| I have just an idea | `/zanjireh <slug>` |
| I have research material in `raw/` | `/zanjireh <slug>` (it auto-runs `/tahghigh` first) |
| I have a finished script and want to improve it | `/eslaah loop <slug>` |
| I have a finished script and want a storyboard only | `/tasvir all <slug>` |
| I have an existing video and want to audit it against the plan | `/tasvir prompts <slug>` → open `06-comparison-guide.md` |
| I want a YouTube short / Reel / TikTok | `/zanjireh <slug> koutaah` |
| I want a documentary | `/zanjireh <slug> documentary` |
| I have only an idea, want to know the genre | `/dastan gooneh "<idea>"` |
| I want one specific scene rewritten in depth | `/dastan scene <slug> <N>` |
| I want one scene's critique-fix loop only | `/eslaah scene <slug> <N>` |
| I don't know what I want — ask me questions | `/rahnama` |

Or just type `/rahnama route` and describe your situation — the agent tells you the exact sequence.

---

## The five user-driven features that make this work

### 1. The critique-and-fix loop (`/eslaah loop`)
After every first draft, the agent runs:
- Round 1 critique → numbered points `[C-1.1]`, `[C-1.2]`, … each with file:line ref + severity (must-fix / should-fix / nice-to-have).
- Round 1 fix → edits the affected files to fulfill every must-fix point. Marks each `✓ FIXED in <file>:<line>` in the critique file.
- Round 2 critique on the fixed draft (catches issues introduced by round 1's rewrite + remaining nice-to-haves).
- Round 2 fix.

The critique file becomes a **checklist** — every point ends as `✓ FIXED`, `⏸ DEFERRED` (with reason), or `✗ REJECTED` (only the user can reject). This is the difference between "the agent wrote a critique" and "the script got better".

Built into `/zanjireh kaameleh` by default. Standalone: `/eslaah loop <slug> 2`.

### 2. The Visual Bible (`/tasvir bible`) — locks consistency across the whole film
The single file that makes 30 panels in 3 different image generators still look like one film. It locks:
- **One style fragment** (e.g. 40 words of Kiarostami aesthetic) → prepended to every image prompt.
- **One phrase per character** → pasted byte-identical into every panel/shot that includes them. Result: the character has the same face across every prompt.
- **One phrase per location** + light direction + color palette per act + lens plan + aspect ratio + atmospheric mood per act.

Read by every prompt the system writes. Update once → re-emit all prompts with the new locked phrases via `/tasvir prompts <slug>`.

### 3. Two prompt tracks — storyboard AND photorealistic-YouTube-video
`/tasvir prompts <slug>` writes **two distinct prompt tracks**. They share the locked cast / location / palette / light from the Visual Bible, but optimize differently:

```
output/prompt/<slug>/
├── 00-bible-summary.md            one-page Visual Bible — read first
│
├── storyboard/                    ★ TRACK 1: storyboard prompts (image gen)
│   ├── 01-sequence-prompts.md       style = Visual Bible aesthetic
│   ├── 02-scene-prompts.md            (comic / noir / kiarostami / ghibli / etc.)
│   ├── 03-shot-prompts.md           for free IMAGE generators
│   ├── paste-targets.md               (Bing IC / Mage / NightCafe / Stable Horde / local SD)
│   └── prompts.tsv                  purpose: preproduction visualization
│
├── video/                         ★ TRACK 2: photorealistic video prompts
│   ├── 01-scene-establishing.md     style = photoreal-cinema (default)
│   ├── 02-shot-videos.md              or photoreal-vlog / -doc / -music-video / -8k-prestige
│   ├── 03-engine-variants/          for free AI VIDEO generators (one tweaked variant each):
│   │   ├── sora.md                    Sora 2 via ChatGPT/Bing Video
│   │   ├── veo.md                     Veo 3 via Google AI Studio
│   │   ├── kling.md                   Kling 2.x free trial
│   │   ├── hailuo.md                  Hailuo MiniMax 2 free daily
│   │   ├── pika.md                    Pika 2.2 free
│   │   ├── luma.md                    Luma Dream Machine free daily
│   │   ├── runway.md                  Runway Gen-4 trial
│   │   ├── wan.md                     Wan 2.2 (open-source, local)
│   │   └── pixverse.md                Pixverse free
│   ├── 04-negative-prompts.md       universal anti-AI-artifact negative
│   └── 05-audio/                    companion audio prompts:
│       ├── narration.md               ElevenLabs free / Tortoise / coqui-TTS
│       ├── music.md                   Suno free / Udio free / MusicGen on HF
│       └── sfx.md                     AudioGen on HF / Freesound free
│
├── 06-comparison-guide.md         AUDIT CHECKLIST for existing footage
└── _consistency.md                Visual Bible adherence audit
```

**Why two tracks?** A storyboard wants to look *drawn* in your chosen aesthetic (so a producer flips through and sees the *feel*). The final YouTube video wants to look *real* — film-stock photorealism, cinema-camera image quality, natural skin texture. Same scenes, same characters, same locations (locked in Bible) — different rendering.

**Video-style packages** (override the default `photoreal-cinema` with `--video-style`):

| Key | Look | Best for |
|---|---|---|
| `photoreal-cinema` (default) | Arri Alexa, anamorphic, 24fps, premium feature film | narrative shorts, festival |
| `photoreal-youtube-doc` | Sony FX6, broadcast doc feel | video essays, explainers |
| `photoreal-vlog` | Sony FX3 handheld, 30fps, intimate | personal YouTube |
| `photoreal-music-video` | RED V-Raptor, bold grading, slo-mo | music videos, atmospheric shorts |
| `photoreal-commercial` | Arri Mini LF, controlled light, polished | brand films, product reveals |
| `photoreal-handheld-realism` | Cinéma vérité, available light | observational drama |
| `photoreal-8k-prestige` | Arri Alexa 65, IMAX feel | prestige series |
| `photoreal-archival` | 35mm Kodak Vision3, period | biopic, historical |

Full package text + per-engine tweaks live at [`templates/video-styles.md`](templates/video-styles.md).

**Comparison-guide use case**: even if your video is already shot, open `06-comparison-guide.md` while watching your edit. Five-question rubric per shot (framing match? light direction match? color hold? character bearing? duration earned?) tells you exactly which shots need a re-shoot, re-grade, or re-cut.

### 4. The user taste profile (`/salighe`)
`salighe/profile.md` is the agents' memory of who you are. Every command reads it first.

- **`/salighe update "..."`** — tell it explicitly.
- **`/salighe learn`** — the **salighe-shenas** sub-agent reads your prior work and proposes additions (with file-path evidence). You accept / reject / edit before merge.

Result: scripts in your sentence rhythm, storyboards in your preferred style by default, dialogue in your register.

### 5. Multi-backend image studio (`/tasvir negaareh`)
**Claude does not generate raster images** — it's a text model. Real drawn images come from your choice of free generator. The `studio.html` page has buttons per panel for:
- **Bing Image Creator** (DALL·E 3, free with Microsoft account — best for storyboards)
- **Microsoft Designer**, **Mage.space**, **NightCafe**, **Ideogram**, **Leonardo**, **HuggingFace Flux Schnell**
- **Try Stable Horde** (in-browser, anonymous, ~30–90s queue)
- **Drag-and-drop** to load any image file onto a panel
- **Upload** button per panel

Plus CLI tools for bulk rendering:
- `tools/render-panels.sh <prompts.tsv> auto` — tries Stable Horde → local Automatic1111 → Pollinations
- `tools/render-local.py <prompts.tsv>` — fully offline via HuggingFace `diffusers` + Flux Schnell on your GPU

Seven backends mean at least one always works — important for users in restricted networks.

---

## Output structure (everything in clean per-type files)

```
output/
  senaario/<slug>/
    01-logline.md
    02-synopsis.md
    03-treatment.md
    04-beats.md
    05-scenes.md
    06-filmnaameh.md           # the script
    07-sahneh/scene-NN.md      # deep-designed scenes
    08-mosaahebeh/<sub>.md     # documentary interviews (opt-in)
  shakhsiat/<slug>.md          # character bible
  visual-bible/<slug>/
    01-style.md  02-palette.md  03-light.md  04-lens.md  05-aspect.md
    06-cast-visual.md  07-locations.md  08-mood.md  09-references.md
  storybord/<slug>/            # schematic SVG board
    board-NN.svg  shotlist.md  timeline.md
  negaareh/<slug>/             # drawn HTML studio
    studio.html  prompts.tsv  prompts.md  _cast-map.md  panels/
  prompt/<slug>/               # TWO prompt tracks
    00-bible-summary.md
    storyboard/                # Track 1: in chosen artistic style (for image gen)
      01-sequence-prompts.md  02-scene-prompts.md  03-shot-prompts.md
      paste-targets.md  prompts.tsv
    video/                     # Track 2: photorealistic (for AI video gen)
      01-scene-establishing.md  02-shot-videos.md  04-negative-prompts.md
      03-engine-variants/{sora,veo,kling,hailuo,pika,luma,runway,wan,pixverse}.md
      05-audio/{narration,music,sfx}.md
    06-comparison-guide.md  _consistency.md
  naghd/<slug>/                # critiques
    round-1.md  round-2.md  ...
  eslaah/<slug>/log.md         # critique-fix changelog
  _projects/<slug>.md          # dashboard for the project
```

Critiques live with critiques. Prompts live with prompts. Storyboards live with storyboards. You can delete any one type without touching the others.

---

## Folders at the repo root

```
.
├── .claude/
│   ├── agents/          # 6 agents (daastansaraa, pardeh-negaar, negaaregar, shakhsiat-pardaaz, pajooheshgar, salighe-shenas)
│   └── commands/        # 7 slash commands
├── raw/                 # drop research material here (PDFs, photos, transcripts)
├── danesh/              # distilled research notes (written by pajooheshgar)
├── salighe/             # your taste profile — read before every command
├── templates/
│   ├── storyboard.svg   # base for /tasvir bord
│   ├── studio.html      # base for /tasvir negaareh — multi-backend interactive
│   ├── visual-bible.md  # base for /tasvir bible
│   └── comparison-guide.md  # base for /tasvir prompts (audit checklist)
├── tools/
│   ├── render-panels.sh # bulk-render (multi-backend, falls through if one is down)
│   └── render-local.py  # local Stable Diffusion via diffusers
└── output/              # see structure above
```

---

## YouTube / Reels / TikTok — `/zanjireh <slug> koutaah`

Short-form rules baked in:
- **Hook in the first 3 seconds** — three competing options, the agent picks one with reasoning.
- **Retention beats every 5–7 seconds** — new visual, revelation, or charge.
- **Payoff in the last 5 seconds** — resolve the hook or open a loop.
- **Vertical aspect** by default.
- **Short-form critique rubric**: hook strength, retention curve density, payoff alignment, visual density, on-screen text plan, loop potential.

Platform defaults: youtube-shorts (60s 9:16), reels (90s 9:16), tiktok (60s 9:16), twitter (140s 16:9), youtube long (any 16:9).

---

## Documentary — `/zanjireh <slug> documentary`

Replaces dialogue-writing with B-roll planning. **Interviews are opt-in** — many doc modes don't use them (observational/Wiseman, poetic/Reggio, archival/Kapadia, essay/Marker). If you want interviews, run `/dastan mosaahebeh <slug>` separately. The agent posts a one-paragraph suggestion after the scenario step but never writes interviews unless you ask.

Genre / mode picker first: `/dastan gooneh <slug>` recommends expository / observational / poetic / archival / essay / participatory / hybrid + 5 reference works.

---

## Honest disclaimer about images

**Claude cannot generate raster images.** It's a text/code model. SVG (which is text) Claude can write; pixel-art with recognizable faces is outside its capability.

For real drawn storyboards, this project orchestrates **free external generators** — primarily Bing Image Creator (DALL·E 3, free), and as alternatives NightCafe / Mage / Ideogram / Leonardo / HuggingFace Flux / Stable Horde / local Stable Diffusion. The HTML studio page has a button for each. If one is blocked or down, another works — that's the whole point of having seven backends. No paid API, no subscription, no API keys.

For users in restricted networks (Iran, China etc.): local Stable Diffusion always works offline; Bing IC + Mage usually need VPN; Stable Horde sometimes works without VPN.

---

## Who is the writer? (the pedigree behind Daastansaraa)

- **Craft**: McKee, Syd Field, Campbell / Vogler, Blake Snyder, Aristotle, Mamet, Sorkin, Charlie Kaufman.
- **Documentary**: Errol Morris, Werner Herzog, Ken Burns, Wiseman, Varda, Asif Kapadia, Adam Curtis, Joshua Oppenheimer.
- **Iranian cinema**: کیارستمی، فرهادی، بیضایی، مهرجویی، شهیدثالث، مجیدی، بنی‌اعتماد، پناهی.
- **Literary roots**: فردوسی، نظامی، حافظ، فروغ، شاملو، هدایت، گلشیری.

Full skill list (10 detailed sections covering structural models, character psychology, dialogue, cinematography, genre mastery, documentary craft, Iranian cultural context, story-doctoring) lives in [`.claude/agents/daastansaraa.md`](.claude/agents/daastansaraa.md).

---

## نکته‌ی نهایی / Final note

The point of this system: you make the film. The agents do the structural / continuity / consistency labor that's easy to get wrong manually. The critique loop catches the structural failures every first draft has. The Visual Bible keeps the look consistent across 50 panels. The comparison guide lets you audit your edit against what you planned, shot by shot.

Run `/rahnama tutorial` once for the full walkthrough. Run `/rahnama route` whenever you're stuck. Run `/salighe learn` every few projects so the agents keep up with how you're evolving.
