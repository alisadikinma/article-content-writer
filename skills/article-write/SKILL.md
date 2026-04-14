---
name: article-write
description: "Pipeline-only skill for article generation Step 4 (Write + Polish + Image Prompts). Runs on Sonnet/Opus with refs-write.md injected via --append-system-prompt-file. Reads prep data from backend API, writes full article with image prompt text. Image files generated separately after approval. Part of the split pipeline: article-prep → article-write → article-score."
---

# Article Write Skill (Step 4)

Pipeline-only skill that handles Writing, Polishing, and Image Prompt generation for the split article generation pipeline. Image *files* are generated separately after article approval (not in this step).

> **DO NOT read reference files with the Read tool.** All references (global-config, style-guide, retention-engine, seo-rules-engine) are injected via `--append-system-prompt-file refs-write.md`. They are already in your system prompt. Reading them again wastes time and tokens.

---

## 1. Pipeline Flags (Required)

| Flag | Required | Description |
|------|----------|-------------|
| `--idea-id {id}` | Yes | Content idea ID in the Portfolio database |
| `--api-url {url}` | Yes | Base API URL (e.g., `https://alisadikinma.com/api`) |
| `--api-token {token}` | Yes | Authentication bearer token |

All other inputs (topic, keyword, framework, hooks, outline, research data) come from the prep data stored in the database.

---

## 2. Progress Reporting

```bash
curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/progress" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"step":"{step_name}","percentage":{pct},"message":"{description}"}'
```

| Sub-step | Step Name | Percentage | Description |
|----------|-----------|-----------|-------------|
| Writing started | writing_started | 50 | Prep data loaded, writing begins |
| Draft complete | draft_complete | 70 | First draft with all rules applied |
| Style pass done | style_pass | 78 | AI humanization + readability verified |
| SEO pass done | seo_pass | 85 | Keyword placement + GEO formatting verified |

---

## 3. Startup — Fetch Prep Data

On start, fetch the prep data saved by `/article-prep`:

```bash
curl -s -X GET "{api_url}/automation/content-ideas/{idea_id}" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json"
```

Extract from the response:
- `generated_article.prep_data.topic` — article topic
- `generated_article.prep_data.keyword` — confirmed SEO keyword
- `generated_article.prep_data.languages` — output languages
- `generated_article.prep_data.instructions` — custom instructions (if any)
- `generated_article.prep_data.research_data` — all data points, sources, pain point
- `generated_article.prep_data.framework` — selected copywriting framework
- `generated_article.prep_data.template` — selected content template
- `generated_article.prep_data.hooks` — primary/secondary/wildcard hooks (use primary)
- `generated_article.prep_data.emotional_arc` — selected arc
- `generated_article.prep_data.arc_pacing` — pacing plan
- `generated_article.prep_data.outline` — full section outline with retention, citations, image concepts

**Report progress: 50% (writing_started)**

---

## 4. Hard Rules (NON-NEGOTIABLE)

These 20 rules apply during writing. All reference details are in your system prompt.

1. **NEVER use forbidden vocabulary.** The following words are permanently banned: Unlock, Unleash, Supercharge, Empower, Enhance, Exceed, Maximize. Replace immediately with concrete alternatives.

2. **ALWAYS Grade 5 readability.** Flesch-Kincaid age 9-11. Short words, short sentences, active voice.

3. **ALWAYS minimum 1 data point per 400 words (E-E-A-T).** Use ONLY data from prep_data.research_data. Do NOT run new web searches.

4. **ALWAYS 3+ open loops in first 500 words (Zeigarnik Effect).**

5. **NEVER use summary-style headers.** Every header creates an information gap.

6. **ALWAYS place bucket brigades on own lines ending with colon.**

7. **ALWAYS max 3-4 line paragraphs.**

8. **ALWAYS pass "So What?" test per section.**

9. **ALWAYS dual CTA (Direct + Transitional) at article end.**

10. **ALWAYS 20% fluff reduction mindset.** Write tight from the start.

11. **NO additional web searches.** Use ONLY data from prep_data.research_data. If a claim can't be supported, rephrase using available data or remove.

12. **NEVER exceed 25 words in hook (15 preferred).**

13. **Virality awareness.** Write with the 5 virality triggers in mind (scored in article-score).

14. **ALWAYS plan Completion-to-Share resolution.**

15. **ALWAYS target high-arousal emotions (awe, excitement, productive anger).**

16. **ALWAYS include Practical Utility section.** [Number]+[Superlative]+[Timeframe]+[Outcome].

17. **SEO awareness.** Place keyword per seo-rules-engine in system prompt (scored in article-score).

18. **ALWAYS Actionable Depth in numbered sections.** What+How+Example+Outcome, 150-250 words per point.

19. **ALWAYS apply AI Humanization during writing.** Zero Tier 1 words (52 words). Max 1 Tier 2 per paragraph (43 words). Tier 3 under 3% density (12 words). Zero detectable AI patterns from 36 categories. See style-guide in system prompt.

20. **ALWAYS apply GEO/AEO formatting.** Answer-First H2s (40-60 word openers), Passage Citability (50-150 word chunks), 2+ FAQ pairs, Entity Clarity, 3+ Freshness Signals. See seo-rules-engine in system prompt.

---

## 5. Writing Process

### Opening
- First line MUST be short (5-8 words) — Slippery Slide
- Hook from prep_data.hooks.primary delivered in first 1-2 sentences
- 3+ open loops in first 500 words

### Per-Section (follow outline from prep_data)
- Follow template section structure from prep_data.template
- Bucket brigades at every transition (own line, colon)
- Pattern interrupts every 300-400 words
- Nested loops: new thread opens before previous resolves
- "Trailer Moments" mid-section previewing upcoming content
- Neurotransmitter targeting per section (per outline)
- Citations woven naturally from prep_data.research_data
- Zeigarnik cliffhanger at end of each section (except final)
- Actionable Depth for numbered sections

### Section-Bound Image Analysis (per H2 section)
After writing each H2 section, decide if this section needs an image:

**Decision criteria (all must be true):**
1. Minimum 1 text-only section since last image (no clustering)
2. Section is at an emotional turning point (Problem→Solution, Data reveal, Story beat, CTA)
3. Under max inline image count (3 for standard ≤2200 words, 4 for long >2200 words)

**If YES — generate image prompt FROM this section's content:**
- `concept` = visual metaphor of what THIS section communicates (not generic decoration)
- `insert_after_heading` = exact H2 heading text of THIS section (MANDATORY, no exceptions)
- `style` + `mood` = matches this section's emotional arc phase (see section-to-style mapping in image-prompt-guide)
- `prompt` = 20-80 words describing a scene that SUPPORTS this section's message

**Goal:** Images are visual anchors that reinforce the section's narrative. A reader should glance at the image and immediately understand what the section is about. Images keep readers engaged through the full article length — they must be SPREAD from top to bottom, not clustered at the beginning.

### Style + AI Humanization (inline, not separate pass)
- Scan for Tier 1 words and replace on sight (see style-guide in system prompt)
- Monitor Tier 2 clusters per paragraph
- Keep Tier 3 words below 3% density
- Avoid all 36 AI pattern categories
- Grade 5 readability throughout

### SEO + GEO/AEO (inline, not separate pass)
- Title: 50-60 chars, keyword present, 6-10 words
- Keyword in first 100 words
- Keyword in 1-2 H2/H3 headings (not stuffing)
- Body density 0.5-1.5%
- GEO: Answer-First H2 openers (40-60 words, stat-rich)
- GEO: Passage Citability (50-150 word extractable chunks)
- GEO: 2+ FAQ Q&A pairs (40-60 word answers, near end before CTA)
- GEO: Entity Clarity (named sources for all claims)
- GEO: 3+ current-year references

### Final Section
- Key insight + surprise resolution (Completion-to-Share)
- Dual CTA: Direct + Transitional (from outline)

**Report progress: 70% (draft_complete)**

### Style Verification
- Scan for any remaining Tier 1 violations
- Check Tier 2 cluster density per paragraph
- Verify Grade 5 readability
- Confirm no AI patterns from 36 categories

**Report progress: 78% (style_pass)**

### SEO Verification
- Verify keyword placement (title, first 100 words, headings, body density)
- Verify GEO formatting (Answer-First H2s, FAQ pairs, entity clarity, freshness)

**Report progress: 85% (seo_pass)**

---

## 6. Completion — Save Article Data

**NOTE:** Image *files* are NOT generated in this step. The write step generates image prompt text (included in the payload below). Actual image generation happens after article approval via the admin panel's image pipeline.

**CRITICAL:** Every inline image MUST have `insert_after_heading` set to the exact H2 heading text of the section it belongs to. Images without this field will be positioned incorrectly in the preview. The concept and prompt must be derived FROM the section content — not generic stock imagery.

Save the written article:

```bash
curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/save-article" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{JSON_PAYLOAD}'
```

**JSON payload:**

```json
{
  "title": "Article Title",
  "content": "<full article content in HTML>",
  "word_count": 2100,
  "keyword": "target keyword",
  "framework": "PASO",
  "template": "How-To",
  "hook_type": "Curiosity Gap",
  "hook_boost": "+45%",
  "emotional_arc": "Discovery",
  "image_prompts": [
    {
      "type": "cover",
      "section": "Header",
      "insert_after_heading": null,
      "concept": "hero concept description",
      "prompt": "20-80 word image prompt",
      "model": "nano-banana-pro",
      "style": "Photorealistic",
      "aspect_ratio": "16:9",
      "resolution": "1K"
    },
    {
      "type": "inline",
      "section": "Section Title",
      "insert_after_heading": "The exact H2 heading text this image appears below",
      "concept": "concept description",
      "prompt": "20-80 word image prompt",
      "model": "nano-banana-pro",
      "style": "Cinematic",
      "aspect_ratio": "16:9",
      "resolution": "1K"
    }
  ]
}
```

**Single-language output:** Write the article in the PRIMARY language from prep data (first language in the list). If Indonesian (`id`), use Gen-Z Bahasa (casual, conversational, localized idioms and examples). If English (`en`), write in English. Output ONE article only — translation to other languages is handled separately after approval via Haiku (not in this step).

The JSON payload uses flat format (single language):

```json
{
  "title": "Article Title in primary language",
  "content": "<full article in primary language>",
  "language": "id",
  "word_count": 2100,
  "keyword": "target keyword",
  ...
}
```

---

## 7. Pipeline Continuation

After saving article data, trigger the scoring step:

```bash
curl -s -X POST "{api_url}/automation/content-ideas/{idea_id}/continue-pipeline" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"completed_step": "write"}'
```

---

## 8. Error Handling

If any step fails:

```bash
curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/progress" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"step":"failed","percentage":{last_pct},"message":"Error at {step_name}: {error_detail}"}'
```

Do NOT call continue-pipeline on failure.
