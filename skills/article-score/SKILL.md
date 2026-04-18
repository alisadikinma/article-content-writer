---
name: article-score
description: "Pipeline-only skill for article generation Step 5 (Five Gates + Combined 100-Point Score). Runs on Sonnet with refs-score.md injected via --append-system-prompt-file. Reads article from backend API, scores all 5 gates, fixes failures, sends completion callback. Part of the split pipeline: article-prep → article-write → article-score."
---

# Article Score Skill (Step 5)

Pipeline-only skill that handles Five-Gate Scoring, fix-and-re-score loops, and completion callback for the split article generation pipeline. Designed to run on **Sonnet** for speed.

> **DO NOT read reference files with the Read tool.** All references (style-guide, seo-rules-engine, virality-triggers, quality-gate) are injected via `--append-system-prompt-file refs-score.md`. They are already in your system prompt. Reading them again wastes time and tokens.

> **Output discipline — TWO pieces only:** (1) bullet-style evidence in §4 format, (2) the JSON completion callback in §7. No markdown tables. No executive summary. No restating scores in a final section. The evidence bullets reuse the same strings as the JSON `evidence` fields — compose each sentence once, quote it in both places.

> **Trust the mechanical scores.** SEO metrics (title length, keyword counts, density), Tier 1/2/3 word counts, FAQ count, and freshness signal count are computed by the backend before you run. Re-counting them yourself wastes 3-5 minutes per article with no quality gain — the backend regex is exact; your estimates are approximate.

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

## 3. Startup — Fetch Article Data + Mechanical Scores

On start, run TWO fetches in parallel. The first gives you the article; the second gives you pre-computed mechanical metrics so you can skip string counting / regex work and focus on subjective judgment.

**Fetch 1 — article data:**

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
- `generated_article.framework` / `template` / `hook_type` / `hook_boost` / `emotional_arc`
- `generated_article.image_prompts` — image prompt array
- `generated_article.prep_data.research_data` — research data for completion callback

**Fetch 2 — mechanical scores (pre-computed by backend):**

```bash
curl -s -X GET "{api_url}/automation/content-ideas/{idea_id}/mechanical-scores" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json"
```

Response structure:

```json
{
  "success": true,
  "data": {
    "word_count": 2191,
    "seo": {
      "title_length": {"value": 53, "status": "green"},
      "keyword_in_title": {"value": true, "status": "green"},
      "title_word_count": {"value": 9, "status": "green"},
      "body_keyword_density": {"value": 0.64, "occurrences": 14, "status": "green"},
      "keyword_in_first_100": {"value": true, "status": "green"},
      "keyword_in_headings": {"value": 2, "status": "green"}
    },
    "freshness_signals": 21,
    "faq_pair_count": 2,
    "h2_count": 11,
    "h3_count": 10,
    "ai_humanization": {
      "tier1_violations": [],
      "tier1_violation_count": 0,
      "tier2_clusters": 0,
      "tier2_cluster_paragraphs": [],
      "tier3_density_issues": [],
      "note": "Tier word lists are English-specific; skipped for Indonesian article."
    },
    "language": "id"
  }
}
```

**USE the mechanical scores directly** for SEO (Gate 3), Freshness Signals (part of Gate 5), and Tier 1/2/3 word counting (part of Gate 4). Do NOT re-count these yourself — the backend already did it accurately.

---

## 4. Five-Gate Scoring — Bullet Evidence Format

Score the article against all five gates. **Output format: ONE pass through the article, producing a short bullet list of evidence per gate.** Do NOT compose markdown tables. The evidence strings you produce here get reused verbatim in the JSON callback (§7) — write each bullet so it reads well as both a log entry and a JSON "evidence" string (one complete sentence, 15-40 words).

### Gate 1 — Virality Score (5 triggers, min 3/5)

Read the article ONCE. For each trigger, write a single-line bullet: `pass|fail — evidence sentence`.

1. **Social Currency** — exclusive/insider info that makes sharer look smart
2. **High-Arousal Emotion** — awe, excitement, productive anger (NOT contentment)
3. **Practical Utility** — [Number]+[Superlative]+[Timeframe]+[Outcome] formula present
4. **Identity Signaling** — reader can share to reinforce professional identity
5. **Cognitive Gap Closure** — narrative tension resolves satisfyingly

Output:

```
Virality (X/5):
- social_currency: pass — First-hand curation + insider data (Cursor 1.42x, $4.7B market).
- high_arousal_emotion: pass — Productive anxiety in first 50 words: "...tertinggal...".
- practical_utility: pass — 10-tool formula + install commands + "coba 3 hari" timeframe.
- identity_signaling: pass — 5 dev personas explicitly named.
- cognitive_gap_closure: pass — 5 loops opened first 500w, all resolved.
```

**Report progress: 90% (virality_scored)**

### Gate 2 — Quality Gate (10 criteria, min 7/10)

Same format — bullet per criterion. One line each.

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

### Gate 3 — SEO Score (6 metrics) — USE MECHANICAL

Do NOT recompute. Copy directly from `mechanical_scores.seo`. Map `status: green` → `pass`, `amber` → `pass` (but note in evidence), `red` → `fail`.

```
SEO (X/6):
- title_length: pass — 53 chars (green, target 50-60).
- keyword_in_title: pass — keyword present.
- ... (one line per metric, pulled from mechanical data)
```

Count passes. SEO score = number of `green` + `amber` among 6 (any `red` = not pass for that metric).

### Gate 4 — AI Humanization Score (20 points, deduction-based) — PARTIAL MECHANICAL

**Mechanical (backend computed — use directly):**
- Tier 1 count = `mechanical_scores.ai_humanization.tier1_violation_count` → deduct 2 per violation, max -10
- Tier 2 clusters = `mechanical_scores.ai_humanization.tier2_clusters` → deduct 1 per cluster, max -5
- Tier 3 density issues = count of `mechanical_scores.ai_humanization.tier3_density_issues` → deduct 1 per issue, max -3

**Subjective (you judge):**
- AI pattern categories — scan for the 36 categories (10 structural + 12 language + 8 tone + 6 advanced) from style-guide in system prompt. Deduct -0.5 per category detected, max -2.

Final score: `max(0, 20 - total_deductions)`.

If backend noted "Tier word lists English-specific; skipped for Indonesian" — score tier portions as 0 deductions (article not in English).

Output:

```
AI Humanization (XX/20):
- tier1_deduction: -0 (mechanical: 0 violations).
- tier2_deduction: -0 (mechanical: 0 clusters).
- tier3_deduction: -0 (mechanical: 0 density issues).
- ai_pattern_deduction: -0 (judged: no categories detected).
```

### Gate 5 — GEO Score (5 metrics) — MIXED MECHANICAL + JUDGMENT

- **Answer-First H2s** — judge. You read H2 openers; verify each starts with a 40-60 word stat-rich answer.
- **Passage Citability** — judge. Are 50-150 word chunks extractable as standalone answers?
- **FAQ Presence** — MECHANICAL. Use `mechanical_scores.faq_pair_count`. Green: 2+, Amber: 1, Red: 0.
- **Entity Clarity** — judge. Are claims tied to named entities (sources, tools, companies)?
- **Freshness Signals** — MECHANICAL. Use `mechanical_scores.freshness_signals`. Green: 3+, Amber: 1-2, Red: 0.

Output one bullet per metric.

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

After all gates pass and combined >= 70, send the FULL completion callback. **Reuse the exact evidence strings** from your §4 bullet output — don't compose new sentences. The mechanical metrics (SEO values, FAQ count, freshness count, Tier counts) come from `mechanical_scores` — paste values directly.

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
