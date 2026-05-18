# AI Video Generation Prompts — پرده‌ی آخر / The Final Curtain

---

## How to Use This File

**EN**: This file contains one detailed video-generation prompt per shot from FILE 7 (`07-shotlist-full.md`). Each block contains: a primary universal English prompt (works across most engines), a negative prompt, a Farsi director's note, and engine-specific tips for the seven major free/freemium engines as of 2026. Paste the PRIMARY VIDEO PROMPT into the engine of your choice. For static-camera shots (the majority of this film), prefer Hailuo or Kling for their motion control. For the three moving-camera shots (Shots 09, 26, 39) use Runway Gen-4 or Luma Dream Machine for the smoothest dolly/track. Generate at 16:9 and crop to 2.39:1 in post.

**FA**: این فایل شامل یک پرامپتِ ویدئویی برای هر شات از فایلِ ۷ است. هر بلوک شامل: پرامپتِ اصلیِ انگلیسی، پرامپتِ منفی، توضیحِ فارسی برای کارگردان و راهنمای موتورهای مختلف. پرامپتِ اصلی را در موتورِ موردنظر بچسبانید. برای شات‌های ثابت از Hailuo یا Kling استفاده کنید. برای سه شاتِ متحرک (۹، ۲۶، ۳۹) از Runway Gen-4 یا Luma استفاده کنید. خروجی را به نسبتِ ۱۶:۹ بگیرید و در مرحله‌ی پایانی به ۲.۳۹:۱ کراپ کنید.

---

## Free Credit Reminder (verify current limits — as of early 2026)

| Engine | Free offer (approx) | Best for this project |
|---|---|---|
| **Hailuo (MiniMax)** | ~30 daily free generations | Cinematic motion, static realism — **PRIMARY RECOMMENDATION** |
| **Kling 1.6** | ~6 free generations/day | Long duration (up to 10s), photoreal — **STRONG SECOND** |
| **Pika 2.0** | ~30 credits/day | Quick iterations, slight stylization |
| **Runway Gen-4** | Free trial credits on signup | Dolly/track motion shots — use for Shots 09, 26, 39 |
| **Luma Dream Machine** | ~30 free/month + daily refresh | Real-world physics, dolly moves |
| **Sora (via Bing Video Creator)** | Limited free per day | Highest quality when available; period drama strong |
| **Wan 2.1** | Free if self-hosted; free on HuggingFace inference | Fully free, slower turnaround |
| **Pixverse** | Free tier with daily limit | Fast turnaround; less photorealistic |

## Recommended engine for THIS project

**Primary: Hailuo MiniMax.** Reasoning: this film is 80% static, contemplative, with subtle micro-motion (cloth in wind, hand on stone, eyes closing). Hailuo's strength is exactly this — restrained motion, photorealistic skin tones, and good handling of period costume. Persian chador is rendered correctly without "fantasy" distortion.

**Secondary: Kling 1.6** for any shot requiring 8+ seconds of continuous performance (Shots 9, 22, 26, 36, 53). Kling's longer maximum duration preserves the slow-cinema rhythm.

**For the three camera-movement shots** (Shot 9 lateral track, Shot 26 dolly-in, Shot 39 push-in): **Runway Gen-4** or **Luma Dream Machine** with explicit camera-motion controls.

**Avoid**: any engine that over-stylizes or "anime-ifies" by default (Pixverse default style). Always include "photorealistic, no anime, no cartoon" in negative prompts.

---

## Shot 01 — Scene 1 / Shot A
**Scene**: Pre-dawn bedroom, Maryam asleep, curtain moving at window.
**Duration**: 15s

---

### PRIMARY VIDEO PROMPT (Universal / Portable)
> A small whitewashed Persian bedroom at pre-dawn, Isfahan 1978. A 65-year-old Iranian woman in a black chador, weathered olive skin, deep brown eyes, gray-streaked hair at temples is asleep on her back on a narrow wooden bed in the lower-left of frame. A wooden chair sits empty in mid-ground. A brass samovar rests on a low tray. A framed photograph is turned face-down on a side table. A thin white curtain at the upper-right wooden-shutter window moves very slowly in a pre-dawn breeze. The camera is static, locked, eye-level. 35mm lens equivalent, deep depth of field. Light: cool blue-grey pre-dawn light entering from upper-left through wooden shutter slats, dust suspended in the shafts. Color palette: cool blues, white plaster, dark wood, the deep black of the chador on the bedclothes. Mood: stillness, anticipation, the silence before a long-awaited day. Style: in the style of Abbas Kiarostami, Vermeer interior light, Iranian slow cinema. 16:9 aspect, 15 seconds. Photorealistic, 4K, no motion blur on the curtain, cinematic depth of field, fine 35mm film grain.

### NEGATIVE PROMPT
> watermark, text overlay, subtitles, distortion, extra fingers, cartoonish, CGI look, anime, modern clothing, modern architecture, phone, car, bright saturated colors, lens flare, fast motion, motion blur on subject, fish-eye, vignette

### راهنمای فارسی
> نمای ثابت و باز از اتاقِ خوابِ مریم در سپیده‌دم اصفهانِ ۱۳۵۷. مریم در رختخواب خوابیده. صندلیِ خالی، سماورِ برنجی، عکسِ وارونه روی میز. پرده‌ی نازک کنارِ پنجره به‌آرامی تکان می‌خورد. نورِ سرد آبی از بالا-چپ. دوربین کاملاً ثابت.

### Engine-Specific Tips
- **Hailuo MiniMax**: paste the primary; add "subject: stationary, only the curtain moves" in the optional motion field. Web: hailuoai.video
- **Kling 1.6**: use "Image-to-Video" mode with a still from FILE 8 (Shot 01); set motion-strength to 1/5.
- **Pika 2.0**: prefix with "[static camera]"; set Pika Effect "Subtle".
- **Runway Gen-4**: select "Camera Control → Static"; duration 10s (max free), loop in edit.
- **Luma Dream Machine**: include "no camera move, only curtain motion" at end of prompt.
- **Sora (via Bing)**: paste primary as-is; Sora handles long static shots well.
- **Wan 2.1**: on HuggingFace, set "Motion bucket id" to 5 (very low).

---

## Shot 02 — Scene 1 / Shot B
**Scene**: Maryam wakes, sits on edge of bed, examines hands.
**Duration**: 18s

---

### PRIMARY VIDEO PROMPT
> A 65-year-old Iranian woman in a black chador, weathered olive skin, deep brown eyes, gray-streaked hair at temples is sitting up slowly on the edge of a narrow wooden bed in a whitewashed Persian bedroom at pre-dawn. She brings her hands into her lap, palm up, and examines them — first the palms, then turning to the backs — as if checking they are still hers. She does not look anywhere else. The camera is static, eye-level, slightly low. 50mm lens equivalent. Light: cool pre-dawn blue from upper-left through wooden shutter, one warm accent from a brass samovar in background. Color palette: cool blue-white, deep black chador, warm copper accent, olive skin. Mood: quiet examination of a long life. Style: in the style of Abbas Kiarostami, Sebastião Salgado hand portraiture. Photorealistic, 4K, cinematic depth of field, fine grain. 16:9, 18 seconds.

### NEGATIVE PROMPT
> watermark, text, distortion, extra fingers, deformed hands, cartoonish, anime, CGI plastic skin, modern clothing, fast motion, jittery camera, lens flare

### راهنمای فارسی
> مریم آرام روی لبه‌ی تخت می‌نشیند، دستانش را در دامن می‌گذارد و کفِ دست و پشتِ دست را وارسی می‌کند. دوربین ثابت در سطحِ چشم. نور سرد آبی از بالا-چپ.

### Engine-Specific Tips
- **Hailuo MiniMax**: emphasize "slow deliberate movement of hands only"; PRIMARY CHOICE for this shot.
- **Kling 1.6**: Image-to-Video with hand-detail focus.
- **Pika 2.0**: avoid Pika Effects; pure prompt.
- **Runway Gen-4**: static camera lock; medium motion strength.
- **Luma Dream Machine**: works well; emphasize "no body shift, only hands move".
- **Sora (via Bing)**: paste primary.
- **Wan 2.1**: motion bucket 10.

---

## Shot 03 — Scene 1 / Shot C
**Scene**: MCU of Maryam looking down at her hands.
**Duration**: 8s

### PRIMARY VIDEO PROMPT
> Medium close-up, eye-level, of a 65-year-old Iranian woman in a black chador, weathered olive skin, deep brown eyes, gray-streaked hair at temples. She is looking downward at her hands (below frame). Pre-dawn blue light catches the left side of her face from upper-left; the right side of her face is in soft shadow. Her expression is neither sad nor neutral — it is contemplative. She blinks slowly, once. Camera static. 50mm lens equivalent, shallow depth. Mood: quiet reckoning. Style: Kiarostami close-up restraint, Persian classical portraiture. Photorealistic, 4K, 16:9, 8 seconds, fine grain.

### NEGATIVE PROMPT
> watermark, text, distortion, plastic skin, fake makeup, anime, glamour-shot lighting, sharp dramatic shadows, fast eye motion, swift head movement

### راهنمای فارسی
> نمای متوسط-نزدیک از صورتِ مریم. نگاه پایین. یک پلک آرام. نورِ آبی از بالا-چپ.

### Engine-Specific Tips
- **Hailuo MiniMax**: PRIMARY. Excellent for restrained face work.
- **Kling 1.6**: enable face-enhancement.
- **Pika 2.0**: 8s exactly, no effects.
- **Runway Gen-4**: portrait mode tuning.
- **Luma**: ideal for slow blink.
- **Sora (via Bing)**: paste primary.
- **Wan 2.1**: motion bucket 8.

---

## Shot 04 — Scene 1 / Shot D
**Scene**: Washing face from copper basin.
**Duration**: 22s

### PRIMARY VIDEO PROMPT
> A 65-year-old Iranian woman in a black chador, weathered olive skin, deep brown eyes, gray-streaked hair at temples stands at a low table in a whitewashed Persian bedroom at pre-dawn. She pours water from a brass pitcher into a copper basin (the water catches a sharp highlight from the upper-left window light). She washes her face with three slow, deliberate handfuls. Static camera, eye-level. 50mm lens equivalent. Light: cool pre-dawn blue from upper-left, beginning to warm at the window edges. Color palette: copper, white plaster, water highlights, the black chador. Mood: morning ritual carried out for the ten-thousandth time. Style: Iranian realism, Kiarostami, Vermeer. Photorealistic, 4K, 16:9, 22 seconds, fine grain.

### NEGATIVE PROMPT
> watermark, text, distortion, extra fingers, splashing water special effects, dramatic music suggestion, modern bathroom, faucet, mirror, cartoonish

### راهنمای فارسی
> مریم آب از کوزه‌ی برنجی به طشتِ مسی می‌ریزد و با سه مشتِ آرام صورت می‌شوید. دوربین ثابت. نور آبی از بالا-چپ.

### Engine-Specific Tips
- **Hailuo MiniMax**: superb water rendering.
- **Kling 1.6**: long-duration friendly.
- **Pika 2.0**: 22s exceeds free limit — split into 11s + 11s.
- **Runway Gen-4**: 10s max free; consider two takes.
- **Luma**: handles water beautifully.
- **Sora (via Bing)**: paste primary.
- **Wan 2.1**: works well at motion bucket 12.

---

## Shot 05 — Scene 1 / Shot E
**Scene**: ECU top-down on tin and hands.
**Duration**: 10s

### PRIMARY VIDEO PROMPT
> Extreme close-up, top-down 30-degree angle, of weathered olive-skinned aged hands opening a small worn tin box on a wooden table. Inside the tin: a pair of brass tweezers, a folded handkerchief, several wrapped sweets in pastel paper. The hands carefully select one wrapped sweet, lift it, hold it for a moment. Static camera. 85mm lens equivalent macro. Light: soft directional pre-dawn light from upper-left. Color palette: tin silver-grey, pastel wrappers, olive skin, warm wood. Mood: small careful gesture, the dignity of small things. Style: still-life, Iranian art-cinema detail shot. Photorealistic, 4K, 16:9, 10 seconds.

### NEGATIVE PROMPT
> watermark, text, distortion, extra fingers, deformed hands, plastic look, modern packaging, branded products, candy logos

### راهنمای فارسی
> نمای نزدیک از بالا. دستِ مریم قوطیِ کوچک را باز می‌کند، یک شکلاتِ کاغذپیچ برمی‌دارد.

### Engine-Specific Tips
- **Hailuo MiniMax**: ECU work is its strength.
- **Kling 1.6**: macro mode.
- **Pika 2.0**: works well at 10s.
- **Runway Gen-4**: tight crop; manual aspect.
- **Luma**: good hand fidelity.
- **Sora (via Bing)**: paste primary.
- **Wan 2.1**: motion bucket 5.

---

## Shot 06 — Scene 1 / Shot F
**Scene**: Donning the chador.
**Duration**: 14s

### PRIMARY VIDEO PROMPT
> A 65-year-old Iranian woman with weathered olive skin, deep brown eyes, gray-streaked hair at temples lifts a black chador from a wooden hook on a wooden door in a whitewashed Persian bedroom. She drapes it over her head, settles it on her shoulders, and adjusts the fabric under her chin with both hands, without using a mirror. The motion is practiced, unhurried. Static camera, eye-level, medium shot. 50mm lens. Light: pre-dawn blue from upper-left, slightly warming at the window. Mood: putting on the public self. Style: Iranian realism. Photorealistic, 4K, 16:9, 14 seconds.

### NEGATIVE PROMPT
> watermark, text, distortion, decorative chador with patterns, fashionable hijab, colorful headscarf, mirror in frame, glamorous makeup, fast motion

### راهنمای فارسی
> مریم چادر را از چوب‌رخت برمی‌دارد، سر می‌کند، بدونِ آینه زیرِ چانه تنظیم می‌کند.

### Engine-Specific Tips
- **Hailuo**: PRIMARY for cloth dynamics.
- **Kling**: good chador fabric.
- **Pika**: works at 14s.
- **Runway Gen-4**: 10s max — consider trimming.
- **Luma**: handles fabric well.
- **Sora**: paste primary.
- **Wan 2.1**: motion bucket 14.

---

## Shot 07 — Scene 1 / Shot G
**Scene**: Same wide as Shot 01; Maryam crosses to door, pauses, exits.
**Duration**: 18s

### PRIMARY VIDEO PROMPT
> Wide static shot, identical framing to the film's opening shot: a small whitewashed Persian bedroom now with morning light arriving — cool blue beginning to warm. The bed in the lower-left is now empty and tidy. A wooden chair sits empty in mid-ground (note: in the foreground left, a second empty chair). A 65-year-old Iranian woman in a black chador, weathered olive skin, deep brown eyes, gray-streaked hair at temples crosses the room from mid-frame to a wooden door at right. She pauses, one hand on the door frame, looking ahead. Then she steps out. The room is briefly empty before the shot ends. Static camera, 35mm lens, eye-level. Light: cool blue from upper-left warming. Mood: the threshold. Style: Kiarostami, Vermeer. Photorealistic, 4K, 16:9, 18 seconds.

### NEGATIVE PROMPT
> watermark, text, distortion, modern décor, mirror, photographs face-up, decorative chador, fast movement

### راهنمای فارسی
> همان قابِ شات یک. مریم اتاق را به سمتِ در می‌برد. یک لحظه می‌ایستد، بعد بیرون می‌رود.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Kling**: good for 18s if free credits allow.
- **Pika**: split if over 10s.
- **Runway Gen-4**: 10s — trim to entry + pause, animate exit separately.
- **Luma**: works at 16s; tighten prompt.
- **Sora**: paste primary.
- **Wan 2.1**: motion bucket 18.

---

## Shot 08 — Scene 2 / Shot A
**Scene**: Maryam steps out of her house into the alley.
**Duration**: 10s

### PRIMARY VIDEO PROMPT
> A narrow Isfahan alley in the old quarter at morning, 1978. Sand-colored adobe walls, half the alley in upper-left light, half in shade. A weathered wooden door in mid-frame opens; a 65-year-old Iranian woman in a black chador, weathered olive skin, deep brown eyes, gray-streaked hair at temples steps out, closes the door behind her with one hand, adjusts the chador under her chin. Static camera, medium-long shot, eye-level. 35mm lens. Color palette: warm adobe sand, deep shade, black chador. Mood: stepping into the world. Style: Iranian neorealism. Photorealistic, 4K, 16:9, 10 seconds.

### NEGATIVE PROMPT
> watermark, modern doors, metal hardware, satellite dish, electric meter, painted graffiti (other than period-accurate), neon, car

### راهنمای فارسی
> مریم از درِ چوبیِ خانه‌اش وارد کوچه‌ی باریکِ خاکیِ اصفهانی می‌شود. در را می‌بندد، چادر را تنظیم می‌کند.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Kling**: good period-accurate texture.
- **Pika**: works at 10s.
- **Runway Gen-4**: ideal.
- **Luma**: works well.
- **Sora**: excellent period rendering.
- **Wan 2.1**: motion bucket 10.

---

## Shot 09 — Scene 2 / Shot B (LATERAL TRACKING)
**Scene**: Maryam walks the alley; camera tracks beside her.
**Duration**: 28s

### PRIMARY VIDEO PROMPT
> A 65-year-old Iranian woman in a black chador, weathered olive skin, deep brown eyes, gray-streaked hair at temples walks at a slow, deliberate pace through a narrow Isfahan alley in the old quarter, 1978. Sand-colored adobe walls; one side in upper-left morning light, the other in shade. THE CAMERA MOVES LATERALLY, tracking beside her at 6 meters from her shoulder, matching her walking pace exactly. Medium shot. 35mm lens equivalent. Color palette: warm adobe, black chador, dust in the air. Mood: a city remembered. Style: in the style of Abbas Kiarostami, slow tracking, Iranian realism. Photorealistic, 4K, 16:9, 28 seconds, fine grain. Camera motion: slow lateral dolly track, perfectly horizontal, no shake.

### NEGATIVE PROMPT
> watermark, handheld shake, jitter, modern signage, car, neon, fast walking, exaggerated steady-cam wobble, anime, CGI

### راهنمای فارسی
> دوربین به موازاتِ مریم در کوچه حرکت می‌کند — هم‌سرعت با او. فاصله ۶ متر. هیچ لرزشی نباشد. کندِ ۲۸ ثانیه.

### Engine-Specific Tips
- **Hailuo MiniMax**: in motion settings, select "Track" + "Lateral".
- **Kling 1.6**: SECONDARY CHOICE. Use "Camera Movement → Tracking Left/Right" preset.
- **Pika 2.0**: limited camera control; less ideal.
- **Runway Gen-4**: **PRIMARY** for this shot. Use "Camera Control → Pan/Track Horizontal", duration 10s × 3 segments.
- **Luma Dream Machine**: explicit "tracking shot, lateral, smooth dolly" — performs well.
- **Sora (via Bing)**: paste primary; Sora handles tracking elegantly.
- **Wan 2.1**: motion bucket 30 + camera-motion flag.

---

## Shot 10 — Scene 2 / Shot C
**Scene**: ECU insert: torn pamphlet on wall.
**Duration**: 3s

### PRIMARY VIDEO PROMPT
> Extreme close-up, slightly low angle, of a torn paper pamphlet pasted on a sand-colored adobe wall in Isfahan, 1978. Persian script suggested but unreadable. The corner of the pamphlet flutters slightly in a soft morning breeze. Static camera. 85mm lens equivalent. Light: morning sun from upper-left. Mood: political pressure without naming itself. Style: documentary detail. Photorealistic, 4K, 16:9, 3 seconds.

### NEGATIVE PROMPT
> watermark, readable text, modern flyer, color photo, glossy paper, logos, English text, brand names

### راهنمای فارسی
> نمای نزدیک از اعلامیه‌ی پاره روی دیوارِ خاکی. گوشه‌اش با باد تکان می‌خورد. متن خوانده نمی‌شود.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Kling**: ideal at 3s.
- **Pika**: works.
- **Runway**: tight crop.
- **Luma**: micro-motion is its strength.
- **Sora**: paste primary.
- **Wan 2.1**: motion bucket 3.

---

## Shot 11 — Scene 2 / Shot D
**Scene**: Boy with paper kite runs past.
**Duration**: 6s

### PRIMARY VIDEO PROMPT
> A narrow Isfahan alley, morning, 1978. A 65-year-old Iranian woman in a black chador stands on the left of frame, watching. A barefoot boy of about 8, in simple period clothing — loose cotton trousers and shirt — runs from right to left across the frame holding a hand-made paper kite trailing string. He kicks up small dust clouds. The woman turns her head slowly to follow him. Static camera, medium-long shot, eye-level. 35mm lens. Morning light upper-left. Color palette: warm dust, paper kite catching light. Mood: time passing. Style: Iranian neorealism, Kiarostami children. Photorealistic, 4K, 16:9, 6 seconds.

### NEGATIVE PROMPT
> watermark, modern toy, plastic kite, branded shoes, sneakers, t-shirt with print, fast motion blur, distortion

### راهنمای فارسی
> پسرِ هشت‌ساله با بادبادکِ کاغذی از مقابلِ مریم می‌گذرد. مریم با سر او را دنبال می‌کند.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Kling**: works well; emphasize "child running, paper kite trailing".
- **Pika**: works at 6s.
- **Runway**: works.
- **Luma**: good kid motion.
- **Sora**: paste primary.
- **Wan 2.1**: motion bucket 25 (the running child is the main motion).

---

## Shot 12 — Scene 2 / Shot E
**Scene**: Maryam pauses at shop window with doll.
**Duration**: 12s

### PRIMARY VIDEO PROMPT
> A 65-year-old Iranian woman in a black chador, weathered olive skin, deep brown eyes, gray-streaked hair at temples pauses at a small dusty shop window in a narrow Isfahan alley, 1978. Behind the glass, a single child's doll with a hand-stitched simple dress sits propped on a shelf. The woman's face is faintly reflected in the glass. She looks at the doll for a long beat. She does not enter. She moves on. Static camera, medium shot, eye-level. 50mm lens. Light: morning sun from upper-left, glare on glass. Mood: an unspoken memory. Style: Asghar Farhadi pause, restrained. Photorealistic, 4K, 16:9, 12 seconds.

### NEGATIVE PROMPT
> watermark, plastic modern doll, Barbie, branded toys, store signage in English, modern shop display, neon, garish colors

### راهنمای فارسی
> مریم پشتِ ویترینِ پر گرد و خاکِ یک مغازه‌ی کوچک می‌ایستد. یک عروسکِ ساده پشتِ شیشه. صورتش در شیشه منعکس می‌شود. می‌گذرد.

### Engine-Specific Tips
- **Hailuo**: PRIMARY; reflection rendering strong.
- **Kling**: works.
- **Pika**: works at 12s if split or compress.
- **Runway**: 10s — slight trim.
- **Luma**: handles reflections.
- **Sora**: paste primary.
- **Wan 2.1**: motion bucket 8.

---

## Shot 13 — Scene 2 / Shot F
**Scene**: Samovar shopkeeper nods; Maryam nods back.
**Duration**: 8s

### PRIMARY VIDEO PROMPT
> The threshold of a small samovar shop in a narrow Isfahan alley, 1978. Copper samovars of various sizes stacked inside and at the doorway. The shopkeeper, an older Iranian man with a gray beard in simple period clothes (white shirt, dark vest), stands at his door. A 65-year-old Iranian woman in a black chador passes through frame. They exchange a single nod each — slight, dignified. Neither speaks. Static camera, medium shot, eye-level. 50mm lens. Morning light upper-left, glints on copper. Mood: a community of nods. Style: Iranian realism. Photorealistic, 4K, 16:9, 8 seconds.

### NEGATIVE PROMPT
> watermark, modern man clothes, t-shirt, baseball cap, smile, hand wave, conversation, smartphone

### راهنمای فارسی
> فروشنده‌ی سماورهای مسی در آستانه‌ی مغازه. مریم می‌گذرد. هر دو سری تکان می‌دهند. هیچ‌کس حرف نمی‌زند.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Kling**: good for two-person scenes.
- **Pika**: works.
- **Runway**: works.
- **Luma**: works.
- **Sora**: paste primary.
- **Wan 2.1**: motion bucket 10.

---

## Shot 14 — Scene 2 / Shot G
**Scene**: Maryam recedes into the alley depth.
**Duration**: 12s

### PRIMARY VIDEO PROMPT
> A long shot, slightly elevated, of a narrow Isfahan alley receding into deep perspective, 1978. Sand-colored adobe walls on both sides. A 65-year-old Iranian woman in a black chador walks away from camera, becoming progressively smaller. Morning light from upper-left makes the walls glow on one side and shadow on the other. Static camera, 35mm lens, deep depth of field. Color palette: warm sand, deep shade, the single black silhouette receding. Mood: a city swallowing a figure. Style: Kiarostami long shot. Photorealistic, 4K, 16:9, 12 seconds.

### NEGATIVE PROMPT
> watermark, modern signage, satellite dish, electric pole, car, motorcycle, fast walking, distortion

### راهنمای فارسی
> نمای بازِ کوچه. مریم از دوربین دور می‌شود، کوچک‌تر می‌شود. عمق میدان بالا.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Kling**: good for long-distance walk.
- **Pika**: works.
- **Runway**: 10s — slight crop.
- **Luma**: works well.
- **Sora**: paste primary.
- **Wan 2.1**: motion bucket 12.

---

## Shot 15 — Scene 3 / Shot A
**Scene**: Wide of bazaar; Maryam enters from far end.
**Duration**: 12s

### PRIMARY VIDEO PROMPT
> The vaulted brick interior of the grand bazaar of Isfahan, 1978. High brick ceiling with circular oculi from which shafts of sunlight descend, dust hanging visibly in the shafts. Stalls of merchants suggested on either side. A 65-year-old Iranian woman in a black chador enters from the far end of the corridor and walks toward camera at a slow, deliberate pace, gradually becoming larger in frame. Static camera, slightly elevated long shot. 35mm lens. Color palette: warm brick, golden dust-shafts, deep shade, black chador. Mood: arrival into the marketplace. Style: Iranian realism, documentary. Photorealistic, 4K, 16:9, 12 seconds.

### NEGATIVE PROMPT
> watermark, fluorescent lighting, modern signage, English text, plastic packaging, tourists, cameras, smartphones

### راهنمای فارسی
> نمای بازِ بازارِ سرپوشیده‌ی اصفهان. ستون‌های نور از سقف. مریم از انتها به سمتِ دوربین می‌آید.

### Engine-Specific Tips
- **Hailuo**: PRIMARY — handles dust-shafts beautifully.
- **Kling**: excellent for atmospheric depth.
- **Pika**: works.
- **Runway**: works.
- **Luma**: shaft lighting strong.
- **Sora**: paste primary.
- **Wan 2.1**: motion bucket 15.

---

## Shot 16 — Scene 3 / Shot B
**Scene**: Maryam at bookseller's stall, beaded curtain behind.
**Duration**: 8s

### PRIMARY VIDEO PROMPT
> A 65-year-old Iranian woman in a black chador stands at a small Persian bookseller's stall inside the Isfahan bazaar, 1978. Worn leather-bound books stacked floor-to-ceiling. A wooden beaded curtain is visible over her left shoulder in mid-ground. She speaks briefly — lips move once, then she becomes still and waits. Static camera, medium shot, eye-level. 50mm lens. Soft warm light from the bazaar oculi above. Mood: the asking. Style: Iranian realism. Photorealistic, 4K, 16:9, 8 seconds.

### NEGATIVE PROMPT
> watermark, modern books with glossy covers, English titles, fluorescent light, plastic curtain, contemporary signage

### راهنمای فارسی
> مریم کنارِ غرفه‌ی کتاب‌فروش. پرده‌ی منجوقیِ چوبی پشتِ شانه‌اش. یک لحظه حرف می‌زند، بعد ساکن می‌ماند.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Kling**: works.
- **Pika**: works.
- **Runway**: works.
- **Luma**: works.
- **Sora**: paste primary.
- **Wan 2.1**: motion bucket 6.

---

## Shot 17 — Scene 3 / Shot C
**Scene**: Hold on Maryam listening to off-screen voice.
**Duration**: 10s

### PRIMARY VIDEO PROMPT
> Same medium-shot framing as the previous shot. The 65-year-old Iranian woman in black chador stands listening, looking toward the beaded curtain over her left shoulder. Her face is still. A small swallow visible in her throat. Static camera. 50mm lens. Soft warm bazaar light. Mood: receiving news. Style: Kiarostami listening shot. Photorealistic, 4K, 16:9, 10 seconds.

### NEGATIVE PROMPT
> watermark, exaggerated reaction, tears, head turn, fast blinking, distortion

### راهنمای فارسی
> همان قاب. مریم به پرده گوش می‌دهد. صورت ساکن. فقط یک قورت دادنِ کوچک.

### Engine-Specific Tips
- **Hailuo**: PRIMARY for restrained reaction work.
- **Kling**: face-enhancement on.
- **Pika**: works.
- **Runway**: works.
- **Luma**: works.
- **Sora**: paste primary.
- **Wan 2.1**: motion bucket 5.

---

## Shot 18 — Scene 3 / Shot D
**Scene**: MCU Maryam absorbing news.
**Duration**: 14s

### PRIMARY VIDEO PROMPT
> Medium close-up, eye-level, of the face of a 65-year-old Iranian woman in a black chador, weathered olive skin, deep brown eyes, gray-streaked hair at temples. She is absorbing news she did not want to hear. The face is mostly still; one slow blink; a single small contraction at the corner of the mouth. Soft directional light from upper-left from the bazaar oculi. 50mm lens, shallow depth. Mood: contained grief. Style: Kiarostami restraint. Photorealistic, 4K, 16:9, 14 seconds.

### NEGATIVE PROMPT
> watermark, tears, dramatic gasp, hand to mouth, head shake, fast emotion, exaggerated face

### راهنمای فارسی
> نمای متوسط-نزدیک از صورتِ مریم در حالِ هضمِ خبر. تنها یک پلکِ آرام، یک انقباضِ کوچک در گوشه‌ی لب.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Kling**: face-enhance.
- **Pika**: works.
- **Runway**: 10s — trim.
- **Luma**: works.
- **Sora**: paste primary.
- **Wan 2.1**: motion bucket 4.

---

## Shot 19 — Scene 3 / Shot E
**Scene**: Hold on Maryam, receiving the address.
**Duration**: 12s

### PRIMARY VIDEO PROMPT
> Medium shot, same framing as Shot 16, of a 65-year-old Iranian woman in a black chador receiving information from an off-screen voice behind a beaded curtain in an Isfahan bazaar bookstall. She is still. She nods once, very slightly, as if memorizing an address. Static camera. 50mm lens. Soft warm light. Mood: information passed across a threshold. Style: Iranian realism. Photorealistic, 4K, 16:9, 12 seconds.

### NEGATIVE PROMPT
> watermark, exaggerated nod, writing down, hand gestures, fast motion

### راهنمای فارسی
> مریم آدرس را می‌گیرد. سری تکان می‌دهد — خیلی کوچک، فقط برای حفظ.

### Engine-Specific Tips
- Same as Shot 17. **Hailuo PRIMARY.**

---

## Shot 20 — Scene 3 / Shot F
**Scene**: Maryam turns to leave, pauses, looks back.
**Duration**: 10s

### PRIMARY VIDEO PROMPT
> A 65-year-old Iranian woman in a black chador turns to leave a bookseller's stall in the Isfahan bazaar, 1978. The beaded wooden curtain swings slightly from a draft. She takes one step, then pauses, then looks back toward the curtain. She does not speak. She turns again and exits frame at left. Static camera, medium shot, eye-level. 50mm lens. Mood: the unspoken kindness. Style: Iranian realism. Photorealistic, 4K, 16:9, 10 seconds.

### NEGATIVE PROMPT
> watermark, hand wave, smile, exaggerated head turn, fast walking

### راهنمای فارسی
> مریم برای رفتن می‌چرخد، یک لحظه برمی‌گردد و به پرده نگاه می‌کند، بعد از قاب بیرون می‌رود.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Others**: standard application.

---

## Shot 21 — Scene 3 / Shot G
**Scene**: Empty stall; beaded curtain still moving.
**Duration**: 8s

### PRIMARY VIDEO PROMPT
> The empty bookseller's stall in the Isfahan bazaar after Maryam has left, 1978. The wooden beaded curtain is still moving slightly from her departure. Books stacked floor-to-ceiling. Warm dust suspended in shafts of light from above. No human in frame. Static camera, long shot. 35mm lens. Mood: presence in absence. Style: Iranian realism, Wiseman observational. Photorealistic, 4K, 16:9, 8 seconds.

### NEGATIVE PROMPT
> watermark, ghost, person in background, fast curtain motion, fluorescent light

### راهنمای فارسی
> غرفه‌ی خالی. پرده‌ی منجوقی هنوز آرام تکان می‌خورد. کسی نیست.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Kling**: curtain micro-motion strong.
- **Luma**: micro-motion is its forte.
- **Others**: standard.

---

## Shot 22 — Scene 4 / Shot A
**Scene**: ELS of Safavid courtyard; Maryam enters from far left.
**Duration**: 25s

### PRIMARY VIDEO PROMPT
> Extreme long shot, slightly elevated, of an abandoned Safavid-era Persian courtyard, Isfahan 1978. Four pointed-arch tile portals on the surrounding walls, tilework in turquoise, white, and cobalt geometric patterns. A turquoise-tiled bulbous dome rising behind the far wall. Two tall cypress trees in opposite corners of the courtyard. A long stone bench against the far wall. Worn flagstone underfoot. Late-afternoon golden light from upper-left, casting long shadows of the cypresses across the flagstones. A 65-year-old Iranian woman in a black chador enters from the far left of the frame, very small, and begins to walk slowly across the courtyard. Static camera, 35mm lens, deep depth of field. Color palette: turquoise tile, warm golden flagstone, deep cypress green, black chador. Mood: arrival at a remembered place. Style: in the style of Abbas Kiarostami, Persian Safavid architectural photography. Photorealistic, 4K, 16:9, 25 seconds, fine grain.

### NEGATIVE PROMPT
> watermark, tourists, modern signage, scaffolding, restoration plastic, ropes, electric wires, fluorescent light, fast walking

### راهنمای فارسی
> نمای فوق‌العاده باز از حیاطِ صفویِ متروکه. گنبدِ فیروزه‌ای، دو سرو، نیمکتِ سنگی. مریم از چپ وارد می‌شود، خیلی کوچک. نور طلایی از بالا-چپ.

### Engine-Specific Tips
- **Hailuo**: PRIMARY — handles architectural depth well.
- **Kling 1.6**: SECONDARY for long-duration; emphasize "no camera motion, only the figure walks".
- **Pika**: split into 12.5s + 12.5s.
- **Runway**: 10s — trim or animate from a perfect still.
- **Luma**: ideal for architectural beauty.
- **Sora (via Bing)**: paste primary — Sora's strongest mode.
- **Wan 2.1**: motion bucket 12.

---

## Shot 23 — Scene 4 / Shot B
**Scene**: LS of Maryam crossing flagstones.
**Duration**: 18s

### PRIMARY VIDEO PROMPT
> Long shot, eye-level, of a 65-year-old Iranian woman in a black chador, weathered olive skin, deep brown eyes, gray-streaked hair at temples crossing the flagstone floor of an abandoned Safavid courtyard in Isfahan, 1978. Her step is deliberate, slightly stooped at the shoulders. Her shadow trails behind her toward upper-left from the lowering sun. The turquoise dome visible above the back wall. Two cypress trees frame the courtyard. Static camera, 35mm lens. Light: golden hour from upper-left. Mood: deliberate approach to the long-awaited. Style: Kiarostami, Persian realism. Photorealistic, 4K, 16:9, 18 seconds.

### NEGATIVE PROMPT
> watermark, fast walking, modern shoes, decorative chador, scaffolding, restoration ropes, tourists

### راهنمای فارسی
> مریم در حالِ عبور از حیاط. گامِ آرام، شانه‌های کمی خمیده. سایه‌ی بلندش پشتِ سر.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Kling**: 18s within range.
- **Pika**: split or compress.
- **Runway**: 10s — choose a section.
- **Luma**: works well.
- **Sora**: paste primary.
- **Wan 2.1**: motion bucket 12.

---

## Shot 24 — Scene 4 / Shot C
**Scene**: MS Maryam arrives at the bench; sees the book and letter.
**Duration**: 10s

### PRIMARY VIDEO PROMPT
> A 65-year-old Iranian woman in a black chador, weathered olive skin, deep brown eyes, gray-streaked hair at temples arrives at a long stone bench in the corner of an abandoned Safavid courtyard, Isfahan 1978. On the bench: a small worn leather-bound book of Hafez poetry, with a folded yellowed letter tucked beneath it, held in place by a small smooth grey river-stone. A cypress branch enters the upper-right of frame. Golden afternoon light from upper-left. Static camera, medium shot, eye-level. 50mm lens. Mood: discovery without rushing. Style: Iranian realism. Photorealistic, 4K, 16:9, 10 seconds.

### NEGATIVE PROMPT
> watermark, multiple letters, modern book, glossy book, color photographs on bench, plastic objects

### راهنمای فارسی
> مریم به نیمکت می‌رسد. کتابِ حافظ، نامه‌ی تاشده زیرِ کتاب، سنگِ هموار رویش. شاخه‌ی سرو بالای راست.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Kling**: object detail strong.
- **Others**: standard application.

---

## Shot 25 — Scene 4 / Shot D
**Scene**: ECU top-down on the bench: book, letter, stone.
**Duration**: 6s

### PRIMARY VIDEO PROMPT
> Extreme close-up, top-down 45-degree angle, of a small worn leather-bound Hafez book on a sun-warmed stone bench. Beneath the book, the corner of a folded yellowed letter is visible. A small smooth grey river-stone holds them in place. Faint Persian calligraphy visible on the letter's outer edge. Golden directional light from upper-left, the warm patina of old leather, the grain of the stone bench. Static camera. 85mm lens equivalent. Mood: an object waiting. Style: Kiarostami detail, Persian still-life. Photorealistic, 4K, 16:9, 6 seconds.

### NEGATIVE PROMPT
> watermark, modern book, glossy cover, English title, plastic stone, multiple letters

### راهنمای فارسی
> نمای نزدیک از کتابِ حافظِ کهنه روی نیمکت. نامه‌ی تاشده‌ی زرد زیرِ آن، با سنگِ هموارِ خاکستری.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Others**: standard.

---

## Shot 26 — Scene 4 / Shot E (SLOW DOLLY-IN)
**Scene**: MCU dolly-in (8s) on hands lifting stone, drawing letter.
**Duration**: 14s

### PRIMARY VIDEO PROMPT
> Medium close-up moving slowly to close-up over 8 seconds via a smooth dolly-in (90cm to 45cm), eye-level, of the aged olive-skinned hands of a 65-year-old Iranian woman lifting a smooth river-stone off a folded yellowed letter, setting the stone aside on the stone bench, sliding the letter from beneath a worn leather-bound Hafez book, turning the letter over to reveal her name "مریم" written in old slanted brown ink in her father's handwriting. Static foreground bench, only camera moves. 85mm lens equivalent. Golden afternoon light from upper-left. Mood: the touch of the long-awaited. Style: Kiarostami, Iranian art-cinema. Photorealistic, 4K, 16:9, 14 seconds. CAMERA MOTION: smooth slow dolly-in, motorized slider feel, no shake.

### NEGATIVE PROMPT
> watermark, handheld shake, fast zoom, jitter, extra fingers, English handwriting, distortion of script

### راهنمای فارسی
> دوربین آرام به سمتِ دستان و نامه نزدیک می‌شود (پوش‌ـ‌این، ۸ ثانیه). دستِ مریم سنگ را برمی‌دارد، نامه را از زیرِ کتاب می‌کشد، اسمِ "مریم" به خطِ پدر روی پاکت دیده می‌شود.

### Engine-Specific Tips
- **Hailuo**: motion setting "Zoom in slow" + face-/hand-focus.
- **Kling 1.6**: SECONDARY — "Camera Movement → Zoom in".
- **Pika**: limited camera control; less ideal.
- **Runway Gen-4**: **PRIMARY for this shot**. Camera Control → "Push In" preset, slow speed.
- **Luma Dream Machine**: explicit "slow dolly in, motorized, smooth, no shake".
- **Sora (via Bing)**: paste primary; Sora's dolly-in is excellent.
- **Wan 2.1**: motion bucket 18 + push-in flag.

---

## Shot 27 — Scene 4 / Shot F
**Scene**: First true CU of Maryam, breaking the seal.
**Duration**: 10s

### PRIMARY VIDEO PROMPT
> Close-up, eye-level, of the face of a 65-year-old Iranian woman in a black chador, weathered olive skin, deep brown eyes, gray-streaked hair at temples — the first time we see her face this close in the film. She has not yet read the letter; she is breaking the old wax seal of an envelope with her thumb. Golden afternoon light from upper-left, deep shadow on the right side of her face. 85mm lens equivalent, shallow depth. The cypress branch out of focus in the background. Mood: the threshold before knowing. Style: in the style of Abbas Kiarostami, the earned close-up. Photorealistic, 4K, 16:9, 10 seconds.

### NEGATIVE PROMPT
> watermark, exaggerated emotion, dramatic gasp, tears, fast hand motion, plastic skin, makeup, glamour lighting

### راهنمای فارسی
> اولین نمای نزدیکِ واقعیِ صورتِ مریم. هنوز نخوانده. با شست مهرِ کهنه را می‌شکند. نورِ طلایی، نیمی از صورت در سایه.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Kling**: face-enhance.
- **Pika**: works.
- **Runway**: works.
- **Luma**: subtle face work strong.
- **Sora**: paste primary.
- **Wan 2.1**: motion bucket 5.

---

## Shot 28 — Scene 4 / Shot G
**Scene**: ECU letter in her lap, opening words visible.
**Duration**: 8s

### PRIMARY VIDEO PROMPT
> Extreme close-up, over-shoulder top-down angle, of an unfolded yellowed letter in a woman's lap. The father's slanted brown-ink Persian script clearly visible on the first lines, the opening words "مریمِ من" (meaning "My Maryam") readable in elegant period Persian handwriting. The black chador in lower frame edge. Golden afternoon light from upper-left, warm shadows. Static camera. 85mm lens equivalent. Mood: arrival of the word. Style: Kiarostami detail. Photorealistic, 4K, 16:9, 8 seconds.

### NEGATIVE PROMPT
> watermark, English handwriting, printed text, modern font, garbled script, distortion of Persian letters

### راهنمای فارسی
> نمای نزدیک از نامه‌ی باز در دامن. خطِ پدر، اولین کلمات "مریمِ من" خوانده می‌شود.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Ideogram (still ref)** generates clearest Persian script if needed as base image.
- **Others**: standard.

---

## Shot 29 — Scene 5 / Shot A
**Scene**: CU Maryam reading the letter.
**Duration**: 12s

### PRIMARY VIDEO PROMPT
> Close-up, eye-level, of the face of a 65-year-old Iranian woman in a black chador, weathered olive skin, deep brown eyes, gray-streaked hair at temples reading a letter held in her hands below frame. Her eyes move slowly across the page. Her lips part very slightly, as if shaping the words silently. Golden afternoon light from upper-left. Cypress branch out of focus background. 85mm lens, shallow depth. Mood: listening to a voice through paper. Style: Kiarostami. Photorealistic, 4K, 16:9, 12 seconds.

### NEGATIVE PROMPT
> watermark, audible speaking, exaggerated emotion, tears, fast reading, head shaking

### راهنمای فارسی
> صورتِ مریم در حالِ خواندنِ نامه. چشم‌ها روی صفحه حرکت می‌کنند، لب‌ها به‌آرامی کلمات را شکل می‌دهند.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Kling**: face-enhance.
- **Others**: standard.

---

## Shot 30 — Scene 5 / Shot B (FLASH IMAGE)
**Scene**: ECU older man's hand on alley door, hesitating.
**Duration**: 3s

### PRIMARY VIDEO PROMPT
> A deliberately over-exposed, grainy, bleached high-contrast extreme close-up of an older man's weathered hand resting against a closed wooden Isfahan alley door. The hand hesitates, does not knock, then pulls slowly away. We do not see his face. Different film stock feel from the rest of the film — looks like archival 16mm. Disorienting light from upper-right (not upper-left). Static camera, 85mm lens. Mood: a memory not Maryam's. Style: archival flash, bleached. Photorealistic but with film-degradation overlay, 4K, 16:9, 3 seconds.

### NEGATIVE PROMPT
> watermark, clear face visible, modern hand, ring brands, sharp digital look, vibrant color

### راهنمای فارسی
> فلاش — دستِ مردِ مسن روی درِ چوبی. مردد. در نمی‌زند. عقب می‌کشد. حسِ آرشیویِ پرنور.

### Engine-Specific Tips
- **Hailuo**: in style settings, choose "Vintage" or "Film grain".
- **Kling 1.6**: post-process with grain overlay.
- **Pika**: Pika Effect "Film Grain" appropriate here.
- **Runway**: built-in film stock filter.
- **Luma**: emphasize "bleached, grainy, over-exposed, 16mm look".
- **Sora**: paste primary.
- **Wan 2.1**: motion bucket 8 + film-style LoRA if available.

---

## Shot 31 — Scene 5 / Shot C
**Scene**: CU Maryam, still, jaw moves once.
**Duration**: 8s

### PRIMARY VIDEO PROMPT
> Close-up, eye-level, of the face of a 65-year-old Iranian woman in a black chador, weathered olive skin, deep brown eyes, gray-streaked hair at temples. She is reading a letter (offscreen below). She is still. A single small muscle moves at her jaw — the only sign she has heard. Golden afternoon light from upper-left. 85mm lens, shallow depth. Mood: containment. Style: Kiarostami restraint. Photorealistic, 4K, 16:9, 8 seconds.

### NEGATIVE PROMPT
> watermark, tears, gasp, head turn, fast blink, exaggerated micro-expression

### راهنمای فارسی
> صورتِ مریم. ساکن. تنها یک حرکتِ ریزِ ماهیچه در فک.

### Engine-Specific Tips
- **Hailuo**: PRIMARY for micro-expression.
- **Others**: standard.

---

## Shot 32 — Scene 5 / Shot D (FLASH IMAGE)
**Scene**: Alley wall; veiled silhouette weeping behind window; man's hand falls.
**Duration**: 4s

### PRIMARY VIDEO PROMPT
> A deliberately over-exposed, grainy, bleached, high-contrast wide shot of a sand-colored adobe alley wall in late afternoon, Isfahan circa 1953. Behind a curtained window we see the silhouette of a veiled woman, shoulders shaking softly with weeping. At the right edge of frame, an older man's hand (we see only the hand and a sliver of dark sleeve) falls slowly to his side, defeated. Different film stock — feels like archival 16mm. Flat disoriented light. Static camera. 85mm lens. Mood: the moment of turning back. Style: archival flash, bleached, Iranian historical memory. Photorealistic with degradation overlay, 4K, 16:9, 4 seconds.

### NEGATIVE PROMPT
> watermark, clear face, modern clothes, sharp digital look, fast motion of silhouette, melodrama

### راهنمای فارسی
> فلاش — دیوارِ کوچه. سایه‌ی زنی پشتِ پرده‌ی پنجره گریه می‌کند. دستِ مرد رها می‌شود. حسِ آرشیوی، پرنور.

### Engine-Specific Tips
- Same as Shot 30. Apply film-grain effect.

---

## Shot 33 — Scene 5 / Shot E
**Scene**: CU Maryam reading second page.
**Duration**: 6s

### PRIMARY VIDEO PROMPT
> Close-up, eye-level, of the face of a 65-year-old Iranian woman in a black chador reading the second page of a letter. Her eyes move slowly. Still. Golden afternoon light upper-left. 85mm lens. Mood: holding what she has been given. Style: Kiarostami. Photorealistic, 4K, 16:9, 6 seconds.

### NEGATIVE PROMPT
> watermark, head movement, dramatic reaction, fast eyes

### راهنمای فارسی
> مریم صفحه‌ی دومِ نامه را می‌خواند. هنوز ساکن.

### Engine-Specific Tips
- Standard application across all engines.

---

## Shot 34 — Scene 5 / Shot F
**Scene**: ECU hands folding the letter along original creases.
**Duration**: 14s

### PRIMARY VIDEO PROMPT
> Extreme close-up, top-down 45-degree angle, of the aged olive-skinned hands of a 65-year-old Iranian woman in a black chador folding a yellowed letter slowly along its existing creases. The brown-ink Persian script on the paper, the worn folds where it has been folded many times before. The edge of the chador in lower frame. Stone bench background out of focus. Golden afternoon light from upper-left. Static camera, 85mm lens equivalent macro. Mood: the close of a vigil. Style: Kiarostami detail. Photorealistic, 4K, 16:9, 14 seconds.

### NEGATIVE PROMPT
> watermark, fast folding, crumpling, tearing, extra fingers, distortion of script

### راهنمای فارسی
> دستانِ مریم نامه را آرام در امتدادِ تاهای قدیمی‌اش تا می‌زنند.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Others**: standard.

---

## Shot 35 — Scene 5 / Shot G
**Scene**: MS Maryam stands, slips letter into chador, exits frame.
**Duration**: 12s

### PRIMARY VIDEO PROMPT
> A 65-year-old Iranian woman in a black chador rises slowly from a stone bench in an abandoned Safavid courtyard, Isfahan 1978. She slips a folded letter into the front fold of her chador, against her chest. She begins to walk slowly out of frame at left. Long shadow trailing behind her. Golden afternoon light from upper-left. Static camera, medium shot, eye-level. 50mm lens. Mood: carrying it home. Style: Iranian realism. Photorealistic, 4K, 16:9, 12 seconds.

### NEGATIVE PROMPT
> watermark, fast standing, fumbling, dropping the letter, exaggerated movement

### راهنمای فارسی
> مریم آرام بلند می‌شود، نامه را در چینِ چادر روی سینه می‌گذارد، از قاب بیرون می‌رود.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Others**: standard.

---

## Shot 36 — Scene 6 / Shot A
**Scene**: ELS dry riverbed at dusk; Khaju Bridge.
**Duration**: 15s

### PRIMARY VIDEO PROMPT
> Extreme long shot, slightly elevated, of the dry bed of the Zayandeh-Rud river in Isfahan at dusk, autumn 1978. Exposed grey-brown river stones stretching toward upper-left of frame. The silhouette of the Khaju Bridge with its multi-arched stone construction (the famous 17th-century bridge with two tiers of pointed arches) in deep middle background. A violet-blue dusk sky above. A few weeds in the riverbed. No water visible. No figures. Empty geography. Static camera, 35mm lens, deep depth of field. Color palette: violet-rose sky, grey stones, dark bridge silhouette. Mood: a city's river gone. Style: documentary landscape, Iranian elegy. Photorealistic, 4K, 16:9, 15 seconds, fine grain.

### NEGATIVE PROMPT
> watermark, water in riverbed, tourists, cars on bridge, modern lighting, neon, satellite dish

### راهنمای فارسی
> نمای فوق‌العاده باز از بسترِ خشکِ زاینده‌رود در غروبِ پاییز. پلِ خواجو در دور. آسمانِ بنفش-صورتی. خالی.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Kling**: excellent landscape rendering.
- **Sora**: paste primary; period landscapes are Sora's strength.
- **Others**: standard.

---

## Shot 37 — Scene 6 / Shot B
**Scene**: LS Maryam walking along dry channel edge.
**Duration**: 18s

### PRIMARY VIDEO PROMPT
> Long shot, eye-level, of a 65-year-old Iranian woman in a black chador walking along the edge of the dry channel of the Zayandeh-Rud river in Isfahan at dusk, 1978. The Khaju Bridge in middle distance. Footprints visible in the dust behind her. The dusk sky violet-rose. Static camera. 35mm lens. Mood: small against geography. Style: Kiarostami, Iranian realism. Photorealistic, 4K, 16:9, 18 seconds.

### NEGATIVE PROMPT
> watermark, fast walking, modern figures in background, contemporary clothing, vehicles

### راهنمای فارسی
> مریم در کنارِ کانالِ خشک راه می‌رود. ردپا در خاک. پل در فاصله. غروب.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Others**: standard.

---

## Shot 38 — Scene 6 / Shot C
**Scene**: MLS Maryam reaches Khaju Bridge parapet, stops.
**Duration**: 8s

### PRIMARY VIDEO PROMPT
> A 65-year-old Iranian woman in a black chador arrives at the worn stone parapet of the Khaju Bridge in Isfahan at dusk, 1978. The historic pointed-arch construction of the bridge visible. She stops. The dusk light catches the side of her face. Static camera, medium-long shot, eye-level. 50mm lens. Color palette: violet-rose, dark stone, black chador. Mood: arriving at a place that is also gone. Style: Iranian realism. Photorealistic, 4K, 16:9, 8 seconds.

### NEGATIVE PROMPT
> watermark, modern bridge railing, tourists, vehicles, lighting, signage

### راهنمای فارسی
> مریم به جانپناهِ پلِ خواجو می‌رسد، می‌ایستد. غروب.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Others**: standard.

---

## Shot 39 — Scene 6 / Shot D (SLOW PUSH-IN)
**Scene**: MS pushing in (6s) on Maryam at parapet.
**Duration**: 10s

### PRIMARY VIDEO PROMPT
> A medium shot pushing in slowly over 6 seconds to a closer medium shot, eye-level, of a 65-year-old Iranian woman in a black chador, weathered olive skin, deep brown eyes, gray-streaked hair at temples placing one weathered hand on the worn pale-grey stone parapet of the Khaju Bridge in Isfahan at dusk, 1978. She looks down at the dry channel below. The dusk violet-rose light catches the side of her face from upper-left. 50mm lens equivalent. Mood: the absence acknowledged. Style: Kiarostami, restrained push-in. Photorealistic, 4K, 16:9, 10 seconds. CAMERA MOTION: smooth slow push-in, motorized dolly feel.

### NEGATIVE PROMPT
> watermark, handheld shake, fast zoom, modern bridge details, plastic objects, neon

### راهنمای فارسی
> دوربین آرام به سمتِ مریم نزدیک می‌شود (پوش‌ـ‌این، ۶ ثانیه). دستش را روی سنگ می‌گذارد، به پایین نگاه می‌کند.

### Engine-Specific Tips
- **Runway Gen-4**: **PRIMARY**. Camera Control → Push In, slow speed.
- **Luma**: explicit push-in command.
- **Kling 1.6**: Camera Movement → Zoom In, slow.
- **Hailuo**: motion = "Slow Zoom In".
- **Pika**: limited; can approximate.
- **Sora**: paste primary.
- **Wan 2.1**: motion bucket 14 + push-in flag.

---

## Shot 40 — Scene 6 / Shot E
**Scene**: ECU hand on parapet, dry channel below.
**Duration**: 4s

### PRIMARY VIDEO PROMPT
> Extreme close-up, top-down 60-degree angle, of an aged olive-skinned hand of a 65-year-old Iranian woman resting flat on a worn pale-grey stone parapet of the Khaju Bridge. The dry rocky channel of the Zayandeh-Rud visible far below in soft focus. Dusk violet-rose light from upper-left. Static camera, 85mm lens macro. Mood: contact across what is missing. Style: Kiarostami detail. Photorealistic, 4K, 16:9, 4 seconds.

### NEGATIVE PROMPT
> watermark, modern jewelry, ring brands, plastic watch, distortion, fast motion

### راهنمای فارسی
> دستِ مریم روی سنگِ جانپناه. بسترِ خشکِ رودخانه در پایین.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Others**: standard.

---

## Shot 41 — Scene 6 / Shot F
**Scene**: MCU profile; "تو هم رفتی" whispered.
**Duration**: 6s

### PRIMARY VIDEO PROMPT
> Medium close-up, profile (side view from her left), of the face of a 65-year-old Iranian woman in a black chador, weathered olive skin, deep brown eyes, gray-streaked hair at temples. She is looking out and slightly down toward the dry riverbed. Her lips part barely in a whispered word. The dusk rose-violet light catches the bridge of her nose and the curve of her chador from upper-left. 85mm lens, shallow depth. Mood: speaking to what is gone. Style: Kiarostami profile work. Photorealistic, 4K, 16:9, 6 seconds.

### NEGATIVE PROMPT
> watermark, audible speaking, dramatic emotion, tears, head turn, glamour lighting

### راهنمای فارسی
> نیم‌رخِ مریم. در حالِ نجوای "تو هم رفتی". غروب از کنار.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Others**: standard.

---

## Shot 42 — Scene 6 / Shot G
**Scene**: LS Maryam walks away along riverbed; sky deepens to indigo.
**Duration**: 16s

### PRIMARY VIDEO PROMPT
> Long shot, slightly elevated, of a 65-year-old Iranian woman in a black chador walking away from camera along the edge of the dry Zayandeh-Rud riverbed in Isfahan, 1978. She becomes progressively smaller in the frame. The Khaju Bridge to one side. The dusk sky deepening from violet-rose to indigo over the duration of the shot. Static camera, 35mm lens, deep depth. Mood: the walk home. Style: Iranian realism, Kiarostami long shot. Photorealistic, 4K, 16:9, 16 seconds.

### NEGATIVE PROMPT
> watermark, sudden darkness, fast sky color change, modern background figures

### راهنمای فارسی
> مریم دور می‌شود. آسمان از بنفش به نیلی می‌رود. کوچک‌تر می‌شود.

### Engine-Specific Tips
- **Hailuo**: PRIMARY — handles sky-color transition well.
- **Luma**: sky-time-passage is its strength.
- **Others**: standard.

---

## Shot 43 — Scene 7 / Shot A
**Scene**: MS Maryam enters room, closes door, stands.
**Duration**: 10s

### PRIMARY VIDEO PROMPT
> A 65-year-old Iranian woman in a black chador enters her one-room Persian house at night, 1978. She closes a wooden door behind her with one hand. She stands a moment with her back to the door. The room is lit only by a single oil lamp on a table in mid-ground, casting warm low light. Static camera, medium shot, eye-level. 50mm lens. Color palette: warm amber lamp-glow, deep shadows, the black chador. Mood: return. Style: Vermeer interior, Iranian realism. Photorealistic, 4K, 16:9, 10 seconds.

### NEGATIVE PROMPT
> watermark, electric light, modern lamp, fluorescent, fast movement

### راهنمای فارسی
> مریم وارد اتاق می‌شود، در را می‌بندد، با پشت به در یک لحظه می‌ایستد. تنها چراغِ نفتی.

### Engine-Specific Tips
- **Hailuo**: PRIMARY — handles low light beautifully.
- **Others**: standard.

---

## Shot 44 — Scene 7 / Shot B
**Scene**: MS lighting stove, placing kettle on flame.
**Duration**: 12s

### PRIMARY VIDEO PROMPT
> A 65-year-old Iranian woman in a black chador at a small kerosene or wood stove in her one-room Persian house at night, 1978. She strikes a match, lights the stove, the flame catches. She places a copper kettle on the flame. Warm flame light joins the oil-lamp light. Static camera, medium shot, eye-level. 50mm lens. Mood: the ritual of return. Style: Iranian realism, Vermeer-like warm light. Photorealistic, 4K, 16:9, 12 seconds.

### NEGATIVE PROMPT
> watermark, gas stove, modern kitchen, electric kettle, lighter, fast match strike

### راهنمای فارسی
> مریم کبریت می‌کشد، اجاق را روشن می‌کند، کتری مسی را روی شعله می‌گذارد.

### Engine-Specific Tips
- **Hailuo**: PRIMARY — flame rendering strong.
- **Others**: standard.

---

## Shot 45 — Scene 7 / Shot C
**Scene**: MS reaching to high shelf, lifting down wooden box.
**Duration**: 10s

### PRIMARY VIDEO PROMPT
> A 65-year-old Iranian woman in a black chador reaches up to a high wooden shelf in her one-room Persian house at night, 1978, and lifts down carefully a small plain carved wooden box the size of two hands. She sets it on a low wooden table. Oil-lamp light from upper-left. Static camera, medium shot, eye-level. 50mm lens. Warm amber palette. Mood: bringing down a private archive. Style: Iranian realism. Photorealistic, 4K, 16:9, 10 seconds.

### NEGATIVE PROMPT
> watermark, modern shelf, plastic box, fast movement, dropping the box

### راهنمای فارسی
> مریم به طاقچه‌ی بلند دست می‌برد، جعبه‌ی چوبیِ کوچک را پایین می‌آورد، روی میز می‌گذارد.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Others**: standard.

---

## Shot 46 — Scene 7 / Shot D
**Scene**: ECU top-down on opened box contents.
**Duration**: 8s

### PRIMARY VIDEO PROMPT
> Extreme close-up, top-down 45-degree angle, of an opened plain carved wooden box on a wooden table. Inside the box: three folded yellowed letters stacked neatly, a faded sepia photograph turned face-down on top, a single pressed dry rose, a thin worn copper bangle. Oil-lamp light from upper-left, warm shadows pooling inside the box. Static camera. 85mm lens equivalent macro. Color palette: amber lamp-warmth, yellowed paper, dried rose petal beige, copper glint. Mood: the archive of a life. Style: still-life, Persian intimate detail. Photorealistic, 4K, 16:9, 8 seconds.

### NEGATIVE PROMPT
> watermark, modern photographs, glossy paper, plastic flower, multiple bangles, jewelry, color photo

### راهنمای فارسی
> نمای نزدیکِ بالای جعبه‌ی باز. سه نامه‌ی زرد، عکسِ سپیای وارونه، یک گلِ پرس‌شده، یک النگوی نازکِ مسی.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Ideogram (still ref)** for the base if generating reference.
- **Others**: standard.

---

## Shot 47 — Scene 7 / Shot E
**Scene**: ECU hands placing new letter on top of three older.
**Duration**: 12s

### PRIMARY VIDEO PROMPT
> Extreme close-up, top-down 45-degree angle, of the aged olive-skinned hands of a 65-year-old Iranian woman taking a new folded letter (in lighter, less yellowed paper) from inside her black chador's front fold, refolding it once carefully, and placing it on top of three older folded yellowed letters inside an open wooden box. Oil-lamp warm light from upper-left. Static camera. 85mm lens macro. Mood: completion. Style: Iranian intimate detail. Photorealistic, 4K, 16:9, 12 seconds.

### NEGATIVE PROMPT
> watermark, fast hands, dropping letter, extra fingers, distortion

### راهنمای فارسی
> دستانِ مریم نامه‌ی جدید را از چینِ چادر بیرون می‌آورند، یک بار تا می‌زنند، روی سه نامه‌ی قدیم می‌گذارند.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Others**: standard.

---

## Shot 48 — Scene 7 / Shot F (BRASS CLASP CLICK)
**Scene**: ECU hand on closed box; brass clasp fastens.
**Duration**: 10s

### PRIMARY VIDEO PROMPT
> Extreme close-up, top-down 45-degree angle, of an aged olive-skinned hand of a 65-year-old Iranian woman resting on the closed lid of a plain carved wooden box. After a long beat, her thumb and forefinger reach for a small brass clasp at the front of the box. With a single deliberate motion, the clasp is fastened. The hand rests again on the closed box. Oil-lamp warm light from upper-left. Static camera. 85mm lens macro. Mood: the closing — the most important physical action of the film. Style: Iranian detail. Photorealistic, 4K, 16:9, 10 seconds.

### NEGATIVE PROMPT
> watermark, fast motion, multiple clasp attempts, modern hardware, distortion

### راهنمای فارسی
> دستِ مریم روی جعبه‌ی بسته. یک مکثِ بلند. سپس قفلِ برنجی را می‌بندد. دست دوباره روی جعبه آرام می‌گیرد.

### Engine-Specific Tips
- **Hailuo**: PRIMARY. Most important shot of the scene for clarity.
- **Others**: standard. In post-production, the foleyed clasp-click is mixed at -8dB peak (see FILE 6).

---

## Shot 49 — Scene 7 / Shot G
**Scene**: MS Maryam at window, empty chair beside her, kettle whispers.
**Duration**: 18s

### PRIMARY VIDEO PROMPT
> Medium shot, eye-level, of a 65-year-old Iranian woman in a black chador sitting in a wooden chair at a window in her one-room Persian house at night, 1978. Beside her, a second identical wooden chair sits empty. A glass of tea cools on the windowsill. Amber oil-lamp light from upper-left, deep blue night beyond the window. Static camera. 50mm lens. Color palette: warm amber lamp interior, cool blue night exterior — the chromatic contrast is the meaning. Mood: the rest after the closing. Style: Vermeer-Persian. Photorealistic, 4K, 16:9, 18 seconds.

### NEGATIVE PROMPT
> watermark, ghost in second chair, second person, modern window, curtains motion exaggerated

### راهنمای فارسی
> مریم در صندلیِ کنارِ پنجره. صندلیِ دوم خالی. چایی روی لبه‌ی پنجره. شبِ آبی بیرون، کهربای فانوس درون.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Kling**: works at 18s.
- **Others**: standard.

---

## Shot 50 — Scene 8 / Shot A
**Scene**: MS Maryam at window; amber turns to deep blue.
**Duration**: 30s

### PRIMARY VIDEO PROMPT
> Medium shot, eye-level, of a 65-year-old Iranian woman in a black chador, weathered olive skin, deep brown eyes, gray-streaked hair at temples sitting at a window of her one-room Persian house, 1978. A glass of tea cools on the windowsill beside her hand. The light in the room transitions over the 30-second shot from amber late-afternoon glow to deep blue dusk. The light arrives from upper-left and slowly fades. She does not move. Static camera. 50mm lens. Mood: stillness at the end of the day, the slow descent of evening. Style: Vermeer, Iranian slow cinema. Photorealistic, 4K, 16:9, 30 seconds.

### NEGATIVE PROMPT
> watermark, sudden light change, fast time-lapse jitter, head movement, blinking exaggerated

### راهنمای فارسی
> مریم پشت پنجره. نور در طولِ سی ثانیه از کهربایی به آبیِ عمیق تغییر می‌کند. او حرکت نمی‌کند.

### Engine-Specific Tips
- **Kling 1.6**: PRIMARY — best for long-duration light-shift shots; up to 10s × 3 segments stitched.
- **Hailuo**: split into 15s + 15s and stitch.
- **Luma**: time-of-day shift is a strength.
- **Pika**: split into 10s × 3.
- **Runway**: 10s — animate transition in three takes.
- **Sora**: paste primary; Sora handles long time-of-day well.
- **Wan 2.1**: motion bucket 10 + duration extension.

---

## Shot 51 — Scene 8 / Shot B
**Scene**: CU face; light leaving, shadow climbing from chin.
**Duration**: 24s

### PRIMARY VIDEO PROMPT
> Close-up, eye-level, of the face of a 65-year-old Iranian woman in a black chador, weathered olive skin, deep brown eyes, gray-streaked hair at temples. Over 24 seconds, the light leaves her face very slowly — a shadow climbs from her chin upward, until at the end only her eyes are still lit. Light source upper-left, the only motivated source — like sunset through a window beside her. She does not move. 85mm lens, shallow depth. Mood: the day's last light. Style: chiaroscuro, Caravaggio-Persian. Photorealistic, 4K, 16:9, 24 seconds.

### NEGATIVE PROMPT
> watermark, head turn, blinking, fast shadow movement, exaggerated chiaroscuro

### راهنمای فارسی
> نمای نزدیکِ صورتِ مریم. سایه آرام از چانه به بالا می‌رود، تا فقط چشم‌ها در نور بمانند.

### Engine-Specific Tips
- **Kling 1.6**: PRIMARY for slow-light shifts.
- **Luma**: works well.
- **Others**: split into segments and stitch.

---

## Shot 52 — Scene 8 / Shot C
**Scene**: ECU only the eyes lit, then eyes too pass to shadow.
**Duration**: 12s

### PRIMARY VIDEO PROMPT
> Extreme close-up, eye-level, of only the eyes of a 65-year-old Iranian woman lit, the rest of the face in deep shadow. Over 12 seconds, the light leaves the eyes too — slowly — until they pass into shadow. Static camera. 85mm lens macro. Mood: the day's last light. Style: extreme chiaroscuro. Photorealistic, 4K, 16:9, 12 seconds.

### NEGATIVE PROMPT
> watermark, blinking, head movement, fast light change, glassy stare, plastic skin

### راهنمای فارسی
> نمای فوق‌العاده نزدیک — فقط چشم‌ها در نور. سپس آنها هم به تاریکی می‌روند.

### Engine-Specific Tips
- **Hailuo**: PRIMARY for restrained micro-motion.
- **Luma**: subtle shadow-shift strong.
- **Others**: standard.

---

## Shot 53 — Scene 8 / Shot D
**Scene**: Wide same as SC 1 Shot A; empty room, dawn arriving.
**Duration**: 25s

### PRIMARY VIDEO PROMPT
> Wide static shot, identical framing to the film's opening shot: a small whitewashed Persian bedroom in Isfahan, 1978. The narrow wooden bed in the lower-left, empty and made. Two wooden chairs in mid-ground, both empty. On the seat of one of the chairs, a small worn leather-bound book of Hafez poetry, closed. A black chador hanging on a hook on the wooden door at right. A thin white curtain at the upper-right window moving slowly. Over the 25-second duration, the light at the window transitions from pre-dawn blue to morning amber. Static camera, 35mm lens, eye-level. Mood: presence in absence, the final image. Style: Kiarostami, Vermeer, Iranian slow cinema. Photorealistic, 4K, 16:9, 25 seconds.

### NEGATIVE PROMPT
> watermark, person in room, ghost, fast time-lapse, dramatic light change, modern décor

### راهنمای فارسی
> همان نمای بازِ شات یک. اتاق خالی. دو صندلیِ خالی. کتابِ حافظ روی یکی از صندلی‌ها. چادر روی چوب‌رخت. پرده آرام تکان می‌خورد. نور در ۲۵ ثانیه از آبیِ سپیده به کهربای صبح می‌رود.

### Engine-Specific Tips
- **Kling 1.6**: PRIMARY for the long time-of-day shift.
- **Sora (via Bing)**: excellent for this final image.
- **Hailuo**: split into 12.5s × 2.
- **Luma**: handles time-shift beautifully.
- **Others**: split.

---

## Shot 54 — Scene 8 / Shot E
**Scene**: ECU top-down on closed Hafez book on chair.
**Duration**: 6s

### PRIMARY VIDEO PROMPT
> Extreme close-up, top-down view, of a small closed worn leather-bound Hafez book of poetry resting on the seat of a simple wooden chair in a Persian bedroom. Soft warm dawn amber light from upper-left. Static camera. 85mm lens macro. Mood: the elixir brought back from the journey. Style: Iranian intimate detail. Photorealistic, 4K, 16:9, 6 seconds.

### NEGATIVE PROMPT
> watermark, modern book, glossy cover, English title, multiple books, distortion

### راهنمای فارسی
> نمای نزدیک از کتابِ حافظِ بسته روی نشیمنگاه صندلی. نورِ کهربای صبح.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Others**: standard.

---

## Shot 55 — Scene 8 / Shot F
**Scene**: Wide return; full amber dawn; final silence.
**Duration**: 10s

### PRIMARY VIDEO PROMPT
> Return to the wide static framing of Shot 53. The light has now fully arrived as warm amber dawn through the upper-right window. The empty whitewashed Persian bedroom — empty bed lower-left, two empty chairs mid-ground, Hafez book on one chair, black chador on the door hook, curtain moving slowly. The room is at peace. Static camera. 35mm lens, eye-level. Mood: the new day. Style: Kiarostami, Vermeer. Photorealistic, 4K, 16:9, 10 seconds.

### NEGATIVE PROMPT
> watermark, person in room, sudden light change, fast curtain movement, modern objects

### راهنمای فارسی
> بازگشت به نمای باز. نورِ کاملاً کهربایی. اتاقِ خالی در صلح. روزِ نو.

### Engine-Specific Tips
- **Hailuo**: PRIMARY.
- **Others**: standard.

---

## Shot 56 — Scene 8 / Shot G
**Scene**: Title card fade.
**Duration**: 8s

### PRIMARY VIDEO PROMPT
> A pure black screen. Persian calligraphy in elegant traditional Nastaliq script appears slowly center-frame: "پرده‌ی آخر". Beneath it, smaller English text appears: "The Final Curtain". A single fine horizontal line separates them. Minimal, dignified, festival-quality typography. The text holds for 5 seconds, then begins to fade. Static, 4K, 16:9, 8 seconds total.

### NEGATIVE PROMPT
> watermark, decorative borders, color, glitter, fast animation, modern font, English first

### راهنمای فارسی
> کارتِ عنوان. زمینه‌ی سیاه. خوشنویسیِ نستعلیقِ "پرده‌ی آخر" در مرکز. زیرِ آن انگلیسیِ کوچک‌تر. ساده، با وقار.

### Engine-Specific Tips
- **Ideogram**: PRIMARY for accurate Persian typography.
- **Sora (via Bing)**: handles title cards well.
- **Others**: most video engines mangle text; better to generate a static title image in Ideogram or Bing Image Creator and animate the fade in a video editor (DaVinci Resolve free tier).

---

# Key Frame Still-Image Prompt Set

For the 6 most pivotal moments — generate as **portrait-orientation stills** (1080×1920 or 1440×1920) in Bing Image Creator / Leonardo / Flux Schnell on HuggingFace for use as reference art, posters, marketing stills.

---

## Key Frame 1 — Maryam at dawn (SC 1, derived from Shot 02)

> Portrait orientation 9:16, photorealistic. A 65-year-old Iranian woman in a black chador, weathered olive skin, deep brown eyes, gray-streaked hair at temples, sitting on the edge of a narrow wooden bed in a whitewashed Persian bedroom at pre-dawn, examining her own hands held palm-up in her lap. Cool blue-grey light from upper-left through wooden shutter slats. One warm copper samovar accent in background. Style: Vermeer interior with Persian texture, Kiarostami restraint. 4K, fine grain, no text, no watermark.
> **Seed**: 42001

---

## Key Frame 2 — Maryam in the bazaar (SC 3, derived from Shot 15)

> Portrait 9:16. The vaulted brick interior of the grand bazaar of Isfahan, 1978. Shafts of sunlight descending from circular oculi in the high ceiling, dust hanging visibly. A 65-year-old Iranian woman in a black chador walking toward camera through the corridor, very small. Stalls of merchants suggested left and right. Warm brick palette, golden dust-shafts, deep shade. Style: documentary realism, Iranian neorealism. 4K, fine grain, no text, no watermark.
> **Seed**: 42002

---

## Key Frame 3 — The discovery (SC 4, derived from Shot 26)

> Portrait 9:16. Hands of a 65-year-old Iranian woman with weathered olive skin lifting a smooth grey river-stone off a folded yellowed letter on a stone bench in an abandoned Safavid courtyard, Isfahan 1978. A worn leather-bound Hafez book beside. Golden late-afternoon light from upper-left. Cypress branch out of focus background. Persian script faintly visible on the letter. Style: Kiarostami detail, Iranian art-cinema. 4K, fine grain, no text, no watermark.
> **Seed**: 42003

---

## Key Frame 4 — The reading (SC 5, derived from Shot 29 + 32)

> Portrait 9:16. Close-up of the face of a 65-year-old Iranian woman in a black chador reading a letter below frame, her eyes moving slowly, lips parted very slightly. Golden afternoon light from upper-left, deep shadow on right side of face. The earned close-up. Cypress branch out of focus behind. Style: Kiarostami, the held face. 4K, fine grain, no text, no watermark.
> **Seed**: 42004

---

## Key Frame 5 — The river (SC 6, derived from Shot 36 + 39)

> Portrait 9:16. A 65-year-old Iranian woman in a black chador standing at the worn stone parapet of the Khaju Bridge in Isfahan at dusk, 1978, one hand on the stone, looking down at the dry riverbed below. The pointed-arch bridge construction behind her. Violet-rose dusk sky. Empty geography. Style: Iranian elegy, documentary landscape. 4K, fine grain, no text, no watermark.
> **Seed**: 42005

---

## Key Frame 6 — The final image (SC 8, derived from Shot 53)

> Portrait 9:16. A small whitewashed Persian bedroom in Isfahan, 1978. A narrow wooden bed lower-left, empty and made. Two wooden chairs in mid-ground, both empty. A worn closed Hafez book resting on the seat of one of the chairs. A black chador hanging on a wooden hook on a door at right. A thin white curtain at the upper-right window moving slowly. Warm amber dawn light from upper-left. The final image of the film. Style: Vermeer, Kiarostami. 4K, fine grain, no text, no watermark.
> **Seed**: 42006

---

# End of FILE 9

**56 video prompts + 6 key-frame still prompts.** Generate in batches according to the engine you choose. For free-tier work, prioritize Hailuo for static shots, Runway Gen-4 / Luma for the three motion shots (Shots 9, 26, 39), Kling for the long-duration time-of-day shifts (Shots 50, 51, 53), and Ideogram for the title card and any panel requiring Persian script.

The film is ready to render.
