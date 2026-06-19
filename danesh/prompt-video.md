# Persian Cheetah — AI-Video Prompts (per shot)
> Source: `danesh/shotlist.md` + `danesh/script-v2.md`. All prompts engineered to **override the African-savannah prior** that diffusion models default to. See `danesh/Persian-Cheetah-research.md` §8 for why.
> Each shot includes: **EN prompt** (engines are EN-only), **Farsi gloss** (راهنمای فارسی), **negative prompt**, **engine recommendation + free-tier note**, **paste-here hint**.
> Strategy: where text-to-video drifts, generate a strong **still keyframe** first (Flux Schnell / Ideogram / Bing-DALL·E free) and then run **image-to-video** on Kling / Runway / Hailuo. This is noted per shot.

---

## GLOBAL NEGATIVE PROMPT (paste with every shot)

```
African savannah, savanna, Serengeti, Maasai Mara, tall waving grass, acacia tree, baobab,
zebra, lion, elephant, giraffe, wildebeest, jungle, rainforest, green grassland, safari jeep,
warm golden grass background, tropical, deciduous forest, Maasai horizon,
text overlay, watermark, logo, low resolution, blurry, distorted anatomy, extra legs, extra tails,
cartoon, anime, oversaturated, neon, glitch, jpeg artefact
```

**راهنمای منفی (فارسی):** هیچ ساوانای آفریقایی، هیچ درخت آکاسیا یا بائوباب، هیچ گورخر، شیر، فیل، زرافه، گاومیش وحشی. علف بلند و طلایی ممنوع. متن، واترمارک، کارتون، رنگ‌های اشباع‌شده، اعضای بدن اضافی، آناتومی غلط ممنوع.

---

## SHOT 1.1 — Cold-open aerial, Touran plateau, blue dawn

**EN prompt:**
> *Iranian central plateau, Touran Biosphere Reserve, pre-sunrise blue hour, low-altitude aerial drone footage, slow forward parallel-to-ground glide over a vast, cold semi-arid steppe. Pale sand and gravel substrate, sparse silver-grey Artemisia tussocks, scattered dark basalt outcrops, a snow-dusted ridge floating on the distant horizon. No vegetation taller than ankle-height. Cool blue ambient light, no sun in frame yet, long dawn shadows. Photorealistic, 4K, 24mm wide cinematic, Kapadia / Attenborough realism. Subtle wind across the dust. 16:9, 8 seconds.*

**Farsi gloss:**
> فلات مرکزی ایران، ذخیره‌گاه زیست‌کره توران، آبی‌ساعت قبل از طلوع. تصویربرداری هوایی پایین با پهپاد، حرکت آرام به جلو موازی با زمین. شن و سنگریزه‌ی روشن، بوته‌های پراکنده‌ی درمنه‌ی نقره‌ای، صخره‌های بازالت تیره، رشته‌کوه برف‌پوش در افق دور. هیچ گیاهی بلندتر از قوزک پا نیست. نور آبی سرد، بدون خورشید در قاب. واقع‌گرایی فیلم مستند، ۲۴ میلی‌متر، ۴K، ۹۶:۹، ۸ ثانیه.

**Engine:** **Kling** (free trial) for longer cinematic drone moves; or generate keyframe on **Flux Schnell** (HuggingFace free) → image-to-video on **Hailuo** (daily free credits).
**Paste here:** kling.ai → New Generation → Text-to-Video → 16:9 → paste prompt; OR fal.ai → flux/schnell for keyframe, then kling.ai → Image-to-Video → upload keyframe.

---

## SHOT 1.2 — Camera-trap, night, single cheetah crossing

**EN prompt:**
> *Static infrared camera-trap footage, night, no sound. Iranian central plateau wadi, rocky desert floor. A single adult Asiatic cheetah — paler sandy coat, slightly smaller frame than African form, thicker neck ruff — walks left to right across the frame. Eyeshine bright in the infrared. Long tail trailing. Grainy black-and-white-and-grey thermal palette, slight vignetting, low-resolution security-camera quality, fixed wide shot, no camera movement. 16:9, 5 seconds.*

**Farsi gloss:**
> فوتیج ثابت دوربین‌تله مادون قرمز، شب، بدون صدا. وادی فلات ایران، کف صخره‌ای کویری. یک یوزپلنگ آسیایی بالغ ـ کم‌رنگ‌تر، کمی کوچک‌تر از گونه‌ی آفریقایی، با یال گردنی ضخیم‌تر ـ از چپ به راست از قاب می‌گذرد. درخشش چشم در مادون قرمز. دانه‌دانه، خاکستری‌سیاه، وینیت ملایم، کیفیت دوربین امنیتی، قاب ثابت، بدون حرکت دوربین. ۹۶:۹، ۵ ثانیه.

**Engine:** **Wan 2.1** (open-source, free on HF) or **Pika** (free tier). The IR aesthetic is hard for text-to-video — better: generate IR-style still on Flux + Ideogram, then i2v on Kling.
**Paste here:** huggingface.co/spaces/Wan-AI/Wan2.1 → text-to-video. Or pika.art → Create.

---

## SHOT 2.1 — Split-screen, African vs. Persian (generate two clips, edit-combine)

**EN prompt — LEFT half (African, the "wrong" image):**
> *African cheetah running through tall golden grass on Serengeti savannah, acacia tree silhouette in background, warm gold sunset light, classic safari documentary look, 50mm cinematic, 16:9, 4 seconds.*

**EN prompt — RIGHT half (Persian, the "right" image):**
> *Iranian central plateau, Asiatic cheetah trotting across pale gravel and salt-flat steppe, sparse Artemisia tussocks, snow-dusted mountains in distant background, cool hard white midday light, paler sandy coat with thicker neck ruff, no trees, no tall grass, photorealistic 4K, 50mm cinematic, Kapadia / BBC Planet Earth realism, 16:9, 7 seconds.*

**Farsi gloss:**
> چپ: یوزپلنگ آفریقایی در علف بلند طلایی، آکاسیا، نور طلایی غروب. راست: یوزپلنگ آسیایی، فلات ایران، سنگریزه‌ی روشن، درمنه‌ی پراکنده، کوه برف‌پوش در دور، نور سفید سرد ظهر، بدون درخت، بدون علف بلند. هر دو سینمایی ۵۰mm، ۹۶:۹.

**Engine:** **Runway Gen-3 Alpha** trial (best for stylized cinematic) or **Luma Dream Machine** (free daily credits).
**Paste here:** runwayml.com → Gen-3 Alpha → text-to-video. Generate twice, combine in editor.

**Note:** the left clip is the *only* place in the entire film the African default may render. Everywhere else, use the full global negative prompt.

---

## SHOT 3.1 — Touran drone wide with gazelle herd

**EN prompt:**
> *Iranian central plateau, Touran Biosphere Reserve at sunrise, low-altitude aerial drone footage moving parallel to the ground. A small herd of jebeer gazelles trots across the foreground from camera-right to camera-left, kicking up faint dust. Pale gravel and sandy substrate with sparse Artemisia tussocks. Dusty-brown mountains in the distance, with snow on the highest peaks. Low warm side light from the left, long raking shadows. No tall grass, no trees, no acacia. Photorealistic 4K, 28mm cinematic drone, Attenborough / Planet Earth realism. 16:9, 6 seconds.*

**Farsi gloss:**
> فلات مرکزی ایران، ذخیره‌گاه توران در طلوع. فیلم پهپادی پایین موازی با زمین. گله‌ی کوچک جبیر از راست به چپ از پیش‌زمینه می‌گذرد، گرد ملایم از سم‌ها. سنگریزه‌ی روشن، درمنه‌ی پراکنده. کوه‌های قهوه‌ای-خاکی در دور با برف بر قله‌ها. نور گرم پایین از چپ، سایه‌های دراز. بدون علف بلند، بدون درخت. ۲۸mm پهپاد سینمایی، ۴K، ۹۶:۹، ۶ ثانیه.

**Engine:** **Luma Dream Machine** (best for natural physics, free daily) or **Kling** for gazelle motion fidelity.
**Paste here:** lumalabs.ai → Dream Machine → Create → 16:9.

---

## SHOT 4.1 — Kooshki pacing enclosure (archival recreation if no archive)

**Default:** use real archival footage from ICS / Pardisan / IRIB. AI generation is **not recommended** for a named real animal — accuracy is too risky and the footage exists.

**Only if archival unavailable** — EN prompt:
> *Archival-style 2010s documentary footage, Pardisan Park Tehran, an adult male Asiatic cheetah paces along the rectangular path of a concrete-floored enclosure. Wire mesh in foreground slightly out of focus. Slightly faded sandy coat. Eight steps, turn, eight steps, turn. Yellow-grey overhead institutional lighting, soft top key, no sun. Static medium shot, 50mm, slight handheld breath. Grainy archival video quality, 4:3 source upconverted to 16:9. 6 seconds.*

**Farsi gloss:**
> فوتیج آرشیوی سبک مستند دهه ۲۰۱۰، پارک پردیسان تهران، یوزپلنگ آسیایی نر بالغ در مسیر مستطیلی محوطه‌ی بتنی قدم می‌زند. توری سیمی در پیش‌زمینه‌ی کمی محو. کت کم‌رنگ شده. هشت قدم، چرخش، هشت قدم. نور بالاسری زرد-خاکستری. قاب متوسط ثابت، ۵۰mm. کیفیت آرشیوی دانه‌دار، ۹۶:۹، ۶ ثانیه.

**Engine:** if generating, **Hailuo** for human-like archival look + **Pixverse** for short loops; otherwise license real footage.
**Paste here:** hailuoai.video → text-to-video.

---

## SHOT 4.5 — Pirouz photo montage (do NOT AI-generate; use real photos)

**Hard rule:** **Pirouz is a real, named, recently-deceased animal. Do not generate AI imagery of him.** Use the public ICS / DOE photographic record. The film's emotional credibility depends on the *real* photographs.

If you need a stylistic Ken Burns motion effect on the stills, that is an **editor-level** task in Resolve / Premiere — not an AI-video task.

---

## SHOT 4.7 — Mural + child

**EN prompt:**
> *A weathered plaster wall in a Tehran neighborhood, with a large painted mural of an Asiatic cheetah — paler sandy coat, slightly smaller than African form, with the Farsi word "پیروز" beneath. Soft warm late-afternoon side light from camera-right. A child of about seven, seen from behind, three-quarter angle, stands at the base of the mural, reaches one hand up, fingertips just touching the painted paw. Static medium shot, 35mm cinematic, photorealistic 4K, gentle ambient street sound. 16:9, 5 seconds. No tall grass, no acacia, no savannah.*

**Farsi gloss:**
> دیوار گچی فرسوده در محله‌ای از تهران، نقاشی دیواری بزرگ یوزپلنگ آسیایی با کت کم‌رنگ‌تر، و واژه‌ی «پیروز» در زیر. نور گرم ملایم بعد از ظهر از سمت راست دوربین. کودکی حدود هفت‌ساله، از پشت، در زاویه‌ی سه‌چهارم، در پای دیوار. یک دست را بالا می‌آورد، نوک انگشتانش به پنجه‌ی نقاشی‌شده می‌رسد. قاب متوسط ثابت، ۳۵mm سینمایی، ۴K، ۹۶:۹، ۵ ثانیه.

**Engine:** keyframe on **Bing Image Creator** (DALL·E 3) or **Ideogram** (great with embedded Farsi text), then image-to-video on **Kling** for the slow ambient micro-movement.
**Paste here:** bing.com/images/create → paste prompt (the Farsi mural text renders best in Ideogram); then kling.ai → image-to-video.

---

## SHOT 5.1 — Empty highway, then truck

**EN prompt:**
> *Static wide shot of an empty two-lane asphalt highway cutting straight across the Iranian central plateau, no road markings except a faded yellow centerline, late-morning heat shimmer rising from the surface. Pale gravel and Artemisia shoulders, dusty mountains in the distance, no trees. Hold static for four seconds, then a large dusty cargo truck blasts through the frame from camera-right to camera-left in less than one second, leaving a trail of dust. 35mm cinematic, photorealistic 4K, 16:9, 6 seconds.*

**Farsi gloss:**
> قاب ثابت وسیع از بزرگراه دو-طرفه‌ی خالی که مستقیماً از فلات مرکزی ایران می‌گذرد. خط زرد محو، مارپیچ گرما از آسفالت. سنگریزه و درمنه در شانه‌های جاده، کوه‌های خاکی در دور، بدون درخت. چهار ثانیه ثابت، سپس کامیون باری بزرگ گردآلود در کمتر از یک ثانیه از راست به چپ قاب را می‌شکافد، گردوغبار. سینمایی ۳۵mm، ۴K، ۹۶:۹، ۶ ثانیه.

**Engine:** **Kling** for the speed of the truck (motion fidelity matters). Or **Hailuo** for the static→sudden motion contrast.
**Paste here:** kling.ai → text-to-video → 16:9 → 6s.

---

## SHOT 5.7 — Cheetah walking away into heat shimmer

**EN prompt:**
> *Iranian central plateau, midday, a single adult Asiatic cheetah walks away from the camera into a wide pale gravel and Artemisia steppe, seen from behind. Long-lens compression (200mm equivalent), the cheetah small in the frame, heat shimmer distorts the horizon. Paler sandy coat, slightly smaller than African form, thicker neck ruff. Dusty mountains in the far distance. Hard white midday light, no shadows. No trees, no tall grass, no acacia. Photorealistic 4K cinematic, 16:9, 5 seconds.*

**Farsi gloss:**
> فلات مرکزی ایران، نیمروز، یوزپلنگ آسیایی بالغ از دوربین دور می‌شود و به استپ سنگریزه‌ای-درمنه می‌رود، از پشت. لنز تله ۲۰۰mm، یوز کوچک در قاب، مارپیچ گرما در افق. کم‌رنگ‌تر، یال گردن ضخیم‌تر. کوه‌های خاکی در دور. نور سفید سخت ظهر، بدون سایه. بدون درخت، بدون علف بلند. ۴K سینمایی، ۹۶:۹، ۵ ثانیه.

**Engine:** **Runway Gen-3** for long-lens compression realism; **Luma** as alternative.
**Paste here:** runwayml.com → Gen-3 → text-to-video.

---

## SHOT 6.1 — Wild cubs camera-trap IR

**EN prompt:**
> *Static infrared camera-trap footage, night, wadi in Touran Biosphere Reserve. Wide fixed framing. An adult female Asiatic cheetah watches from the left foreground, eyeshine bright. Two cheetah cubs play in the right midground — one pounces on the other in a brief playful jump. Grainy black-and-grey infrared, low-resolution security-camera quality, slight vignette, fixed wide shot, no camera movement. The cubs move; the mother is still. 16:9, 7 seconds.*

**Farsi gloss:**
> فوتیج ثابت دوربین‌تله مادون قرمز، شب، وادی در ذخیره‌گاه توران. قاب ثابت وسیع. ماده‌یوز بالغ در پیش‌زمینه‌ی چپ می‌نگرد، چشمانش می‌درخشد. دو توله‌یوز در میانه‌ی راست بازی می‌کنند ـ یکی روی دیگری می‌پرد. خاکستری‌سیاه دانه‌دار مادون قرمز، کیفیت دوربین امنیتی، وینیت ملایم. توله‌ها حرکت می‌کنند، مادر بی‌حرکت. ۹۶:۹، ۷ ثانیه.

**Engine:** prefer real ICS archival footage. If generation needed: keyframe on **Flux Schnell** (IR-style prompt) → image-to-video on **Kling**. Hailuo also handles the IR aesthetic.
**Paste here:** if generating: fal.ai (flux/schnell) → still → kling.ai (image-to-video) → 7s.

---

## SHOT 6.4 — Rural classroom

**EN prompt:**
> *Wide interior shot of a small rural Iranian classroom, simple plastered walls, a single window camera-left letting in soft warm afternoon light. A teacher in modest dress stands camera-right, holding up a printed poster of an Asiatic cheetah, the Farsi word یوزپلنگ visible at the top. A circle of about six children, ages 6 to 9, sit cross-legged on a kilim rug on the floor, facing the teacher. One child near the center has raised both hands like paws and is imitating the cheetah, eyes wide; the other children are laughing. Photorealistic 4K, 28mm cinematic, gentle ambient classroom sound. 16:9, 5 seconds. No exoticism, no orientalist flourishes.*

**Farsi gloss:**
> نمای داخلی وسیع از کلاس درس روستایی کوچک ایرانی، دیوارهای ساده‌ی گچی، پنجره‌ای در سمت چپ دوربین که نور گرم ملایم بعد از ظهر را به داخل می‌فرستد. معلم در سمت راست، پوستر یوزپلنگ آسیایی را بالا گرفته، واژه‌ی «یوزپلنگ» در بالا. دایره‌ای از حدود شش کودک شش تا نه ساله، چارزانو روی گلیم، رو به معلم. یک کودک در میانه دو دستش را مانند پنجه بالا برده و یوز را تقلید می‌کند، چشمانش گرد. بقیه می‌خندند. ۲۸mm سینمایی، ۴K، ۹۶:۹، ۵ ثانیه.

**Engine:** **Hailuo** (best for natural human + child motion) or **Kling**. Bing Image Creator for the keyframe (DALL·E 3 is strong at children + classroom scenes); then image-to-video.
**Paste here:** hailuoai.video → text-to-video. For keyframe: bing.com/images/create.

---

## SHOT 7.1 — Drone crane-up over plateau

**EN prompt:**
> *Cinematic drone footage, slow vertical crane-up over the Iranian central plateau in late afternoon. Start at low altitude, the camera rising steadily for ten seconds, the plateau widening below. Pale gravel and Artemisia substrate, sparse vegetation visible as small dots from increasing altitude, a thin dirt road curving across the frame. Dusty mountains on the horizon. Low warm side light from camera-left, long shadows raking. No tall grass, no trees, no acacia. Photorealistic 4K, 24mm wide drone cinematic. 16:9, 10 seconds.*

**Farsi gloss:**
> فیلم پهپاد سینمایی، صعود عمودی آرام بر فراز فلات مرکزی ایران در اواخر بعد از ظهر. شروع از ارتفاع پایین، دوربین به‌طور پیوسته ده ثانیه بالا می‌رود، فلات گسترده‌تر می‌شود. سنگریزه و درمنه، نقاط پراکنده‌ی گیاهی از بالا، جاده‌ی خاکی نازک. کوه‌های خاکی در افق. نور گرم پایین از چپ، سایه‌های دراز. بدون درخت، بدون علف بلند. ۲۴mm پهپاد، ۴K، ۹۶:۹، ۱۰ ثانیه.

**Engine:** **Kling** (best for long sustained drone moves on the free tier); **Veo** if you have AI Studio access; **Luma** as backup.
**Paste here:** kling.ai → text-to-video → 16:9 → 10s.

---

## SHOT 7.3 — Final camera-trap still, eyes glowing

**EN prompt:**
> *Static infrared camera-trap still image (or 4-second held shot), an Asiatic cheetah head-on to the camera at close range, head slightly raised, the eyes glowing brightly in the infrared. Tear-stripes visible. Pale sandy coat slightly visible in the IR grain. Wadi rocks in the background. Grainy black-and-grey infrared, slight vignette, low-resolution security-camera quality, no camera movement, the only motion is a slow blink. 16:9, 6 seconds.*

**Farsi gloss:**
> تصویر ثابت دوربین‌تله مادون قرمز (یا برداشت ۴ ثانیه‌ای ثابت)، یوزپلنگ آسیایی رودرروی دوربین در فاصله‌ی نزدیک، سر کمی بالا، چشم‌ها در مادون قرمز روشن می‌درخشند. خط‌های اشک پیداست. کت کم‌رنگ در دانه‌بندی IR. صخره‌های وادی در پس‌زمینه. خاکستری-سیاه دانه‌دار، وینیت ملایم، تنها حرکت یک پلک آرام. ۹۶:۹، ۶ ثانیه.

**Engine:** prefer real archival ICS still. If generating: **Ideogram** (free) for the IR still, then **Pika** or **Pixverse** for the slow-blink i2v.
**Paste here:** ideogram.ai → generate (paste prompt, set 16:9); then pika.art → upload image → "subtle motion, one slow blink."

---

## PRODUCTION NOTES

- **Order of operations:** generate Section 1 + Section 7 plates first (the bookends). The rest of the film inherits their look. If they fail, the whole film fails.
- **Cost discipline:** free tiers regenerate daily. Spread generation across 3–5 days, ~3 shots per day, to stay free.
- **Keyframe-first wins:** for every shot, generating a strong still keyframe and then running image-to-video produces more controllable, more *Persian-plateau* results than text-to-video alone. The image-to-video step gives the model a visual anchor that overrides the African default.
- **Aspect ratio:** every prompt is 16:9. Do not let any engine default to 1:1 or 9:16.
- **Pirouz: do not generate him.** Real footage only. The film's covenant with the audience.

---

End of prompt-video.md.
