# Persian Cheetah · AI Video Prompts (per shot)
## یوز ایرانی · پرامپت ویدئو برای هر نما

> **Most important deliverable.** Per-shot prompts for free AI-video generators.
> **Reference script:** `output/senaario/Persian-Cheetah/06-filmnaameh.md`.
> **Project rule:** AI video defaults to African-savanna prior. Every prompt must override that prior with **location anchor first**, then **substrate**, then **animal anatomy**, then **negative prompt**.
> **Workflow:** when text-to-video drifts (it will for the cheetah shots), fall back to **image-to-video**: generate a key-frame still on Flux Schnell / Ideogram / Bing-DALL·E, then animate on Kling / Runway / Luma using motion prompts only.

---

## GLOBAL ANCHORS (paste at top of every cheetah-containing prompt)

**Location anchor** *(always lead with this):*
> `Central Iranian Plateau, Touran Biosphere Reserve, Semnan Province, Iran. Semi-arid steppe at 1500m elevation. Pale gravel and sand substrate, scattered ankle-high Artemisia and Stipa tussocks, dark basalt outcrops, snow-dusted Alborz/Kopet Dag ridges in far distance. Sparse Haloxylon and tamarisk only — no acacia, no baobab, no tropical trees.`

**Animal anatomy** *(when a cheetah is in frame):*
> `Asiatic cheetah (Acinonyx jubatus venaticus): paler sandy coat (not orange), slightly smaller and leaner than African cheetah, longer-legged proportionally, thicker neck ruff for cold desert nights, prominent black tear-stripes from inner eye to mouth corner.`

**Global negative prompt** *(append to every cheetah prompt):*
> `--no African savannah, savanna, Serengeti, Maasai Mara, tall grass, golden grass, waving grass, acacia tree, umbrella tree, baobab, palm tree, jungle, rainforest, green grassland, zebra, lion, lioness, elephant, giraffe, wildebeest, hyena, safari jeep, tourist, watermark, text overlay, low resolution, motion blur excess, oversaturated colors, cartoon, 3D render, illustration, painting style`

**Engine quick-reference:**
| Engine | Best for | Free-tier |
|---|---|---|
| **Hailuo (MiniMax)** | Cinematic motion, realistic; **best for cheetah motion** | daily credits |
| **Kling** | Long clips, photoreal; **best for landscape drone** | trial generations |
| **Runway Gen-3 Alpha** | High-quality cinematic; **best for slow-mo + lens work** | trial credits |
| **Luma Dream Machine** | Real-world physics, dawn/dusk light | free daily |
| **Pika** | Quick iteration, style variety | free tier |
| **Sora (via Bing Video Creator)** | High quality when available; **best for archival recreations** | limited |
| **Wan 2.1** | Self-host, fully free for cheetah re-generations | open-source |
| **Pixverse** | Stylized, anime; useful for the Sassanid miniature animation only | free tier |

---

# SECTION 1 — HOOK

## SHOT 1.01 · African cheetah sprint (the misdirection)

| Field | Spec |
|---|---|
| Scene | 01 · 0:00–0:08 · 8 sec |
| Camera position | Low-angle ground level, ~30cm AGL, slight side-tracking |
| Angle | Eye-level of running cat |
| Height | 0.3 m |
| Lens | 24mm wide, deep DoF f/8 |
| Movement | **Lateral tracking left-to-right**, matched to cat's velocity (~60 km/h equivalent on plate) |
| Light | **Warm golden-hour direct sun camera-back-left**, long shadows raking right |
| Palette | Saturated gold #d9b34a, ochre #b78a3a, dust amber #c89858 |
| Texture | Tall waving golden grass, fine red dust kicked up, dry acacia silhouette in BG-left |
| Subject blocking | African cheetah at full sprint, all four feet off ground at apex, gazelle in upper-right third bolting forward, dust trail |
| Must be visible | Dust, gazelle in frame, tall gold grass, savanna horizon |
| Must NOT be visible | Iranian plateau elements, basalt, Artemisia — this is the WRONG cheetah on purpose |
| Engine | **Runway Gen-3 Alpha** (handles motion blur and grass-with-dust best) or **Hailuo** (cleaner physics) |
| Continuity to next shot | Cat exits frame right, dust lingers — Hard cut to 1.02 |

**ENGLISH PROMPT:**
> *African cheetah at full sprint across Maasai Mara golden savanna at golden hour, low-angle lateral tracking shot 30cm above ground, 24mm wide lens deep depth-of-field, all four feet briefly off ground, fine red dust kicked up behind paws, single gazelle bolting forward in upper-right third of frame, distant acacia trees silhouetted against gold horizon, tall waving golden grass in foreground and midground, warm directional golden sunlight from back-left casting long raking shadows, hyper-realistic wildlife documentary cinematography, BBC Planet Earth style, 16:9, 8 seconds.*
> `--no` *Iranian plateau, basalt, Artemisia, snow mountains, watermark, text*

**فارسی (راهنما):** یوز آفریقایی در دویدنِ سینه‌کش روی علفزار طلاییِ ماسایی‌مارا در ساعت طلایی؛ این تنها نمای فیلم است که عمداً «اشتباه» است؛ ۸ ثانیه.

---

## SHOT 1.02 · Sprint slow-motion + turn to camera

| Field | Spec |
|---|---|
| Scene | 02 · 0:08–0:18 · 10 sec |
| Camera position | Same lateral track, decelerates |
| Angle | Eye-level transitioning to 3/4 toward camera |
| Lens | 85mm long-lens (compression on the slow-mo) |
| Movement | **Slow motion ramp** (250 fps → real-time at end) + camera holds, subject decelerates |
| Light | Golden-hour, same as 1.01, holds |
| Palette | Gold + warm amber + cheetah cinnamon coat |
| Texture | Cat fur in detail, dust particles suspended |
| Subject blocking | Cheetah's run slows, head pivots to camera, eyes catch lens at ~7s mark, freeze final beat |
| Must be visible | Eye contact at end, dust slow-mo suspension |
| Must NOT be visible | African background detail (defocused) |
| Engine | **Runway Gen-3** (best slow-mo) · fallback Kling |
| Continuity | The eye-contact beat is the audience's hook. Match cut to Iranian plateau on the next cut. |

**ENGLISH PROMPT:**
> *African cheetah running across golden savanna, decelerating from full sprint into slow motion, slow-motion ramp from 250fps to real-time over 7 seconds, 85mm long lens compression, shallow depth-of-field, defocused gold savanna background, cat turns head three-quarter toward camera, eyes meet lens in final two seconds, suspended dust particles around paws, hyperrealistic fur detail, golden-hour back-light, BBC Planet Earth cinematography, 16:9, 10 seconds.*
> `--no` *Iranian plateau, basalt, snow mountains, watermark, motion-blur excess, cartoon*

**فارسی:** آهسته‌سازی دویدنِ یوز آفریقایی؛ چرخش سر به دوربین در ثانیه‌ی ۷؛ ۱۰ ثانیه. لنز ۸۵mm، کاهش سرعت ۲۵۰ به ۲۴ فریم.

---

## SHOT 1.03 · Hard cut to Iranian plateau (no cat)

| Field | Spec |
|---|---|
| Scene | 03 · 0:18–0:30 · 12 sec |
| Camera position | Low aerial drone, ~8m AGL |
| Angle | Slight downward 5° |
| Lens | 24mm wide drone, deep DoF |
| Movement | **Drone slow forward glide ~2 m/s**, parallel to ground |
| Light | **Pre-sunrise blue dawn**, back-right horizon glow only, cold ambient |
| Palette | Bone-white #e6dcc8, dust-blue #8da3b8, charcoal basalt #2e2924, single horizon gold seam #c87a3a |
| Texture | Pale gravel, scattered Artemisia tussocks ankle-high, dark basalt outcrops, snow-dusted distant ridges |
| Subject blocking | **NO CHEETAH** — the landscape is the subject |
| Must be visible | Snow-dusted mountains on horizon, pale gravel substrate, sparse Artemisia |
| Must NOT be visible | Any animal, any vehicle, any human, any tree larger than knee-high |
| Engine | **Kling** (best for landscape drone) or **Luma** |
| Continuity | Hard cut from 1.02 — match-on-action: the cat's eyes were the last thing; now the eyes are gone, the ground is left. |

**ENGLISH PROMPT:**
> *Aerial drone shot at 8 meters above ground, low and slow forward glide at 2 meters per second, 24mm wide-angle lens deep depth of field, over Touran Biosphere Reserve in central Iran at pre-sunrise blue hour, pale sand and gravel substrate with scattered ankle-high Artemisia and Stipa tussocks, dark basalt outcrops in foreground and midground, snow-dusted Alborz mountain ridge on far horizon, single thin band of orange dawn glow at back-right horizon, cold blue ambient light overall, no animals, no people, no trees taller than knee-high, hyperrealistic landscape cinematography, BBC Planet Earth style, 16:9, 12 seconds.*
> `--no` *African savannah, acacia, baobab, tall grass, zebra, lion, elephant, jungle, green grassland, watermark, text, cartoon, oversaturated*

**فارسی:** نمای هوایی پهپاد در ارتفاع ۸ متر بر فراز ذخیره‌گاه توران در سپیده‌دمِ آبی؛ سوبسترای سنگ‌ریزه‌ی روشن، بوته‌های آرتمیزیا، صخره‌های بازالت، رشته‌کوه برف‌گرفته در دور؛ ۱۲ ثانیه. هیچ حیوانی در کادر نیست.

---

## SHOT 1.04 · Asiatic cheetah portrait on basalt

| Field | Spec |
|---|---|
| Scene | 04 · 0:30–0:42 · 12 sec **STILL** |
| Camera position | Eye-level of cat, ~1 m |
| Angle | Level, rule-of-thirds right |
| Lens | 85mm portrait equiv, shallow DoF |
| Movement | **STATIC** — this is a still photograph held |
| Light | **Hard white midday raking from camera-left**, sharp shadow |
| Palette | Sand pale, basalt charcoal, pale cinnamon coat, eye amber |
| Texture | Rough basalt rock, sand fur detail, tear-stripe definition |
| Subject blocking | Single lean Asiatic cheetah standing on basalt outcrop, body in profile, head turned slightly to look off-frame right |
| Must be visible | Tear-stripes, paler coat, longer-legged proportion, basalt under paws, snow ridge in defocused BG |
| Must NOT be visible | African elements, orange savanna coat, acacia |
| Engine | **Flux Schnell / Ideogram for the keyframe** (still image) — no animation needed |
| Continuity | Held still. The eye-contact beat from 1.02 is now repaid in stillness here. |

**ENGLISH PROMPT (image-only, for Flux/Ideogram/Bing-DALL·E):**
> *Photograph: single Asiatic cheetah (Acinonyx jubatus venaticus) standing in profile on a dark basalt outcrop in the central Iranian plateau, head turned slightly to look off-frame right, paler sandy coat (not orange), leaner and longer-legged than African cheetah, thicker neck ruff, prominent black tear-stripes from inner eyes to mouth corners, hard white midday sun raking from camera-left creating sharp shadow on the right side of body, snow-dusted Alborz mountain ridge defocused in far background, sparse Artemisia tussocks at edge of frame, 85mm lens shallow depth of field, hyperrealistic wildlife photography, National Geographic editorial quality, 16:9.*
> `--no` *African savanna, golden grass, acacia, baobab, orange fur, savannah, zebra, lion, tourist, jeep, watermark*

**فارسی:** تک‌نمای یوز ایرانی روی صخره‌ی بازالت، در پروفایل، سر کمی به راست؛ پوست شنی روشن، رگه‌های اشک نمایان؛ نور سختِ ظهر از چپ کادر؛ کوهستان برف‌گرفته در عمق دور؛ تصویر ثابت ۱۲ ثانیه.

---

## SHOTS 1.05 / 1.06 / 1.07 · Title cards + second portrait

| Field | Spec |
|---|---|
| Scenes | 05 (0:42–0:48), 06 (0:48–0:54), 07 (0:54–1:00) |
| Format | Two title cards (Ideogram for text-in-image quality) + one still portrait (head-turned-away) |
| Engine | **Ideogram** for the title cards; **Flux** for the second portrait |

**Title card 05:** *White serif text on pure black background: "یوز ایرانی" in Persian (top, 60pt) and beneath "The Asiatic Cheetah" in English (40pt). Generous margin. Held 6 seconds.*

**Title card 06:** *White serif text on pure black background: "Fewer than 30 remain." Single line, centered, 40pt. Held 6 seconds.*

**Portrait 07:** *Photograph: same Asiatic cheetah from 1.04, head turned fully away from camera, only the back of skull and ear visible in profile, same hard-white midday light, basalt and pale sand setting, snow-dusted ridge defocused in background, 85mm shallow DoF, hyperrealistic, 16:9.*

---

# SECTION 2 — WHAT MAKES THEM DIFFERENT

## SHOT 2.01 · Split-screen comparison (African / Asiatic)

| Field | Spec |
|---|---|
| Scene | 08 · 1:00–1:18 · 18 sec |
| Camera | Two matched static cameras, 50mm equiv each |
| Movement | **STATIC both panels**; cut to right-panel-only at 1:14 |
| Light | Left = warm gold soft; Right = cool hard white |
| Engine | **Generate two separate plates (Flux/Kling)** then composite in editor. Do not try one-shot split. |
| Continuity | The right panel takes over alone in the final 4 seconds |

**LEFT PLATE PROMPT (African):**
> *Medium shot, African cheetah trotting (not sprinting) past mature acacia tree, golden-hour soft warm light, tall waving golden grass at ankle and knee height, dust haze, 50mm lens, savanna horizon, hyperrealistic wildlife footage, 16:9, 18 seconds, slow steady motion.*

**RIGHT PLATE PROMPT (Asiatic):**
> *Medium shot, Asiatic cheetah trotting across pale gravel and Artemisia steppe in central Iran, cool hard white midday raking from camera-left, sparse ankle-high vegetation, dark basalt outcrops, snow-dusted Alborz ridge in distance, paler sandy coat (not orange), leaner build, longer legs proportionally, thicker neck ruff, prominent black tear-stripes, 50mm lens, hyperrealistic wildlife footage, 16:9, 18 seconds, slow steady motion.*
> `--no` *African savanna, acacia, golden grass*

---

## SHOTS 2.02 · Range map (Arabia → India) · 12 sec

Animated graphic. Render in After Effects / Figma — not AI video. Specs: historical range polygon in pale ochre over neutral satellite-style basemap, slow reveal across 12 sec, no narration competition. Engine: not applicable.

## SHOT 2.03 · Range map retract (India 1947 collapse to central Iran) · 12 sec

Same medium. Range polygon retracts; "1947" caption fades in over India then fades out; final state = small irregular patch in central Iran. Hold 4 sec on final state.

## SHOT 2.04 · Male Yuz walks past lens (camera-trap, IR) · 8 sec

**SOURCE FOOTAGE PREFERRED — license from ICS.** AI-generated camera-trap is the *fallback*.

**FALLBACK PROMPT (Hailuo):**
> *Infrared night camera-trap footage, static fixed framing, grainy black-and-white-green tint, slight vignette, single Asiatic cheetah walks left-to-right across pale gravel in central Iranian reserve, bright reflective eyeshine, ankle-high Artemisia tussocks barely visible at frame edges, ground-level wide framing approximately 35mm equivalent, no motion blur, 16:9, 8 seconds, hyperrealistic camera-trap aesthetic with authentic IR grain.*
> `--no` *African savanna, color daylight, smooth motion, cinematic dolly, watermark*

---

# SECTION 3 — WHERE THEY LIVE

## SHOT 3.01 · Touran wide drone

| Field | Spec |
|---|---|
| Scene | 12 · 1:50–2:05 · 15 sec |
| Camera | Drone, 10m AGL |
| Lens | 28mm wide, deep DoF |
| Movement | **Drone forward glide 2 m/s**, parallel to ground, slight downward 10° |
| Light | Low golden sun camera-left, long shadows raking right |
| Engine | **Kling** (best landscape drone) |

**PROMPT:**
> *Aerial drone shot at 10 meters above ground, slow steady forward glide at 2 meters per second, 28mm wide-angle lens deep depth of field, slight downward angle 10 degrees, over Touran Biosphere Reserve in central Iran at golden hour with low sun from camera-left, long raking shadows extending to camera-right, pale gravel substrate with scattered ankle-high Artemisia and Stipa tussocks receding toward horizon, dark basalt outcrops scattered, dusty-blue snow-dusted Alborz mountain ridge on far horizon, hyperrealistic landscape cinematography, BBC Planet Earth style, 16:9, 15 seconds.*
> `--no` *African savanna, acacia, baobab, tall grass, zebra, lion, jungle, green pasture, watermark, text*

## SHOT 3.02 · Miandasht dawn + jebeer gazelle

| Field | Spec |
|---|---|
| Scene | 13 · 2:05–2:18 · 13 sec |
| Lens | 28mm drone |
| Movement | Drone hovering, slight pan-left |
| Light | Dawn — soft golden side-light |
| Engine | **Kling** + image-to-video fallback |

**PROMPT:**
> *Drone hover over Miandasht Wildlife Refuge in northeast Iran at dawn, 28mm wide-angle lens, slight pan left over 13 seconds, small herd of jebeer gazelle (Gazella bennettii — small slender gazelle with short straight horns, sandy coat) trotting in distant midground at frame-right, foreground pale gravel and Artemisia, dusty-blue mountains on far horizon, soft golden side-light from camera-right, hyperrealistic wildlife documentary, 16:9, 13 seconds.*
> `--no` *African gazelle species, Thomson gazelle, wildebeest, savanna, acacia*

## SHOT 3.03 · Naybandan basalt low ground

| Field | Spec |
|---|---|
| Scene | 14 · 2:18–2:30 · 12 sec |
| Lens | 35mm low ground-level |
| Movement | Slow lateral tracking left |
| Light | Hard midday, no shadow softness |

**PROMPT:**
> *Low ground-level shot at 30cm AGL, 35mm lens, slow lateral tracking left at 0.5 m/s, across the dark basalt rock field of Naybandan Wildlife Refuge in south Khorasan Iran, no vegetation, no animals, no people, hard white midday light overhead, sharp shadows under rocks, distant pale mountain ridge on horizon, hyperrealistic landscape, 16:9, 12 seconds.*
> `--no` *African landscape, vegetation, water, animal, watermark*

## SHOT 3.04 · Kavir salt flats

| Field | Spec |
|---|---|
| Scene | 15 · 2:30–2:42 · 12 sec |
| Lens | 24mm wide static |
| Movement | **STATIC**, faint heat shimmer in air |

**PROMPT:**
> *Static wide shot 24mm lens, Kavir salt flats in central Iran at midday, pale crusted salt substrate stretching to horizon, visible heat shimmer rising from ground, single low Haloxylon bush in middle-third of frame, dusty-blue distant ridge, hyperrealistic, 16:9, 12 seconds, no movement except heat shimmer atmospherics.*
> `--no` *African savanna, acacia, grass, animal, water*

## SHOT 3.05 · Silhouetted game-guard in Land Cruiser

| Field | Spec |
|---|---|
| Scene | 15a · 2:42–2:50 · 8 sec |
| Lens | 85mm long, shallow DoF |
| Movement | **STATIC** |
| Light | Sun glare on windshield, interior silhouette |
| Engine | **Hailuo** or **Runway** (faces well-handled but kept in silhouette) |

**PROMPT:**
> *Static shot, 85mm long lens shallow depth of field, profile view of a man inside a Toyota Land Cruiser through the side window, head and shoulders silhouetted black against bright windshield glare, sun blowing out the glass behind him, no visible facial features (silhouette only), khaki collar visible at neck, the Land Cruiser parked on pale gravel of the Iranian plateau, dust on the door, snow-dusted distant ridge visible defocused behind the vehicle, hyperrealistic documentary cinematography, 16:9, 8 seconds, no camera movement.*
> `--no` *visible face, identifiable features, watermark, African savanna*

## SHOT 3.06 · Male Yuz at riverbed, 3 a.m. IR

**SOURCE FOOTAGE PREFERRED.** ICS camera-trap, license required.

**FALLBACK PROMPT (Hailuo):**
> *Infrared night camera-trap footage, static fixed framing approximately 35mm equivalent, grainy IR green tint with vignette, single Asiatic male cheetah drinking from a shallow dry-riverbed water seep on the central Iranian plateau, 3 a.m. ambient nighttime, bright reflective eyeshine, ankle-high sparse vegetation barely visible at frame edges, ground-level wide framing, no motion blur, hyperrealistic authentic IR camera-trap aesthetic, 16:9, 10 seconds, near-static animal action.*
> `--no` *daylight, color, cinematic dolly, smooth motion, watermark*

---

# SECTION 4 — WHAT WENT WRONG

## SHOT 4.01 · Sassanid/Safavid royal-yuz miniature

**SOURCE PREFERRED — public-domain manuscript scan (British Library, Met, Iran Heritage).** AI is fallback.

**FALLBACK PROMPT (Pixverse for stylized; Flux for still):**
> *14th-century Persian miniature painting in the Safavid style: a royal hunter on horseback rides across stylised dry plain, behind him on the horse's back rides a trained cheetah (yuz) wearing an embroidered collar, gold-leaf background, lapis-blue sky, vermilion-and-saffron costumes, flat perspective with stylised foliage at lower edge, manuscript-paper grain visible, no text in image, 16:9, still image.*

Animation note: Apply slow Ken Burns push (18 sec) on the cheetah figure in post — do not request AI motion.

## SHOTS 4.02 — 4.04 · Historical archival sequence

**Use real archival material only.** Do not AI-generate the Qajar hunting photograph (4.02), the 1947 Indian cheetah photograph (4.03), or the 1979 revolution footage (4.04). These are documents — fabrication is unethical.

Where archival access fails, **substitute with a black title card stating the date and event** (e.g., *"1947 — India loses hers."*) rather than generating fake archive.

## SHOT 4.05 · Iran-Iraq war archive (4:00–4:18)

Real archival footage only. Same ethical rule. License from IRIB / BBC Persian / Pathé News.

## SHOT 4.06 · Tehran-Mashhad highway aerial at sunset

| Field | Spec |
|---|---|
| Scene | 21 · 4:18–4:36 · 18 sec |
| Camera | Drone, ~50m AGL |
| Lens | 200mm telephoto compression |
| Movement | **Drone slow lateral tracking**, perpendicular to highway |
| Light | Sunset, low warm sun from camera-back |
| Engine | **Runway Gen-3** (telephoto compression handling) |

**PROMPT:**
> *Aerial drone telephoto shot at approximately 200mm equivalent compression, 50 meters above ground, slow lateral tracking perpendicular to a two-lane asphalt highway slicing across pale-ochre Iranian central plateau at sunset, warm low sun from camera-back casting long shadows from roadside debris, distant trucks visible as small heat-shimmered dots in extreme compression, sparse Artemisia and gravel terrain on either side of road, dusty-blue mountains in far background, hyperrealistic documentary cinematography, BBC Planet Earth style, 16:9, 18 seconds, slow steady tracking.*
> `--no` *African landscape, jungle, palm tree, urban area, billboards, watermark*

## SHOT 4.07 · Yuz carcass at roadside (still)

**RESTRAINT IS LOAD-BEARING.** Do not generate a graphic close-up. Use one of:

(a) Real licensed photojournalism still (preferred — IRNA, ICS, Mehr News).

(b) AI keyframe with explicit framing constraint:
> *Wide-frame photograph from ~5 meters away, eye-level, 35mm lens, indistinct sand-colored animal form lying still at the right verge of a two-lane asphalt road in central Iranian plateau at late afternoon, yellow road centerline visible, sparse Artemisia at edge, dusty mountains in defocused background, hyperrealistic documentary photojournalism, no graphic detail, 16:9, still.*
> `--no` *blood close-up, gore, graphic injury, watermark*

Hold 4 sec. Score drops out. Wind + distant engine only.

## SHOT 4.08 · Live Yuz in daylight (recovery image)

| Field | Spec |
|---|---|
| Scene | 23 · 4:42–5:00 · 18 sec |
| Engine | **Hailuo** for animation; Flux for keyframe |

**PROMPT:**
> *Wide-angle ground-level shot, 35mm lens, single live Asiatic cheetah walking calmly across pale gravel and Artemisia steppe in central Iran in late-afternoon daylight, paler sandy coat (not orange), leaner build, longer legs, thicker neck ruff, prominent tear-stripes, ankle-high sparse vegetation, dusty-blue Alborz ridge in distance, warm side-light from camera-right, calm steady walking motion, no human presence, hyperrealistic wildlife documentary footage, BBC Planet Earth style, 16:9, 18 seconds.*
> `--no` *African savanna, acacia, golden grass, orange fur, zebra, lion, watermark*

---

# SECTION 5 — THE NAMED CHEETAHS

## SHOTS 5.01–5.05 · Named portrait cards (Kooshki, Delbar, Iran, Koushki II, Telma)

**REAL ARCHIVAL PHOTOGRAPHS PREFERRED.** Each cat has documented photographs in ICS / DOE archives. License them.

**Where archival access fails for a specific cat, the portrait card must be a NAME CARD ONLY (white-on-black text) — not a fabricated photograph.** Inventing a portrait of a real animal is a misrepresentation.

Name card style (Ideogram):
> *White Persian serif text "کوشکی" centered top of pure black frame, beneath in white English serif "Kooshki", beneath in small italic English "Male · captured 2007 · died 2018", generous margin, 16:9, still image, 12 seconds.*

(Repeat for Delbar / دلبر, Iran / ایران, Koushki II / کوشکی دوم, Telma / تلما, with appropriate date lines.)

## SHOT 5.01a · Kooshki pacing his enclosure (if AI fallback required)

If no archival pacing footage available, generate **a generic captive-cheetah enclosure plate** without claiming it is Kooshki — use as B-roll over name card only:

**PROMPT (Hailuo):**
> *Static medium shot, 50mm lens equivalent, behind chain-link mesh fence (mesh out-of-focus in foreground), interior of a concrete-walled cheetah enclosure under harsh fluorescent top-light with yellow-grey archival color cast, a captive cheetah paces a rectangular path along the back wall — eight steps, turn, eight steps — coat slightly faded from indoor years, hyperrealistic archival documentary footage style, 16:9, 12 seconds, repetitive pacing motion.*
> `--no` *outdoor savanna, sunlight on grass, watermark*

## SHOT 5.06 · Pirouz · age montage (4 stages)

**REAL ARCHIVAL ONLY.** Pirouz is a documented animal whose photographs are in the public record. Use them with proper licensing. **Do not generate fake Pirouz photographs.**

Animation: Ken Burns push on each archival still in post (After Effects). Total 12 sec, holds escalate 2 → 3 → 4 → 3.

## SHOT 5.07 · Empty veterinary incubator (the death beat)

| Field | Spec |
|---|---|
| Scene | 30 · 6:30–6:42 · 12 sec |
| Camera | Static |
| Lens | 35mm |
| Movement | **STATIC. Do not move the camera. Ever.** |
| Light | Fluorescent overhead, slight green cast, motivated by visible tube |
| Engine | **Flux Schnell for keyframe** (still), no animation. If animation desired, **Luma** for the subtle fluorescent-tube flicker only. |

**PROMPT (Flux/Ideogram, still):**
> *Photograph, static eye-level medium shot at 35mm, a single empty veterinary infant incubator in a clean clinical room, clear glass front showing the empty interior, folded crisp white towel inside on the floor of the incubator, no animal, no person, fluorescent ceiling tube visible above casting slightly green-cast cool light, pale clinical green-grey walls, hyperrealistic documentary still photography, generous negative space around the incubator, 16:9, still, no movement.*
> `--no` *animal in incubator, person, color saturation, warm light, watermark*

**Optional 12-sec animation (Luma):** input the still above as image-to-video; motion prompt only: *"imperceptible fluorescent tube flicker every 4 seconds, no camera movement, no subject movement, atmospheric stillness."*

## SHOT 5.08 · Pirouz alive, looking past camera

**REAL ARCHIVAL ONLY.** Same rule as 5.06.

---

# SECTION 6 — CONSERVATION TODAY

## SHOT 6.01 · Kavous Seyed-Emami portrait

**REAL PUBLIC-DOMAIN PHOTOGRAPH ONLY.** Public-record news photograph. Hold 12 sec on portrait + 6 sec with name card overlay. **Do not AI-generate a portrait of a real deceased person.** This is ethically non-negotiable.

Animation: Ken Burns imperceptible push (After Effects).

## SHOT 6.02 · Camera-trap equipment on a desk

| Field | Spec |
|---|---|
| Scene | 32a · 7:18–7:36 · 18 sec |
| Engine | **Flux/Ideogram still + Luma for subtle drift** |

**PROMPT (still):**
> *Photograph, medium close-up at 50mm lens shallow depth of field, on a wooden field-laboratory desk: a camera-trap unit (rugged green plastic housing, two infrared LED arrays, motion-sensor lens), a coiled black mounting strap, a notebook open with handwritten Persian field notes (Farsi script visible but unreadable), a metal cup of tea steaming, soft warm window light from camera-right, dark studio background, hyperrealistic documentary still photography, 16:9, still.*
> `--no` *African setting, watermark, brand logos, oversaturated*

## SHOT 6.03 · Map graphic with three icon overlays

Animated graphic. Render in After Effects / Figma. Map of Iran with the four reserves marked; three icon overlays appear in sequence (sanctions = red crate stamped HELD; conflict 2026 = orange burst; road kills = black tire-track icon). 14 sec.

## SHOT 6.04 · White-on-black pull-quote card

Ideogram. *White serif text on pure black: "Every camera we put in a tree is an act of patience." Beneath, smaller, italic: "— Iranian Cheetah Society biologist". Generous margin. 10 sec.*

## SHOT 6.05 · Unidentified Yuz at dawn

| Field | Spec |
|---|---|
| Scene | 33c · 8:00–8:18 · 18 sec |
| Engine | **Hailuo** for animation; preferred = ICS source |

**PROMPT:**
> *Camera-trap aesthetic, transitioning from infrared green tint to soft blue-dawn color across the shot, static fixed wide framing approximately 35mm equivalent, single Asiatic cheetah walking calmly across pale gravel in central Iranian reserve at dawn, paler sandy coat, lean build, longer legs, thicker neck ruff, prominent tear-stripes, ankle-high Artemisia tussocks at frame edges, dusty-blue mountain ridge defocused in distance, hyperrealistic documentary footage with authentic camera-trap grain, 16:9, 18 seconds.*
> `--no` *African savanna, color saturation excess, smooth dolly, watermark*

## SHOT 6.06 · Daylight drone of empty wadi

| Field | Spec |
|---|---|
| Scene | 33d · 8:18–8:30 · 12 sec |
| Engine | **Kling** |

**PROMPT:**
> *Aerial drone shot, slow ascent from 15m to 30m AGL over 12 seconds, 28mm wide-angle lens, over an empty rocky wadi (dry riverbed) cut into the pale Iranian plateau gravel, no animals, no people, hard mid-morning light from above, sharp shadows in the wadi cut, sparse Haloxylon bush at one edge, dusty-blue distant ridge, hyperrealistic landscape, BBC Planet Earth style, 16:9, 12 seconds.*
> `--no` *African landscape, vegetation density, water, animals, watermark*

---

# SECTION 7 — OUTRO

## SHOT 7.01 · Mehrdad direct address

**Production shoot only — not AI-generated.** This is the filmmaker. Specs documented in shotlist.md.

Setup notes: lavalier mic, room tone recorded separately for the mix, single take preferred (30 sec), 50mm prime, f/2.8, daylight from window-left only. **No score.**

## SHOT 7.02 · Wild mother + five cubs (camera-trap)

**REAL ICS ARCHIVAL FOOTAGE — license required.** This is documented camera-trap footage from autumn 2023. **Do not AI-generate.** The film's argument-against-despair rests on this being real.

If absolutely no licensing is achievable, the film should *cut* this beat and end on Mehrdad's address — never fabricate the closing image.

## SHOT 7.03 · Final title card

Ideogram. Specifications:

*Pure black background. Centered white Persian + English serif text:*

```
Kooshki · Delbar · Iran · Koushki · Telma · Pirouz (2022 — 2023)

___________

Fewer than 30 remain. Five were born this year.
```

*Hold 10 sec. Then cut to held black 3 sec. End.*

---

# B-ROLL CONSIDERATIONS

The film's B-roll falls into four Nichols-aligned categories. Use the right category per beat:

| Category | Purpose | Example shots in this film |
|---|---|---|
| **Illustrative** | Shows what is being described | 3.02 gazelle herd · 6.02 camera-trap equipment · 4.06 highway aerial |
| **Counterpoint** | Tension between sound and image | 4.06 highway sunset (beautiful) vs. 4.07 carcass (ugly) — sequencing makes the counterpoint |
| **Question** | Image that poses an open question | 6.06 empty wadi · the seventh blank line of the title card |
| **Answer** | Image that resolves a question | 7.02 wild mother + five cubs |

**B-roll budget per section:**
- Section 1: 4 shots (3 video + 2 title cards + 1 still). All AI or archival.
- Section 2: 4 shots (1 video + 2 graphics + 1 trap). Mostly graphics.
- Section 3: 6 shots (5 video + 1 silhouette). High AI-generation cost — anchor heavily on negative prompts.
- Section 4: 8 shots (4 archival + 2 AI video + 1 graphic + 1 still). Archival access is the bottleneck.
- Section 5: 11 shots (mostly archival stills + 1 incubator still + name cards). **Do not AI-generate Pirouz or other named animals.**
- Section 6: 6 shots (1 archival portrait + 1 still + 1 graphic + 1 pull-quote + 2 video).
- Section 7: 3 shots (1 production + 1 archival trap + 1 title card).

**Total AI-generation budget:** approximately 14–16 plates (most are 8–18 sec). Plan for at least 3 generations per plate to clear the African-prior contamination. Budget time for negative-prompt iteration.

---

# CONTINUITY ANCHORS (cross-shot consistency)

| Anchor | Shots | Rule |
|---|---|---|
| **Cheetah coat color** | All cheetah shots | Sand-pale, never orange. If a plate shows orange fur, reject. |
| **Substrate** | All landscape shots | Pale gravel + Artemisia tussocks + basalt. Never green grass, never dark loam. |
| **Horizon** | All wide shots | Dusty-blue mountains, often snow-dusted. Never flat green or acacia silhouette. |
| **Light direction** | Section 3 sequence (12 → 16) | Sun stays camera-left through Section 3 to maintain continuity of time-of-day. |
| **Camera-trap framing** | 2.04, 3.06, 6.05, 7.02 | All static, ground-level ~35mm equiv, IR-or-blue-dawn color. Used as-shot — no stabilization, no crop > 20%. |
| **Title cards** | All TITLE scenes | White serif on pure black. Persian top, English beneath. No motion graphics flourish. |
| **Pirouz** | 5.06, 5.08 | Real archival photographs only. Same animal, age-progressed. |
| **The blank seventh line** | Final card 7.03 | Underscore. Same character width as the longest name. Hold the blank. |

---

# DELIVERY CHECKLIST FOR EACH PLATE

For every AI-generated plate, before accepting into the cut:

- [ ] Substrate matches Iranian plateau (gravel + Artemisia + basalt)? If no — reject.
- [ ] Horizon shows dusty-blue mountains (not flat green or acacia)? If no — reject.
- [ ] If cheetah is in frame: coat is sand-pale (not orange)? Tear-stripes visible? Neck ruff thicker? If no — reject.
- [ ] No acacia, baobab, palm, jungle, zebra, lion, or wildebeest anywhere in frame? If no — reject and add term to negative prompt.
- [ ] No watermark, no text overlay, no model artifacts? If no — re-generate.
- [ ] Duration matches script ± 1 sec? If no — re-cut at engine or in post.
- [ ] Light direction matches adjacent shots? If no — flip in post or reject.

---

# ETHICAL RULES (non-negotiable)

1. **Do not AI-generate portraits of real named animals** (Kooshki, Delbar, Iran, Koushki II, Telma, Pirouz). Use real archival photographs with license or substitute with name cards.
2. **Do not AI-generate the portrait of Kavous Seyed-Emami.** Public-record photograph only.
3. **Do not AI-generate "archival" footage that does not exist** (1947 Indian cheetahs, 1979 revolution, Iran-Iraq war). License real archive or substitute with a title card stating the date.
4. **Do not AI-generate the final wild mother + cubs footage** (Scene 34b). The film's hope rests on this being real. License from ICS or cut the beat.
5. **Do not fabricate quotes** for any human subject. The pull-quote in Scene 33b must be attributed to a real ICS biologist with their permission, or genericized to *"— Iranian Cheetah Society biologist"* without name.

These rules are not aesthetic — they are the documentary's contract with its audience.

---

End of video-prompts file.
