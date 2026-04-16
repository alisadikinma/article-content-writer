---
name: article-images
description: "Pipeline-only skill for Gate 2 image prompt authoring. Context-aware: extracts brands/products/tools from article, generates Reference Image Manifest for user uploads, then expands per-section image_concept into 300-500 word cinematic prompts (8-element WOW + 5-paragraph structure) with brand refs via file_urls. Cover images use nano-banana-pro for YouTube-thumbnail-style title+subtitle rendering. Enforces Physical Reality Constraints. Runs on Sonnet with refs-images.md injected. Part of split pipeline: article-prep → article-write → article-score → [Gate 1] → article-images → GeminiGen."
---

# Article Images Skill (Gate 2 — Context-Aware Image Prompt Authoring)

Pipeline-only skill that performs **context extraction** from the article, generates a **Reference Image Manifest** for brand asset uploads, then expands per-section `image_concept` blueprints into full 300-500 word cinematic image prompts with brand references via `file_urls`. Cover images are YouTube-style thumbnails with title + subtitle rendered using `nano-banana-pro`. All prompts enforce Physical Reality Constraints. Runs AFTER the user approves the article at Gate 1 and BEFORE GeminiGen generates the actual image files.

> **DO NOT read reference files with the Read tool.** All references (global-config image sections, image-prompt-guide, cinematography-lut) are injected via `--append-system-prompt-file refs-images.md`. They are already in your system prompt. Reading them again wastes time and tokens.

---

## 1. Pipeline Flags (Required)

| Flag | Required | Description |
|------|----------|-------------|
| `--idea-id {id}` | Yes | Content idea ID in the Portfolio database |
| `--api-url {url}` | Yes | Base API URL (e.g., `https://alisadikinma.com/api`) |
| `--api-token {token}` | Yes | Authentication bearer token |
| `--idempotency-key {uuid}` | Yes | UUID passed by backend to dedupe retries |
| `--only-sections {n,n,n}` | No | Comma-separated outline section positions to regenerate. If omitted, author prompts for ALL sections with `image_concept != null`. |

All article data, outline, `image_instructions`, and reference images come from the database.

---

## 2. Don't Read Reference Files

References (`image-prompt-guide.md`, `cinematography-lut.md`, global-config image sections) are pre-injected into the system prompt by the backend when it launches the Claude CLI with `--append-system-prompt-file refs-images.md`. Attempting to Read them wastes tokens. Trust the system prompt.

---

## 3. Read Idea Data

On start, fetch the full idea state from the database:

```bash
curl -s -X GET "{api_url}/automation/content-ideas/{idea_id}" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json"
```

Extract from the response:

- `generated_article.prep_data.outline.sections[]` — ordered list with `position`, `title`, `arc_phase`, `image_concept` (may be null)
- `generated_article.prep_data.outline.image_count` — planned image count
- `generated_article.content` — full article body (HTML)
- `generated_article.title` — article title (seeds the cover image concept)
- `image_instructions` — user's global style guide (tone, brand palette, mood overrides)
- `reference_images` — object with `face[]` + `style[]` + `brand[]` arrays of uploaded reference URLs (may be empty)
  - `face[]` — face reference URLs for identity preservation
  - `style[]` — mood/style reference URLs
  - `brand[]` — brand logos and product visuals for context-accurate rendering (see Section 3.5)

**Report progress: 10% (reading_blueprint)**

---

## 3.5. Context Extraction (MANDATORY)

Before writing any prompt, analyze the article to understand what each image should actually depict. This prevents generic stock-photo results.

**Read `generated_article.content` (full article HTML) and `generated_article.title`, then extract:**

1. **Brands/Products/Tools** — every brand name, product, software tool, service, or company mentioned. Record each with the section(s) it appears in.
2. **Key Actions/Transformations** — what the reader learns to DO (e.g., "set up Claude Code in VS Code", "analyze data with Python")
3. **Target Persona** — who is the reader in a visual scene (e.g., "developer at a desk", "startup founder in a meeting")

**Per-section extraction (for inline images):**
For each section with `image_concept != null`, identify:
- Primary brand/product/tool mentioned in that section
- Visual representation of the topic (what physical scene or object represents this section?)
- Emotional tone (drives lighting, color palette, mood)
- "At a glance" test: if a reader only sees this image, can they guess what the section is about?

**Cover extraction:**
- Primary brand/product for logo placement
- Core action/transformation for key visual
- Target persona visual
- Emotional summary for mood/lighting
- Title text (from `generated_article.title`)
- Hook promise for subtitle (max 8 words, from prep_data hook)

**Report progress: 15% (context_extracted)**

---

## 3.6. Reference Image Manifest

After Context Extraction, check `reference_images.brand[]`:

### If `brand[]` is EMPTY and Context Extraction identified brands/products:

Generate a Reference Image Manifest — a structured checklist telling the user exactly what brand assets to upload:

```
| # | Filename | Description | Used In | Required |
|---|----------|-------------|---------|----------|
| 1 | [kebab-case.png] | [What + where to find] | [Cover, Sec N] | [Wajib/Opsional] |
```

**Manifest rules:**
- Every brand identified in Context Extraction that appears in an image section MUST have an entry
- **Wajib** = brand logos (AI will hallucinate without reference). **Opsional** = UI screenshots, mood refs
- Filenames: lowercase, kebab-case, `.png`, unique
- Description includes "where to find it" (press kit, official site, screenshot from own setup)
- "Used In" tags which images need this file

**Save manifest to backend and STOP:**

```bash
curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/progress" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"step":"manifest_needed","percentage":20,"message":"Brand reference images needed. Manifest generated. Awaiting upload.","manifest":[...]}'
```

The backend surfaces this manifest in the admin panel UI. The user uploads brand images via the existing reference image upload interface (extended with a `brand[]` tab). Once uploaded, the backend calls `POST /continue-pipeline` to resume this skill.

**Do NOT proceed to prompt authoring until `brand[]` is populated.** This is a hard stop.

### If `brand[]` is POPULATED (or no brands identified):

Map brand URLs to sections based on Context Extraction output. Proceed directly to Section 4 (Filter Sections).

**Report progress: 20% (manifest_resolved)**

---

## 4. Filter Sections

- If `--only-sections` is provided (e.g., `2,4`): keep ONLY outline sections whose `position` is in the list. Used when the user edits one concept and regenerates just that prompt.
- If `--only-sections` is omitted: keep ALL sections with `image_concept != null`.
- The cover image is ALWAYS authored (see Section 6) regardless of filter, UNLESS `--only-sections` is provided and does not include position 0 (reserved for cover).

Do not author prompts for sections with `image_concept === null` — those sections intentionally have no image.

---

## 5. Authoring Rules

Every prompt MUST follow the 8-element WOW framework and 5-paragraph structure from `image-prompt-guide.md` (in your system prompt). Target length: **300-500 words per prompt**. Generic prompts under 200 words are REJECTED.

Required elements:

1. **Camera specs** — lens (e.g., 35mm / 50mm / 85mm), aperture (f/1.4 - f/8), angle, depth of field
2. **Lighting pattern** — named pattern + ratio + Kelvin temperatures (e.g., "Rembrandt lighting 3:1, 5600K key + 3200K fill")
3. **3 depth layers** — foreground / midground / background, each described with specific subject matter
4. **Film stock** — default Kodak Portra 400; specify grade and color profile
5. **Atmosphere** — volumetric light, particles, haze, humidity
6. **Material textures** — specific (brushed aluminum, linen, patinated brass) — never "metal" or "fabric"
7. **Cinematographer inspiration** — pull from cinematography-lut.md in system prompt (e.g., Deakins, Lubezki, Doyle)
8. **Emotional anchor** — a single dominant feeling that matches the section's `arc_phase`

**Context-aware prompts (MANDATORY):**
- Every prompt must reflect the SPECIFIC topic of its section — not generic scenes. Use Context Extraction output (Section 3.5) to drive visual choices.
- If a section discusses a specific brand/product/tool and `brand[]` reference images exist for that brand, include the matching `file_urls` in the prompt output and reference the brand: "incorporate the brand identity from the provided reference image, positioned at [specific location]."
- All prompts must comply with **Physical Reality Constraints** from `image-prompt-guide.md` — verify screen orientations, object physics, spatial perspective, and human anatomy in every prompt.

**Use `image_instructions` as the global style guide** — apply tone, palette, and mood overrides to every prompt. If `image_instructions` says "warm golden hour, earthy palette, analog film feel," every prompt must honor that.

**Consider `reference_images`:**
- `face[]` — if face references uploaded, weave identity preservation instructions into relevant prompts
- `style[]` — if style references uploaded, their palette/lighting direction should influence prompt phrasing
- `brand[]` — if brand references uploaded, include via `file_urls` for sections that mention the brand (mapped in Context Extraction). Never describe brand logos from memory — always use the reference image.

---

## 6. Cover Image — YouTube Thumbnail Style

Always author the cover image FIRST in the output array, unless `--only-sections` explicitly excludes position 0.

The cover functions like a **YouTube thumbnail** — it must tell the article's story at a glance. A viewer scrolling past should instantly understand what the article is about.

Cover authoring rules:

- `type` = `cover`
- `section` = `Header`
- `insert_after_heading` = `null`
- `model` = `nano-banana-pro` (OVERRIDE default — text rendering required for title)
- `concept` = thumbnail concept derived from Context Extraction output — NOT just title + hook, but the full story at a glance

**5 Required Elements in Cover Prompt:**

1. **Title Text** — `generated_article.title` rendered in-image. Position using rule-of-thirds (upper or lower third). Specify in prompt: bold, clean, sans-serif typeface. High contrast against background. Must be legible at 320px width.

2. **Subtitle / Tagline** — max 8 words derived from the article's hook or core promise (from prep_data). Positioned below title. Smaller font size. Use contrasting color or semi-transparent background strip.

3. **Key Visual** — 1 dominant visual element SPECIFIC to the article topic (from Context Extraction). Not a generic scene. If article is about Claude Code, show terminal/IDE. If about cooking, show the specific dish.

4. **Brand Logo** — if `reference_images.brand[]` contains a logo for the primary brand, include the URL in `file_urls` and instruct: "incorporate the brand identity from the provided reference image, positioned at [corner/on-screen/watermark]." If no brand refs, skip entirely.

5. **Composition** — max 3 focal points (key visual, title, optional logo). High contrast. Visual hierarchy: key visual > title > subtitle > logo. Readable at 320px.

- `style` = Photorealistic or Portrait Cinematic (default) or match article tone
- `title_text` = exact article title string (stored separately for backend use)
- `subtitle_text` = max 8 word tagline (stored separately for backend use)
- `file_urls` = array of brand reference URLs from `reference_images.brand[]`, or empty array

---

## 7. Output Format

Build a single JSON array `image_prompts[]` consumed by GeminiGen and frontend preview:

```json
[
  {
    "type": "cover",
    "section": "Header",
    "insert_after_heading": null,
    "concept": "thumbnail concept — what story at a glance",
    "prompt": "<300-500 word cinematic prompt with title/subtitle/key visual/brand>",
    "model": "nano-banana-pro",
    "style": "Photorealistic",
    "aspect_ratio": "16:9",
    "resolution": "1K",
    "title_text": "exact article title",
    "subtitle_text": "max 8 word tagline from hook",
    "file_urls": ["https://...brand-logo.png"]
  },
  {
    "type": "inline",
    "section": "<exact section title from outline>",
    "insert_after_heading": "<exact H2 heading text>",
    "concept": "<context-specific concept from extraction + outline>",
    "prompt": "<300-500 word cinematic prompt — section-specific, not generic>",
    "model": "nano-banana-2",
    "style": "Cinematic",
    "aspect_ratio": "16:9",
    "resolution": "1K",
    "file_urls": ["https://...brand-reference.png"]
  }
]
```

Field requirements:

- `insert_after_heading` — exact H2 heading text; MANDATORY for all inline images, null only for cover
- `concept` — inherit from outline, enriched with Context Extraction insights; if regenerating after user edit, use the edited concept
- `model` — cover ALWAYS `nano-banana-pro` (text rendering); inline default `nano-banana-2`, upgrade to `nano-banana-pro` for complex instructions or `imagen-4` for fine textures
- `aspect_ratio` — default `16:9`
- `resolution` — default `1K`
- `title_text` — cover only: exact article title string for in-image rendering. Null for inline.
- `subtitle_text` — cover only: max 8 word tagline from hook. Null for inline.
- `file_urls` — array of reference image URLs from `reference_images.brand[]` for images that need brand/product visuals. Empty array `[]` when no brand refs needed for this image. GeminiGen API passes these via the `file_urls` form parameter.

---

## 8. Save via Callback

POST the full array to the backend:

```bash
curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/save-image-prompts" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"idempotency_key":"{idempotency_key}","image_prompts":[ ... ]}'
```

The backend merges `image_prompts[]` into `generated_article` JSON without touching article body, metadata, or scores.

**Report progress: 80% (prompts_saved)**

---

## 9. Continue Pipeline

After the save returns 200, trigger the next phase (actual image generation by GeminiGen):

```bash
curl -s -X POST "{api_url}/automation/content-ideas/{idea_id}/continue-pipeline" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"phase":"images","next":"gemini_gen"}'
```

**Do NOT generate image files in this skill.** Image files are GeminiGen's responsibility — this skill only authors prompt text.

**Report progress: 100% (pipeline_continued)**

---

## 10. Progress Reporting

```bash
curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/progress" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"step":"{step_name}","percentage":{pct},"message":"{description}"}'
```

| Sub-step | Step Name | Percentage | Description |
|----------|-----------|-----------|-------------|
| Reading blueprint | reading_blueprint | 10 | Outline + article + instructions loaded |
| Context extracted | context_extracted | 15 | Brands/products/tools identified per section |
| Manifest resolved | manifest_resolved | 20 | Brand refs available (or manifest sent, awaiting upload) |
| Manifest needed (STOP) | manifest_needed | 20 | Brand reference images needed — manifest sent to backend, awaiting user upload |
| Authoring prompts | authoring_prompts | 40 | Expanding concepts into cinematic prompts with context + brand refs |
| Prompts saved | prompts_saved | 80 | Image prompts persisted to database |
| Pipeline continued | pipeline_continued | 100 | Handoff to GeminiGen |

**Note:** `manifest_needed` is a blocking state. The skill stops at 20% and waits for the backend to call `POST /continue-pipeline` after the user uploads brand reference images. The skill resumes at `manifest_resolved` (20%) and continues to `authoring_prompts` (40%).

---

## Error Handling

If any step fails:

```bash
curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/progress" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"step":"failed","percentage":{last_pct},"message":"Error at {step_name}: {error_detail}"}'
```

Do NOT call continue-pipeline on failure.
