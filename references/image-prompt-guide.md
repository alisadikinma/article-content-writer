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
  --form "model=nano-banana-pro" \
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
  "model_name": "nano-banana-pro",
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

### nano-banana-pro (DEFAULT)
- **Underlying model:** Gemini 3 Pro Image Preview (gemini-3-pro-image-preview)
- **Strengths:** Professional asset creation, advanced reasoning ("Thinking") capabilities, follows complex instructions, renders high-fidelity text (critical for YouTube-thumbnail-style covers)
- **Best for:** All article images — covers with title overlay, editorial photography, complex scenes, concept art
- **Cost:** FREE tier available
- **Rate limit:** 5 req/min, 100 req/hour, 1,000 req/day
- **When to use:** Default choice for cover and inline images

### nano-banana-2
- **Underlying model:** Gemini 3.1 Flash Image Preview (gemini-3.1-flash-image-preview)
- **Strengths:** High performance, optimized for speed and high-volume use cases
- **Best for:** High-volume batch runs where rate limits on nano-banana-pro bite
- **Cost:** Credit-based
- **When to use:** Downgrade target when speed/cost beats instruction-following

### imagen-4
- **Underlying model:** General-use model balancing speed and quality
- **Strengths:** Excels at rendering fine textures — fur, fabric, water droplets
- **Best for:** Nature articles, texture-heavy topics, food photography, material science
- **Cost:** Credit-based
- **When to use:** When article topic involves natural textures, materials, or highly detailed physical subjects

### Model Decision Table
| Article Topic | Recommended Model | Why |
|--------------|-------------------|-----|
| Business / productivity | nano-banana-pro | Complex scenes, text-on-image covers |
| Technology / AI | nano-banana-pro | Complex concept rendering, text in diagrams |
| Nature / environment | imagen-4 | Fine texture rendering |
| Food / cooking | imagen-4 | Texture detail (ingredients, surfaces) |
| Fashion / lifestyle | nano-banana-pro | High-fidelity detail, brand accuracy |
| Complex concept art | nano-banana-pro | Advanced reasoning, text rendering |
| High-volume batch | nano-banana-2 | Faster iteration when rate limits bite |
| Default / unsure | nano-banana-pro | Best quality, text rendering for covers |

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

### Image 1: Cover Image — YouTube Thumbnail Style (MANDATORY)

The cover image functions like a **YouTube thumbnail** — it must tell the story of the article at a glance. A viewer scrolling past should instantly understand what the article is about.

**Model:** `nano-banana-pro` (OVERRIDE default — text rendering required for title)

**5 Required Elements:**

1. **Title Text** — The article title rendered directly in the image. Position using rule-of-thirds (upper or lower third). High contrast against the background. Specify in prompt: bold, clean, sans-serif typeface. Must be legible at 320px width (mobile thumbnail size).

2. **Subtitle / Tagline** — Max 8 words, derived from the article's hook or core promise. Positioned below the title. Smaller font size than title. Use contrasting color or semi-transparent background strip for readability.

3. **Key Visual** — 1 dominant visual element that is SPECIFIC to the article's topic. This is NOT a generic stock photo scene — it must represent the actual subject matter. If the article is about Claude Code, show a terminal/IDE with Claude Code. If about cooking, show the specific dish. Occupies the center or remaining composition space.

4. **Brand Logo** — If `brand[]` reference images are provided via `reference_images`, incorporate the brand logo using `file_urls` parameter. Position naturally: corner placement, on a screen in the scene, or as a watermark. If NO `brand[]` references exist, **skip logo entirely** — never hallucinate or approximate a brand logo.

5. **Composition** — YouTube thumbnail principles:
   - Maximum 3 focal points (title text, key visual, optional logo)
   - High contrast between text and background
   - Readable at 320px width (mobile thumbnail preview)
   - Visual hierarchy: key visual (largest) > title text > subtitle > logo (smallest)
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
- NO text in INLINE images — text belongs in the article, not rendered in inline section images
- **COVER images MUST include title + subtitle text** — this is the one exception to the no-text rule (see Cover Image section above)
- NO generic descriptions ("a beautiful landscape") — always be specific to the article topic
- NO conflicting instructions ("dark and bright simultaneously")
- NO brand logos or trademarked visuals UNLESS using `file_urls` with uploaded reference images from `reference_images.brand[]` — never hallucinate logos from text descriptions alone

### Brand Reference Images (`file_urls`)

When a brand, product, or tool is discussed in the article, its logo or visual identity can be included in image prompts — but ONLY through uploaded reference images passed via the GeminiGen API `file_urls` parameter.

**How it works:**
1. Context Extraction identifies brands/products/tools mentioned in the article (see Context Extraction Gate section)
2. Reference Image Manifest tells the user which brand assets to upload with specific filenames
3. Uploaded images are stored in `reference_images.brand[]` array
4. When writing a prompt for a section that mentions the brand, include the `file_urls` URLs in the API call
5. In the prompt body, reference the brand: "incorporate the brand identity from the provided reference image, positioned at [specific location in composition]"

**Applies to ALL images (cover + inline):**
- **Cover:** Brand logo as a small corner element or natural placement in scene
- **Inline:** Brand/product visual integrated into the section's scene (e.g., product on desk, logo on screen, tool UI visible on monitor)

**When `brand[]` is empty:**
- Skip logo/brand visual entirely
- Focus on visual metaphor + topic representation
- NEVER attempt to describe or approximate a brand logo from memory — AI image models will hallucinate inaccurate logos

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

## Physical Reality Constraints (MANDATORY)

Before writing ANY image prompt, mentally simulate the camera position and verify all objects, screens, and reflections are physically consistent from that viewpoint. These constraints prevent the AI image model from generating physically impossible scenes.

### Screen/Display Logic

- **Laptop screens face the person using them, not the camera.** If the camera is behind or beside a laptop user, only the back of the laptop lid is visible — never the screen content.
- **Monitor content is only visible from the front.** A camera positioned behind a monitor shows cables and the back panel, not the display.
- **Phone screens face the holder.** A person looking at their phone has the screen facing them. The camera only sees the screen if positioned in front of or over the shoulder of the holder.
- **Tablet screens follow the same rules.** The display faces whoever is using it. Camera angle determines visibility.

**Common AI Failures:**
- Laptop screen content rendered on the lid/cover side (physically impossible — the lid is opaque)
- Monitor displaying content when camera is behind the screen
- Multiple screens showing content from angles where they would not be visible
- Screen reflections appearing on surfaces that are not in the reflection path

### Object Physics

- **Objects obey gravity.** Items rest on surfaces, liquids flow downward, papers lie flat unless held or pinned.
- **Hands grip objects at physically possible angles.** Fingers wrap around objects naturally — no impossible thumb positions or floating grips.
- **Reflections match scene geometry.** Mirror reflections show what is actually opposite the mirror from the camera's perspective. Window reflections match the exterior or interior accordingly.
- **Shadows are consistent with the light source.** A single key light produces shadows in one direction. Multiple lights produce multiple shadows. No shadows without a light source.

**Common AI Failures:**
- Objects floating above surfaces with no support
- Cups or bottles at impossible tilt angles without spilling
- Reflections showing content that is not in the scene
- Shadows pointing in contradictory directions

### Spatial Perspective

- **Camera angle determines what is visible.** A low-angle shot looking up at a desk shows the underside of the desk surface, not the items on top. A high-angle shot looking down shows the top of objects, not their fronts.
- **Consistent vanishing points.** All parallel lines in the scene must converge to the same vanishing point(s). Mixed perspective creates visual dissonance.
- **Depth is proportional.** Objects further from the camera appear smaller. People in the background are smaller than people in the foreground.
- **No impossible viewing angles.** The camera cannot simultaneously be above and below an object, or in front of and behind a person.

**Common AI Failures:**
- Mixed perspective where some objects follow one vanishing point and others follow a different one
- Interior of a container visible from outside without the container being open or transparent
- Objects in the background appearing the same size as foreground objects

### Human Anatomy

- **Five fingers per hand.** Count before finalizing — AI models frequently add or remove fingers.
- **Natural joint bending angles.** Elbows bend inward, knees bend backward, wrists have limited rotation range. No hyper-extension.
- **Proportional limbs.** Arms reach roughly to mid-thigh. Hands are approximately face-length. Heads are roughly 1/7 to 1/8 of total body height.
- **Symmetric facial features.** Ears are at the same height. Eyes are level. Nose is centered. Teeth are roughly uniform in size.

**Common AI Failures:**
- Six fingers, four fingers, or merged fingers on one or both hands
- Arms bending at impossible angles or with extra joints
- One hand significantly larger or smaller than the other
- Facial features misaligned (one ear higher, asymmetric jawline)

### Authoring Instruction

When writing ANY image prompt, apply this mental checklist:
1. Where is the camera positioned?
2. From this position, what surfaces/screens/objects are visible vs. hidden?
3. Are all reflections and shadows consistent with the light source and camera angle?
4. If people are in the scene, are their hands, limbs, and posture anatomically correct?
5. Do all objects obey gravity and rest naturally on surfaces?

If any element fails this checklist, revise the prompt to specify the correct physical arrangement before submitting.

---

## Context Extraction Gate (MANDATORY)

Before writing ANY image prompt (cover or inline), perform a mandatory context extraction step. This ensures every image is contextually accurate and specific to the article's actual content — not generic stock photography.

### Step 1: Full Article Analysis

Read the complete article content and extract:

- **Brands/Products/Tools** — every brand name, product, software tool, service, or company mentioned in the article. Record each with the section(s) it appears in.
- **Key Actions/Transformations** — what the reader will learn to DO (e.g., "set up Claude Code in VS Code", "cook rendang from scratch", "analyze data with Python pandas")
- **Target Persona** — who is the reader? What do they look like in a visual scene? (e.g., "developer at a desk", "home cook in a kitchen", "startup founder in a meeting")

### Step 2: Per-Section Analysis (for inline images)

For each H2 section that will have an image, identify:

| Extract | Purpose |
|---------|---------|
| Primary brand/product/tool in this section | Determines if brand reference images are needed |
| Visual representation of the topic | What physical scene or object represents this section's content? |
| Emotional tone | Drives lighting, color palette, and mood |
| "At a glance" test | If a reader only sees this image, can they guess what the section is about? |

### Step 3: Cover Analysis (for cover image)

For the cover thumbnail, identify the OVERALL article's:

| Extract | Purpose |
|---------|---------|
| Primary brand/product | For logo placement via `file_urls` |
| Core action/transformation | For key visual — what does the article teach/reveal? |
| Target persona visual | Who is the "character" in the thumbnail? |
| Emotional summary | Drives overall mood/lighting of the cover |
| Title text | Exact article title for in-image text rendering |
| Hook promise | For subtitle/tagline (max 8 words) |

### Context Extraction drives everything downstream

The extraction output directly feeds into:
- **Reference Image Manifest** — which brand assets the user needs to upload
- **Cover prompt** — title, subtitle, key visual, brand logo, composition
- **Inline prompts** — section-specific visuals with brand/product integration where relevant
- **Model selection** — if a section needs text or complex instruction following, use `nano-banana-pro`

---

## Reference Image Manifest

After Context Extraction, generate a **single unified manifest** listing ALL reference images needed across ALL image prompts (cover + inline). This manifest tells the user exactly what to upload, with what filename, and for which images.

### Manifest Format

```
Reference Image Manifest

| # | Filename | Description | Used In | Required |
|---|----------|-------------|---------|----------|
| 1 | [kebab-case-name.png] | [What the image contains + where to find it] | [Cover, Sec N] | [Wajib/Opsional] |
| 2 | ... | ... | ... | ... |
```

### Manifest Rules

1. **Every brand/product identified in Context Extraction that appears in an image section MUST have a manifest entry.** If the article discusses Claude Code and an image will show Claude Code, the manifest must request a Claude Code logo/screenshot.

2. **Required classification:**
   - **Wajib** (Required) — brand logos, product identity visuals. Without these, the prompt cannot accurately render the brand. The AI will hallucinate inaccurate logos.
   - **Opsional** (Optional) — UI screenshots, mood references, environment references. These improve accuracy but the AI can approximate without them.

3. **Filename conventions:**
   - Lowercase, kebab-case, ending with `.png`
   - Descriptive: `claude-code-logo.png`, `vscode-sidebar-screenshot.png`, `rendang-reference-photo.png`
   - Unique across the manifest — no duplicate filenames
   - These filenames are referenced in the `file_urls` parameter when calling GeminiGen API

4. **Description must include "where to find it"** — guide the user:
   - Logo: "download from [brand] press kit or official website"
   - Screenshot: "capture from your own setup showing [specific feature]"
   - Product photo: "photograph of [specific item] or download from [source]"

5. **"Used In" column** — tag which images will reference this file:
   - `Cover` — used in the cover thumbnail
   - `Sec N` — used in the inline image for section N
   - A single reference image can be used in multiple images (e.g., a brand logo in both cover and an inline section)

6. **One manifest for all images** — generated ONCE after Context Extraction, not per-image.

### Example Manifest

**Article:** "5 Tips Vibe Coding dengan Claude Code yang Bikin 3x Lebih Produktif"

```
Reference Image Manifest

| # | Filename                  | Description                                                     | Used In       | Required |
|---|---------------------------|-----------------------------------------------------------------|---------------|----------|
| 1 | claude-code-logo.png      | Logo Claude Code (purple terminal icon) — from Anthropic        | Cover, Sec 3  | Wajib    |
|   |                           | press kit or official branding page                             |               |          |
| 2 | claude-code-vscode.png    | Screenshot of Claude Code sidebar active in VS Code —           | Section 2     | Opsional |
|   |                           | capture from your own setup showing chat panel                  |               |          |
| 3 | mcp-server-diagram.png    | Architecture diagram showing MCP Server connections —           | Section 4     | Opsional |
|   |                           | from official Claude Code documentation                         |               |          |
| 4 | cursor-vs-claude.png      | Side-by-side screenshot comparing Cursor AI and Claude Code —   | Section 5     | Opsional |
|   |                           | capture both UIs on your screen                                 |               |          |

Wajib: #1 (brand logo — used in 2 images)
Opsional: #2, #3, #4 (meningkatkan akurasi visual section-specific)
```

### Pipeline Integration

In the `article-images` skill pipeline:
- If `reference_images.brand[]` is **empty**: generate the manifest, report to backend via progress callback (`step=manifest_needed`), and STOP. Wait for user to upload before proceeding to prompt authoring.
- If `reference_images.brand[]` is **populated**: map brand URLs to sections based on Context Extraction, then proceed directly to prompt authoring.

In interactive mode (`article-gen` skill):
- Present the manifest to the user inline and ask them to provide the reference images before generating image prompts.

---

## Image Prompt Output Format

```
### Image 1: COVER — [Article Title Short]
**Concept:** [1-line thumbnail concept — what story does this tell at a glance?]
**Prompt:** [300-500 word cinematic prompt with title text + subtitle + key visual + brand ref]
**Model:** nano-banana-pro
**Style:** [Photorealistic / Portrait Cinematic]
**Aspect Ratio:** 16:9
**Resolution:** 1K
**Placement:** Article header / social share thumbnail
**Title Text:** [exact article title to render in image]
**Subtitle:** [max 8 words tagline]
**file_urls:** [brand reference image URLs from reference_images.brand[], or "none"]

### Image [N]: Section [N] — [Title]
**Concept:** [1-line concept tied to THIS section's content]
**Prompt:** [300-500 word cinematic prompt — context-specific, not generic]
**Model:** [nano-banana-pro / nano-banana-2 / imagen-4]
**Style:** [selected style]
**Aspect Ratio:** [16:9 / 4:3 / 1:1]
**Resolution:** [1K / 2K / 4K]
**Placement:** After "[Exact H2 heading text]" — [reason]
**file_urls:** [brand reference URLs if this section uses brand visuals, or "none"]
```

### JSON Output Format (for API callbacks)

When outputting image_prompts in JSON (e.g., for save-article or completion callbacks), use this structure:

**Cover image:**
```json
{
  "type": "cover",
  "section": "Header",
  "insert_after_heading": null,
  "concept": "thumbnail concept — what story at a glance",
  "prompt": "300-500 word cinematic prompt with title/subtitle/key visual/brand",
  "model": "nano-banana-pro",
  "style": "Photorealistic",
  "aspect_ratio": "16:9",
  "resolution": "1K",
  "title_text": "exact article title",
  "subtitle_text": "max 8 word tagline",
  "file_urls": ["https://...brand-logo.png"]
}
```

**Inline image:**
```json
{
  "type": "inline",
  "section": "Section Title",
  "insert_after_heading": "The exact H2 heading text this image appears below",
  "concept": "1-line concept from context extraction",
  "prompt": "300-500 word cinematic prompt — section-specific",
  "model": "nano-banana-pro",
  "style": "Photorealistic",
  "aspect_ratio": "16:9",
  "resolution": "1K",
  "file_urls": ["https://...brand-reference.png"]
}
```

**Critical:** `insert_after_heading` must be the **exact text** of an H2 heading in the article. The frontend uses this to position images correctly. For cover images, set `insert_after_heading` to `null`. `file_urls` is an array of reference image URLs from `reference_images.brand[]` — include only for images that need brand/product visuals. Set to empty array `[]` when no references are needed.

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

**Paragraph 5 — Aspect Ratio + Negative Constraints + Text (Cover Only)**
Aspect ratio. Negative constraints: "no competitor branding",
"no unrelated text". For INLINE images: add "no text visible", "no logos".
For COVER images: specify title text placement, subtitle text, font style
(bold sans-serif), and contrast requirement. Include brand logo placement
instruction if `file_urls` reference images are provided.

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

### Example 1: Cover Image — YouTube Thumbnail Style

**Article:** "5 Tips Vibe Coding dengan Claude Code yang Bikin Kamu 3x Lebih Produktif"
**Brand references uploaded:** `claude-code-logo.png` (via `file_urls`)

```
A photorealistic cinematic wide shot of an Indonesian-appearing
professional developer in his mid-30s leaning back in an ergonomic
chair with a relaxed confident posture, one hand resting on a mechanical
keyboard, the other gesturing casually at a large ultra-wide monitor
displaying a VS Code interface with a chat sidebar active — the monitor
screen faces the developer from the camera's perspective, showing the
interface at a natural three-quarter angle. expression: wide genuine
smile, eyes bright with excitement, eyebrows slightly raised in a
"can you believe this?" look suggesting effortless productivity.
wearing a fitted dark navy henley with rolled sleeves.

foreground: soft bokeh of a small desk plant and a coffee mug catching
warm light, adding casual atmosphere. midground: the developer centered
in the left two-thirds of the frame, monitor visible in the right third
showing the active coding interface — the UPPER THIRD of the image is
reserved for title text overlay with a clean dark gradient strip for
contrast. background: modern home office with warm ambient shelf
lighting, books and tech gadgets softly out of focus, creating a
lived-in creative space.

lens: 35mm f/2.0, eye-level, medium depth of field keeping developer
and monitor both in acceptable focus. butterfly key light at 3:1 ratio
from above-center at 4000K neutral daylight, warm 3200K accent from
the monitor glow on his face, cool 5600K rim light from a window
camera-left providing edge separation.

Kodak Portra 400, warm golden amber grade with lifted shadows. clean
atmosphere with minimal haze, soft natural bokeh from shelf lights.
natural skin texture with visible pores, henley fabric showing soft
cotton weave, keyboard keycaps with subtle shine from use, monitor
bezel catching rim light. cinematography inspired by Bradford Young.

16:9 aspect ratio. bold clean sans-serif title text "5 Tips Vibe Coding
dengan Claude Code" positioned in the upper third with dark
semi-transparent gradient backdrop for legibility. subtitle text
"3x Lebih Produktif dengan AI" in smaller font below the title.
incorporate the Claude Code brand identity from the provided reference
image as a small logo placed in the lower-right corner. no competitor
branding. no unrelated text.
```
**WOW Score: 8/8** — all elements present. **Thumbnail Score: 5/5** — title, subtitle, key visual, brand logo, readable at 320px.

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
