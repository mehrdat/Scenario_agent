# Scenario_agent 🎬🌿

> An agent that turns a raw idea about **Iran's nature** into a ready-to-shoot AI-video package:
> a sectioned **scenario**, the factual **research**, and — most importantly — **shot-by-shot
> prompts** detailed enough to generate an entire 15+ minute documentary with AI video tools.
>
> Voice: a **whistleblower** for Iran's vanishing wildlife and habitats. Informative first,
> scientific, and emotionally honest — always tied to Iran's people, culture, and land.

---

## How it works / گردش کار

You give an idea (and any material you've gathered). The agent runs the whole pipeline
internally and hands you **3 Markdown files** — nothing more:

```
idea + input  →  research  →  plan + story depth  →  critique loop
              →  SCENARIO  →  critique  →  PROMPTS (★)
```

| File | What it is |
|---|---|
| `output/<slug>-prompts.md` ★ | The crown jewel. Per-shot prompts (5–8s each), scene detail, and the narration for each sequence. Extreme directorial detail: camera, lens, light, motion, palette, textures, must / must-not show. |
| `output/<slug>-scenario.md` | The sectioned scenario, bilingual (EN + FA), translated into filmable visual language. |
| `output/<slug>-research.md` | Facts, ecology, conservation numbers, cultural ties — with sources. |

Full rules live in **[`WORKFLOW.md`](WORKFLOW.md)**.

---

## Schema / ساختار پوشه‌ها

```
Scenario_agent/
├─ README.md            ← this file
├─ WORKFLOW.md          ← the agent's full operating brief (the rules)
├─ input/               ← drop your gathered material here (one subfolder per topic)
├─ output/              ← the 3 generated .md files per topic
│   ├─ <slug>-prompts.md     ★ most important
│   ├─ <slug>-scenario.md
│   └─ <slug>-research.md
└─ (legacy) danesh/ raw/ templates/ tools/ .claude/   ← earlier pipeline, kept as-is
```

`<slug>` = kebab-case topic, e.g. `persian-cheetah`, `hyrcanian-forest`, `dragonfly-wetlands`.

---

## Commands / دستورها

Just tell the agent in plain language. These are the core intents:

| Command | What it does |
|---|---|
| `suggest topics` | Proposes Iran-nature topics (cheetah, Hyrcanian forest, dragonflies, bears, Lake Urmia, Zagros…). |
| `research <topic>` | Reads `input/` + does its own web research → writes `research.md`. |
| `scenario <topic>` | Builds the sectioned, bilingual scenario → `scenario.md` (researches first if needed). |
| `prompts <topic>` | Writes the shot-by-shot video prompts → `prompts.md` (★). |
| `full <topic>` | The whole pipeline → all 3 files. |
| `+ options` | Override defaults inline: length (e.g. `8s shots`, `20 minutes`), `aspect 9:16`, focus more scientific / more emotional. |

The agent **asks before guessing** when the topic, length, or intent is unclear.

---

## Example / مثال

```
You:   full persian-cheetah, 18 minutes, lean toward emotional but keep the science
Agent: → researches the Asiatic cheetah (status, numbers, causes, cultural meaning)
       → writes output/persian-cheetah-research.md
       → writes output/persian-cheetah-scenario.md   (sectioned, EN + FA)
       → writes output/persian-cheetah-prompts.md     (~130 shots of 5–8s, extreme detail)
```

A single prompt looks like this (abbreviated):

> **Shot 4.1 — 6s** · *Dawn, lone Asiatic cheetah scans the Lut salt plain.*
> "Natural-history documentary shot, photoreal, 8K… a lean adult Asiatic cheetah on cracked
> salt at first light, slowly turning its head, breathing fast… 300mm telephoto, ground-level,
> shallow focus, slow dolly-in… golden-hour light from frame-right, amber/blue palette… no
> people, vehicles, or text. 16:9."

---

## Defaults / پیش‌فرض‌ها

- **Format:** Markdown · **Aspect:** 16:9
- **Language:** bilingual — narration EN + Farsi; **prompts in English** (AI engines read it best)
- **Runtime:** 15+ minutes, built from **5–8s shots** with strict cross-shot continuity
- **Research:** uses your `input/` *and* the agent's own research; deep independent research if you give nothing

---
---

# فارسی 🌿

> عاملی که یک ایدهٔ خام دربارهٔ **طبیعت ایران** را به یک بستهٔ آمادهٔ ساخت ویدئو با هوش مصنوعی
> تبدیل می‌کند: یک **سناریوی** بخش‌بندی‌شده، **تحقیق** علمی، و از همه مهم‌تر **پرامپت‌های
> نما‌به‌نما** که آن‌قدر دقیق هستند که بتوان با ابزارهای ویدئوی هوش مصنوعی یک مستند ۱۵ دقیقه‌ای
> و بیشتر ساخت.
>
> لحن: مثل یک **افشاگر / زنگ خطر** برای حیات‌وحش و زیست‌بوم‌های روبه‌نابودی ایران. اول
> **اطلاع‌رسان**، علمی، و صادقانه از نظر احساسی — همیشه در پیوند با مردم، فرهنگ و سرزمین ایران.

## گردش کار

شما ایده (و هر چیزی که از قبل جمع کرده‌اید) را می‌دهید. عامل کل خط تولید را در پشت‌صحنه اجرا
می‌کند و فقط **۳ فایل Markdown** تحویل می‌دهد، نه بیشتر:

```
ایده + ورودی  →  تحقیق  →  طرح و عمق داستان  →  حلقهٔ نقد
              →  سناریو  →  نقد  →  پرامپت‌ها (★)
```

| فایل | چیست |
|---|---|
| `output/<slug>-prompts.md` ★ | مهم‌ترین فایل. پرامپت هر نما (۵ تا ۸ ثانیه)، جزئیات صحنه و روایت هر توالی. با جزئیات کاملِ کارگردانی: دوربین، لنز، نور، حرکت، رنگ، بافت، چیزهایی که باید و نباید دیده شوند. |
| `output/<slug>-scenario.md` | سناریوی بخش‌بندی‌شده، دوزبانه (انگلیسی + فارسی)، ترجمه‌شده به زبان تصویریِ قابل فیلم‌برداری. |
| `output/<slug>-research.md` | حقایق، بوم‌شناسی، آمار حفاظت، پیوندهای فرهنگی — همراه با منابع. |

قواعد کامل در **[`WORKFLOW.md`](WORKFLOW.md)** است.

## دستورها

کافی است به زبان ساده به عامل بگویید:

| دستور | کار |
|---|---|
| `suggest topics` | پیشنهاد موضوع‌های طبیعت ایران (یوز، جنگل هیرکانی، سنجاقک، خرس، دریاچهٔ ارومیه، زاگرس…). |
| `research <topic>` | خواندن `input/` + تحقیق مستقل → نوشتن `research.md`. |
| `scenario <topic>` | ساخت سناریوی بخش‌بندی‌شدهٔ دوزبانه → `scenario.md`. |
| `prompts <topic>` | نوشتن پرامپت‌های نما‌به‌نما → `prompts.md` (★). |
| `full <topic>` | کل خط تولید → هر ۳ فایل. |
| `+ گزینه‌ها` | تغییر پیش‌فرض‌ها: مدت (مثلاً `۸ ثانیه`, `۲۰ دقیقه`)، نسبت تصویر `9:16`، علمی‌تر یا احساسی‌تر. |

عامل وقتی موضوع، مدت یا هدف روشن نباشد، **پیش از حدس‌زدن می‌پرسد**.

## مثال

```
شما:  full persian-cheetah، ۱۸ دقیقه، احساسی‌تر ولی علم را حفظ کن
عامل: → دربارهٔ یوزپلنگ آسیایی تحقیق می‌کند (وضعیت، آمار، علل، معنای فرهنگی)
      → output/persian-cheetah-research.md را می‌نویسد
      → output/persian-cheetah-scenario.md را می‌نویسد (بخش‌بندی‌شده، EN + FA)
      → output/persian-cheetah-prompts.md را می‌نویسد (حدود ۱۳۰ نما ۵ تا ۸ ثانیه‌ای، با جزئیات کامل)
```

## پیش‌فرض‌ها

- **قالب:** Markdown · **نسبت تصویر:** 16:9
- **زبان:** دوزبانه — روایت انگلیسی + فارسی؛ **پرامپت‌ها انگلیسی** (موتورهای هوش مصنوعی بهتر می‌فهمند)
- **مدت:** ۱۵ دقیقه و بیشتر، ساخته‌شده از نماهای **۵ تا ۸ ثانیه‌ای** با پیوستگی دقیق میان نماها
- **تحقیق:** هم از `input/` شما و هم تحقیق مستقل عامل؛ اگر چیزی ندهید، تحقیق عمیق مستقل انجام می‌شود
