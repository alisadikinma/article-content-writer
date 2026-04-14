# SEO Rules Engine

> Third mandatory scoring gate. Scores 6 SEO metrics using a green/amber/red traffic light system.
> Minimum score: **4/6 to publish.**

---

## 1. SEO Scoring System (6 Metrics)

| # | Metric | Green (1 pt) | Amber (0.5 pt) | Red (0 pt) |
|---|--------|-------------|-----------------|------------|
| 1 | Title length | 50–60 chars | 40–50 or 60–70 | <40 or >70 |
| 2 | Keyword in title | Present | — | Missing |
| 3 | Title word count | 6–10 words | 5 or 11–12 | <5 or >12 |
| 4 | Body keyword density | 0.5–1.5% | 0.3–0.5% or 1.5–2.5% | <0.3% or >3% |
| 5 | Keyword in first 100 words | Present | — | Missing |
| 6 | Keyword in H2/H3 headings | 1–2 times | 0 | >3 (keyword stuffing) |

**Scoring:** Green = 1 point, Amber = 0.5 point, Red = 0 points.
**Maximum:** 6/6. **Minimum to publish:** 4/6.

**Notes:**
- Metrics 2 and 5 are binary (Green/Red only — no Amber state)
- Keyword density is calculated as: (keyword occurrences / total words) × 100
- Heading count includes both H2 and H3 elements
- Keyword matching is case-insensitive

---

## 2. Keyword Handling

### Auto-Derive Flow
1. During topic research (article-gen Step 1), analyze the topic for keyword opportunities
2. Consider: search intent, specificity, natural fit in title
3. Present 2–3 keyword suggestions to user:
   ```
   KEYWORD OPTIONS:
   1. [keyword phrase] — [rationale: search volume, specificity, intent match]
   2. [keyword phrase] — [rationale]
   3. [keyword phrase] — [rationale]
   
   RECOMMENDATION: #[N] — [keyword] because [reason tied to topic + audience]
   ```
4. User reviews and confirms, modifies, or inputs custom keyword
5. Confirmed keyword is used throughout SEO optimization and scoring

### Pipeline Mode
- If `--keyword` flag provided → use it directly, skip auto-derive
- If no `--keyword` flag → auto-derive from topic, auto-select top recommendation

### Keyword Quality Criteria
- **Specific** — "SaaS onboarding email strategy" not "email marketing"
- **Natural** — must fit naturally in a title and headings without forcing
- **Intent-matched** — aligns with the article's goal (educate/sell/convert/engage)
- **Length** — 2–4 words is ideal for long-tail targeting

---

## 3. SEO Optimization Rules

These rules are applied inline during article writing (Step 4) and scored in Step 5:

### Title Optimization
- Adjust title to **50–60 characters** (optimal for search display)
- Include the target keyword **naturally** — never force it
- Keep title to **6–10 words**
- Title must still follow the Information Gap rule (no summary-style titles)

### First 100 Words
- Verify keyword appears within the first 100 words
- If missing, weave it into the opening hook or problem statement naturally
- Do NOT front-load the keyword awkwardly — it must read naturally

### H2/H3 Headings
- Include keyword in **1–2 headings** across the article
- Distribute across sections (not all in the first two headings)
- Headings must still create information gaps — keyword inclusion is secondary to hook quality
- **>3 keyword appearances in headings = keyword stuffing** — this HURTS ranking

### Body Keyword Density
- Target **0.5–1.5%** density
- Calculate: count keyword occurrences in body text (excluding title/headings), divide by total body words, multiply by 100
- If too low (<0.5%): add keyword in topic sentences of 2–3 key sections
- If too high (>1.5%): replace some instances with synonyms, related terms, or pronouns
- **>3% density = keyword stuffing** — triggers search penalties

### Natural Integration Principle
All keyword placements must read naturally. If adding the keyword makes a sentence awkward, find a different placement. Google's algorithms detect forced keyword insertion — natural language always wins.

---

## 4. JS Logic Contract — `computeSeoAnalysis()`

This function defines the **exact scoring logic** that the Portfolio website implements client-side for real-time SEO preview. The plugin implements the same logic during scoring (markdown-side).

```js
function computeSeoAnalysis(content, title, keyword) {
  const textContent = stripHtml(content)
  const words = textContent.split(/\s+/)
  const totalWords = words.length
  const keywordLower = keyword.toLowerCase()

  // Keyword density
  const keywordRegex = new RegExp(keywordLower, 'gi')
  const bodyMatches = textContent.match(keywordRegex) || []
  const density = (bodyMatches.length / totalWords) * 100

  // In title
  const inTitle = title.toLowerCase().includes(keywordLower)

  // In first 100 words
  const first100 = words.slice(0, 100).join(' ').toLowerCase()
  const inFirst100 = first100.includes(keywordLower)

  // In headings
  const headingRegex = /<h[23][^>]*>(.*?)<\/h[23]>/gi
  let headingMatches = 0
  let match
  while ((match = headingRegex.exec(content)) !== null) {
    if (match[1].toLowerCase().includes(keywordLower)) headingMatches++
  }

  // Title length
  const titleLength = title.length
  const titleWords = title.split(/\s+/).length

  return {
    density: { value: density.toFixed(1), status: getStatus(density, 0.5, 1.5, 0.3, 2.5) },
    inTitle: { value: inTitle, status: inTitle ? 'good' : 'bad' },
    inFirst100: { value: inFirst100, status: inFirst100 ? 'good' : 'bad' },
    inHeadings: { value: headingMatches, status: getStatus(headingMatches, 1, 2, 0, 3) },
    titleLength: { value: titleLength, status: getStatus(titleLength, 50, 60, 40, 70) },
    titleWords: { value: titleWords, status: getStatus(titleWords, 6, 10, 5, 12) },
    totalWords,
    keywordCount: bodyMatches.length
  }
}

/**
 * getStatus — traffic light classifier
 * @param {number} value — the metric value
 * @param {number} greenMin — lower bound of green zone (inclusive)
 * @param {number} greenMax — upper bound of green zone (inclusive)
 * @param {number} amberMin — lower bound of amber zone (inclusive)
 * @param {number} amberMax — upper bound of amber zone (inclusive)
 * @returns {'good' | 'warning' | 'bad'}
 *
 * Logic:
 *   greenMin <= value <= greenMax → 'good'    (Green, 1 point)
 *   amberMin <= value < greenMin → 'warning'  (Amber, 0.5 points)
 *   greenMax < value <= amberMax → 'warning'  (Amber, 0.5 points)
 *   value < amberMin or value > amberMax → 'bad' (Red, 0 points)
 */
function getStatus(value, greenMin, greenMax, amberMin, amberMax) {
  if (value >= greenMin && value <= greenMax) return 'good'
  if ((value >= amberMin && value < greenMin) || (value > greenMax && value <= amberMax)) return 'warning'
  return 'bad'
}

/**
 * stripHtml — removes HTML tags from content
 * @param {string} html — raw HTML content
 * @returns {string} — plain text
 */
function stripHtml(html) {
  return html.replace(/<[^>]*>/g, ' ').replace(/\s+/g, ' ').trim()
}
```

### Return Object Fields

| Field | Type | Description |
|-------|------|-------------|
| `density.value` | string | Body keyword density as percentage (e.g., "1.2") |
| `density.status` | string | `good` / `warning` / `bad` |
| `inTitle.value` | boolean | Whether keyword is present in title |
| `inTitle.status` | string | `good` / `bad` (binary — no warning state) |
| `inFirst100.value` | boolean | Whether keyword is in first 100 words |
| `inFirst100.status` | string | `good` / `bad` (binary — no warning state) |
| `inHeadings.value` | number | Count of H2/H3 headings containing keyword |
| `inHeadings.status` | string | `good` / `warning` / `bad` |
| `titleLength.value` | number | Character count of title |
| `titleLength.status` | string | `good` / `warning` / `bad` |
| `titleWords.value` | number | Word count of title |
| `titleWords.status` | string | `good` / `warning` / `bad` |
| `totalWords` | number | Total word count of body content |
| `keywordCount` | number | Raw count of keyword occurrences in body |

### Status-to-Score Mapping (for Portfolio UI)

| Status | Points | Color | UI Display |
|--------|--------|-------|-----------|
| `good` | 1 | Green | Optimal |
| `warning` | 0.5 | Amber | Needs attention |
| `bad` | 0 | Red | Fix required |

---

## 5. Completion Callback JSON Schema

When pipeline mode completes, the full data package is sent to the Portfolio API. This is the complete schema:

```json
{
  "article": {
    "title": "string — article title",
    "content": "string — full HTML content",
    "keyword": "string — target SEO keyword",
    "word_count": "number — total word count",
    "citation_count": "number — E-E-A-T citations used",
    "image_count": "number — images generated (3-5)",
    "framework": "string — copywriting framework used (e.g., PASO)",
    "hook_type": "string — hook type used (e.g., Curiosity Gap)",
    "hook_boost": "string — expected engagement boost (e.g., +45%)",
    "emotional_arc": "string — arc pattern used (e.g., Discovery)"
  },
  "seo_analysis": {
    "score": "number — total SEO score (0-6, supports 0.5 increments)",
    "max_score": 6,
    "pass": "boolean — true if score >= 4",
    "keyword": "string — target keyword used for analysis",
    "metrics": {
      "title_length": { "value": "number — char count", "status": "string — good/warning/bad" },
      "keyword_in_title": { "value": "boolean", "status": "string — good/bad" },
      "title_word_count": { "value": "number — word count", "status": "string — good/warning/bad" },
      "body_keyword_density": { "value": "number — percentage", "status": "string — good/warning/bad" },
      "keyword_in_first_100": { "value": "boolean", "status": "string — good/bad" },
      "keyword_in_headings": { "value": "number — heading count", "status": "string — good/warning/bad" }
    }
  },
  "virality_score": {
    "score": "number — total virality score (0-5)",
    "max_score": 5,
    "pass": "boolean — true if score >= 3",
    "triggers": {
      "social_currency": { "pass": "boolean", "evidence": "string" },
      "high_arousal_emotion": { "pass": "boolean", "evidence": "string" },
      "practical_utility": { "pass": "boolean", "evidence": "string" },
      "identity_signaling": { "pass": "boolean", "evidence": "string" },
      "cognitive_gap_closure": { "pass": "boolean", "evidence": "string" }
    }
  },
  "quality_gate": {
    "score": "number — total quality score (0-10)",
    "max_score": 10,
    "pass": "boolean — true if score >= 7",
    "criteria": {
      "clear": { "pass": "boolean", "evidence": "string" },
      "concise": { "pass": "boolean", "evidence": "string" },
      "compelling": { "pass": "boolean", "evidence": "string" },
      "credible": { "pass": "boolean", "evidence": "string" },
      "nested_loops": { "pass": "boolean", "evidence": "string" },
      "bucket_brigades": { "pass": "boolean", "evidence": "string" },
      "emotional_arc": { "pass": "boolean", "evidence": "string" },
      "scannability": { "pass": "boolean", "evidence": "string" },
      "benefit_first": { "pass": "boolean", "evidence": "string" },
      "dual_cta": { "pass": "boolean", "evidence": "string" }
    }
  },
  "image_prompts": [
    {
      "type": "string — cover or inline",
      "section": "string — section title (null for cover)",
      "concept": "string — 1-line concept description",
      "prompt": "string — full 20-80 word prompt",
      "model": "string — nano-banana-pro / nano-banana-2 / imagen-4",
      "style": "string — Photorealistic, Portrait Cinematic, etc.",
      "aspect_ratio": "string — 16:9, 4:3, 1:1",
      "resolution": "string — 1K, 2K, 4K"
    }
  ],
  "research_data": {
    "key_data_points": ["string — verified data points used"],
    "primary_pain_point": "string — reader's core pain point",
    "sources": [
      { "name": "string — source publication", "url": "string — source URL" }
    ]
  }
}
```

---

## 6. SEO Score Output Format

```
## SEO Score: [N]/6 — [PASS (>=4) / NEEDS OPTIMIZATION (<4)]

| # | Metric | Value | Status |
|---|--------|-------|--------|
| 1 | Title Length | [N] chars | [GREEN/AMBER/RED] |
| 2 | Keyword in Title | [Yes/No] | [GREEN/RED] |
| 3 | Title Words | [N] words | [GREEN/AMBER/RED] |
| 4 | Body Keyword Density | [N]% ([count] occurrences / [total] words) | [GREEN/AMBER/RED] |
| 5 | Keyword in First 100 Words | [Yes/No] | [GREEN/RED] |
| 6 | Keyword in Headings | [N] times | [GREEN/AMBER/RED] |

**Target Keyword:** [keyword]

## GEO Score: [N]/5 — [status]

| # | Metric | Value | Status |
|---|--------|-------|--------|
| 1 | Answer-First H2s | [X/Y comply] | [GREEN/AMBER/RED] |
| 2 | Passage Citability | [assessment] | [GREEN/AMBER/RED] |
| 3 | FAQ Presence | [count] pairs | [GREEN/AMBER/RED] |
| 4 | Entity Clarity | [assessment] | [GREEN/AMBER/RED] |
| 5 | Freshness Signals | [count] current-year refs | [GREEN/AMBER/RED] |
```

---

## 7. Per-Metric Optimization Strategies

When a metric scores Amber or Red, apply these fixes:

### Title Length (Red: <40 or >70 chars)
- **Too short:** Add a qualifying phrase or specific detail. "SEO Tips" → "7 SEO Tips That Actually Work for Small Business Blogs"
- **Too long:** Cut filler words. "The Complete and Comprehensive Guide to Understanding SEO" → "The Complete Guide to SEO in 2026"

### Keyword Missing from Title (Red)
- Rewrite the title to naturally include the keyword
- Keep the information gap style — keyword must serve the hook, not replace it
- Example: keyword "onboarding emails" → "Why Most Onboarding Emails Fail (And 3 That Convert)"

### Title Word Count (Red: <5 or >12)
- **Too few:** Add specificity. "SEO Guide" → "The Practical SEO Guide for Content Marketers"
- **Too many:** Merge or remove weak words. Remove "that," "which," "in order to"

### Body Keyword Density (Red: <0.3% or >3%)
- **Too low:** Add keyword in topic sentences of 2–3 key sections. Use it in explanatory passages where it fits naturally.
- **Too high:** Replace some instances with synonyms, related terms ("SEO" → "search optimization," "ranking strategy"), or pronouns. Vary the phrasing.
- **Critical:** Never add keywords to satisfy a metric if it breaks readability. Natural language always wins.

### Keyword Missing from First 100 Words (Red)
- Weave the keyword into the opening hook, problem statement, or first bucket brigade
- It should appear within the natural topic introduction — not as an inserted afterthought
- Example: If keyword is "content marketing strategy" and the hook discusses the topic → include it in the problem framing

### Keyword in Headings (Red: >3 = stuffing)
- Replace keyword in 1–2 headings with synonyms or related phrases
- Keep keyword in the most important H2 (usually the main solution/value section)
- Vary heading language: "Email Automation Strategy" → "How to Set Up Automated Sequences"
- If 0 headings have the keyword: add it to 1–2 headings where it fits the information gap naturally

---

## 8. GEO/AEO Optimization Rules

These rules ensure articles are optimized for AI citation in Google AI Overviews, ChatGPT web search, Perplexity, and other AI-powered search systems. GEO (Generative Engine Optimization) and AEO (Answer Engine Optimization) target the extractability and citability of content by AI systems.

### 8.1 Answer-First Formatting

Every H2 section must open with a **40-60 word stat-rich paragraph** that directly answers the section heading. This paragraph must be self-contained — extractable by AI systems as a standalone answer.

- Lead with the fact or answer, then explain
- Bad: "In recent years, there has been a growing trend toward AI-powered onboarding systems that many companies are beginning to adopt across various industries."
- Good: "Companies using AI-powered onboarding see 34% higher retention within 90 days, according to a 2025 Gartner report. Here's how that works."

**Before/After — Answer-First H2:**

Before (FAIL — vague opening, no data, not extractable):
> ## How AI Is Changing Onboarding
> In recent years, there has been a growing trend toward using artificial intelligence in employee onboarding processes. Many companies are now exploring various ways to incorporate AI tools.

After (PASS — 45-word stat-rich paragraph, self-contained, instantly quotable):
> ## How AI Is Changing Onboarding
> Companies using AI-powered onboarding see 34% higher new-hire retention within 90 days, according to Gartner's 2025 HR Technology report. Average time-to-productivity drops from 12 weeks to 7. Here's how the best onboarding programs are structured — and what most companies get wrong.

### 8.2 Passage Citability

Structure content in **50-150 word self-contained chunks.** Each chunk should answer one specific question. AI systems prefer clear, quotable passages over long narrative blocks.

- Each passage should be independently meaningful if extracted
- Use question-style headings (H2/H3) that match search queries
- Avoid passages that require reading prior context to understand

### 8.3 FAQ Schema Hints

Include at least **2-3 FAQ-format Q&A pairs** within the article. Each answer: 40-60 words, factual, directly responsive.

- Position FAQs near the end (before CTA) or as a dedicated section
- Each Q&A becomes eligible for FAQ rich results AND AI citation
- Questions should match real search queries about the topic
- Answers should be self-contained — no "as mentioned above" references

### 8.4 Entity Clarity

Name specific entities (people, companies, tools, studies) rather than vague references. Helps AI systems verify and cite with confidence.

- "A McKinsey 2025 report" beats "a recent study"
- "Shopify's checkout optimization tool" beats "an e-commerce platform"
- "Dr. Sarah Chen, AI researcher at Stanford" beats "experts say"
- Every claim with a source should name the specific source

### 8.5 Freshness Signals

Include current year references in the content. AI systems prefer fresh, recently-updated content for citations.

- Include 3+ current-year data points or references
- Mention recent developments (within 12 months when possible)
- Use specific dates rather than "recently" or "lately"
- Update any legacy data to current versions when available

---

## 9. GEO Score (5 Metrics)

Separate scoring for AI citation readiness. Uses the same traffic light system as SEO scoring.

| # | Metric | Green (1 pt) | Amber (0.5 pt) | Red (0 pt) |
|---|--------|-------------|-----------------|------------|
| 1 | Answer-first H2s | All H2s open with 40-60 word fact paragraph | 50%+ of H2s comply | <50% comply |
| 2 | Passage citability | All key sections are 50-150 word extractable chunks | Most sections comply | Few or none |
| 3 | FAQ presence | 2+ FAQ Q&A pairs with 40-60 word answers | 1 FAQ pair | No FAQ format |
| 4 | Entity clarity | All claims name specific entities + dates | Most claims | Vague attributions |
| 5 | Freshness signals | 3+ current-year references | 1-2 current-year refs | No current-year data |

**Scoring:** Green = 1 point, Amber = 0.5 point, Red = 0 points.
**Maximum:** 5/5. **Not a blocking gate** — contributes to combined 100-point score.

### GEO Score Output Format

```
## GEO Score: [N]/5 — [status]

| # | Metric | Value | Status |
|---|--------|-------|--------|
| 1 | Answer-First H2s | [X/Y comply] | [GREEN/AMBER/RED] |
| 2 | Passage Citability | [assessment] | [GREEN/AMBER/RED] |
| 3 | FAQ Presence | [count] pairs | [GREEN/AMBER/RED] |
| 4 | Entity Clarity | [assessment] | [GREEN/AMBER/RED] |
| 5 | Freshness Signals | [count] current-year refs | [GREEN/AMBER/RED] |
```
