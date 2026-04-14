---
name: article-images
description: "Pipeline-only skill for Gate 2 image prompt authoring. Reads article + outline blueprint from backend, expands per-section image_concept into 300-500 word cinematic prompts (8-element WOW + 5-paragraph structure). Runs on Sonnet with refs-images.md injected. Part of split pipeline: article-prep → article-write → article-score → [Gate 1] → article-images → GeminiGen."
---

# Article Images Skill (Gate 2 — Image Prompt Authoring)

Pipeline-only skill that expands per-section `image_concept` blueprints into full 300-500 word cinematic image prompts. Runs AFTER the user approves the article at Gate 1 and BEFORE GeminiGen generates the actual image files.

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
- `reference_images` — object with `face[]` + `style[]` arrays of uploaded reference URLs (may be empty)

**Report progress: 10% (reading_blueprint)**

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

**Use `image_instructions` as the global style guide** — apply tone, palette, and mood overrides to every prompt. If `image_instructions` says "warm golden hour, earthy palette, analog film feel," every prompt must honor that.

**Consider `reference_images`** — if `face[]` contains uploaded references, identity preservation instructions should be woven into relevant prompts. If `style[]` contains mood references, their palette/lighting direction should influence prompt phrasing.

---

## 6. Cover Image

Always author the cover image FIRST in the output array, unless `--only-sections` explicitly excludes position 0.

Cover authoring rules:

- `type` = `cover`
- `section` = `Header`
- `insert_after_heading` = `null`
- `concept` = visual metaphor derived from `generated_article.title` + hook
- `prompt` = full 300-500 word cinematic prompt (same rules as Section 5)
- `style` = Photorealistic (default) or match article tone

---

## 7. Output Format

Build a single JSON array `image_prompts[]` matching the existing schema (same shape already consumed by GeminiGen and frontend preview):

```json
[
  {
    "type": "cover",
    "section": "Header",
    "insert_after_heading": null,
    "concept": "visual metaphor from article title + hook",
    "prompt": "<300-500 word cinematic prompt>",
    "model": "nano-banana-2",
    "style": "Photorealistic",
    "aspect_ratio": "16:9",
    "resolution": "1K"
  },
  {
    "type": "inline",
    "section": "<exact section title from outline>",
    "insert_after_heading": "<exact H2 heading text>",
    "concept": "<from outline section image_concept>",
    "prompt": "<300-500 word cinematic prompt>",
    "model": "nano-banana-2",
    "style": "Cinematic",
    "aspect_ratio": "16:9",
    "resolution": "1K"
  }
]
```

Field requirements:

- `insert_after_heading` — exact H2 heading text; MANDATORY for all inline images, null only for cover
- `concept` — inherit from outline; if regenerating after user edit, use the edited concept
- `model` — default `nano-banana-2`; may upgrade to `nano-banana-pro` for complex text rendering or `imagen-4` for fine nature textures
- `aspect_ratio` — default `16:9`
- `resolution` — default `1K`

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
| Authoring prompts | authoring_prompts | 40 | Expanding concepts into cinematic prompts |
| Prompts saved | prompts_saved | 80 | Image prompts persisted to database |
| Pipeline continued | pipeline_continued | 100 | Handoff to GeminiGen |

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
