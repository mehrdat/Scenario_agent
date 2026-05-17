# Video style packages — for AI video generation (highest quality, YouTube-ready)

These packages get injected at the **start of every video prompt** in `output/prompt/<slug>/video/`. They tell the AI video engine what kind of cinematography you want.

Unlike storyboard styles (which are aesthetic — comic, noir, anime, ghibli), video styles are **technical cinematography directives** — film stock, camera body, lens, lighting, motion. The AI engine reads these as instructions for how to render motion and detail.

The default for `/tasvir video` and `/tasvir prompts` is **`photoreal-cinema`**. Pass `--video-style <key>` to override.

---

## Package library

### `photoreal-cinema` (default — premium feature-film aesthetic)
```
Cinematic film production, photorealistic, shot on Arri Alexa Mini LF with
anamorphic prime lens, 35mm large-format sensor, natural skin texture with
visible pores, shallow depth of field with creamy bokeh and natural lens
breathing, professional color grading, subtle organic film grain, 24fps
cinematic motion blur, IMAX-quality detail, director-of-photography aesthetic,
no stylization, no animation, fully photorealistic
```
**Best for**: narrative shorts, prestige drama, festival submissions.

### `photoreal-youtube-doc` (YouTube documentary / explainer)
```
Documentary cinematography, photorealistic, shot on Sony FX6 with 24-105mm
zoom, natural available light, observational handheld camera with smooth
gimbal stabilization, broadcast-television documentary feel, journalistic
quality, no artificial polish, sharp focus, 4K resolution detail, 24fps
cinematic, YouTube-ready broadcast quality
```
**Best for**: video essays, documentary YouTube channels, educational content.

### `photoreal-vlog` (YouTube vlog / personal channel)
```
Handheld photorealistic vlog cinematography, shot on Sony FX3 with 35mm
prime lens, natural light, slight intentional camera movement, intimate
immediate feel, YouTube creator production quality, professional independent
filmmaker aesthetic, sharp focus, color graded for warmth, 30fps smooth motion
```
**Best for**: personal YouTube channels, vlogs, lifestyle content.

### `photoreal-music-video` (cinematic music video)
```
Music video cinematography, photorealistic, shot on RED V-Raptor 8K with
anamorphic lens, dynamic dolly and gimbal camera movements, bold color grading
(teal-and-orange or saturated jewel tones), slow-motion at 60fps capable,
professional music video production aesthetic, high-end commercial polish,
shallow depth of field
```
**Best for**: music videos, atmospheric YouTube shorts, branded content.

### `photoreal-commercial` (commercial / advertising)
```
Commercial advertising photography in motion, photorealistic, shot on Arri
Mini LF with macro lens for product detail, perfectly controlled three-point
lighting, polished commercial color grading with vibrant accent colors,
product-focused composition with shallow depth of field, ultra-sharp focus,
high-end commercial aesthetic, 24fps cinematic
```
**Best for**: product reveals, brand films, commercials.

### `photoreal-handheld-realism` (cinema vérité / immediate)
```
Cinema vérité documentary realism, photorealistic, shot on Sony A7S III
handheld with 24mm prime, available natural light only, slight authentic
camera shake, unposed natural action, journalistic immediacy, direct-cinema
tradition, 24fps cinematic motion blur, no stylization
```
**Best for**: gritty drama, observational documentary, war reportage feel.

### `photoreal-8k-prestige` (premium streaming series)
```
Ultra-high-resolution 8K cinematic, photorealistic, shot on Arri Alexa 65
with vintage spherical lenses, IMAX format, every pore and fabric thread
visible, deep environmental detail, premium streaming series production
quality (HBO / Apple TV+ aesthetic), masterful natural-light cinematography,
24fps with subtle motion blur
```
**Best for**: prestige drama, period pieces, films meant for theatrical look.

### `photoreal-archival` (period / historical realism)
```
Photorealistic period cinematography, shot on 35mm Kodak Vision3 500T film
stock with vintage Cooke spherical lenses, slight authentic film grain,
period-accurate color palette and contrast curve, naturalistic available
light, 24fps with real-film motion characteristics
```
**Best for**: period drama, historical content, biopics.

---

## Universal negative prompt (appended to every video prompt)

```
low quality, blurry, watermark, text overlay, captions, subtitles, low
resolution, distorted faces, extra limbs, plastic skin, uncanny valley,
anime, cartoon, illustration, painting, drawing, 3D render, CGI, video game,
oversaturated, AI artifacts, deformed hands, missing fingers, melting faces,
motion artifacts, frame stuttering, jittery motion, fake-looking, mannequin,
doll, stylized
```

If the user has explicitly chosen a stylized video style (`anime`, `ghibli`, etc.), remove the matching exclusions from the negative prompt automatically.

---

## Per-engine tweaks (each video prompt block emits per-engine variants)

### Sora 2 (via ChatGPT free / Bing Video Creator)
- **Strength**: prompt-following, dialogue, complex scenes.
- **Tweaks**: write in natural sentences, not comma-lists. Mention specific film stock and lens.
- **Length cap**: ~250 words per prompt.
- **Audio**: Sora 2 generates synced audio — describe sound cues in the prompt.

### Veo 3 (Google AI Studio limited free, Whisk on Labs)
- **Strength**: photorealism, audio generation, lip sync.
- **Tweaks**: append explicit audio direction ("ambient sound: [...]", "dialogue: '[...]'"). Veo handles voice.
- **Length cap**: ~200 words.
- **Aspect**: native 16:9 and 9:16 both supported.

### Kling 2.0 / 2.1 (free trial credits per signup)
- **Strength**: complex motion, cinematic camera moves.
- **Tweaks**: describe motion explicitly ("camera dollies in slowly while subject turns toward the window"). Kling rewards detailed motion description.
- **Length cap**: ~150 words.

### Hailuo MiniMax 2.0 (free daily credits)
- **Strength**: realistic motion, character consistency.
- **Tweaks**: keep prompts shorter (under ~150 words). Mention specific motion verbs.
- **Length cap**: ~150 words.

### Pika 2.2 (free tier)
- **Strength**: speed, iterations.
- **Tweaks**: mention frame-to-frame consistency. Pika is better at short focused clips than long takes.
- **Length cap**: ~200 words.

### Luma Dream Machine (free daily credits)
- **Strength**: real-world physics, natural motion.
- **Tweaks**: describe physics explicitly ("water cascades naturally, gravity-affected"). Luma honors physics.
- **Length cap**: ~200 words.

### Runway Gen-4 / Gen-3 Alpha (trial credits per signup)
- **Strength**: cinematic camera moves, professional polish.
- **Tweaks**: heavy on cinematography terms (lens, T-stop, aperture, focal length, ISO).
- **Length cap**: ~250 words.

### Wan 2.2 (open-source, runs locally on GPU)
- **Strength**: free forever, fully offline, fine-tunable.
- **Tweaks**: detailed prompts welcome; runs at user's hardware speed.
- **Length cap**: unlimited.

### Pixverse (free, fast)
- **Strength**: stylized output, fast iteration.
- **Tweaks**: for photoreal use, explicitly mention "photorealistic, no stylization, no animation."
- **Length cap**: ~150 words.

### CogVideoX-5B (open-source, HuggingFace)
- **Strength**: free Hugging Face inference, decent quality.
- **Tweaks**: concise prompts, focus on action.
- **Length cap**: ~100 words.

---

## Audio companion prompts (track in `video/05-audio/`)

### Narration / Voice (ElevenLabs free / Tortoise / coqui-TTS)
For each scene with V.O. or dialogue, write:
- Speaker description (age, gender, voice quality, accent).
- Delivery direction (calm, urgent, intimate, declamatory).
- Pacing (slow, measured, rapid).
- The exact line(s).

### Music (Suno free / Udio free / MusicGen on HF)
Per scene or per sequence:
- Genre + tempo (e.g. "solo tar, slow, contemplative, 60bpm").
- Mood directive matching the Visual Bible's `08-mood.md`.
- Cue points if syncing to action.

### SFX (AudioGen on HF / Freesound free)
Per scene:
- Diegetic sounds (footsteps on stone, distant azan, paper rustle).
- Ambient bed (wind, traffic, room tone).
- Special effects punctuation (door slam, glass break, breath).

---

## Frame rate / aspect ratio defaults per format

| Format | Aspect | FPS | Recommended length |
|---|---|---|---|
| YouTube long | 16:9 | 24fps cinematic | per scene |
| YouTube Shorts | 9:16 | 30fps smooth | up to 60s |
| Reels | 9:16 | 30fps | up to 90s |
| TikTok | 9:16 | 30fps | up to 60s |
| Twitter | 16:9 or 1:1 | 30fps | up to 140s |
| Cinema | 2.39:1 | 24fps | per scene |

Inject the aspect + fps into every video prompt: `, 16:9 aspect ratio, 24fps cinematic motion blur`.
