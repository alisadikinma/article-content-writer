---
name: article-seo
description: SEO analysis and optimization for any article. Scores 6 SEO metrics using traffic light system (green/amber/red). Use when the user wants to check SEO, analyze keyword density, optimize title, or improve search ranking of an existing article. Triggers on SEO, keyword, search optimization, density check, title optimization, cek SEO, or any SEO-related request.
---

# Article SEO — Search Optimization Analyzer

Standalone SEO analysis and optimization. Scores 6 metrics using a green/amber/red traffic light system with minimum 4/6 to pass.

## Reference Files

| File | When to Read |
|------|-------------|
| `references/global-config.md` | ALWAYS — read FIRST for language, readability target, and all configurable values |
| `references/seo-rules-engine.md` | ALWAYS — traffic light thresholds, scoring logic, and per-metric optimization strategies |
| `references/style-guide.md` | During optimization — maintain readability and natural language when weaving keywords |

## Workflow

### Step 1 — INPUT

1. Read `references/global-config.md` first.
2. Read `references/seo-rules-engine.md` for scoring thresholds.
3. Collect from the user:
   - **Article text** — pasted directly or provided as a file path. If file path, read the file.
   - **Target keyword** — REQUIRED. Ask explicitly if not provided.
4. Extract the article title (first H1 heading) and full body text.
5. Confirm the target keyword with the user before proceeding.

### Step 2 — SEO ANALYSIS

Score all 6 metrics using the traffic light system from `seo-rules-engine.md`. Calculate exact values for each.

#### Metric 1: Title Length (character count)

Count the total characters in the article title (excluding the `#` markdown prefix and leading/trailing whitespace).

| Status | Range | Points |
|--------|-------|--------|
| GREEN | 50-60 characters | 1 |
| AMBER | 40-49 or 61-70 characters | 0.5 |
| RED | <40 or >70 characters | 0 |

#### Metric 2: Keyword in Title

Check if the target keyword appears in the title (case-insensitive match).

| Status | Condition | Points |
|--------|-----------|--------|
| GREEN | Keyword found in title | 1 |
| RED | Keyword not found in title | 0 |

#### Metric 3: Title Word Count

Count the number of words in the article title.

| Status | Range | Points |
|--------|-------|--------|
| GREEN | 6-10 words | 1 |
| AMBER | 5 words or 11-12 words | 0.5 |
| RED | <5 or >12 words | 0 |

#### Metric 4: Body Keyword Density

Calculate: `(keyword occurrences in body / total body words) x 100`. Count only body text — exclude the title, headings, image prompts, and metadata. For multi-word keywords, count each full-phrase occurrence.

| Status | Range | Points |
|--------|-------|--------|
| GREEN | 0.5%-1.5% | 1 |
| AMBER | 0.3%-0.49% or 1.51%-2.5% | 0.5 |
| RED | <0.3% or >2.5% (stuffing) | 0 |

#### Metric 5: Keyword in First 100 Words

Check if the target keyword appears within the first 100 words of the body text (case-insensitive). The first 100 words start after the title, from the first paragraph of body content.

| Status | Condition | Points |
|--------|-----------|--------|
| GREEN | Keyword found in first 100 words | 1 |
| RED | Keyword not found in first 100 words | 0 |

#### Metric 6: Keyword in H2/H3 Headings

Count how many H2 (`##`) and H3 (`###`) headings contain the target keyword (case-insensitive).

| Status | Count | Points |
|--------|-------|--------|
| GREEN | 1-2 headings contain keyword | 1 |
| AMBER | 0 headings contain keyword | 0.5 |
| RED | >3 headings contain keyword (stuffing) | 0 |

### Step 3 — REPORT

Generate the full SEO analysis report:

1. **Overall verdict**: Sum all points. PASS if >= 4/6, NEEDS OPTIMIZATION if < 4/6.
2. **Traffic light table**: All 6 metrics with exact measured values, status color, and points awarded.
3. **Recommendations for RED metrics**: Specific, actionable fix with a concrete example rewrite. Not generic advice — show exactly what to change and what the result would look like.
4. **Suggestions for AMBER metrics**: Improvement suggestion explaining what would push the metric to GREEN.
5. **Strengths**: Call out what is already well-optimized so the user knows what to keep.
6. **Overall assessment**: 2-3 sentence summary of the article's SEO health and the highest-impact action to take.

### Step 4 — OPTIONAL OPTIMIZATION

Only proceed if the user explicitly requests fixes to be applied. Do not auto-optimize.

For each RED or AMBER metric, apply the appropriate optimization strategy:

- **Title too short** — Expand with descriptive modifiers or the target keyword while keeping the information gap hook style. Keep under 60 characters.
- **Title too long** — Trim filler words, condense phrases, remove redundant modifiers. Aim for 50-60 characters.
- **Keyword missing from title** — Integrate the keyword naturally, preferably near the front of the title. Never force awkward phrasing.
- **Title word count off** — Restructure to hit 6-10 words while maintaining clarity and keyword presence.
- **Density too low** — Add keyword mentions in natural positions: topic sentences, transitional sentences, summary paragraphs. Use the keyword and close semantic variants.
- **Density too high** — Replace excess occurrences with synonyms, pronouns, or semantic equivalents. Prioritize removing keyword instances from positions where they feel forced.
- **Keyword missing from first 100 words** — Weave the keyword into the opening paragraph naturally, ideally within the first two sentences.
- **No keyword in headings** — Add the keyword to 1-2 H2/H3 headings where it fits the section topic. Choose headings where the keyword contextually belongs.
- **Keyword stuffed in headings** — Remove keyword from headings where it feels redundant or forced. Keep it in the 1-2 most relevant headings only.

Read `references/style-guide.md` before making any text changes to ensure:
- Readability is maintained at the target grade level from `global-config.md`
- No forbidden vocabulary is introduced
- Natural conversational tone is preserved
- Changes do not disrupt the article's flow or emotional arc

Present every change as a before/after pair so the user can review.

### Step 5 — RE-SCORE

After optimization is applied, re-run the full 6-metric analysis on the updated article:

1. Score all 6 metrics again with exact values.
2. Present a before/after comparison table showing:
   - Old value vs. new value for each metric
   - Old status vs. new status
   - Old points vs. new points
3. Show the overall score change (e.g., 3/6 -> 5.5/6).
4. Highlight which metrics improved and by how much.
5. If any metrics are still RED or AMBER, note what further action could help.

## Output Format

```
## SEO Analysis Report — [PASS / NEEDS OPTIMIZATION]
**Target Keyword:** [keyword]
**Article:** [title]

### SEO Score: [N]/6
| # | Metric | Value | Status | Points |
|---|--------|-------|--------|--------|
| 1 | Title Length | [N] chars | [GREEN/AMBER/RED] | [1/0.5/0] |
| 2 | Keyword in Title | [Yes/No] | [GREEN/RED] | [1/0] |
| 3 | Title Words | [N] words | [GREEN/AMBER/RED] | [1/0.5/0] |
| 4 | Body Keyword Density | [N]% ([count]/[total]) | [GREEN/AMBER/RED] | [1/0.5/0] |
| 5 | Keyword in First 100 | [Yes/No] | [GREEN/RED] | [1/0] |
| 6 | Keyword in Headings | [N] times | [GREEN/AMBER/RED] | [1/0.5/0] |

### Recommendations
[For each RED metric: specific actionable fix with example rewrite]
[For each AMBER metric: improvement suggestion to reach GREEN]

### Strengths
[What is already well-optimized — list GREEN metrics and why they work]

### Overall Assessment
[2-3 sentence summary: SEO health, biggest win, highest-impact next action]
```

For re-scores after optimization, use this extended format:

```
## SEO Re-Score — Before vs. After

### Score: [old]/6 → [new]/6
| # | Metric | Before | After | Status Change | Points |
|---|--------|--------|-------|---------------|--------|
| 1 | Title Length | [old] chars ([STATUS]) | [new] chars ([STATUS]) | [same/improved] | [old] → [new] |
| 2 | Keyword in Title | [old] ([STATUS]) | [new] ([STATUS]) | [same/improved] | [old] → [new] |
| 3 | Title Words | [old] words ([STATUS]) | [new] words ([STATUS]) | [same/improved] | [old] → [new] |
| 4 | Body Keyword Density | [old]% ([STATUS]) | [new]% ([STATUS]) | [same/improved] | [old] → [new] |
| 5 | Keyword in First 100 | [old] ([STATUS]) | [new] ([STATUS]) | [same/improved] | [old] → [new] |
| 6 | Keyword in Headings | [old] ([STATUS]) | [new] ([STATUS]) | [same/improved] | [old] → [new] |

### Summary
[Which metrics improved, overall delta, any remaining issues]
```

## Rules

- NEVER skip a metric. Score all 6 every time.
- NEVER inflate scores — if a value is borderline, score conservatively and explain why.
- NEVER force keywords at the expense of readability. Natural language always wins.
- NEVER auto-optimize without the user's explicit request. Analysis is default; optimization is opt-in.
- ALWAYS read `references/global-config.md` and `references/seo-rules-engine.md` before starting.
- ALWAYS report exact values — character counts, word counts, occurrence counts, density percentages to two decimal places.
- ALWAYS provide specific fix examples for RED metrics with concrete before/after rewrites, not generic advice.
- ALWAYS confirm the target keyword with the user before running analysis.
- ALWAYS count multi-word keywords as full-phrase matches only (e.g., "content marketing" counts only where both words appear together in that order).
- ALWAYS exclude markdown formatting characters (`#`, `**`, `_`, etc.) when counting title characters.
- ALWAYS use case-insensitive matching for all keyword checks.
- ALWAYS read `references/style-guide.md` before applying any text optimizations to preserve readability.
