---
name: article-validate
description: Five-gate scoring (Quality 10-point + Virality 5-point + SEO 6-point + AI Humanization 20-point + GEO 5-point) with combined 100-point score for any article or blog post. Use when the user wants to check, score, audit, or improve an existing article's quality, shareability, search optimization, AI humanization, or GEO readiness. Triggers on validate, score, check article, quality gate, audit article, review article, virality check, SEO check, cek artikel, or any request to evaluate written content.
---

# Article Validator — Five-Gate Scoring + Combined 100-Point Score

Scores any article against five gates: Quality (10-point, min 7/10), Virality (5-point, min 3/5), SEO (6-point, min 4/6), AI Humanization (20-point), and GEO (5-point). Calculates a combined 100-point weighted score with minimum 70 to publish.

## Reference Files

- ALWAYS read: `references/global-config.md` + `references/quality-gate.md` + `references/virality-triggers.md` + `references/seo-rules-engine.md` + `references/style-guide.md`
- For detailed checks: + `references/retention-engine.md` + `references/hook-repository.md`

## Workflow: Article Validation

### Step 1 — INPUT

- User provides article text (paste or file path).
- User provides target SEO keyword (required for SEO scoring). If not provided, ask for it before proceeding.
- Read the full article.
- Confirm the article language, topic, and keyword before proceeding.
- If the article is provided as a file path, use the Read tool to load its contents.
- If the article is pasted inline, capture it in full — do not truncate.

### Step 2 — VIRALITY SCORING (5 triggers)

Read `references/virality-triggers.md` before scoring this section.

Score each trigger 0 or 1:

1. **Social Currency** — PASS if article has exclusive data, insider insights, or counterintuitive findings making sharer look knowledgeable. FAIL if generic publicly available info.
2. **High-Arousal Emotion** — PASS if dominant tone triggers awe, excitement, or productive anger. FAIL if contentment or mild interest.
3. **Practical Utility** — PASS if at least 1 section uses [Number]+[Superlative]+[Timeframe]+[Outcome]. FAIL if advice is vague/unquantified.
4. **Identity Signaling** — PASS if reader can share to reinforce professional/cultural identity. FAIL if no identity hook for any group.
5. **Cognitive Gap Closure** — PASS if narrative tension resolves satisfyingly (loops open and close with payoff). FAIL if conclusions given upfront or no tension.

For each trigger, quote the specific sentence or passage that justifies the score. If scoring 0, explain exactly what is missing and where it should appear.

### Step 2.5 — SEO SCORING (6 metrics)

Read `references/seo-rules-engine.md` before scoring this section.

Score each metric using the traffic light system (Green = 1 pt, Amber = 0.5 pt, Red = 0 pt):

1. **Title Length** — Count characters. Green: 50–60. Amber: 40–50 or 60–70. Red: <40 or >70.
2. **Keyword in Title** — Check case-insensitive presence. Green: present. Red: missing. (Binary.)
3. **Title Word Count** — Count words. Green: 6–10. Amber: 5 or 11–12. Red: <5 or >12.
4. **Body Keyword Density** — Calculate (occurrences / total words) × 100. Green: 0.5–1.5%. Amber: 0.3–0.5% or 1.5–2.5%. Red: <0.3% or >3%.
5. **Keyword in First 100 Words** — Check presence. Green: present. Red: missing. (Binary.)
6. **Keyword in H2/H3 Headings** — Count heading occurrences. Green: 1–2. Amber: 0. Red: >3 (stuffing).

For each metric, report the exact value and traffic light status. If scoring Red, explain what specifically needs to change and where.

### Step 2.7 — AI HUMANIZATION SCORING (20 points)

Read `references/style-guide.md` Rules 3 + 8 before scoring this section.

Score by deductions from a 20-point base:

1. **Tier 1 scan** — Check for ALL 52 Tier 1 words. Each found = -2 points (max -10). List every violation.
2. **Tier 2 cluster scan** — Check each paragraph for 2+ Tier 2 words. Each violating paragraph = -1 point (max -5). Quote the cluster.
3. **Tier 3 density scan** — Check each of the 12 Tier 3 words. If any exceeds 3% density = -1 point per word (max -3). Report the density.
4. **AI pattern scan** — Check for all 36 AI pattern categories. Each detected = -0.5 points (max -2). Name the pattern category and quote the offending passage.

Final score: max(0, 20 - total_deductions).

### Step 2.8 — GEO SCORING (5 metrics)

Read `references/seo-rules-engine.md` Sections 8 + 9 before scoring this section.

Score each metric using the traffic light system (Green = 1 pt, Amber = 0.5 pt, Red = 0 pt):

1. **Answer-First H2s** — Check each H2 section opening. Green: all H2s open with 40-60 word fact paragraph. Amber: 50%+ comply. Red: <50% comply.
2. **Passage Citability** — Assess whether key sections are 50-150 word self-contained extractable chunks. Green: all key sections. Amber: most. Red: few or none.
3. **FAQ Presence** — Count FAQ-format Q&A pairs with 40-60 word answers. Green: 2+. Amber: 1. Red: none.
4. **Entity Clarity** — Check whether claims name specific entities + dates. Green: all claims. Amber: most. Red: vague attributions.
5. **Freshness Signals** — Count current-year references. Green: 3+. Amber: 1-2. Red: none.

For each metric, provide specific evidence and quote examples.

### Step 3 — QUALITY SCORING (10 criteria)

Read `references/quality-gate.md` before scoring this section.

Score each criterion 0 or 1:

1. **Clear** — Grade 5 readable, jargon-free. Run a mental readability check: would a 10-year-old understand the core message? Flag any sentence with 3+ syllable jargon words that lack immediate plain-language explanation.
2. **Concise** — 20% fluff rubbed out, every sentence earns its place. Look for filler phrases ("it is important to note that", "in order to", "the fact that"), redundant adjectives, and paragraphs that repeat the same idea. Quote the worst offender.
3. **Compelling** — Addresses specific urgent pain point in first 100 words. The reader must feel "this is about MY problem" within the opening. Quote the first 100 words and identify the pain point or note its absence.
4. **Credible** — 1+ citation per 400 words, named sources. Count total word count, divide by 400, compare to actual citation count. List each citation found (source name + location in article).
5. **Nested Loops** — 3+ unresolved loops in first 500 words. A nested loop is a story, question, or promise opened but not yet resolved. Quote each loop found in the first 500 words and note where (or if) it closes later.
6. **Bucket Brigades** — On own lines with colons, 3+ present. These are short transitional phrases on their own line ending with a colon (e.g., "Here's the thing:", "But wait:", "It gets better:"). List each one found with its line location.
7. **Emotional Arc** — Fast hook / slow build, matches a known arc pattern. Identify the arc pattern (e.g., Rags to Riches, Overcoming the Monster, Voyage and Return). Quote the hook and the emotional peak.
8. **Scannability** — Bold subheadings every 200-300 words, no paragraph > 4 lines. Count words between each subheading. Flag any gap > 300 words. Flag any paragraph exceeding 4 lines.
9. **Benefit-First** — Every section passes "So What?" test. For each major section, identify the reader benefit stated. Flag any section where the benefit is buried or absent.
10. **Dual CTA** — Both Direct ("Buy now") and Transitional ("Download guide") present. Quote both CTAs. If only one type exists, note which is missing.

For each criterion, provide specific evidence (quote the line that passes/fails).

### Step 4 — REPORT

Present ALL FIVE scored gates with evidence, then the combined 100-point score.

- **Virality Score:** [N]/5 — PASS (>= 3) or NEEDS BOOST (< 3)
- **SEO Score:** [N]/6 — PASS (>= 4) or NEEDS OPTIMIZATION (< 4)
- **AI Humanization:** [N]/20 — report deductions
- **GEO Score:** [N]/5 — report per metric
- **Quality Score:** [N]/10 — PASS (>= 7) or NEEDS REVISION (< 7)
- **Combined Score:** [N]/100 — [BAND] (Exceptional/Strong/Acceptable/Below Standard/Rewrite)
- **Combined verdict:** PUBLISH READY (Combined >= 70 AND Quality >= 7 AND Virality >= 3 AND SEO >= 4) / NEEDS WORK (any fails)
- For each failing criterion/trigger: specific, actionable fix recommendation with an example rewrite of the offending passage.
- Priority order for fixes (highest-impact first per `references/quality-gate.md` revision priority guide):
  1. Failing criteria that block the quality gate (score < 7)
  2. Failing triggers that block the virality gate (score < 3)
  3. SEO metrics scoring Red
  4. AI Humanization violations (highest deduction first)
  5. GEO metrics scoring Red
  6. Remaining improvements to push Combined Score higher

### Step 5 — OPTIONAL REVISION

If user wants fixes applied:

- Revise targeting failing criteria first, then failing triggers, in priority order.
- Apply changes in-place, preserving the article's voice and structure.
- Re-score BOTH gates after revision.
- Present before/after comparison for each changed section:
  - Quote the original passage.
  - Quote the revised passage.
  - Note which criterion/trigger the change addresses and the new score.
- If the article still does not pass after one revision round, list remaining failures and ask the user whether to continue revising or publish as-is.

## Output Format

```
## Article Validation Report — [PUBLISH READY / NEEDS WORK]

### SEO Score: [N]/6 — [PASS / NEEDS OPTIMIZATION]
| # | Metric | Value | Status |
|---|--------|-------|--------|
| 1 | Title Length | [N] chars | [GREEN/AMBER/RED] |
| 2 | Keyword in Title | [Yes/No] | [GREEN/RED] |
| 3 | Title Words | [N] words | [GREEN/AMBER/RED] |
| 4 | Body Keyword Density | [N]% | [GREEN/AMBER/RED] |
| 5 | Keyword in First 100 Words | [Yes/No] | [GREEN/RED] |
| 6 | Keyword in Headings | [N] times | [GREEN/AMBER/RED] |

### Virality Score: [N]/5 — [PASS / NEEDS BOOST]
| # | Trigger | Score | Evidence |
|---|---------|-------|----------|
| 1 | Social Currency | [0/1] | [specific observation] |
| 2 | High-Arousal Emotion | [0/1] | [dominant emotion + arousal level] |
| 3 | Practical Utility | [0/1] | [formula usage or absence] |
| 4 | Identity Signaling | [0/1] | [target group or absence] |
| 5 | Cognitive Gap Closure | [0/1] | [resolution quality] |

### Quality Gate: [N]/10 — [PASS / NEEDS REVISION]
| # | Criterion | Score | Evidence |
|---|-----------|-------|----------|
| 1 | Clear | [0/1] | [quote or observation] |
| 2 | Concise | [0/1] | [quote or observation] |
| 3 | Compelling | [0/1] | [quote or observation] |
| 4 | Credible | [0/1] | [citation count / density] |
| 5 | Nested Loops | [0/1] | [loops found in first 500 words] |
| 6 | Bucket Brigades | [0/1] | [count + examples] |
| 7 | Emotional Arc | [0/1] | [arc pattern + hook quote] |
| 8 | Scannability | [0/1] | [max paragraph + header frequency] |
| 9 | Benefit-First | [0/1] | [3 sections checked] |
| 10 | Dual CTA | [0/1] | [both CTAs quoted] |

### Fix Recommendations (Priority Order)
1. [Criterion/Trigger]: [Specific fix recommendation with example rewrite]
2. [Criterion/Trigger]: [Specific fix recommendation with example rewrite]
...

### AI Humanization Score: [N]/20
- Tier 1 violations: [count] words found ([list])
- Tier 2 clusters: [count] paragraphs with 2+ Tier 2 words
- Tier 3 density: [word]: [N]% ([status])
- AI patterns: [count] detected ([list])

### GEO Score: [N]/5
| # | Metric | Value | Status |
|---|--------|-------|--------|
| 1 | Answer-First H2s | [X/Y comply] | [GREEN/AMBER/RED] |
| 2 | Passage Citability | [assessment] | [GREEN/AMBER/RED] |
| 3 | FAQ Presence | [count] pairs | [GREEN/AMBER/RED] |
| 4 | Entity Clarity | [assessment] | [GREEN/AMBER/RED] |
| 5 | Freshness Signals | [count] current-year refs | [GREEN/AMBER/RED] |

### Combined Article Score: [N]/100 — [BAND]
| Category | Raw | Weight | Score |
|----------|-----|--------|-------|
| Content Quality | [N]/10 | x3 | [N]/30 |
| Virality | [N]/5 | x4 | [N]/20 |
| SEO | [N]/6 | x2.5 | [N]/15 |
| AI Humanization | [N]/20 | x1 | [N]/20 |
| GEO/AEO | [N]/5 | x3 | [N]/15 |

### Strengths
- [What the article does well — call out at least 3 specific strengths with quotes]
```

## Rules

- NEVER skip a criterion, trigger, or metric. Score all 5 gates every time (10 quality + 5 virality + 6 SEO + 20 humanization + 5 GEO).
- NEVER assign a score without quoting evidence from the article.
- NEVER inflate scores — if in doubt, score 0 and explain why.
- ALWAYS read the reference files before scoring. The scoring definitions in the reference files override any conflicting definitions in this skill file.
- ALWAYS present the full report table even if the article passes both gates.
- ALWAYS list at least 3 strengths, even for articles that need work.
- If the article is shorter than 300 words, flag it as potentially too short for a full quality assessment but still score all criteria.
- If the user provides multiple articles, score each one separately with its own report.
