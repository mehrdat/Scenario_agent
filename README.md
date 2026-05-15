# Daastansaraa — داستان‌سرا

> A Claude Code agent system for turning ideas into scenarios, scenarios into storyboards, and storyboards into AI-video prompts — **no paid API required**.

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
| `/storybord <slug> [16x9\|9x16\|1x1]` | استوری‌بورد | SVG storyboard + shot-list |
| `/prompt-video <slug> [engine]` | پرامپت ویدئو | Per-shot AI-video prompts (free engines) |
| `/zanjireh <slug> [variant]` | زنجیره · pipeline | Runs the full chain end-to-end |

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
