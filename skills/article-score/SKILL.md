---
name: article-score
description: "Pipeline-only skill for article generation Step 5 (Five Gates + Combined 100-Point Score). Runs on Sonnet with refs-score.md injected via --append-system-prompt-file. Reads article from backend API, scores all 5 gates, fixes failures, sends completion callback. Part of the split pipeline: article-prep → article-write → article-score."
---

# Article Score Skill (Step 5)

Pipeline-only skill that handles Five-Gate Scoring, fix-and-re-score loops, and completion callback for the split article generation pipeline. Designed to run on **Sonnet** for speed.

> **DO NOT read reference files with the Read tool.** All references (style-guide, seo-rules-engine, virality-triggers, quality-gate) are injected via `--append-system-prompt-file refs-score.md`. They are already in your system prompt. Reading them again wastes time and tokens.

---

## 1. Pipeline Flags (Required)

| Flag | Required | Description |
|------|----------|-------------|
| `--idea-id {id}` | Yes | Content idea ID in the Portfolio database |
| `--api-url {url}` | Yes | Base API URL (e.g., `https://alisadikinma.com/api`) |
| `--api-token {token}` | Yes | Authentication bearer token |

All article data comes from the database (saved by `/article-write`).

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
| Virality scored | virality_scored | 90 | 5 virality triggers evaluated |
| Quality scored | quality_scored | 94 | 10 quality criteria evaluated |
| SEO + GEO scored | seo_scored | 97 | 6 SEO + 5 GEO metrics evaluated |
| All gates passed | completed | 100 | Combined score calculated, completion sent |

---

## 3. Startup — Fetch Article Data

On start, fetch the article and prep data:

```bash
curl -s -X GET "{api_url}/automation/content-ideas/{idea_id}" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json"
```

Extract from the response:
- `generated_article.title` — article title
- `generated_article.content` — full article HTML
- `generated_article.word_count` — word count
- `generated_article.keyword` — target SEO keyword
- `generated_article.framework` — framework used
- `generated_article.template` — template used
- `generated_article.hook_type` — hook type used
- `generated_article.hook_boost` — hook engagement boost
- `generated_article.emotional_arc` — arc used
- `generated_article.image_prompts` — image prompt array
- `generated_article.prep_data.research_data` — research data for completion callback

---

## 4. Five-Gate Scoring

Score the article against ALL five gates using the rubrics in your system prompt.

### Gate 1 — Virality Score (5 triggers, min 3/5)

Score each trigger as PASS or FAIL with evidence:

1. **Social Currency** — exclusive/insider info that makes sharer look smart
2. **High-Arousal Emotion** — awe, excitement, productive anger (NOT contentment)
3. **Practical Utility** — [Number]+[Superlative]+[Timeframe]+[Outcome] formula present
4. **Identity Signaling** — reader can share to reinforce professional identity
5. **Cognitive Gap Closure** — narrative tension resolves satisfyingly

**Report progress: 90% (virality_scored)**

### Gate 2 — Quality Gate (10 criteria, min 7/10)

Score each criterion as PASS or FAIL with notes:

1. **Clear** — Grade 5 readable
2. **Concise** — tight writing, no fluff
3. **Compelling** — specific pain point in first 100 words
4. **Credible** — 1+ citation per 400 words
5. **Nested Loops** — 3+ unresolved in first 500 words
6. **Bucket Brigades** — own lines with colons, 3+ present
7. **Emotional Arc** — fast hook / slow build pattern
8. **Scannability** — headers every 200-300 words, paragraphs max 4 lines
9. **Benefit-First + Actionable Depth** — "So What?" + "Now What?" tests pass
10. **Dual CTA** — Direct + Transitional present

**Report progress: 94% (quality_scored)**

### Gate 3 — SEO Score (6 metrics, min 4/6)

Score each metric with traffic light (GREEN/AMBER/RED):

1. **Title Length** — Green: 50-60 chars, Amber: 40-50/60-70, Red: <40/>70
2. **Keyword in Title** — Green: present, Red: missing
3. **Title Words** — Green: 6-10, Amber: 5/11-12, Red: <5/>12
4. **Body Keyword Density** — Green: 0.5-1.5%, Amber: 0.3-0.5%/1.5-2.5%, Red: <0.3%/>3%
5. **Keyword in First 100** — Green: present, Red: missing
6. **Keyword in Headings** — Green: 1-2, Amber: 0, Red: >3

### Gate 4 — AI Humanization Score (20 points, deduction-based)

Base score: 20. Deduct for violations:

- **Tier 1 violations:** -2 per word found (max -10). The 53 always-replace words per style-guide in system prompt.
- **Tier 2 cluster violations:** -1 per paragraph with 2+ Tier 2 words (max -5). The 42 cluster-flag words.
- **Tier 3 density violations:** -1 per word exceeding 3% density (max -3). The 12 density-flag words.
- **AI pattern violations:** -0.5 per category detected (max -2). The 36 pattern categories (10 structural + 12 language + 8 tone + 6 advanced).

Final score: max(0, 20 - total_deductions)

### Gate 5 — GEO Score (5 metrics, traffic light)

1. **Answer-First H2s** — Green: all H2s comply, Amber: 50%+, Red: <50%
2. **Passage Citability** — Green: all key sections extractable, Amber: most, Red: few
3. **FAQ Presence** — Green: 2+ pairs, Amber: 1 pair, Red: none
4. **Entity Clarity** — Green: all claims specific, Amber: most, Red: vague
5. **Freshness Signals** — Green: 3+ current-year refs, Amber: 1-2, Red: none

**Report progress: 97% (seo_scored)**

---

## 5. Combined Score (100-point weighted)

Calculate the combined score:

| Category | Raw | Weight | Max Points |
|----------|-----|--------|-----------|
| Content Quality | [Quality Gate]/10 | x3 | 30 |
| Virality | [Virality Score]/5 | x4 | 20 |
| SEO | [SEO Score]/6 | x2.5 | 15 |
| AI Humanization | [Humanization]/20 | x1 | 20 |
| GEO/AEO | [GEO Score]/5 | x3 | 15 |
| **Total** | | | **100** |

**Bands:** Exceptional (90-100), Strong (80-89), Acceptable (70-79), Below Standard (60-69), Rewrite (<60)

**Minimum to publish: Combined Score >= 70 (Acceptable)**

---

## 6. Fix-and-Re-Score Loop

If ANY blocking gate fails (Virality <3/5, Quality <7/10, SEO <4/6, or Combined <70):

1. Identify the lowest-scoring gate (highest weighted impact on combined score)
2. Apply fix strategies from the rubric references in system prompt
3. Revise the article content
4. Re-score ONLY the failed gate(s)
5. Recalculate combined score
6. Repeat until all blocking gates pass AND combined >= 70

If the article was revised, save the updated version:

```bash
curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/save-article" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"title": "...", "content": "<updated article>", "word_count": ..., "keyword": "..."}'
```

---

## 7. Completion Callback

After all gates pass and combined >= 70, send the FULL completion callback:

```bash
curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/complete" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{COMPLETION_JSON}'
```

**Completion JSON structure:**

```json
{
  "article": {
    "title": "Article Title",
    "content": "<full HTML content>",
    "keyword": "target keyword",
    "word_count": 2100,
    "citation_count": 6,
    "image_count": 4,
    "framework": "PASO",
    "template": "How-To",
    "hook_type": "Curiosity Gap",
    "hook_boost": "+45%",
    "emotional_arc": "Discovery"
  },
  "seo_analysis": {
    "score": 5,
    "max_score": 6,
    "pass": true,
    "keyword": "target keyword",
    "metrics": {
      "title_length": {"value": 55, "status": "good"},
      "keyword_in_title": {"value": true, "status": "good"},
      "title_word_count": {"value": 8, "status": "good"},
      "body_keyword_density": {"value": 1.2, "status": "good"},
      "keyword_in_first_100": {"value": true, "status": "good"},
      "keyword_in_headings": {"value": 2, "status": "good"}
    }
  },
  "virality_score": {
    "score": 4,
    "max_score": 5,
    "pass": true,
    "triggers": {
      "social_currency": {"pass": true, "evidence": "description"},
      "high_arousal_emotion": {"pass": true, "evidence": "description"},
      "practical_utility": {"pass": true, "evidence": "description"},
      "identity_signaling": {"pass": true, "evidence": "description"},
      "cognitive_gap_closure": {"pass": false, "evidence": "description"}
    }
  },
  "quality_gate": {
    "score": 9,
    "max_score": 10,
    "pass": true,
    "criteria": {
      "clear": {"pass": true, "evidence": "description"},
      "concise": {"pass": true, "evidence": "description"},
      "compelling": {"pass": true, "evidence": "description"},
      "credible": {"pass": true, "evidence": "description"},
      "nested_loops": {"pass": true, "evidence": "description"},
      "bucket_brigades": {"pass": true, "evidence": "description"},
      "emotional_arc": {"pass": true, "evidence": "description"},
      "scannability": {"pass": true, "evidence": "description"},
      "benefit_first": {"pass": true, "evidence": "description"},
      "dual_cta": {"pass": false, "evidence": "description"}
    }
  },
  "ai_humanization": {
    "score": 18,
    "max_score": 20,
    "tier1_violations": [],
    "tier2_clusters": 0,
    "tier3_density_issues": [],
    "pattern_violations": []
  },
  "geo_score": {
    "score": 4,
    "max_score": 5,
    "metrics": {
      "answer_first_h2s": {"value": "5/6", "status": "good"},
      "passage_citability": {"value": "all key sections extractable", "status": "good"},
      "faq_presence": {"value": 2, "status": "good"},
      "entity_clarity": {"value": "all claims specific", "status": "good"},
      "freshness_signals": {"value": 3, "status": "good"}
    }
  },
  "combined_score": {
    "score": 85,
    "max_score": 100,
    "band": "Strong",
    "pass": true
  },
  "image_prompts": [
    {
      "type": "cover",
      "section": "Header",
      "concept": "concept",
      "prompt": "image prompt text",
      "model": "nano-banana-pro",
      "style": "Photorealistic",
      "aspect_ratio": "16:9",
      "resolution": "1K"
    }
  ],
  "research_data": {
    "key_data_points": ["data points"],
    "primary_pain_point": "pain point",
    "sources": [{"name": "source", "url": "url"}]
  }
}
```

**Report progress: 100% (completed)**

---

## 8. Error Handling

If any step fails:

```bash
curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/progress" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"step":"failed","percentage":{last_pct},"message":"Error at {step_name}: {error_detail}"}'
```
