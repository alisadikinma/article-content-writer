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
