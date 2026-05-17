# Daastansaraa — داستان‌سرا

> A Claude Code agent system for turning ideas into scenarios, scenarios into storyboards, storyboards into real drawn images, and images into AI-video prompts — all with **no paid API and no subscription**.

---

## بزن بریم / Quick start

```bash
git clone https://github.com/<you>/Scenario_agent.git
cd Scenario_agent
claude            # opens Claude Code in this folder
```

Then in Claude Code:
```
/rahnama          # personal decision guide — tells you which commands to run for your situation
/salighe update   # tell the agents your taste so every output sounds like you
```

That's it. The agents auto-discover from `.claude/agents/` and `.claude/commands/`.

---

## "What command do I need?" — quick decision tree

| Your situation | Command to run |
|---|---|
| I have just an idea, nothing written | `/zanjireh <slug> kaameleh` (full pipeline) |
| I want a YouTube short / Reel / TikTok | `/koutaah <slug> youtube-shorts 60 <style>` |
| I want a documentary | `/zanjireh <slug> documentary` |
| I have a finished script and want a storyboard | `/storybord <slug>` (planning) or `/negaareh <slug> 25` (drawn) |
| I have a script and want a critique | `/naghd <slug>` |
| I have a draft that needs improvement | `/naghd <slug>` then `/behtar <slug>` |
| I have research material in `raw/` | `/tahghigh <slug>` first |
| I want to know which genre fits my idea | `/gooneh "<your idea>"` |
| I want to design one specific scene in depth | `/sahneh <slug> <scene-N>` |
| I want better dialogue | `/dialog <slug>` |
| I want characters | `/shakhsiat <slug>` |
| I don't know what I want — ask me questions | `/rahnama` |

**Not sure?** Always run `/rahnama` — it tells you the exact sequence of commands for *your* situation, in order.

---

## Commands (Farsi names in Latin alphabet)

### Core scenario commands
| Command | Meaning | Does |
|---|---|---|
| `/rahnama` | راهنما · guide | Decision guide — tells you which commands to run for your situation |
| `/tahghigh <slug>` | تحقیق · research | Reads `raw/` → `danesh/<slug>-research.md` |
| `/gooneh <slug or idea>` | گونه · genre | Recommends genre + reference works |
| `/senaario <slug> [brief]` | سناریو · scenario | Builds logline → synopsis → treatment → beats → scenes → script |
| `/shakhsiat <slug> [name]` | شخصیت · character | Builds character bible |
| `/sahneh <slug> <N>` | صحنه · scene | Deep-designs one scene |
| `/dialog <slug> [scope]` | گفتگو · dialogue | Rewrites dialogue with subtext + voice differentiation |
| `/behtar <slug> [focus]` | بهتر · improve | Story-doctors an existing draft |
| `/naghd <slug>` | نقد · critique | Diagnosis without rewriting |
| `/mosaahebeh <slug>` | مصاحبه · interview | **(Opt-in)** Documentary interview question design |

### Storyboard commands (two fidelities)
| Command | Output | Best for |
|---|---|---|
| `/storybord <slug> [scope] [aspect] [ink-style]` | **SVG** schematic boards | Planning the shoot, day-of director's reference, scratch notes |
| `/negaareh <slug> <%> [style] [aspect]` | **HTML studio + real drawn images** via Bing IC / Mage / NightCafe / Stable Horde / local SD | Pitch deck, festival package, portfolio, presentation |

### Format-specific pipelines
| Command | Does |
|---|---|
| `/koutaah <slug> <platform> <seconds> [style]` | **Short-form pipeline** for YouTube Shorts / Reels / TikTok. Hook in first 3s, retention beats every 5–7s, payoff in last 5s |
| `/zanjireh <slug> [variant]` | Full pipeline. Variants: `kaameleh` (feature) · `documentary` · `tabligh` (ad/music-video) · `bazneveshtan` (rewrite) |

### Output post-production
| Command | Does |
|---|---|
| `/prompt-video <slug>` | Per-shot AI-video prompts for Hailuo, Kling, Pika, Runway free, Luma free, Sora-via-Bing, Veo, Wan, Pixverse |

### User taste / self-improving agents
| Command | Does |
|---|---|
| `/salighe view` | View your taste profile (genres, directors, themes, visual style, register) |
| `/salighe update "..."` | Add/refine preferences explicitly |
| `/salighe learn` | Have **salighe-shenas** read your prior work and propose profile updates (you accept/reject before merge) |
| `/salighe reset` | Archive current profile and start fresh |

---

## The taste profile (سلیقه) — agents that learn you

`salighe/profile.md` is the agents' memory of *who you are as a creator*. Every command reads it first.

- **Tell it explicitly**: `/salighe update "I love Farhadi-style moral dilemmas and Kiarostami long takes. Persian, Tehrani register. Default storyboard style: kiarostami. Hate slapstick."`
- **Let it learn**: `/salighe learn` reads everything in `output/` and proposes additions — directors you've cited, themes that recur, structural choices you've made, visual styles you've picked. Each proposal cites file paths as evidence. You accept / reject / edit before anything merges.

Once populated, every command tailors its output:
- `/senaario` writes in your sentence rhythm and vocabulary register.
- `/storybord` and `/negaareh` default to your preferred visual style if you don't pass one.
- `/behtar` flags issues against the structural model *you* tend to use.
- `/koutaah` matches your tone preference.

This is the difference between generic output and output that feels written *for you*.

---

## Storyboard fidelities — `/storybord` vs `/negaareh`

These are two separate commands because they solve different problems.

|  | `/storybord` (pardeh-negaar) | `/negaareh` (negaaregar) |
|---|---|---|
| **What it produces** | SVG file (text-based vector) | HTML studio page + real drawn images |
| **Who draws** | Claude writes SVG geometry | **You pick the generator** (Bing IC, Mage, NightCafe, Stable Horde, local SD …) |
| **Look** | Clean ink lines, stick figures, white background — a planning document | Real comic-book / Hollywood / noir / Ghibli / Kiarostami images |
| **Best for** | Planning the shoot, day-of reference | Pitch deck, festival, portfolio |
| **Scope picker** | `sample` / `key` / `scene N` / `sequence N` / `act N` / `all` | **Percentage of runtime** (1–100) |
| **Style picker** | clean / sketchy / cinematic ink | 20-preset library (see below) |
| **Hard cap per call** | 4 pages (24 panels) | 36 panels |
| **Credit cost** | Minimal | Low (Claude writes prompts + HTML; image work is offloaded) |

### `/negaareh` style library

```
comic        Hollywood storyboard pencil-and-ink (default)
real         Photorealistic cinematic 35mm
noir         B&W chiaroscuro, Sin City inspired
anime        Anime production cel
ghibli       Studio Ghibli, painterly Miyazaki
watercolor   Loose washes, ink over wet paint
pencil       Graphite sketch, cross-hatched value
graphic-novel Mignola / Frank Miller bold lines
pixar        3D animation still
wes-anderson Symmetrical pastel dollhouse
kiarostami   Iranian neorealism, dust palette
farhadi      Contemporary Tehran ensemble realism
kubrick      Symmetric one-point monumentalism
fincher      Desaturated green-yellow, precise
wong-kar-wai Saturated jewel tones, step-printed
deakins      Painterly natural light, environmental
del-toro     Fairy-tale gothic, amber + teal
lynch        Dreamlike surreal, red + electric blue
marvel       Dynamic action, bold primaries
bw-photo     B&W documentary photography
custom       You type your own style brief
```

### How `/negaareh` actually works

1. You run `/negaareh pardeye-akhar 25 kiarostami` (25% of runtime, Kiarostami style).
2. Negaaregar selects the 25% most dramatically important scenes (climax / midpoint / inciting / all-is-lost / turning points).
3. Builds a `_cast-map.md` so the same character has the same face in every panel.
4. Writes 60–120-word style-locked prompts per panel.
5. Assembles `output/negaareh/pardeye-akhar/studio.html`.
6. **You open the HTML in your browser.** For each panel:
   - Click **"Bing IC"** → opens Bing Image Creator with prompt pre-filled → click Create → drag the generated image back onto the panel.
   - Or click **"Try Stable Horde"** → in-browser generation, ~30–90s queue, no clicks elsewhere.
   - Or click **"Mage" / "NightCafe" / "Ideogram" / "Leonardo" / "HF Flux"** → similar flow with different engines.
   - Or **drag any image file** onto a panel — saved to your browser's localStorage.
7. Click **"Export all (ZIP)"** in the toolbar when you're done.

### Bulk-render path (CLI, for users with GPU or restricted browsers)

```bash
# Multi-backend: tries Stable Horde → local Automatic1111 → Pollinations
tools/render-panels.sh output/negaareh/<slug>/prompts.tsv auto

# Or render entirely locally with Stable Diffusion
python tools/render-local.py output/negaareh/<slug>/prompts.tsv black-forest-labs/FLUX.1-schnell
```

Then load the JPGs into the studio HTML via the per-panel Upload button.

### When you don't have to draw anything

`/storybord` is enough when you just need a planning document. Use it for blocking, coverage maps, AD reference. Save `/negaareh` for moments where you actually need to *show* somebody what the film will look like.

---

## YouTube / short-form focus — `/koutaah`

A 60-second YouTube short is **not** a shrunken feature. `/koutaah` runs a pipeline that respects short-form rules:

- **First 3 seconds = the hook.** Audience swipes or stays at second 3. The agent writes three competing hook options and picks one, with reasoning.
- **Retention beats every 5–7 seconds.** A new visual, a new revelation, a new emotional charge. No flat stretches.
- **Payoff in the last 5 seconds** — either resolve the hook or open a loop that drives rewatches.
- **Vertical aspect by default** for Shorts/Reels/TikTok. Composition rules differ.
- **Critique uses a short-form rubric**: hook strength, retention curve density, payoff alignment, visual density per 10s window, on-screen text plan, loop potential.

```bash
/koutaah cafe-tehran youtube-shorts 60 kiarostami
/koutaah daily-coffee reels 90 wes-anderson
/koutaah lab-explainer tiktok 45 real
```

Defaults per platform: youtube-shorts (60s 9:16), youtube (any 16:9), reels (90s 9:16), tiktok (60s 9:16), twitter (140s 16:9).

---

## Documentary path

```
/zanjireh <slug> documentary
```

Replaces dialogue-writing with B-roll planning. **Interviews are opt-in** — many documentary modes don't use them (observational/Wiseman, poetic/Reggio, archival/Kapadia, essay/Marker). If you want interviews, run `/mosaahebeh <slug>` separately. The agent posts a one-paragraph suggestion after the scenario step but never writes interviews unless you ask.

Mode picker via `/gooneh <slug>` first — it recommends expository / observational / poetic / archival / essay / participatory / hybrid and lists 5 reference works.

---

## Honest disclaimer about images

**Claude (this CLI) cannot generate raster images.** It's a text/code model. SVG (which is text) Claude can write; pixel-art with recognizable faces is outside its capability.

For real comic-book / Hollywood-style storyboard images, this project orchestrates **free external generators** — primarily **Bing Image Creator** (DALL·E 3, free with Microsoft account), and as alternatives **NightCafe**, **Mage.space**, **Ideogram**, **Leonardo**, **HuggingFace Flux**, **Stable Horde** (anonymous, in-browser), and **local Stable Diffusion** via `tools/render-local.py`.

The HTML studio page has a button for each. **If one is blocked or down, another works** — that's the whole point of having seven backends. No paid API, no subscription, no API keys.

For users in restricted networks (Iran, China etc.): Bing IC and Mage usually need VPN; local Stable Diffusion always works offline; Stable Horde sometimes works without VPN.

---

## Folders

```
.
├── .claude/
│   ├── agents/          # five agents (daastansaraa, pardeh-negaar, negaaregar, shakhsiat-pardaaz, pajooheshgar, salighe-shenas)
│   └── commands/        # 14 slash commands
├── raw/                 # drop research material here (PDFs, notes, photos, transcripts)
├── danesh/              # distilled research notes (written by pajooheshgar)
├── salighe/             # your taste profile — agents read it before every command
├── templates/
│   ├── storyboard.svg   # base for /storybord
│   └── studio.html      # base for /negaareh — multi-backend interactive page
├── tools/
│   ├── render-panels.sh # bulk-render (multi-backend, falls through if one is down)
│   └── render-local.py  # local Stable Diffusion via diffusers
├── output/
│   ├── senaario/<slug>/ # script artifacts
│   ├── shakhsiat/       # character bibles
│   ├── storybord/<slug>/# SVG storyboards
│   ├── negaareh/<slug>/ # HTML studio + prompts + panels/
│   ├── prompt/          # AI-video prompts
│   └── naghd/           # critiques
└── README.md
```

---

## Who is the writer? (the pedigree behind Daastansaraa)

- **Craft**: McKee, Syd Field, Campbell / Vogler, Blake Snyder, Aristotle, Mamet, Sorkin, Charlie Kaufman.
- **Documentary**: Errol Morris, Werner Herzog, Ken Burns, Wiseman, Varda, Asif Kapadia, Adam Curtis, Joshua Oppenheimer.
- **Iranian cinema**: کیارستمی، فرهادی، بیضایی، مهرجویی، شهیدثالث، مجیدی، بنی‌اعتماد، پناهی.
- **Literary roots**: فردوسی، نظامی، حافظ، فروغ، شاملو، هدایت، گلشیری.

Full skill list (10 detailed sections covering structural models, character psychology, dialogue, cinematography, genre mastery, documentary craft, Iranian cultural context, story-doctoring) lives in [`.claude/agents/daastansaraa.md`](.claude/agents/daastansaraa.md).

---

## Using with other LLMs (Ollama, LM Studio)

The agent prompts in `.claude/agents/*.md` are plain Markdown — paste any one as a system prompt for **Ollama** (`qwen2.5:32b`, `llama3.3:70b`, `deepseek-r1:32b`), **LM Studio**, **Aider**, **Continue.dev**, **Open WebUI**. Slash commands and `AskUserQuestion` are Claude Code-specific, but the underlying agent logic is portable.

Strong free hosted alternatives: **Google AI Studio** (Gemini 2.5 free), **Groq** (free Llama 3.3 70B, Qwen 32B, DeepSeek-R1), **Together AI** free credit, **HuggingFace Inference**, **Mistral Le Chat**.

---

## نکته‌ی نهایی / Final note

This project is designed for the user who is making a film with no budget and a strong vision. Daastansaraa does not write *for* you — it writes *with* you. The taste profile is the contract; the storyboard is the deliverable you'll defend in a meeting. Run `/rahnama` whenever you're not sure what's next. Run `/salighe learn` after every 2–3 finished projects so the agents keep up with how you're evolving.
