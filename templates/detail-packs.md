# Detail packs — extreme-detail prompt injection library

These packs get injected into every storyboard and video prompt by `/tasvir prompts`. The result: prompts with the geographic specificity, cultural accuracy, motion physics, sensory atmosphere, light dynamics, and camera language that AI generators need to produce convincing output.

When negaaregar writes a prompt, it:
1. Reads the scene's location → looks up the geography pack.
2. Reads the cast → looks up the culture pack per character.
3. Reads the shot's motion notes → looks up the motion pack.
4. Reads the time/weather → looks up the sensory pack.
5. Reads the light direction from the Visual Bible → looks up the light pack.
6. Reads the camera move → looks up the camera-language pack.
7. **Composes** all five into the prompt at the right anchor points.

---

## 1 · Geography packs (Iran-emphasized; international supported)

### `iran-tehran`
**Inject phrase**: *"Tehran in {{year}}, a city of fifteen million layered in class and generation, the Alborz mountains visible to the north on clear days, traffic-clogged Vali-Asr boulevard at street level, modernist concrete apartment blocks alongside Qajar-era brick courtyards, plane trees lining the avenue, satellite dishes and air-conditioning units crowding rooftops, the air a faint petrochemical haze even at midday"*
- **Architecture cues**: Pahlavi-era modernist concrete; Qajar brick with stained-glass windows; post-revolution functional apartment blocks; ornate Safavid-style mosques rebuilt in 1970s; the Azadi Tower's marble arch.
- **Vegetation**: chenar (plane), willow on roof gardens, geraniums on apartment balconies.
- **Materials**: tar streets, concrete, brick, ironwork, satellite dishes.
- **Sounds**: traffic horns, motorcycle two-strokes, vendor calls, distant azan from many mosques layered, Tehran-accent Persian.

### `iran-isfahan`
**Inject phrase**: *"Isfahan, late afternoon, the Safavid old city, turquoise-tiled domes catching warm light, pointed brick arches receding in an arcade, the Zayandeh-Rud riverbed visible (often dry in {{year}}), cypress trees lining a Persian garden's water channel, traditional adobe-brick walls in honey and ochre tones, the bazaar's vaulted ceilings rising overhead"*
- **Architecture**: Safavid pointed arches; turquoise Persian seven-color tile (haft-rang); muqarnas (stalactite vaulting); brick domes; vaulted bazaar; caravanserais.
- **Vegetation**: cypress (saru), pomegranate trees, jasmine vines, lotus pools.
- **Materials**: turquoise glazed tile, honey-colored adobe brick, cedar wood, cut stone.
- **Sounds**: hammering from coppersmiths' bazaar (Bazaar-e Mes-garan), softer azan than Tehran, Esfahani dialect Persian (slower vowels).

### `iran-shiraz`
**Inject phrase**: *"Shiraz, the city of Hafez and gardens, the Eram Garden's reflecting pool framed by ancient cypress, citrus blossom in the air, southern hard sunlight bleaching colors at noon, sandstone hills of the Zagros visible to the north, Persian carpet looms in side-street workshops, the soft Shirazi dialect rising and falling like spoken poetry"*
- **Architecture**: Qajar mirror-work palaces (Naranjestan); Pink Mosque (Nasir-ol-Molk) stained-glass refraction; Persian garden with charbagh layout; sandstone walls.
- **Vegetation**: cypress, sour orange (naranj) trees, jasmine, narcissus.
- **Materials**: sandstone, mirror mosaic, walnut wood, hand-knotted carpet.
- **Sounds**: water fountains, songbirds, Shirazi-accent Persian, distant call to prayer at lower volume than Tehran.

### `iran-tabriz`
**Inject phrase**: *"Tabriz, northwestern Iran, the Azeri-speaking city, the Grand Bazaar's vaulted brick corridors UNESCO-listed and crowded with carpet merchants, snow-capped Mount Sahand visible on clear days, traditional Azeri-Iranian architecture with carved wood mashrabiya screens, the bilingual layered identity in every sign"*
- **Architecture**: Blue Mosque ruins (Goy Mescid); Azerbaijan Museum brick courtyard; Constitution House (mashrooteh); bazaar's vaulted brick.
- **Sounds**: Azeri Turkish more common than Persian on the street, both signs visible everywhere, distinct azan style.

### `iran-yazd`
**Inject phrase**: *"Yazd, the desert city, ochre adobe-mud walls baked by sun, the windcatchers (badgir) rising above every old house funneling air down to cool the rooms, narrow shaded alleys, Zoroastrian fire temples still in use, the Dakhmeh towers of silence on the city's edge, intense dry heat at midday and sharp cold at night"*
- **Architecture**: adobe (khesht) and rammed earth (chineh); badgir windcatchers; domed cisterns (ab-anbar); Zoroastrian fire temples.
- **Vegetation**: pomegranate in courtyards, sparse.
- **Sounds**: sand-dampened, very quiet alleys, occasional motorbike, Zoroastrian liturgical chant if near a temple.

### `iran-rasht-caspian`
**Inject phrase**: *"Rasht and the Gilan region, lush rice paddies in summer green, mist rising off the Caspian shore, red-tile roofs, wooden buildings stained dark by rain, citrus orchards, the Gilaki language with its distinctive intonation, constant gentle rain or its threat"*

### `iran-ahvaz-khuzestan`
**Inject phrase**: *"Ahvaz, southwestern Iran, on the Karun river, Arab-Iranian identity, oil refineries on the horizon's haze, dust storms in summer at 50°C heat, Arabic dialect alongside Persian, the Karun's brown water flowing past concrete bridges, palm trees and reed marshes"*

### `iran-kurdistan-sanandaj`
**Inject phrase**: *"Kurdistan province, Sanandaj or village in the Zagros, mountainous, terraced fields, traditional Kurdish dress visible (men in baggy shalvar, women in colorful dresses with embroidered cuffs), wool-spinning visible at house doorways, the Kurdish language, the seasonal rhythm of nomadic herding"*

### `paris-1970s`
**Inject phrase**: *"Paris in the 1970s, narrow Haussmann-era streets, zinc roofs and wrought-iron balconies, the smell of Gauloises cigarettes and espresso from sidewalk cafés, a Citroën DS gliding past on Boulevard Saint-Germain, soft northern overcast light, French rive-gauche bohemian quarter"*

### `nyc-brooklyn`
**Inject phrase**: *"Brooklyn, present-day, brownstone row-houses on a tree-lined street, fire escapes, the subway grate exhaling steam, multicultural sidewalk crowd, traffic murmur from the BQE distant, late-afternoon golden hour cutting between buildings"*

### `generic-iran-rural`
**Inject phrase**: *"Iranian rural village, mountain backdrop, mud-brick houses with flat roofs, a single dirt road, a samovar's smoke rising, sheep visible in a distant pen, women in chador and headscarf, men in traditional shirt and trouser, a Paykan car parked in dust"*

**(More packs can be added by the user editing this file.)**

---

## 2 · Culture packs (Iran-emphasized)

### `iranian-traditional-religious-female`
**Inject phrase**: *"a {{age}}-year-old Iranian woman in a full-length black chador held closed at the chin, plain dark dress and tights visible at the hem, no makeup, gold thin band ring (her marriage ring) on her right hand, modest posture with eyes downcast in public space, gestures contained, traditional Tehrani-Persian register in speech"*
- **Dress**: chador (full coverage), or maghnaeh (head cover) + manteau (long coat).
- **Gestures**: hands often folded; never reaches across a man; eyes downcast around unfamiliar men.
- **Speech**: literary Persian with religious phrases ("Inshallah", "Mashallah", "Astaghfirullah").

### `iranian-secular-urban-female-young`
**Inject phrase**: *"a {{age}}-year-old Iranian woman in Tehran, fashionable manteau in cream or pastel, loose roosari (scarf) pushed back showing front of hair, denim or trousers, sneakers, smartphone in hand, eye contact direct, English-Persian code-switching (Finglish), confident posture, Tehrani slang in speech, lipstick visible"*

### `iranian-traditional-religious-male`
**Inject phrase**: *"a {{age}}-year-old Iranian man in a long dark qaba (coat) over white shirt buttoned to the collar, trimmed beard, prayer cap or turban if clergy, prayer beads (tasbih) in left hand worked rhythmically, formal upright posture, eyes lowered around unfamiliar women, formal Persian register with religious vocabulary"*

### `iranian-secular-urban-male-young`
**Inject phrase**: *"a {{age}}-year-old Iranian man in Tehran, fitted button-down shirt or t-shirt under leather jacket, dark jeans, sneakers, neatly trimmed stubble or clean-shaven, smartphone, casual confident posture, English-Persian code-switching, Tehrani street slang, espresso or cigarette in hand"*

### `iranian-elderly-rural`
**Inject phrase**: *"a {{age}}-year-old Iranian villager, weathered sun-darkened skin, deep-lined face, calloused hands, traditional dress (woman: long colorful patterned dress over trousers and chador-like cover; man: shalvar trousers and long shirt under wool waistcoat), unhurried movement, eyes that have seen drought and revolution, regional dialect"*

### `iranian-diaspora-westernized`
**Inject phrase**: *"an Iranian woman/man living abroad, dressed in fashionable Western style with subtle Persian touch (a turquoise pendant, henna pattern), Persian spoken at home and English in public, the careful bilingual code-switching of exile, posture confident but with a hesitation around homecoming"*

### `kurdish-traditional`
**Inject phrase**: *"a Kurdish woman/man in traditional dress (woman: long bright-colored dress with embroidered cuffs, headscarf with hanging beadwork; man: baggy shalvar trousers, white shirt, embroidered waistcoat, fringed turban or kolah), proud upright bearing, Kurdish language spoken, mountain dweller's weathered skin"*

### `azeri-iranian`
**Inject phrase**: *"an Iranian Azeri person from Tabriz region, dressed in modern clothing with a subtle local touch, Azeri Turkish as first language with code-switching to Persian, distinct facial features (lighter skin, sharper cheekbones common in northwestern Iran), commercial-merchant bearing common to Tabrizi tradition"*

---

## 3 · Motion packs

### `slow-motion-cinematic-120fps`
**Inject phrase**: *"slow-motion at 120fps captured natively, motion blur emphasized on hair and fabric, the subject's movement extended in time so every micro-gesture is visible — the slight tremor of a hand, breath visible in cold air, fabric falling with realistic gravity, eyes traveling across the frame at human-scaled emotional speed"*

### `slow-motion-extreme-480fps`
**Inject phrase**: *"extreme slow-motion at 480fps, time dilated by 20x, every detail crystallized — water droplets visible mid-air, a thrown object hanging weightless, every blink a held moment, frame rate so high motion blur is nearly absent"*

### `real-time-natural-24fps`
**Inject phrase**: *"real-time motion at 24fps cinematic frame rate, natural human-scale movement, subtle motion blur on fast gestures, the rhythm of breath and step preserved as in life"*

### `time-lapse`
**Inject phrase**: *"accelerated time-lapse motion, clouds streaming, shadows sweeping across walls, sun moving visibly across the sky, the subject still or moving slowly while the world accelerates around them"*

### `whip-pan-kinetic`
**Inject phrase**: *"sharp whip-pan motion blur, the kind of energetic camera movement seen in Edgar Wright or Tony Scott — the frame smears horizontally between two moments of crisp focus, kinetic energy preserved"*

### `slow-and-steady`
**Inject phrase**: *"slow deliberate motion, the subject's pace measured and contained, no rushed gestures, Kiarostami-style held quality, the patience of the observer rewarded by the smallest detail"*

### `frantic-handheld`
**Inject phrase**: *"frantic handheld motion, urgent breathing camera, the operator running with the subject, motion blur from intentional camera shake, the immediacy of journalism or war reportage"*

### `floating-steadicam`
**Inject phrase**: *"floating Steadicam glide, gravity-defying smoothness, the camera moves through space as if disembodied, no operator footstep visible in the motion, Cuarón-style long-take floating quality"*

---

## 4 · Sensory atmosphere packs

### `dusty-afternoon-iran`
**Inject phrase**: *"a faint dust haze hangs in the late-afternoon air, sunbeams cutting through it become visible columns of light, the smell of warm stone and dry earth, motorcycle exhaust at a distance, the chirrup of a sparrow on a wall, slight grit on the tongue if you opened your mouth"*

### `bazaar-press-isfahan`
**Inject phrase**: *"the press of the covered bazaar, heat and the smell of saffron, cardamom, frying onions for ash-reshteh, hammering from the coppersmiths' section echoing in the vaulted ceiling, vendors calling prices in Esfahani Persian, the close warm air smelling of bodies and spice and old wool carpet"*

### `caspian-mist-rasht`
**Inject phrase**: *"the constant gentle mist of the Gilan coast, the smell of wet earth and rice paddies, sea-air at a distance, the chirp of frogs from the paddies at dusk, the slow drip of water from leaves of the broad citrus trees, the green light filtering through wet canopy"*

### `desert-night-yazd`
**Inject phrase**: *"the desert night of Yazd, air temperature dropped twenty degrees from daytime, the smell of cool adobe walls, absolute silence except for a distant dog's bark and the wind through a badgir tower far off, the brilliant clarity of stars above the windcatchers"*

### `sandstorm-ahvaz`
**Inject phrase**: *"a Khuzestan dust storm in midsummer, sky turned ochre-yellow, visibility reduced to twenty meters, the sting of sand on exposed skin, the howl of wind interrupting all other sound, breath labored, the city blurred and tinted"*

### `nowruz-air`
**Inject phrase**: *"the air of Nowruz first day in spring, freshness after winter, hyacinth and narcissus smells, the murmur of family inside houses preparing the haft-sin table, a child's distant laugh in a courtyard, the warmth of sun for the first time in months"*

### `cafe-interior-tehran-modern`
**Inject phrase**: *"the warm interior of a modern Tehran café, the hiss of an espresso machine, low conversation in mixed Persian and English, a Spotify playlist of mellow indie, the smell of coffee and pastry and cold marble counter, light from a tall window falling on a single table"*

### `mosque-silence`
**Inject phrase**: *"the silence inside a Persian mosque at non-prayer hour, the cool of the stone floor under bare feet, the smell of carpet wool and incense and decades of human breath, a distant pigeon's coo, the way the dome's acoustic gathers and softens every sound"*

### `bazaar-tehran-grand`
**Inject phrase**: *"Tehran Grand Bazaar's vaulted corridors, the smell of dried fruit, leather, cardamom, sweat, and old paper money, the clatter of trolleys, the bargaining call-and-response, the press of bodies moving in slow current"*

---

## 5 · Light packs (motivated, by time and context)

### `golden-hour-iranian-courtyard`
**Inject phrase**: *"late-afternoon golden hour light raking in from the upper west at a 35° angle, warm 3000K color temperature, long shadows on the courtyard stone in honey and amber, deep shadows under arcades, motivated by the actual sun, contrast ratio 4:1, soft enough at the edges to read every feature on a face"*

### `blue-hour-tehran-rooftop`
**Inject phrase**: *"twilight blue hour about twenty minutes after sunset, sky deep cobalt above, electric lights and neon signs of Tehran beginning to glow as the dominant ambient, mixed color temperature 4500K sky against 2500K practicals, deep but soft shadows, the transitional liminal feel"*

### `noon-harsh-bazaar-exit`
**Inject phrase**: *"harsh noon sun directly overhead at the bazaar's exit, contrast ratio 8:1, deep crushed shadows under eyebrows and nose, sharp-edged shadows on the ground, color temperature 5500K neutral, every detail in sun bleached and every detail in shadow lost"*

### `window-shaft-interior-isfahan`
**Inject phrase**: *"a single shaft of warm light entering from a high mosque-style stained-glass window, refracted in cobalt and ruby tones, the rest of the interior in deep cool shadow, motivated by the visible window, chiaroscuro contrast like a Caravaggio"*

### `practical-only-night-cafe`
**Inject phrase**: *"night interior, no main lights, illumination only from practicals visible in frame — a tabletop candle, a hanging Edison bulb, neon café signage from outside — warm 2200K candle against cool 4500K neon, deep ambient shadow, faces lit only on one side"*

### `overcast-rasht-soft`
**Inject phrase**: *"overcast Gilan day, the sky a vast soft-box, no shadow direction discernible, color temperature 6500K cool diffuse, every surface revealed without contrast, the painterly natural-light quality favored by documentary cinematographers"*

### `magic-hour-mountain`
**Inject phrase**: *"magic hour in the Zagros mountains, the sun just below the western ridge, the sky still bright but the foreground in a soft warm shadow, color temperature 4000K with a warm-cool split, low-angle silhouettes against the lit sky"*

### `dappled-cypress-garden`
**Inject phrase**: *"dappled afternoon light through a cypress grove in a Persian garden, broken patches of gold across the stone path, the breeze making the spots dance subtly, warm 3500K filtered, soft-edged shadows with a romantic quality"*

---

## 6 · Camera language packs (movement vocabulary with motion semantics)

### `kiarostami-observational-static`
**Inject phrase**: *"static locked-off camera on a tripod, no movement at all, observational duration, the subject filmed at distance with patience, master-shot composition holding for the entire shot, Abbas Kiarostami signature aesthetic"*

### `farhadi-handheld-intimate`
**Inject phrase**: *"intimate handheld camera, smooth gentle movement following the subject through domestic space, no judgment in the framing, Asghar Farhadi-style ensemble observational mode"*

### `slow-push-in-cinematic`
**Inject phrase**: *"slow dolly-in over four seconds, framing moving from medium shot to medium close-up, easing in (start-fast, end-slow), motivated by the subject's emotional intensification, no zoom — physical camera move on tracks"*

### `crane-up-reveal-elegiac`
**Inject phrase**: *"crane-up movement starting at medium shot eye-level and ending at a high wide overhead, the subject diminishing in the frame as architectural context expands around them, ten-second duration, smooth and elegiac, motivated by the abandonment of the protagonist by the world"*

### `whip-pan-edgar-wright`
**Inject phrase**: *"sharp whip-pan motion from left to right over twelve frames, blur-blur-crispness, energetic kinetic camera language, ending on a new subject already in matching frame composition"*

### `dolly-zoom-hitchcock`
**Inject phrase**: *"Hitchcock dolly-zoom — physical dolly-out simultaneous with zoom-in, the background expanding while the subject's framing stays constant, spatial distortion creating psychological vertigo, three-second move, motivated by the subject's emotional vertigo"*

### `steadicam-long-take-cuaron`
**Inject phrase**: *"unbroken Steadicam long take, the camera following the subject through three or more changing locations, floating gravity-defying movement, no visible cuts, Cuarón-style virtuoso unbroken duration"*

### `drone-aerial-establish`
**Inject phrase**: *"drone aerial establishing shot, rising slowly from rooftop level to high wide overhead, smooth gimbal-stabilized motion, the city's pattern revealing itself, ending on a single tiny figure at street level as the camera holds"*

### `handheld-vérité-immediate`
**Inject phrase**: *"vérité handheld documentary camera, slight intentional shake, breathing-rhythm framing, the immediacy of being there, no smoothing, the cinematographer's footsteps faintly visible in the motion"*

### `arc-orbit-obsessive`
**Inject phrase**: *"360-degree arc orbit around the subject, smooth gimbal-rig motion, ten-second slow circle, the background revolving while the subject holds central frame, obsessive observational quality, motivated by inspection or threat"*

---

## How packs combine — example for one shot

**Scene 4, Shot 5**: 65-year-old Iranian woman in chador reads a letter in an Isfahan courtyard, late afternoon, slow dolly-in on her face, slight breeze stirring chador edge, distant azan.

The agent picks:
- Geography: `iran-isfahan`
- Culture: `iranian-traditional-religious-female`
- Motion: `slow-and-steady` (her movement)
- Sensory: `dusty-afternoon-iran` + custom (distant azan, breeze on chador)
- Light: `golden-hour-iranian-courtyard`
- Camera: `slow-push-in-cinematic`

**Resulting video prompt** (composed from packs + Visual Bible + scene description):

```
{photoreal-cinema package from templates/video-styles.md}

{iran-isfahan geography pack}: Isfahan, late afternoon, the Safavid old city,
turquoise-tiled domes catching warm light, pointed brick arches receding in
an arcade, the Zayandeh-Rud riverbed visible (often dry in 1357), cypress
trees lining a Persian garden's water channel.

{iranian-traditional-religious-female culture pack}: a 65-year-old Iranian
woman in a full-length black chador held closed at the chin, plain dark
dress visible at the hem, no makeup, gold thin band ring on her right hand,
modest posture, traditional Tehrani-Persian register.

She stands at the center of the courtyard holding a folded yellowed letter
with both hands at chest height, eyes on the first line just read, mouth
slightly parted in stunned recognition, motion contained:
{slow-and-steady motion pack} — slow deliberate, no rushed gestures,
Kiarostami-style held quality.

{dusty-afternoon-iran sensory pack}: a faint dust haze in the late-afternoon
air, sunbeams cutting through it become visible columns of light, the smell
of warm stone and dry earth. Additional: a distant azan call begins from
the mosque beyond the courtyard wall, a faint breeze stirs the lower edge
of her chador.

{golden-hour-iranian-courtyard light pack}: late-afternoon golden-hour light
raking in from upper west at a 35° angle, warm 3000K, long shadows on
courtyard stone in honey-amber, deep shadows under arcades, contrast 4:1.

{slow-push-in-cinematic camera}: slow dolly-in over four seconds from
medium shot to medium close-up, easing in (start-fast, end-slow), motivated
by her emotional intensification, no zoom — physical camera move on tracks.

Foreground: her hands and the letter. Midground: her face and chador.
Background: the courtyard arcade receding, a single cypress visible.
Depth of field shallow, f/2.0 anamorphic, focus on her eyes.

Frame rate 24fps cinematic motion blur. 16:9 cinematic framing.
4 seconds duration.

{universal negative prompt from templates/video-styles.md}
```

That's an extreme-detail prompt. It composes from the Visual Bible (cast phrase, locked location, palette, light direction) + the relevant detail packs.

---

## Editing this file

Add packs as your project demands. The agent will pick the right packs based on the scenario's location/culture/motion notes. If no pack matches, the agent will write a one-off detail directly into the prompt and **suggest adding it to this file** for reuse.
