# Article Generation Reference — Images (Gate 2)

System prompt reference for the `/article-images` skill.
Contains: global-config (Image Generation + Content Templates only), image-prompt-guide, cinematography-lut.
These references are injected via --append-system-prompt-file. Do NOT read them with the Read tool.

---

## Reference: global-config

# Article Content Writer — Global Config

> Single source of truth for all configurable values. To change any setting, edit THIS file only.

---

## 8.1. Research Efficiency

| Setting | Value | Rationale |
|---------|-------|-----------|
| `max_web_searches` | 2-3 per article | Targeted queries reduce latency while maintaining E-E-A-T |
| `max_web_fetches` | 1-2 per article | Only fetch full pages when search snippets lack specific data |
| `research_strategy` | Upfront-only | ALL data collected in Step 1, zero web calls during writing |
| `min_data_points` | 5-8 per article | Enough to support 1 citation per 400 words across 2,000 words |
| `writing_web_calls` | 0 | Writing step uses ONLY Step 1 research — no re-verification |

---

## 11. Image Generation

| Setting | Value |
|---------|-------|
| `api_endpoint` | `https://api.geminigen.ai/uapi/v1/generate_image` |
| `api_key_env` | `GEMINIGEN_API_KEY` |
| `default_model` | `nano-banana-2` (Gemini 3.1 Flash Image Preview — fast + high quality) |
| `available_models` | `nano-banana-2`, `nano-banana-pro`, `imagen-4` |
| `default_style` | `Photorealistic` |
| `default_aspect_ratio` | `16:9` (widescreen for blog articles) |
| `default_resolution` | `1K` |
| `default_output_format` | `jpeg` |
| `image_count` | 3–5 per article (scales with length) |
| `image_allocation` | 1 feature/cover image (MANDATORY) + 2–4 inline section images |
| `prompt_length` | 20–80 words (descriptive, specific) |
| `rate_limit_nano_banana_pro` | 5 req/min, 100 req/hour, 1,000 req/day (free tier) |
| `text_in_image` | NO — text belongs in the article, not the image |
| `reference` | See image-prompt-guide.md for full API docs + prompt best practices |

### Image Count by Article Length

| Article Length | Cover | Inline | Total |
|---------------|-------|--------|-------|
| Short (1,900 words) | 1 | 2 | 3 |
| Standard (2,000–2,200 words) | 1 | 3 | 4 |
| Long (2,200–2,400+ words) | 1 | 4 | 5 |

---

## 16. Content Templates

| Setting | Value |
|---------|-------|
| `template_count` | 12 |
| `template_auto_select` | Yes — based on topic characteristics |
| `template_override` | User can override auto-selection |
| `reference` | See content-templates.md |


---

## Reference: image-prompt-guide

# Image Prompt Guide: GeminiGen.AI for Article Images

## API Reference

### Endpoint
```
POST https://api.geminigen.ai/uapi/v1/generate_image
```

### Authentication
```
Header: x-api-key: <GEMINIGEN_API_KEY from environment variable>
Content-Type: multipart/form-data
```

### Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `prompt` | string | Yes | Text description of the image. Be descriptive and specific. 20-80 words sweet spot. |
| `model` | string | Yes | AI model for generation. See Model Selection Guide below. |
| `aspect_ratio` | string | No | `1:1` (square, default), `16:9` (widescreen), `9:16` (portrait), `4:3` (standard), `3:4` (portrait standard) |
| `style` | string | No | Artistic style. See Style Selection Guide below. |
| `output_format` | string | No | `jpeg` (default) or `png` |
| `resolution` | string | No | `1K` (default), `2K`, `4K` |
| `file_urls` | array | No | URL reference images to guide generation (style, content references) |
| `ref_history` | string | No | UUID of a previous GeminiGen image for style consistency |

### Example Request
```bash
curl -X POST https://api.geminigen.ai/uapi/v1/generate_image \
  -H "Content-Type: multipart/form-data" \
  -H "x-api-key: ${GEMINIGEN_API_KEY}" \
  --form "prompt=A professional blogger working at a minimalist desk with warm golden hour lighting streaming through floor-to-ceiling windows, shallow depth of field, editorial photography style" \
  --form "model=nano-banana-2" \
  --form "aspect_ratio=16:9" \
  --form "style=Photorealistic" \
  --form "output_format=jpeg" \
  --form "resolution=1K"
```

### Response
```json
{
  "id": 12345,
  "uuid": "img_abc123def456",
  "model_name": "nano-banana-2",
  "input_text": "...",
  "generate_result": "https://cdn.geminigen.ai/images/img_abc123def456.jpg",
  "status": 2,
  "status_desc": "completed",
  "status_percentage": 100,
  "used_credit": 0,
  "file_size": 2048576,
  "thumbnail_small": "https://cdn.geminigen.ai/thumbnails/img_abc123def456_small.jpg"
}
```

### Status Codes
| Status | Meaning |
|--------|---------|
| 1 | Processing — image is being generated |
| 2 | Completed — image generation successful, URL in `generate_result` |
| 3 | Failed — check `error_message` field |

### Rate Limits
| Model | Rate Limit |
|-------|-----------|
| `nano-banana-pro` | FREE — 5 req/min, 100 req/hour, 1,000 req/day |
| Other models | No rate limit (credit-based) |

---

## Model Selection Guide

### nano-banana-2 (DEFAULT)
- **Underlying model:** Gemini 3.1 Flash Image Preview (gemini-3.1-flash-image-preview)
- **Strengths:** High performance, optimized for speed and high-volume use cases, good quality
- **Best for:** Most article images — editorial photography, conceptual illustrations, professional scenes
- **Cost:** Credit-based
- **When to use:** Default choice for all article image generation

### nano-banana-pro
- **Underlying model:** Gemini 3 Pro Image Preview (gemini-3-pro-image-preview)
- **Strengths:** Professional asset creation, advanced reasoning ("Thinking") capabilities, follows complex instructions, renders high-fidelity text
- **Best for:** Complex concept art, text-in-image rendering, highly detailed instructions
- **Cost:** FREE tier available
- **Rate limit:** 5 req/min, 100 req/hour, 1,000 req/day
- **When to use:** When image requires complex instruction following or text rendering

### imagen-4
- **Underlying model:** General-use model balancing speed and quality
- **Strengths:** Excels at rendering fine textures — fur, fabric, water droplets
- **Best for:** Nature articles, texture-heavy topics, food photography, material science
- **Cost:** Credit-based
- **When to use:** When article topic involves natural textures, materials, or highly detailed physical subjects

### Model Decision Table
| Article Topic | Recommended Model | Why |
|--------------|-------------------|-----|
| Business / productivity | nano-banana-2 | Professional scenes, fast generation |
| Technology / AI | nano-banana-2 | Concepts, editorial feel, high quality |
| Nature / environment | imagen-4 | Fine texture rendering |
| Food / cooking | imagen-4 | Texture detail (ingredients, surfaces) |
| Fashion / lifestyle | nano-banana-2 | Professional photography quality |
| Complex concept art | nano-banana-pro | Advanced reasoning, text rendering |
| Default / unsure | nano-banana-2 | Fast, high quality, reliable |

---

## Style Selection Guide

### Available Styles
| Style | Description |
|-------|-------------|
| None | No specific style applied |
| 3D Render | Three-dimensional rendered style |
| Acrylic | Acrylic painting style |
| Anime General | General anime/manga style |
| Creative | Creative and artistic interpretation |
| Dynamic | Dynamic and energetic style |
| Fashion | Fashion photography style |
| Game Concept | Video game concept art style |
| Graphic Design 3D | 3D graphic design style |
| Illustration | Digital illustration style |
| Photorealistic | Realistic photography style |
| Portrait | Portrait photography style |
| Portrait Cinematic | Cinematic portrait style |
| Portrait Fashion | Fashion portrait style |
| Ray Traced | Ray-traced rendering style |
| Stock Photo | Stock photography style |
| Watercolor | Watercolor painting style |

### Style Selection for Articles

| Article Type | Recommended Style | Why |
|-------------|-------------------|-----|
| Business / corporate | Photorealistic or Stock Photo | Professional, trustworthy feel |
| Founder story / case study | Portrait Cinematic | Cinematic, human-centered, emotional |
| Technical / explainer | Illustration | Clear concepts, visual metaphors |
| Creative / opinion piece | Creative | Artistic interpretation matches personal voice |
| Data / research | Photorealistic | Clean, credible, factual appearance |
| Lifestyle / wellness | Photorealistic or Fashion | Aspirational, polished |
| Tutorial / how-to | Illustration or Stock Photo | Clear, instructional |
| Default / unsure | Photorealistic | Most versatile for article content |

---

## Image Allocation Rules

### Count by Article Length
| Article Length | Cover Image | Inline Images | Total |
|---------------|-------------|---------------|-------|
| Short (1,900 words) | 1 (mandatory) | 2 | 3 |
| Standard (2,000–2,200 words) | 1 (mandatory) | 3 | 4 |
| Long (2,200–2,400+ words) | 1 (mandatory) | 4 | 5 |

### Image 1: Feature / Cover Image (MANDATORY)
- Hero image representing the entire article's core theme
- Must be visually striking, high-contrast, scroll-stopping
- Should encapsulate the article's hook promise or transformation
- Works as both article header AND social media share thumbnail
- Recommended styles: Portrait Cinematic or Photorealistic (highest engagement)
- Aspect ratio: 16:9 (widescreen — optimal for blog headers and social shares)

### Images 2-5: Inline Section Images (Section-Bound)

Images are NOT decorations — they are **visual anchors** that support each section's narrative. Each inline image is BORN from its section's content.

**Generation process (per H2 section):**
After writing each H2 section, decide if it needs an image:
1. Is there minimum 1 text-only section since last image? (no clustering)
2. Is this section at an emotional turning point? (Problem→Solution, Data reveal, Story beat, CTA)
3. Under max inline image count for this article length?

If YES → generate image prompt FROM this section's content:
- `concept` = visual metaphor of what THIS section communicates
- `insert_after_heading` = exact H2 heading text of THIS section (MANDATORY — no exceptions)
- `prompt` = 20-80 words describing a scene that SUPPORTS the section's message
- Reader should glance at the image and instantly understand the section's topic

**Rules:**
- Images SPREAD from top to bottom — if 6 sections and 3 inline, place at sections 2, 4, 6 (not 1, 2, 3)
- NEVER cluster 2+ images in consecutive sections
- Each image reinforces the section's emotional arc phase
- All inline images share consistent color palette and mood progression
- Aspect ratio: 16:9 (default) or 4:3 for square-format content

---

## Section Type to Image Concept Mapping

| Section Type | Visual Mood | Color Palette | Lighting | Composition |
|-------------|-------------|---------------|----------|-------------|
| Problem / Pain | Dark, tense, isolated | Cool tones (blue, grey, desaturated) | Low-key, dramatic shadows | Isolated subject, negative space |
| Solution / Reveal | Bright, hopeful, movement | Warm tones (gold, amber, green) | High-key, soft, expansive | Open composition, forward motion |
| Data / Statistics | Clean, professional, structured | Neutral with accent color | Even, studio-style | Geometric, ordered, balanced |
| Story / Narrative | Cinematic, human-centered | Rich, film-grade tones | Motivated lighting (Rembrandt, rim) | Subject-focused, shallow DOF |
| CTA / Conclusion | Aspirational, warm, forward | Warm golden tones | Golden hour, backlit | Wide angle, horizon line, path forward |

---

## Prompt Best Practices

### Structure (20-80 words)
Write prompts in this order:
1. **Subject** — who/what is in the image
2. **Scene** — environment, setting, context
3. **Lighting** — light source, quality, mood
4. **Style details** — camera angle, depth of field, color palette
5. **Article context** — tie to the article topic for visual coherence

### Do's
- Be descriptive and specific ("warm golden hour sunlight streaming through industrial windows" not just "nice lighting")
- Include article topic context in every prompt for visual coherence across all images
- Match image mood to the section's emotional arc phase
- Use photography terminology (depth of field, bokeh, rim light, leading lines)
- Specify color temperature and palette to maintain consistency

### Don'ts
- NO text-in-image — text belongs in the article itself, not rendered in the image
- NO generic descriptions ("a beautiful landscape") — always be specific
- NO conflicting instructions ("dark and bright simultaneously")
- NO brand logos or specific trademarked visuals unless using reference images

### Example Prompts by Section Type

**Problem/Pain section:**
"A stressed professional staring at a cluttered screen filled with error messages, dimly lit office with cold blue monitor glow as the only light source, shallow depth of field focusing on their exhausted expression, cool desaturated tones, editorial photography"

**Solution/Reveal section:**
"A confident professional presenting a clean dashboard with upward-trending metrics, bright modern office with warm natural sunlight, lens flare from window, warm amber and gold color palette, wide angle showing open collaborative workspace, photorealistic editorial style"

**Data/Statistics section:**
"A minimalist workspace with a tablet displaying clean data visualization, soft even studio lighting, white and light grey background with a single accent color highlight, overhead camera angle, sharp focus throughout, professional stock photography style"

**Story/Narrative section:**
"A founder working late in a garage startup, single warm desk lamp casting Rembrandt lighting pattern, coffee cups and sketches scattered around, shallow depth of field with bokeh from distant string lights, rich warm film tones reminiscent of Kodak Portra, intimate documentary photography"

**CTA/Conclusion section:**
"A person walking toward a bright horizon on an open road, golden hour backlighting creating a warm silhouette, expansive sky with dramatic clouds, wide angle composition with leading lines, warm golden and amber palette, aspirational editorial photography"

---

## Image Prompt Output Format

```
### Image [N]: [COVER / Section Title]
**Concept:** [1-line image concept tied to content]
**Prompt:** [full descriptive prompt, 20-80 words]
**Model:** [nano-banana-2 / nano-banana-pro / imagen-4]
**Style:** [selected style]
**Aspect Ratio:** [16:9 / 4:3 / 1:1]
**Resolution:** [1K / 2K / 4K]
**Placement:** [Article header / After "[Exact H2 heading text]" — reason]
```

### JSON Output Format (for API callbacks)

When outputting image_prompts in JSON (e.g., for save-article or completion callbacks), use this structure:

```json
{
  "type": "inline",
  "section": "Section Title",
  "insert_after_heading": "The exact H2 heading text this image appears below",
  "concept": "1-line concept",
  "prompt": "20-80 word descriptive prompt",
  "model": "nano-banana-2",
  "style": "Photorealistic",
  "aspect_ratio": "16:9",
  "resolution": "1K"
}
```

**Critical:** `insert_after_heading` must be the **exact text** of an H2 heading in the article. The frontend uses this to position images correctly. For cover images, set `insert_after_heading` to `null`.

---

## Cinematic Prompt Standard (MANDATORY)

Every inline image prompt MUST follow this standard. Generic 50-word prompts
are REJECTED. Target length: 300-500 words per prompt.

### The 8-Element WOW Framework

Every prompt MUST include all 8 elements. Count determines quality tier:
- 8/8 = EXCELLENT (cinematic editorial quality)
- 6-7/8 = PASS (acceptable)
- <6/8 = FAIL (rewrite prompt)

| # | Element | Requirement | Example |
|---|---------|-------------|---------|
| 1 | Lighting Drama | Pattern name + ratio + Kelvin | "Rembrandt key at 4:1 ratio from camera-left at 3200K" |
| 2 | Depth Layers | foreground + midground + background (labeled) | "foreground: dust particles...; midground: subject...; background: bokeh lights" |
| 3 | Atmosphere | Volumetric + particles + haze/fog/bokeh | "heavy volumetric haze catching side light, dust floating" |
| 4 | Color Contrast | Warm-cool tension or accent colors | "warm 3200K key vs cool 5600K rim creating tension" |
| 5 | Emotional Peak | Specific expression or scene emotion | "eyes narrowed in concentration, jaw set with determination" |
| 6 | Camera Intention | Shot type + lens + aperture + angle + DOF | "medium shot, 50mm f/2.0, low angle 15°, shallow DOF" |
| 7 | Texture Realism | Material-specific (skin/fabric/metal/wood) | "skin with visible pores, fabric weave, metal patina" |
| 8 | Cinematic Reference | Film stock + color grade + DP signature | "Kodak Portra 400, warm golden amber grade, inspired by Roger Deakins" |

### 5-Paragraph Structure (REQUIRED)

Every prompt body must be organized into exactly 5 paragraphs:

**Paragraph 1 — Subject + Expression + Wardrobe**
Shot type, who/what is in the image, facial expression (if person), body pose,
clothing/wardrobe details.

**Paragraph 2 — Depth Layers**
Explicitly label foreground, midground, background. Each layer 1-2 sentences
describing what's in it.

**Paragraph 3 — Lens + Lighting Setup**
Camera specs (lens, aperture, angle, DOF). Lighting setup (pattern name, ratio,
Kelvin temperatures for key/fill/rim).

**Paragraph 4 — Film Stock + Color Grade + Atmosphere + Texture + Cinematographer**
Film stock (e.g., Kodak Portra 400). Color grade (e.g., warm golden amber).
Atmosphere elements (volumetric, particles, haze). Material textures (skin,
fabric, metal). Cinematography inspired by [DP name].

**Paragraph 5 — Aspect Ratio + Negative Constraints**
Aspect ratio. Negative constraints: "no text visible", "no logos",
"no competitor branding".

### Formatting Rules

- NO ALL CAPS instructions in the prompt body
- NO raw percentages (use "thirty percent" not "30%")
- NO filenames in body (reference images go in separate `insert_after_heading` or ref fields)
- NO "Shot on [camera]" prefix — use "lens:" format instead
- NO category/emotion tags in body — those are metadata
- Use lowercase for most specifications (helps image model focus on structure)

### Cross-Reference to LUT

For specific values (lighting patterns, Kelvin temps, cinematographer names,
film stocks, shot types), consult `cinematography-lut.md` which is also in
the system prompt.

---

## Cinematic Prompt Example Library

### Example 1: Cover Image (Hero Shot)

```
A photorealistic cinematic wide shot of an Indonesian-appearing
professional developer in his mid-30s working intently at a minimalist
desk, face illuminated by the warm glow of a laptop screen, eyes focused
with quiet determination, slight smile suggesting discovery, wearing a
charcoal crew-neck sweater with subtle texture visible, hands poised
above a mechanical keyboard mid-thought.

foreground: out-of-focus edge of a notebook with handwritten notes
catching warm amber light, coffee mug with steam rising in soft bokeh.
midground: the developer centered in frame, laptop screen reflecting
subtle cool light on his face from below while warm desk lamp provides
key light from upper-right. background: large floor-to-ceiling window
showing Jakarta city skyline at golden hour, warm amber buildings and
sky bokeh creating depth, subtle silhouette of potted plants framing
the scene.

lens: 50mm f/1.8, eye-level slight high angle, shallow depth of field
with developer's face in sharp focus. Rembrandt key light at 3:1 ratio
from upper-right desk lamp at 3200K warm tungsten, cool 5600K fill from
the laptop screen creating subtle warm-cool tension, soft rim light from
window catching hair edges.

Kodak Portra 400, warm golden amber grade. subtle atmospheric haze from
warm evening air, dust particles visible in the desk lamp beam, natural
bokeh from window lights. natural skin texture with visible pores and
faint beard stubble, sweater fiber weave with soft warmth, mechanical
keyboard key caps showing subtle wear and finger oils. cinematography
inspired by Bradford Young.

16:9 aspect ratio. no text visible. no logos on laptop or screen.
```
**WOW Score: 8/8** — all elements present.

### Example 2: Inline Scene (People Interaction)

```
A photorealistic cinematic medium shot of two Indonesian business
professionals in modern office attire standing side-by-side before a
large holographic display, the woman on the left gesturing toward a
sharp upward trajectory curve with her index finger, eyes focused with
analytical intensity, slight confident smile. the man on the right with
arms crossed thoughtfully, eyebrows raised in measured surprise,
nodding slightly. both wearing tailored charcoal suits with subtle
sheen catching screen glow.

foreground: blurred edge of a glass conference table with a coffee cup
and tablet catching warm reflections. midground: both professionals
centered in frame, the holographic display between them projecting
sharp upward chart line in warm golden amber with subtle data points,
their figures illuminated by the screen glow. background: clean glass
and steel office interior with diffused daylight, city skyline visible
through floor-to-ceiling windows, out-of-focus colleagues at distant
workstations.

lens: 35mm f/2.8, eye-level, medium depth of field keeping both
subjects in focus. soft butterfly lighting pattern from overhead
architectural fixtures at 3:1 ratio at 4000K neutral daylight, warm
3200K accent from the holographic display glow on their faces, cool
5600K window light from camera-left providing rim separation.

Kodak Portra 400, balanced warm-neutral grade. minimal haze, clean air
atmosphere with subtle light rays from the windows, gentle bokeh of
city lights outside. natural skin texture with visible pores, suit
fabric showing fine weave pattern and subtle sheen, glass table edge
catching light with crystalline clarity, holographic display edge
showing subtle transparency. cinematography inspired by Emmanuel
Lubezki.

16:9 aspect ratio. no text on holographic screen. no visible corporate
logos.
```
**WOW Score: 8/8**.

### Example 3: Data Visualization (Abstract Concept)

```
A photorealistic cinematic close-up of an abstract digital data
visualization emerging from a dark surface, intricate network of
glowing connection nodes pulsing with soft warm amber light, data
streams flowing between nodes like rivers of liquid light, geometric
precision meets organic flow, sense of intelligence awakening.

foreground: scattered floating holographic data fragments in sharp
focus, numeric micro-text too small to read but suggesting complexity,
subtle bokeh of distant data points. midground: the main network
hub with three concentric rings of nodes rotating slightly, central
core pulsing with brighter warm light, data streams radiating outward.
background: infinite dark void with distant pinpoints of light
suggesting depth, subtle volumetric glow at the horizon creating a
sense of vast computational space.

lens: 100mm macro f/2.8, slight low angle 10° up toward the network
hub, extremely shallow depth of field with the central core in sharp
focus. key rim light from behind the network at 4:1 ratio at 3200K
warm amber creating silhouette glow, soft fill from below at 3500K
warm tungsten, cool 6000K accent lights scattered throughout creating
warm-cool tension.

Kodak Portra 400, warm golden amber grade with deep rich blacks.
heavy volumetric atmosphere with glowing data particles floating
throughout, subtle haze catching the warm rim light, streams of light
creating god rays through the network. glossy reflective surfaces on
the data nodes showing subtle imperfections and micro-scratches, dark
void surface with subtle texture variations catching incidental light.
cinematography inspired by Greig Fraser.

4:3 aspect ratio. no text visible. no logos. abstract conceptual
imagery.
```
**WOW Score: 8/8**.

---

## API Response Handling

### Success Flow
1. Send POST request with prompt + parameters
2. Check `status` field in response
3. If `status: 2` (completed) — image URL is in `generate_result`
4. If `status: 1` (processing) — poll using history API or wait for webhook
5. Download/reference the image URL in the article

### Error Handling
- If `status: 3` (failed) — check `error_message`, adjust prompt, retry
- If rate limited — wait 12 seconds between requests (nano-banana-pro has 5/min free tier limit)
- If all 5 article images needed — they fit within 1 minute at max rate

### History API (for checking status)
```
GET https://api.geminigen.ai/uapi/v1/history/{uuid}
```


---

## Reference: cinematography-lut

# Cinematography Lookup Tables

## Scope

This LUT is used during blog article image prompt generation (`article-write`,
`article-gen`, `article-writer` agent). Every image prompt must reference these
tables for specific values — lighting patterns, Kelvin temperatures,
cinematographer signatures, film stocks, shot types, and atmosphere elements.

Use this alongside `image-prompt-guide.md` which defines the 8-element WOW
framework and 5-paragraph prompt structure.

---

## 1. Emotion → Expression → Setup

| Emotion | Expression Keywords | Lighting | Lens | Camera |
|---------|-------------------|----------|------|--------|
| **Shock** | Wide eyes, raised brows, open mouth, frozen | Split 8:1, harsh key | 85mm CU | Static or quick push-in |
| **Curiosity** | Bright eyes, head tilt, raised brows | Soft key 4:1 | 50mm MCU | Gentle push-in |
| **Confidence** | Steady gaze, subtle smile, squared shoulders | Rembrandt 4:1, 3200K | 85mm CU | Static or slow push-in |
| **Excitement** | Bright eyes, genuine smile, lifted brows | High-key 2:1, warm | 50mm MCU | Tracking or gentle orbit |
| **Tension** | Furrowed brow, tight lips, intense gaze | Chiaroscuro 8:1+ | 35mm, Dutch | Slow push-in or handheld |
| **Awe** | Softened eyes, open mouth, relaxed brow | Rim + volumetric | 24mm WS | Crane rise |
| **Warmth** | Warm smile, soft eyes, relaxed posture | Butterfly 2:1, 3500K | 85mm CU | Gentle approach |
| **Authority** | Steady gaze, knowing smile, steepled hands | Rembrandt 4:1, 3200K | 85mm, slight low | Static |
| **Contemplation** | Downcast eyes, hand near chin | Soft side 4:1 | 50mm MCU | Static or slow drift |
| **Intrigue** | Slightly narrowed eyes, gentle head tilt, focused gaze | Low-key, mysterious | 50mm MCU | Gentle push-in |
| **Resolution** | Relaxed brow, subtle confident smile, steady eye contact | Balanced 3-point, warm 3200K | 50mm MCU | Static |
| **Fear/Concern** | Wide eyes, tense lips, raised inner brows | Underlit, cold 6500K+ | 35mm | Handheld |
| **Determination** | Set jaw, focused eyes, slight brow furrow | Strong key, minimal fill | 85mm CU | Static or push-in |

## 1b. Expression Keyword Phrases

### Positive States

| State | Keyword Phrase |
|-------|---------------|
| Joy | "bright genuine smile, crinkled eyes, lifted cheeks" |
| Confidence | "steady gaze, subtle knowing smile, squared shoulders" |
| Warmth | "soft warm smile, gentle open eyes, relaxed brow" |
| Excitement | "wide bright eyes, open genuine smile, raised brows" |
| Serenity | "peaceful closed-lip smile, soft eyes, relaxed features" |
| Gratitude | "warm appreciative smile, soft glistening eyes, open expression" |

### Neutral States

| State | Keyword Phrase |
|-------|---------------|
| Contemplation | "thoughtful downcast eyes, hand near chin, relaxed mouth" |
| Curiosity | "bright inquisitive eyes, slight head tilt, parted lips" |
| Focus | "narrowed concentrated eyes, set jaw, still posture" |
| Intrigue | "slightly narrowed eyes, gentle head tilt, subtle smile" |
| Resolution | "calm steady gaze, relaxed brow, confident subtle smile" |

### Tension States

| State | Keyword Phrase |
|-------|---------------|
| Tension | "furrowed brow, tight pressed lips, intense focused gaze" |
| Fear | "wide alarmed eyes, tense parted lips, raised inner brows" |
| Determination | "set jaw, focused intense eyes, slight brow furrow" |
| Shock | "wide frozen eyes, raised brows, open mouth, rigid posture" |
| Anger | "narrowed eyes, clenched jaw, flared nostrils, tense brow" |

---

## 2. Lighting Patterns

| Pattern | Key Position | Mood | Prompt Phrase |
|---------|-------------|------|---------------|
| **Rembrandt** | 45° side, above eye | Dramatic, authority | "Rembrandt lighting, triangle shadow" |
| **Butterfly** | Directly above, on-axis | Glamorous, beauty | "Butterfly lighting, glamorous" |
| **Split** | 90° direct side | Intense, duality | "Split lighting, half-face shadow" |
| **Loop** | 30-45° from camera | Natural, flattering | "Soft loop lighting, flattering" |
| **Rim/Edge** | Behind subject | Separation, drama | "Strong rim light, edge separation" |
| **Broad** | Lit side toward camera | Wider appearance | "Broad lighting, open" |
| **Short** | Shadow side toward camera | Slimming, moody | "Short lighting, sculptural" |

| Ratio | Contrast | Use Case |
|-------|----------|----------|
| 2:1 | Subtle | Beauty, commercial, lifestyle |
| 4:1 | Moderate | Standard drama, editorial |
| 8:1 | High | Thriller, tension, dramatic |
| 16:1 | Extreme | Horror, extreme drama |

---

## 3. Color Temperature

| Source | Kelvin | Character | Prompt Phrase |
|--------|--------|-----------|---------------|
| Candlelight | 1900K | Deep warm orange | "candlelit 1900K warm glow" |
| Tungsten bulb | 2700K | Warm amber | "tungsten 2700K amber" |
| Tungsten | 3200K | Classic warm | "tungsten 3200K warm" |
| Golden hour | 3500K | Magic gold | "golden hour 3500K" |
| Midday | 5600K | Neutral | "daylight 5600K neutral" |
| Overcast | 6500K | Cool soft | "overcast 6500K diffused" |
| Shade | 7500K | Cool blue | "open shade 7500K cool" |
| Blue hour | 9000-12000K | Twilight blue | "blue hour 9000K mystery" |

**Default recommendation: 3200-3500K warm range for most blog article images.**

---

## 4. Cinematographer Signatures

| DP | Signature Look | Key Techniques | Prompt Style |
|----|---------------|----------------|--------------|
| **Roger Deakins** | Natural motivated light, precise composition | Single-source key, subtle fill, practical motivation | "Deakins natural motivated lighting, precise composition, minimal fill" |
| **Greig Fraser** | Atmospheric, desaturated, textured | Mixed media, natural haze, muted palette | "Fraser atmospheric desaturated texture, natural haze, mixed format" |
| **Hoyte Van Hoytema** | Large-format, immersive, organic | IMAX, natural light preference, minimal filtration | "Van Hoytema large-format organic, immersive natural light" |
| **Bradford Young** | Underexposed, rich shadows, low-key | Dark skin-tone mastery, motivated practicals | "Bradford Young underexposed rich shadows, low-key practicals" |
| **Emmanuel Lubezki** | Long-take natural light, fluid | Natural/magic hour, wide-angle close | "Lubezki natural light fluid, magic hour wide-angle intimate" |
| **Denis Villeneuve** | Stark minimalism, monumental scale | Wide empty compositions, muted palette, moody atmosphere | "Villeneuve stark monumental, wide minimalism, moody atmosphere" |
| **Janusz Kaminski** | Silver-retention, high contrast | Bleach bypass, dramatic shadows, cold-warm tension | "Kaminski silver bleach bypass, high contrast dramatic" |
| **Chung-hoon Chung** | Warm intimate, rich color | Close framing, warm practicals, rich blacks | "Chung-hoon Chung warm intimate, rich color, close framing" |

---

## 5. Camera & Lens

| Shot | Frame | Lens | Purpose |
|------|-------|------|---------|
| ECU | Eyes/detail | 100mm macro | Intense detail, abstract data viz |
| CU | Face fills | 85mm f/1.8 | Strong emotion, close portrait |
| MCU | Head+shoulders | 50-85mm | Conversational, mid-emotion |
| MS | Waist up | 50mm | Standard coverage, scene |
| MWS | Knees up | 35mm | Wider action, group scenes |
| WS | Full body+env | 24-35mm | Context, establishing scene |
| EWS | Landscape dominant | 14-18mm | Epic scale, cover images |

| Angle | Psychology | Prompt |
|-------|-----------|--------|
| Eye-level | Neutral, equal | "eye-level neutral" |
| Low angle | Powerful, heroic | "low angle heroic" |
| High angle | Vulnerable, overview | "high angle vulnerable" |
| Dutch 15-25° | Tension, unease | "Dutch angle tension" |
| Bird's eye | Directly overhead | "bird's eye omniscient" |
| Worm's eye | Ground level up | "worm's eye maximum power" |

---

## 6. Film Stocks (Warm Palette Preferred)

| Stock | Character | Best For | Prompt |
|-------|-----------|----------|--------|
| **Kodak Portra 400** | Warm skin, natural | DEFAULT — portraits, lifestyle, articles | "Kodak Portra 400 warm skin tones" |
| **Kodak Vision3 500T** | Hollywood warm | Dramatic, professional | "Kodak Vision3 500T tungsten" |
| **Kodak Vision3 250D** | Crisp, accurate | Daylight, outdoor | "Kodak 250D daylight crisp" |
| **Kodak Ektar 100** | Vivid saturated | Colorful scenes, outdoors | "Kodak Ektar 100 saturated vivid" |
| **Kodak Portra 800** | Versatile, slightly more grain | Low light, versatile | "Portra 800 natural warmth" |
| **Kodak Tri-X 400** | High contrast B&W grain | Black & white drama | "Tri-X black and white contrasty" |
| **CineStill 800T** | Halation glow | Night, neon (use warm) | "CineStill 800T warm halation" |
| **Fujifilm Velvia** | Extreme saturation | Landscapes | "Velvia hyper-saturated" |

**Default: Kodak Portra 400 for all blog article images unless topic specifically demands otherwise.**

---

## 7. Color Grading Styles

| Style | Description | Use Case | Prompt Phrase |
|-------|-------------|----------|---------------|
| **Teal & Orange** | Complementary color split, warm skin vs cool shadows | Blockbuster, cinematic | "teal and orange color grade, complementary cinematic" |
| **Bleach Bypass** | Desaturated, high contrast, silver retained | Gritty, thriller | "bleach bypass desaturated high contrast gritty" |
| **Golden Hour** | Warm overall push, lifted shadows | Romance, lifestyle, business | "golden hour warm grade, lifted amber shadows" |
| **Blue Hour** | Cool blue tones, twilight mood | Mystery, melancholy | "blue hour cool grade, twilight mood" |
| **Muted/Desaturated** | Pulled saturation, lifted blacks | Indie, art house, editorial | "muted desaturated grade, lifted blacks indie" |
| **Cross-Process** | Shifted hues, unexpected color casts | Experimental, retro | "cross-process shifted hues experimental retro" |
| **Day for Night** | Blue push, crushed shadows | Simulated night | "day for night blue push, deep crushed shadows" |

**Default: Warm golden amber grade (Portra 400 natural look) for most blog articles.**

---

## 8. Atmosphere Elements

| Type | Particle | Effect | Prompt Phrase |
|------|----------|--------|---------------|
| **Haze** | Fine | Light rays, depth | "atmospheric haze volumetric rays" |
| **Fog** | Large | Thick, mysterious | "thick fog mysterious" |
| **Ground fog** | Heavy, low | Floor mist | "ground fog low mist" |
| **Smoke** | Variable | Noir, dramatic | "wispy smoke noir atmosphere" |
| **Rain** | Water | Wet, moody | "rain backlit streaking" |
| **Snow** | Flakes | Cold, soft | "falling snow soft diffused" |
| **Dust** | Fine | Golden particles | "golden dust particles in warm light" |
| **Bokeh** | — | Subject isolation | "warm bokeh background, golden circles" |
| **Edison bulbs** | — | Lifestyle warmth | "Edison bulb warm glow, shallow DOF" |

### 8a. Volumetric Lighting Setups

| Setup | Description | Prompt Phrase |
|-------|-------------|---------------|
| **God rays** | Beams through atmosphere | "god rays streaming through haze, volumetric beams" |
| **Window blinds** | Patterned light slats | "light through venetian blinds, striped shadow pattern" |
| **Backlit particles** | Rim-lit floating dust/haze | "backlit particles glowing, rim-lit dust atmosphere" |
| **Smoke shafts** | Light cutting through smoke | "light shafts through smoke, dramatic volumetric" |

### 8b. Surface Effects

| Effect | Description | Prompt Phrase |
|--------|-------------|---------------|
| **Wet streets** | Reflective, moody ground | "wet street reflections, rain-slicked pavement glow" |
| **Puddle reflections** | Mirror-like ground reflections | "puddle reflections, mirrored city lights" |
| **Frost** | Ice crystal texture | "frost-covered surface, ice crystal texture cold" |
| **Steam** | Rising vapor, warmth | "rising steam atmosphere, warm vapor diffusion" |

---

## 9. Quick Combos — Content Type → Setup

Blog article images serve two roles:
- **Cover image** = the article's thumbnail/hero — scroll-stopping, dramatic, must
  encapsulate the article's promise in a single glance (like a social media
  thumbnail). Prefer tight CU framing over wide establishing shots.
- **Inline images** = support the article's narrative, can be any scale
  (scene, portrait, abstract, product, group).

| Content | Shot | Lens | Lighting | Film Stock |
|---------|------|------|----------|------------|
| **Cover image (thumbnail/hero)** | CU or MCU tight | 85mm f/1.8 | Rembrandt 4:1-6:1, 3200K | Portra 400 |
| **Inline: portrait scene** | CU or MCU | 85mm f/1.8 | Rembrandt 4:1, 3200K | Portra 400 |
| **Inline: person in environment** | MS | 50mm f/2.0 | Loop 3:1, 3500K | Portra 400 |
| **Inline: data / abstract concept** | ECU or MS | 100mm macro or 35mm | Rim + volumetric | Vision3 500T |
| **Inline: scene / environment** | WS | 24-35mm | Natural/golden hour | Portra 400 |
| **Inline: object / product detail** | CU | 85mm f/2.8 | Soft 2:1, 3200K | Vision3 250D |
| **Inline: group interaction** | MS or MWS | 35-50mm | Loop 3:1, mixed temp | Portra 400 |
| **Inline: epic wide establishing** | WS or EWS | 24mm f/2.8 | Rim + volumetric | Portra 400 |

### 9a. Mood → Complete Setup

| Mood | Lighting | Grade | Atmosphere | Framing |
|------|----------|-------|------------|---------|
| **Tense thriller** | Split 8:1, cool 5600K | Bleach bypass | Heavy haze | 35mm Dutch |
| **Mystery intrigue** | Low-key 8:1, cool | Desaturated teal | Fog | 35mm |
| **Epic reveal** | Rim + volumetric | Teal orange | Dust, god rays | 24mm crane |
| **Intimate dialogue** | Soft 4:1, warm practical | Portra, natural | Clean | 85mm |
| **Urban noir** | Hard 8:1, mixed temp | CineStill 800T | Rain, wet streets | 35mm low |
| **Tech/modern** | Clean 2:1, 5600K | Neutral, slight teal | Clean, screen glow | 50mm |
| **Business authority** | Rembrandt 4:1, 3200K | Portra warm | Minimal haze | 50-85mm |
| **Lifestyle warmth** | Loop 2:1, 3500K | Golden hour | Natural particles | 50mm f/1.8 |

