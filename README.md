# Daastansaraa — داستان‌سرا

> A Claude Code agent system for turning ideas into scenarios, scenarios into storyboards, and storyboards into AI-video prompts — **no paid API required**.

---

## نصب / Install

### Requirements
- **Claude Code** CLI installed and signed in. Install with:
  ```bash
  npm install -g @anthropic-ai/claude-code
  ```
  (Or use Claude Code on the web at <https://claude.ai/code> — this repo works there too.)
- **git** to clone the repo.
- Any modern OS (Linux / macOS / Windows with WSL).
- An SVG viewer — every modern browser is one. That's it. No image API, no Python, no Node, no Docker required.

### One-time setup
```bash
git clone https://github.com/<your-account>/Scenario_agent.git
cd Scenario_agent
claude            # opens Claude Code in this directory
```

When Claude Code launches in this folder it auto-discovers the agents under `.claude/agents/` and the slash commands under `.claude/commands/`. There is nothing to register.

Verify it loaded:
```
/agents          # should list daastansaraa, pardeh-negaar, shakhsiat-pardaaz, pajooheshgar
/help            # should show the Farsi commands: senaario, behtar, storybord, …
```

### Per-project setup
For each story:
1. Choose a kebab-case slug, e.g. `pardeye-akhar`.
2. Drop research material into `raw/pardeye-akhar/` — PDFs, transcripts, notes, photos. (See [`raw/README.md`](raw/README.md).)
3. Run `/zanjireh pardeye-akhar` for the full pipeline, or individual commands for fine control.

---

## استفاده / Quick start

```text
> /tahghigh pardeye-akhar
  Pajooheshgar reads everything in raw/pardeye-akhar/ → writes
  danesh/pardeye-akhar-research.md with setting, period, dialect, lexicon, quotes.

> /senaario pardeye-akhar a grandmother in 1357 Isfahan tells her granddaughter the
  one story she has never told anyone
  Daastansaraa proposes logline + 3 angles, then writes the full script.

> /shakhsiat pardeye-akhar
  Shakhsiat-pardaaz builds the character bible.

> /storybord pardeye-akhar 16x9
  Pardeh-negaar draws SVG storyboard pages + a shot-list.

> /prompt-video pardeye-akhar
  Daastansaraa generates per-shot prompts for free AI video generators.

> /naghd pardeye-akhar
  Daastansaraa critiques the draft. Pair with /behtar to apply fixes.
```

Or run everything in one shot:
```text
> /zanjireh pardeye-akhar kaameleh
```

Open the generated `output/storybord/pardeye-akhar/board-01.svg` in your browser. Paste the prompts from `output/prompt/pardeye-akhar.md` into Hailuo / Kling / Pika / Runway free / Luma free / Bing.

---

## استفاده با LLMهای دیگر / Using with other LLMs (Ollama, LM Studio, etc.)

The agents are written as **plain Markdown system-prompts** plus a folder convention. That means most of the system is portable to any chat UI or local LLM. What's **not** portable is the orchestration plumbing (slash commands, parallel sub-agent calls, `AskUserQuestion`) — that part is Claude Code-specific.

### What works everywhere
- The four agent definitions in `.claude/agents/*.md` — each file's body (below the YAML front-matter) is a complete system prompt you can paste into **any** chat:
  - Ollama (`llama3.3`, `qwen2.5:32b`, `deepseek-r1`, `gemma2`, `mistral-nemo`, `command-r`)
  - LM Studio, Jan, Open WebUI
  - Aider, Continue.dev, Cline, Roo Code, Cursor
  - Groq free tier, Together AI free credit, HuggingFace Inference, Google AI Studio (free)
- The folder convention (`raw/`, `danesh/`, `output/`) is just files. Any agent that can read/write files can use it.
- The SVG storyboard template at `templates/storyboard.svg` is plain XML — any model that can output text can fill it in.
- The AI-video prompt format in `output/prompt/<slug>.md` is provider-agnostic text — paste into any free generator's web UI.

### What is Claude Code-specific
- The `/senaario`, `/storybord`, `/zanjireh`, … slash commands and their argument substitution.
- The `Agent`-tool sub-agent delegation (parallel sub-agents running in isolated contexts).
- The `AskUserQuestion` confirmation popups.

### Portable mode — using the agents with Ollama or any local LLM
A repeatable recipe:

1. **Install a local runtime**, e.g.:
   ```bash
   # Ollama
   curl -fsSL https://ollama.com/install.sh | sh
   ollama pull qwen2.5:32b      # strong on long-form, multilingual, Persian-capable
   ollama pull llama3.3:70b     # if you have the VRAM
   ollama pull deepseek-r1:32b  # strong reasoning
   ```
2. **Hook it to a code-aware client** that can read/write your project files. Free options:
   - **Aider** — `aider --model ollama/qwen2.5:32b` from inside the repo. Aider sees the whole tree.
   - **Continue.dev** in VS Code — point its config at your Ollama endpoint.
   - **Open WebUI** + the *Files* feature — drop the project as context.
3. **Load an agent as the system prompt.** Open one of the four `.claude/agents/*.md` files, copy everything below the `---` YAML block, and paste it as the system / instructions / `.aider.conf.yml` `prompt:` field.
4. **Drive the agent by hand** instead of slash commands. The conventions still apply: ask the LLM to "act as Daastansaraa, run `tahghigh` first, then `senaario`, and write outputs to `output/senaario/<slug>/`". The agent prompt already documents the file layout.

### Suggested model picks for portable mode

| Task | Recommended local model | Why |
|---|---|---|
| Long-form scenario in Farsi | `qwen2.5:32b-instruct` or `command-r:35b` | strong multilingual including Persian |
| Story-doctoring & critique | `deepseek-r1:32b` or `qwen2.5:32b` | strong reasoning |
| SVG storyboard generation | `qwen2.5-coder:32b` or `deepseek-coder-v2` | reliable structured text / XML |
| Character bibles | `llama3.3:70b` or `qwen2.5:32b` | good at structured personas |
| Research summarization | `qwen2.5:32b` or `gemma2:27b` | long context, faithful summary |

### Free hosted alternatives (no install, no card)
- **Google AI Studio** — Gemini 2.0 Flash / 2.5 free tier, generous quota.
- **Groq** — free API for `llama-3.3-70b`, `qwen-2.5-32b`, `deepseek-r1-distill-70b`. Very fast.
- **Together AI** — free trial credit.
- **HuggingFace Inference Providers** — free monthly credits across many open models.
- **Mistral Le Chat** — free web UI with strong models.

### Honest caveats
- Local 8-13B models will struggle with the storyboard SVG step and long-form Farsi consistency. Use 27B+ for serious work.
- Without `AskUserQuestion`, the LLM may guess at unspecified format/length — be explicit in your prompt.
- Without parallel sub-agents, you'll run steps sequentially. That's fine; it's just slower.

---

## نام عامل / Agent name

**Daastansaraa** (داستان‌سرا) — *the bard, the epic storyteller*. In Persian literature, a `داستان‌سرا` is the one who turns history, myth, and witness into a story worth retelling. That's the job.

Sub-agents:

- **Pardeh-Negaar** (پرده‌نگار) — *storyboard artist*. Draws SVG storyboards.
- **Shakhsiat-Pardaaz** (شخصیت‌پرداز) — *character architect*. Builds the cast bible.
- **Pajooheshgar** (پژوهشگر) — *researcher*. Reads everything in `raw/` and writes a knowledge note.

---

## Who is the writer?

Daastansaraa is briefed with the craft of:

- **Robert McKee**, **Syd Field**, **Joseph Campbell / Christopher Vogler**, **Blake Snyder**, **Aristotle**, **David Mamet**, **Aaron Sorkin**, **Charlie Kaufman**.
- Documentary masters: **Errol Morris**, **Werner Herzog**, **Ken Burns**, **Frederick Wiseman**, **Agnès Varda**, **Asif Kapadia**, **Adam Curtis**, **Joshua Oppenheimer**.
- Iranian cinema: **عباس کیارستمی، اصغر فرهادی، بهرام بیضایی، داریوش مهرجویی، سهراب شهیدثالث، مجید مجیدی، رخشان بنی‌اعتماد، جعفر پناهی**.
- Persian literary roots: **فردوسی، نظامی، عطار، حافظ، سعدی، فروغ، شاملو، هدایت، گلشیری**.

Full pedigree and skill list lives in [`.claude/agents/daastansaraa.md`](.claude/agents/daastansaraa.md).

---

## Different skills

1. **Scenario craft** — logline → synopsis → treatment → beats → scenes → script. Three-act, kishōtenketsu, hero's journey, Save-the-Cat.
2. **Character design** — Want vs. Need, wound, lie, arc, voice, silhouette, power-map.
3. **Dialogue** — subtext-first, voice-differentiated, idiomatic Farsi / English / hybrid.
4. **Visual plan & shot design** — lens, lighting, composition, colour script, continuity.
5. **Storyboard** — real SVG output, 6 panels/page, stick-figure blocking, camera notation.
6. **AI-video prompt engineering** — for **free** generators (Hailuo, Kling, Pika, Runway free, Luma free, Sora-via-Bing, Veo, Wan, Pixverse).
7. **Research integration** — reads `raw/`, builds `danesh/<slug>-research.md`, weaves it into the writing.
8. **Genre mastery** — fiction genres + documentary categories, with audience-appeal mechanics.
9. **Geography & cultural context** — climate, dialect, taboos, calendar, gestures. Critical for Iranian stories.
10. **Story-doctoring** — diagnose then prescribe. Turn ordinary into compelling.

---

## دستورها / Commands (Farsi in Latin alphabet)

Type any of these in Claude Code. All commands accept a `<slug>` argument (kebab-case Latin, e.g. `pardeye-akhar`).

| Command | Meaning | Does |
|---|---|---|
| `/tahghigh <slug>` | تحقیق · research | Reads `raw/` → `danesh/<slug>-research.md` |
| `/senaario <slug> [brief]` | سناریو · scenario | Builds logline → synopsis → treatment → beats → scenes → script |
| `/shakhsiat <slug> [name]` | شخصیت · character | Builds character bible |
| `/sahneh <slug> <N>` | صحنه · scene | Deep-designs a single scene |
| `/dialog <slug> [scene/char]` | گفتگو · dialogue | Rewrites dialogue with subtext + voice differentiation |
| `/behtar <slug> [focus]` | بهتر · improve | Story-doctors an existing draft |
| `/naghd <slug>` | نقد · critique | Diagnosis without rewriting |
| `/gooneh <slug or idea>` | گونه · genre | Maps genre conventions + 5 reference works |
| `/storybord <slug> [scope] [aspect]` | استوری‌بورد · planning board | Schematic SVG storyboard for planning the shoot. Low credit, clean lines. Scope picker is mandatory |
| `/negaareh <slug> <percentage> [aspect]` | نگاره · drawn board | **Hollywood-style drawn storyboard.** Paper background, sketchy ink, real character silhouettes with faces & clothing, Persian arch / dome / cypress detail. Scope is % of runtime |
| `/mosaahebeh <slug> [subject]` | مصاحبه · interview | **Opt-in.** Design documentary interview question banks. Skip if your doc doesn't use interviews |
| `/prompt-video <slug> [engine]` | پرامپت ویدئو | Per-shot AI-video prompts (free engines) |
| `/zanjireh <slug> [variant]` | زنجیره · pipeline | Runs the full chain end-to-end |

### Storyboard scope picker

`/storybord` will never silently board your whole film. If you don't pass a scope, it asks. Available scopes:

| Scope | What you get | Credit cost |
|---|---|---|
| `sample` | 1 page (~6 panels) from the most visually rich scene | minimal — **start here** |
| `key` | The film's spine: opening, inciting incident, midpoint, all-is-lost, climax, final image | minimal |
| `scene N` | One scene only | small |
| `scene N-M` | A range of scenes | proportional |
| `sequence N` | One of the 8 sequences (Frank Daniel method) | medium |
| `act N` | Act 1, 2, or 3 | medium-large |
| `all` | Whole script — only on explicit confirmation, with page-count warning | heavy |

Hard cap per `/storybord` call: **4 pages (24 panels)**. Beyond that the agent halts and asks. This is the credit-safety rail.

Examples:
```
/storybord pardeye-akhar sample              # one preview page
/storybord pardeye-akhar key                 # 6 spine moments
/storybord pardeye-akhar scene 4             # board just scene 4
/storybord pardeye-akhar scene 12-15 16x9    # scenes 12-15, widescreen
/storybord pardeye-akhar act 3               # full third act
```

### Honest disclaimer about images

**Claude (this CLI) cannot generate raster images.** It's a text/code model. SVG (which is text) Claude can write, but pixel-art with recognizable faces is outside its capability — no amount of prompting changes that.

For real comic-book / Hollywood-style storyboard images, this project orchestrates **Pollinations.ai** — a free image API powered by Flux Schnell that requires **no API key and no signup**. Claude writes optimized prompts and assembles an HTML contact-sheet; your browser fetches each panel from Pollinations when you open the HTML. Zero paid services anywhere in the loop.

If pollinations.ai is unreachable from your network, the agent provides fallback paste-instructions for **Bing Image Creator (DALL·E 3, free)**, **Leonardo AI free tier**, and **Krea AI free**.

### Two storyboard commands — pick the right one

| | `/storybord` (pardeh-negaar) | `/negaareh` (negaaregar) |
|---|---|---|
| **What it produces** | SVG file (schematic) | **HTML contact-sheet** with real drawn images |
| **Who draws** | Claude writes SVG geometry directly | **Pollinations.ai (Flux Schnell)** renders each panel — your browser fetches |
| **What it looks like** | Clean ink lines, stick figures, white background — a planning document | Comic-book / Hollywood storyboard panels with recognizable faces, action, locations, drawn in pencil / ink / chosen style |
| **Best for** | Planning the shoot, blocking the day, scratch notes | Pitch deck, festival package, presentation, portfolio |
| **Scope picker** | `sample` / `key` / `scene N` / `sequence N` / `act N` / `all` | **Percentage of runtime**: `/negaareh slug 25` = 25% |
| **Style options** | (one style — schematic) | `comic` (default) / `realistic` / `anime` / `noir` / `watercolor` / `graphic-novel` |
| **Hard cap per call** | 4 pages (24 panels) | 36 panels |
| **Credit cost** | Minimal | Low — Claude only writes prompts + HTML; image generation happens in your browser |
| **Network required** | No (SVG renders offline) | Yes — browser must reach pollinations.ai (or use fallback) |

Use one, the other, or both. They write to different folders (`output/storybord/` vs `output/negaareh/`).

#### `/negaareh` examples
```
/negaareh pardeye-akhar 10                       # 10% — absolute spine, ~6 panels
/negaareh pardeye-akhar 25                       # 25% — pitch-deck default
/negaareh pardeye-akhar 50 comic                 # 50% in pencil-sketch comic style
/negaareh pardeye-akhar 100 graphic-novel        # whole film, bold cel-shaded
/negaareh kafe-tehran-1399 70 noir 9x16          # 70%, B&W film noir, vertical
```

#### How you actually view the images
1. After `/negaareh` finishes, open `output/negaareh/<slug>/board.html` in any browser.
2. Each panel loads from `image.pollinations.ai` in 5–15 seconds. Don't refresh — they fetch in parallel.
3. Same prompt + same seed = identical image on every load (Pollinations caches by URL).
4. To download all panels as JPG (for sharing / Keynote / archival): run
   ```
   bash tools/render-panels.sh output/negaareh/<slug>/prompts.tsv
   ```
   This downloads each panel into `output/negaareh/<slug>/panels/`.

#### What if my network blocks pollinations.ai?
Open `output/negaareh/<slug>/prompts.md` and paste each prompt manually into:
- **Bing Image Creator** ([copilot.microsoft.com/images](https://copilot.microsoft.com/images)) — free, DALL·E 3 quality
- **Leonardo AI** free tier — has storyboard style presets
- **Krea AI** free tier
- **HuggingFace Spaces** — search "flux schnell"
- **Local Stable Diffusion** — Automatic1111, ComfyUI, Fooocus

Either way the image generation is free.

### `/storybord` panel quality bar (schematic / planning use)

Every SVG panel includes:
- **Metadata bar** at the top: scene · shot · size · lens · height · angle · move · duration · sound tag.
- **Aspect-correct frame** with letterboxing for 9:16, 2.39:1.
- **Thirds grid**, horizon, ground line, FG/MG/BG depth.
- **Light-direction indicator** (sun + ray arrow) so the gaffer reads the key.
- **Camera move arrows** (DOLLY-IN, PAN-R, CRANE-UP, ARC, HANDHELD, STATIC) inside the frame.
- **Ghost frames** (dashed red) marking the end of a camera move.
- **Character symbols** (standing, walking, sitting, child, elder, crowd) — not raw stick lines.
- **Caption block** with action / dialogue / sound.

Sample: `output/storybord/sample-pardeye-akhar/board-01.svg`. Open in any browser.

### `/negaareh` panel quality (drawn / presentation use)

Each panel is a **real raster image rendered by Pollinations.ai (Flux Schnell)** in your browser. Quality depends on:
- The prompt — written by negaaregar, 60–120 words, period-anchored, character-anchored.
- The seed — deterministic per panel so the same prompt always produces the same image.
- The style key — `comic`, `realistic`, `anime`, `noir`, `watercolor`, `graphic-novel`.
- Face continuity across panels — the `_cast-map.md` defines a single character phrase that gets pasted into every panel where that character appears, so Flux gives them the same face throughout.

Sample contact-sheet: `output/negaareh/sample-pardeye-akhar/board.html` — open in your browser. Real drawings will appear over the first ~30 seconds as Pollinations renders.

### Documentary interviews — opt-in

Many documentaries don't use interviews at all (observational/Wiseman, poetic/Reggio, archival/Kapadia, essay/Marker). So **Daastansaraa never writes interview material unless you ask**. After scenario, if interviews would suit your project, the agent posts a suggestion: *"This doc would benefit from interviews. Run `/mosaahebeh <slug>` to design them."* If you don't ask, none get written. B-roll planning is always included for docs because it applies to every mode.

### Pipeline variants for `/zanjireh`

- `kaameleh` (کامله) — full fiction chain (default).
- `documentary` (مستند) — replaces dialogue with interview-design + B-roll planning.
- `tabligh` (تبلیغ) — 60–90s ad / music-video / short, 9:16 default.
- `bazneveshtan` (بازنویسی) — rewrite an existing scenario.

---

## ساختار / Folders

```
.
├── .claude/
│   ├── agents/          # the agent definitions
│   └── commands/        # the slash commands
├── raw/                 # drop research material here (PDFs, notes, images, transcripts)
├── danesh/              # distilled research notes (written by pajooheshgar)
├── templates/
│   └── storyboard.svg   # base SVG template for storyboards
├── output/
│   ├── senaario/<slug>/ # script artifacts
│   ├── shakhsiat/       # character bibles
│   ├── storybord/<slug>/# SVG storyboards + shot-lists
│   ├── prompt/          # AI-video prompts
│   └── naghd/           # critiques
└── README.md            # this file
```

---

## A typical session

1. Drop a book, a transcript, a few photos into `raw/pardeye-akhar/`.
2. `/zanjireh pardeye-akhar kaameleh`
3. Watch Daastansaraa run: research → script → characters → story-doctor → storyboard → prompts → critique.
4. Open `output/storybord/pardeye-akhar/board-01.svg` in your browser.
5. Take the prompts in `output/prompt/pardeye-akhar.md` and paste them into Hailuo / Kling / Pika / Runway / Luma for free generation.

For finer control, run the individual commands instead of `/zanjireh`.

---

## چرا بدون API پولی / Why no paid API

The user's hard constraint: no paid generation. So the system is built around it:

- **Text & structure** — Claude Code itself, free within your subscription.
- **Storyboards** — real SVG files written by the agent, viewable in any browser. No image-API needed.
- **Still keyframes** — prompts targeted at **Bing Image Creator (DALL·E 3)**, **Leonardo AI free tier**, **Krea free**, **Recraft free**, **Ideogram free**, **Flux Schnell on HuggingFace / fal free**.
- **AI video** — prompts targeted at **Hailuo (MiniMax)**, **Kling**, **Pika**, **Runway Gen-3 trial**, **Luma Dream Machine free**, **Sora via Bing Video Creator**, **Veo (limited)**, **Wan 2.1**, **Pixverse**. All offer some free generations.

Free-tier limits change. The prompt files mark them `[verify current limits]` so you can sanity-check before relying.

---

## نکات / Tips

- The **storyboard is the most important deliverable**. Daastansaraa knows this and will never skip the SVG step.
- Speak Farsi or English — the agent answers in both as you wish.
- Add a folder under `raw/<slug>/` for each project so the researcher doesn't conflate sources.
- For Iranian stories, mention the **region, decade, dialect, and political backdrop** in your brief — the agent uses them to shape voice and silhouette.
- For documentary work, run `/zanjireh <slug> documentary` — you'll get interview question banks instead of dialogue.
