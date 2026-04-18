---
name: article-gen
description: End-to-end long-form article generator with inline image prompts. Use whenever the user needs blog posts, articles, sales copy, or any long-form written content. Triggers on article, blog post, write article, content writing, long-form, copywriting, tulis artikel, buat artikel, or any request to generate written content.
---

# Article Generation Skill

End-to-end long-form article generator with inline image prompts, retention engineering, emotional arc mapping, and virality optimization.

> **Split Pipeline Architecture:** For optimized pipeline execution, the backend calls three separate skills instead of this one: `/article-prep` (Steps 1-3, Sonnet) → `/article-write` (Step 4, Opus) → `/article-score` (Step 5, Sonnet). Each skill has its own compiled reference file injected via `--append-system-prompt-file`, eliminating Read tool calls. This `/article-gen` skill remains the all-in-one option for interactive use and single-session fallback when the backend calls it directly.

---

## 1. Reference Files (Read On-Demand)

Before any task, read the relevant reference files. ALWAYS read `global-config.md` first, then layer additional references as needed.

| Task | Read First |
|------|-----------|
| ANY article | `references/global-config.md` (ALWAYS first) |
| Framework selection | + `references/frameworks-library.md` |
| Hook writing | + `references/hook-repository.md` |
| Body writing | + `references/retention-engine.md` |
| Emotional planning | + `references/emotional-arcs.md` |
| Shareability | + `references/virality-triggers.md` |
| Image prompts | + `references/image-prompt-guide.md` |
| Style editing | + `references/style-guide.md` |
| SEO optimization | + `references/seo-rules-engine.md` |
| Content templates | + `references/content-templates.md` |
| Final scoring | + `references/quality-gate.md` |

**How to use this table:** Each row adds (+) to the base requirement. For example, when writing the body you read `global-config.md` first, then `retention-engine.md`. Multiple tasks in one step means reading all listed files for those tasks.

---

## 2. Hard Rules (NON-NEGOTIABLE)

These 20 rules apply to EVERY article generated. Violation of any rule requires immediate correction before output.

1. **NEVER use forbidden vocabulary.** The following words are permanently banned from all output: Unlock, Unleash, Supercharge, Empower, Enhance, Exceed, Maximize. If any of these appear during writing, replace immediately with concrete, specific alternatives.

2. **ALWAYS Grade 5 readability.** Target Flesch-Kincaid reading level for ages 9-11. Use short words, short sentences, and active voice. If a sentence requires a second read to understand, rewrite it.

3. **ALWAYS minimum 1 data point or citation per 400 words (E-E-A-T).** Every 400-word block must contain at least one verifiable statistic, study reference, expert quote, or data point. This is non-negotiable for credibility and search ranking.

4. **ALWAYS 3+ open loops in the first 500 words (Zeigarnik Effect).** Plant at least three unresolved questions, teasers, or promises in the opening section. The brain cannot ignore incomplete patterns — use this to pull readers deeper.

5. **NEVER use summary-style headers.** Every header must create an information gap. Write "The one metric that predicted our failure" NOT "Our results were good." Headers are ads for the section below — they must earn the click.

6. **ALWAYS place bucket brigades on their own lines ending with a colon.** Bucket brigades are transitional micro-hooks that carry the reader across section breaks. They sit alone on a line, end with a colon, and bridge one thought to the next. Examples: "Here's the thing:", "But that's not the worst part:", "And then everything changed:"

7. **ALWAYS keep paragraphs to a maximum of 3-4 lines.** Wall-of-text paragraphs kill mobile readability. If a paragraph exceeds 4 lines on a standard screen width, split it. White space is a retention tool.

8. **ALWAYS pass the "So What?" test on every section.** After writing each section, ask: "If the reader stopped here, did they get a concrete benefit?" Every section must deliver a benefit, not just a feature. If a section only describes without providing value, rewrite it.

9. **ALWAYS include dual CTA (Direct + Transitional).** Every article ends with two calls to action. The Direct CTA is for ready buyers ("Start your free trial today"). The Transitional CTA is for those not yet ready ("Download our free checklist"). Never leave an article with only one exit path.

10. **ALWAYS perform a 20% fluff reduction on the second pass.** After the first draft, cut at least 20% of filler words, redundant phrases, and weak modifiers. Target: "very," "really," "just," "actually," "basically," "literally," "in order to," "the fact that," and any sentence that restates the previous one.

11. **ALWAYS web-verify factual claims during research (Step 1).** All statistics, data points, and factual claims must be verified via web search during the research step. Collect ALL data needed for the entire article upfront. During writing (Step 4), use ONLY data and sources gathered in Step 1 — do NOT run additional web searches. If a claim cannot be supported by Step 1 research, rephrase using available data or remove it. Do not fabricate or hallucinate data.

12. **NEVER exceed 25 words in the hook (15 preferred, 25 characters for mobile scannability).** The hook is the first sentence. It must be brutally short. 15 words is the target. 25 words is the absolute maximum. The social share preview on mobile shows roughly 25 characters — the hook must land within that window.

13. **ALWAYS score Virality Score (5 triggers) — minimum 3/5 to publish.** Every article must be scored against the 5 virality triggers. A score below 3/5 means the article is not ready. Apply improvement strategies and re-score until the threshold is met.

14. **ALWAYS plan Completion-to-Share resolution.** The article must resolve all narrative tension by the end and deliver a reward. The final section is where the reader feels a sense of completion and is most likely to share. Plan this explicitly during the outline phase.

15. **ALWAYS target high-arousal emotions (awe, excitement, productive anger).** High-arousal emotions drive sharing. NEVER settle for low-arousal emotions like contentment, relaxation, or mild satisfaction. Every article must make the reader feel something strong enough to act on.

16. **ALWAYS include at least 1 Practical Utility section.** This section uses the formula: [Number] + [Superlative] + [Timeframe] + [Outcome]. Example: "7 fastest ways to double your conversion rate in 30 days." This formula signals immediate, concrete value and drives both clicks and shares.

17. **ALWAYS score SEO Score (6 metrics) — minimum 4/6 to publish.** Every article must be scored against the 6 SEO metrics (title length, keyword in title, title words, body keyword density, keyword in first 100 words, keyword in headings). A score below 4/6 means the article is not SEO-ready. Apply optimization strategies and re-score until the threshold is met.

18. **ALWAYS enforce Actionable Depth in numbered sections.** When an article includes numbered lists ("7 ways," "5 steps," etc.), each point MUST have: What (the action, 1-2 sentences), How (implementation steps, 2-4 sentences), Example (real company/tool/person + numbers, 2-3 sentences), Outcome (measurable result, 1-2 sentences). Minimum 150-250 words per point. A one-liner with a dash explanation is a table of contents, not an article. Apply the "Now What?" test: can the reader start doing this within 5 minutes?

19. **ALWAYS apply AI Humanization rules during writing.** Zero Tier 1 words allowed (53 words — always replace on sight). Maximum 1 Tier 2 word per paragraph (42 words — flag clusters of 2+). Tier 3 words must stay under 3% density (12 words). None of the 36 AI patterns (structural, language, tone, advanced) should be detectable in the output. See style-guide.md Rules 3 + 8.

20. **ALWAYS apply GEO/AEO formatting.** Every H2 must open with a 40-60 word stat-rich paragraph that directly answers the heading (Answer-First). Structure content in 50-150 word self-contained extractable chunks (Passage Citability). Include 2+ FAQ Q&A pairs with 40-60 word answers. Name specific entities for all claims (Entity Clarity). Include 3+ current-year references (Freshness Signals). See seo-rules-engine.md Sections 8 + 9.

---

## 3. Workflow: Full Article Generation (5-Step Optimized Pipeline)

Follow these 5 steps in order. Each step consolidates multiple operations for efficiency while maintaining full quality enforcement.

---

### Pipeline Mode (Automated — via CLI flags)

When invoked with `--idea-id` and `--api-url` flags, the skill runs in **pipeline mode** — fully automated with progress callbacks to the Portfolio API. This is used by the Content Engine admin panel.

**Required flags:**
- `--idea-id {id}` — Content idea ID in the Portfolio database
- `--api-url {url}` — Base API URL (e.g., `https://alisadikinma.com/api`)
- `--api-token {token}` — Authentication bearer token
- `--topic "{topic}"` — Article topic
- `--languages {en,id}` — Comma-separated output languages

**Optional flags:**
- `--keyword "{keyword}"` — Target SEO keyword (if not provided, auto-derived from topic)
- `--instructions "{text}"` — Custom generation instructions

**Pipeline mode behavior:**
1. **Skip interactive input collection** — use the provided flags instead of asking the user
2. **Report progress at each step** — call the progress API after completing each step
3. **Auto-complete** — call the completion API with the generated article when done
4. **No user confirmation gates** — proceed through all steps automatically

**Progress reporting:** After completing each step, report progress using the Bash tool:

```bash
curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/progress" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"step":"{step_name}","percentage":{pct},"message":"{description}"}'
```

**Step-to-percentage mapping:**
| Step | Name | Percentage | Description |
|------|------|-----------|-------------|
| 1 | research | 15 | Input parsed + topic research + keyword confirmed |
| 2 | strategy | 25 | Framework + arc + hook selected |
| 3 | outline | 35 | Full outline with retention + image concepts |
| 4 | writing | 85 | Article written + styled + SEO optimized + images generated |
| 5 | completed | 100 | Triple gate passed + output delivered |

**Completion callback:** After all gates pass (Quality + Virality + SEO), send the FULL data package to the Portfolio API. See `references/seo-rules-engine.md` Section 5 for the complete JSON schema. **USE FILE-BASED CURL** — completion payload is 15-30 KB with article HTML + evidence strings; inline `-d '...'` corrupts at shell.

```bash
cat > /tmp/article-complete-{idea_id}.json << 'PAYLOAD_EOF'
{
    "article": {
      "title": "{article_title}",
      "content": "{full_html_content}",
      "keyword": "{target_keyword}",
      "word_count": {word_count},
      "citation_count": {citation_count},
      "image_count": {image_count},
      "framework": "{framework_name}",
      "template": "{template_name}",
      "hook_type": "{hook_type}",
      "hook_boost": "{engagement_boost_pct}",
      "emotional_arc": "{arc_type}"
    },
    "seo_analysis": {
      "score": {seo_score},
      "max_score": 6,
      "pass": {true_or_false},
      "keyword": "{target_keyword}",
      "metrics": {
        "title_length": {"value": {chars}, "status": "{good/warning/bad}"},
        "keyword_in_title": {"value": {true_or_false}, "status": "{good/bad}"},
        "title_word_count": {"value": {words}, "status": "{good/warning/bad}"},
        "body_keyword_density": {"value": {density_pct}, "status": "{good/warning/bad}"},
        "keyword_in_first_100": {"value": {true_or_false}, "status": "{good/bad}"},
        "keyword_in_headings": {"value": {count}, "status": "{good/warning/bad}"}
      }
    },
    "virality_score": {
      "score": {virality_score},
      "max_score": 5,
      "pass": {true_or_false},
      "triggers": {
        "social_currency": {"pass": {bool}, "evidence": "{text}"},
        "high_arousal_emotion": {"pass": {bool}, "evidence": "{text}"},
        "practical_utility": {"pass": {bool}, "evidence": "{text}"},
        "identity_signaling": {"pass": {bool}, "evidence": "{text}"},
        "cognitive_gap_closure": {"pass": {bool}, "evidence": "{text}"}
      }
    },
    "quality_gate": {
      "score": {quality_score},
      "max_score": 10,
      "pass": {true_or_false},
      "criteria": {
        "clear": {"pass": {bool}, "evidence": "{text}"},
        "concise": {"pass": {bool}, "evidence": "{text}"},
        "compelling": {"pass": {bool}, "evidence": "{text}"},
        "credible": {"pass": {bool}, "evidence": "{text}"},
        "nested_loops": {"pass": {bool}, "evidence": "{text}"},
        "bucket_brigades": {"pass": {bool}, "evidence": "{text}"},
        "emotional_arc": {"pass": {bool}, "evidence": "{text}"},
        "scannability": {"pass": {bool}, "evidence": "{text}"},
        "benefit_first": {"pass": {bool}, "evidence": "{text}"},
        "dual_cta": {"pass": {bool}, "evidence": "{text}"}
      }
    },
    "image_prompts": [{
      "type": "{cover/inline}",
      "section": "{section_title}",
      "insert_after_heading": "{exact H2 text or null for cover}",
      "concept": "{concept}",
      "prompt": "{full_prompt}",
      "model": "{model}",
      "style": "{style}",
      "aspect_ratio": "{ratio}",
      "resolution": "{resolution}"
    }],
    "ai_humanization": {
      "score": {score},
      "max_score": 20,
      "tier1_violations": ["{words}"],
      "tier2_clusters": {count},
      "tier3_density_issues": ["{word_and_pct}"],
      "pattern_violations": ["{categories}"]
    },
    "geo_score": {
      "score": {geo_score},
      "max_score": 5,
      "metrics": {
        "answer_first_h2s": {"value": "{X/Y}", "status": "{good/warning/bad}"},
        "passage_citability": {"value": "{assessment}", "status": "{good/warning/bad}"},
        "faq_presence": {"value": {count}, "status": "{good/warning/bad}"},
        "entity_clarity": {"value": "{assessment}", "status": "{good/warning/bad}"},
        "freshness_signals": {"value": {count}, "status": "{good/warning/bad}"}
      }
    },
    "combined_score": {
      "score": {combined},
      "max_score": 100,
      "band": "{Exceptional/Strong/Acceptable/Below Standard/Rewrite}",
      "pass": {true_if_gte_70}
    },
    "research_data": {
      "key_data_points": ["{data_points}"],
      "primary_pain_point": "{pain_point}",
      "sources": [{"name": "{source}", "url": "{url}"}]
    }
  }
PAYLOAD_EOF

curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/complete" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d @/tmp/article-complete-{idea_id}.json

rm -f /tmp/article-complete-{idea_id}.json
```

**CRITICAL:** Single-quoted heredoc delimiter (`<< 'PAYLOAD_EOF'`) prevents bash `$`/`"`/backtick interpolation. If response is `"success": false` with `keys_received`, the file was corrupted — re-write and retry.

**Error handling:** If any step fails, report it as progress with error detail:
```bash
curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/progress" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"step":"failed","percentage":{last_pct},"message":"Error at {step_name}: {error_detail}"}'
```

---

### Step 1 — INPUT + RESEARCH

**Read:** `references/global-config.md`

Collect all inputs and perform comprehensive upfront research in a single step. The goal is to gather ALL data needed for the entire article so that NO additional web searches are needed during writing.

**Pipeline mode:** Parse inputs from CLI flags. Set topic, audience (derive from niche/topic), goal (default: Educate), product (default: None), keyword (from `--keyword` flag or auto-derive).

**Interactive mode:** Collect from the user:
1. **Topic:** What is the article about? Get as specific as possible.
2. **Product/Service (optional):** Product, service, or brand to weave in.
3. **Target Audience:** Demographics, role, experience level, primary pain point.
4. **Article Goal:** Educate / Sell / Convert / Engage.
5. **Target Keyword (optional):** Specific SEO keyword, or auto-derived in research below.
6. **Output Path (optional):** File path or console.

**Web research (2-3 targeted searches):**
1. Search 1: "[topic] statistics data 2024 2025" — recent stats, benchmarks, industry data
2. Search 2: "[topic] case study expert opinion" — real examples, expert quotes, counterarguments
3. Search 3 (if needed): "[topic] trends impact research" — only if first 2 lack sufficient data
4. Read top 2-3 results from snippets. Only WebFetch if snippet lacks specific data.
5. Collect **5-8 verified data points** with source names and URLs — enough for entire article.
6. Identify reader's primary pain point and emotional state.
7. **Keyword research:** If keyword provided, validate it. If not, auto-derive 2-3 suggestions.

**Present findings:**

```
CONFIRMED INPUT:
- Topic: [topic]
- Product/Service: [product or "None"]
- Target Audience: [audience]
- Goal: [educate/sell/convert/engage]
- Output Path: [path or "Console"]

RESEARCH FINDINGS:
- Key Data Points: [5-8 verified statistics with sources]
- Primary Pain Point: [the core problem]
- Reader's Starting Emotion: [emotional state before reading]
- Sources: [numbered list of 3-5 sources with URLs]

KEYWORD OPTIONS:
1. [keyword] — [rationale]
2. [keyword] — [rationale]
3. [keyword] — [rationale]
RECOMMENDATION: #[N] — [keyword] because [reason]
```

**Pipeline mode:** Auto-select keyword, auto-proceed. Report progress: `step=research, percentage=15`.
**Interactive mode:** User reviews findings + keyword. This is informational — the main pause point is after Step 3.

---

### Step 2 — STRATEGY

**Read:** `references/frameworks-library.md` + `references/emotional-arcs.md` + `references/hook-repository.md` + `references/content-templates.md` (all four at once)

Select framework, emotional arc, hook, and content template in a single strategy pass:

**Framework selection:**
1. Use Goal-Based Framework Selection table: match article goal (educate/sell/convert/engage) to primary framework
2. Cross-reference with Topic-Based Decision Matrix for topic-specific refinement
3. If both tables agree, use that framework. If they differ, prefer the Goal-Based table.
4. Select best framework with rationale

**Emotional arc selection:**
1. Match topic to arc type using Arc Selection Guide
2. Map arc phases to planned article sections
3. Define pacing plan (peaks, valleys, climax placement)

**Hook generation (3 hooks):**
1. **PRIMARY:** Safest, highest-probability hook for this context
2. **SECONDARY:** Alternative angle — different hook type, different psychological driver
3. **WILDCARD:** Engagement Multiplier — combines two hook types (e.g., Curiosity+Numbers, HotTake+Story, Before/After+FOMO)
4. Each hook: type, psychological driver, engagement boost %, actual text, word count, mobile preview (25 chars), constraint check

**Content template selection:**
1. Match topic characteristics to template using Auto-Selection Guide in content-templates.md
2. Template determines: target word count, section structure, tone, recommended framework + arc
3. If template's framework recommendation conflicts with Decision Matrix, prefer the Decision Matrix result
4. User can override template choice

**Present strategy:**

```
STRATEGY:
- Template: [selected] ([word count range]) — [rationale]
- Framework: [selected] — [rationale]
- Arc: [selected] ([emotion sequence])
- Pacing: [opening] → [build] → [peak] → [shift] → [resolution]

HOOKS:
1. PRIMARY: [type, boost %, text]
2. SECONDARY: [type, boost %, text]
3. WILDCARD: [combined types, boost %, text]
```

**Pipeline mode:** Auto-select recommended template + framework + arc + PRIMARY hook. Report progress: `step=strategy, percentage=25`.
**Interactive mode:** Selections presented to user as part of the Step 3 review block.

---

### Step 3 — OUTLINE

**Read:** `references/retention-engine.md` + `references/image-prompt-guide.md`

Build the complete article structure combining framework, arc, and hook:

1. **Map framework sections to outline** — use selected framework's structure as skeleton
2. **Overlay retention techniques per section:**
   - Bucket brigades at every major transition
   - 3+ open loops in first 500 words with planned resolution points
   - Nested loops: open new threads before closing previous ones
   - "Trailer moments" mid-section previewing upcoming value
   - Pattern interrupts every 300-400 words
3. **Map neurotransmitter targets per section:**
   - Oxytocin (stories/empathy → medial prefrontal cortex → shareability)
   - Cortisol (stakes/urgency → long-term memory encoding)
   - Dopamine (curiosity resolution/rewards → reward anticipation loops)
4. **Plan citations** — minimum 1 per 400 words, map Step 1 data points to sections
5. **Plan Practical Utility section** — [Number]+[Superlative]+[Timeframe]+[Outcome]
6. **Plan Completion-to-Share resolution** — final payoff + reader reward
7. **Plan self-reflection trigger** — at least 1 section
8. **Plan image sections** — Mark which H2 sections will have images (1 cover + 2-4 inline). Criteria: emotional turning points, spread from top to bottom, minimum 1 text-only section between images. Image concepts will be generated FROM each section's content during writing (Step 4), not here.

**INTERACTIVE MODE — SINGLE PAUSE POINT:**

Present ALL accumulated work (Steps 1-3) for user review in one block:

```
====================================
REVIEW BEFORE WRITING
====================================

RESEARCH: [key data points + sources]
KEYWORD: [confirmed keyword]
FRAMEWORK: [selected] — [rationale]
ARC: [selected] ([emotion sequence])

HOOK OPTIONS:
1. PRIMARY: [type, boost %, text]
2. SECONDARY: [type, boost %, text]
3. WILDCARD: [combined types, boost %, text]
→ Which hook? (1/2/3)

OUTLINE:
---
Section 1: [Title — information gap style]
- Arc Phase: [phase] | Neurotransmitter: [target]
- Retention: [techniques] | Citation: [planned data point]
- Image: [Yes/No — concept] | Open Loops: [count]
---
[... all sections ...]
---
Final Section: [Title]
- Completion-to-Share: [resolution plan]
- Dual CTA: [Direct + Transitional]
---

IMAGES: [count] planned ([cover + inline breakdown])

====================================
Approve to start writing, or request changes.
====================================
```

Wait for user approval + hook selection. After approval, Steps 4-5 run without any pause.

**Pipeline mode:** Auto-proceed, no pause. Report progress: `step=outline, percentage=35`.

---

### Step 4 — WRITE + POLISH

**Read:** `references/style-guide.md` + `references/seo-rules-engine.md`

Write the article in a single comprehensive pass, applying all rules simultaneously. No additional web searches during this step. Image prompts are generated separately after article approval (not in this step).

**CRITICAL — No additional web searches during writing.** Use ONLY data points, statistics, sources, and examples collected in Step 1. If you need a data point not in Step 1 research, rephrase using available data or make a general observation without specific numbers.

**Writing rules (applied inline, not as separate passes):**

**Opening:**
- First line MUST be short (5-8 words) — Slippery Slide principle
- Hook delivered in first 1-2 sentences
- 3+ open loops planted in first 500 words

**Per-section:**
- Bucket brigades at every transition (own line, ending with colon)
- Pattern interrupts every 300-400 words (tone shift, vulnerability, format play)
- Nested loops: new thread opens before previous resolves
- "Trailer Moments" mid-section previewing upcoming content
- Neurotransmitter targeting per section (oxytocin/cortisol/dopamine per outline)
- Citations woven naturally from Step 1 research — no new web searches
- Zeigarnik cliffhanger at end of each section (except final)
- Every sentence earns the next (Slippery Slide)
- Actionable Depth for numbered sections: What + How + Example + Outcome, 150-250 words per point, "Now What?" test

**Context Extraction (before image analysis):**
Before writing any image prompt, perform Context Extraction per `image-prompt-guide.md`:
- Read the full article and extract brands/products/tools mentioned per section
- Identify visual elements that represent each section's topic
- For the cover: identify primary brand, core transformation, target persona, emotional summary
- Apply Physical Reality Constraints from `image-prompt-guide.md` to every prompt — verify screen orientations, object physics, spatial perspective, human anatomy

**Section-bound image analysis (per H2 section):**
After writing each H2 section, decide if it needs an image:
1. Is there minimum 1 text-only section since last image? (no clustering)
2. Is this section at an emotional turning point? (Problem→Solution, Data reveal, Story beat, CTA)
3. Under max inline count? (3 for ≤2200 words, 4 for >2200 words)
If YES → generate image prompt FROM this section's content:
- `concept` = visual metaphor of what THIS section communicates — specific to the topic, not generic
- `insert_after_heading` = exact H2 heading text (MANDATORY)
- Image must SUPPORT this section's narrative — if section discusses a brand/product, image must visually represent THAT brand/product
- If `reference_images.brand[]` exists for a brand in this section, include URLs via `file_urls` in the prompt
- NO text in inline images. Consistent color palette across all images.

**Cover image (YouTube Thumbnail Style):**
- Model: `nano-banana-pro` (text rendering required)
- Include article title text in-image (rule-of-thirds, bold sans-serif, high contrast)
- Include subtitle/tagline (max 8 words from hook, below title)
- Key visual specific to article topic (from Context Extraction)
- Brand logo from `reference_images.brand[]` via `file_urls` if available; skip if no reference
- Max 3 focal points, readable at 320px width

**Style + AI Humanization (applied during writing, not as separate pass):**
- Zero Tier 1 words (53 words — scan and replace on sight per style-guide.md Rule 3)
- No Tier 2 clusters (max 1 Tier 2 word per paragraph — 42 words)
- Tier 3 words under 3% density (12 words)
- No AI patterns from 36 categories (structural, language, tone, advanced — style-guide.md Rule 8)
- Paragraphs max 3-4 lines
- Grade 5 readability — short sentences, common words, active voice
- "So What?" test per section — benefit before feature
- Write tight from the start (20% fluff reduction mindset, not a separate cut pass)

**SEO + GEO/AEO (applied during writing, not as separate pass):**
- Title: 50-60 chars, keyword present naturally, 6-10 words
- Keyword in first 100 words (woven into hook/problem)
- Keyword in 1-2 H2/H3 headings (not stuffing)
- Body density target 0.5-1.5%
- All keyword placements must read naturally
- GEO: Every H2 opens with 40-60 word stat-rich answer paragraph (Answer-First)
- GEO: Content structured in 50-150 word extractable passages (Passage Citability)
- GEO: 2+ FAQ Q&A pairs with 40-60 word answers (near end, before CTA)
- GEO: Name specific entities for all claims (Entity Clarity)
- GEO: 3+ current-year references (Freshness Signals)

**Template structure:**
- Follow the selected content template section structure from Step 2
- Template defines section order, word allocation, and tone per section
- Adapt template sections to the specific topic while maintaining the structure

**Final section:**
- Key insight + surprise resolution (Completion-to-Share)
- Self-reflection trigger if not placed earlier
- Dual CTA: Direct + Transitional

**Single-language output:** Write the article in the PRIMARY language specified by `--languages` (first language in the list). If `--languages id` or `--languages id,en`, write in Indonesian using Gen-Z Bahasa (casual, conversational, localized idioms). If `--languages en`, write in English. Output ONE article only — translation to other languages is handled separately after approval (via Haiku, not in this step).

**NOTE:** Image **files** (actual images via GeminiGen.AI API) are NOT generated in this step. Image **prompts** (text descriptions) are generated above as part of section-bound image analysis. Actual image generation happens separately after article approval using the admin panel's image pipeline.

**Pipeline mode:** Report progress: `step=writing, percentage=85`.

---

### Step 5 — FIVE GATES + COMBINED SCORE + OUTPUT

**Read:** `references/virality-triggers.md` + `references/quality-gate.md` + `references/seo-rules-engine.md`

Score the article against ALL five gates in a single pass using the detailed criteria in the reference files read above. Calculate the combined 100-point score, then deliver the final output.

**Five Gates (score using detailed criteria from refs):**

| Gate | Source | Min | Weight | Max Pts |
|------|--------|-----|--------|---------|
| Virality (5 triggers) | `virality-triggers.md` Scoring Guide | 3/5 | x4 | 20 |
| Quality (10 criteria) | `quality-gate.md` The 10 Criteria | 7/10 | x3 | 30 |
| SEO (6 metrics) | `seo-rules-engine.md` §1 | 4/6 | x2.5 | 15 |
| AI Humanization (20pt) | `quality-gate.md` AI Humanization | — | x1 | 20 |
| GEO (5 metrics) | `seo-rules-engine.md` §8-9 | — | x3 | 15 |

**Combined Score:** Sum of weighted gates. Bands: Exceptional (90-100), Strong (80-89), Acceptable (70-79), Below Standard (60-69), Rewrite (<60). **Minimum to publish: >= 70.**

**If ANY blocking gate fails (Virality <3, Quality <7, SEO <4, or Combined <70):**
- Fix failing items using per-trigger/per-criterion/per-metric strategies from reference files
- Re-score ONLY the failed gate, recalculate Combined
- If still failing after two revision rounds, flag to user with explanation

**Assemble final output** in the standard format (Section 4). Include: metadata header, full article, image prompts, all 5 scores, combined score with band, sources list.

**Pipeline mode:** Send full completion callback JSON (see Pipeline Mode section above). Report progress: `step=completed, percentage=100`.

**Interactive mode:** Present the finished article with all scores.

**If output path was provided:** Write to `{path}/article.md` with full content.
**If no output path:** Print to console.

The output must follow the exact format specified in Section 4 below.

---

## 4. Output Format

Every article output MUST follow this exact structure:

```
# [Article Title]

**Template:** [selected template] | **Framework:** [Selected] | **Hook:** [Type] ([engagement boost %]) | **Arc:** [Selected]
**Keyword:** [target keyword]
**Words:** [count] | **Citations:** [count] | **Images:** [count]
**Quality:** [N]/10 | **Virality:** [N]/5 | **SEO:** [N]/6 | **Humanization:** [N]/20 | **GEO:** [N]/5
**Combined:** [N]/100 ([BAND])

---

[Full article content with all sections, bucket brigades, retention techniques, and inline image placement markers]

---

## Image Prompts ([N] images)

### Image 1: COVER THUMBNAIL
**Concept:** [thumbnail concept — what story at a glance]
**Prompt:** [300-500 word cinematic prompt with title/subtitle/key visual/brand]
**Model:** nano-banana-pro
**Style:** [Photorealistic / Portrait Cinematic]
**Aspect Ratio:** 16:9
**Resolution:** 1K
**Placement:** Article header / social share thumbnail
**Title Text:** [exact article title]
**Subtitle:** [max 8 words tagline from hook]
**file_urls:** [brand reference URLs, or "none"]

### Image 2: Section [N] — [Title]
**Concept:** [context-specific concept — what THIS section is about]
**Prompt:** [300-500 word cinematic prompt — section-specific]
**Model:** [nano-banana-pro / nano-banana-2 / imagen-4]
**Style:** [style]
**Aspect Ratio:** [ratio]
**Resolution:** [resolution]
**Placement:** After "[Exact H2 heading text]" — [reason]
**file_urls:** [brand reference URLs if section uses brand visuals, or "none"]

### Image 3: Section [N] — [Title]
**Concept:** [context-specific concept]
**Prompt:** [300-500 word cinematic prompt]
**Model:** [model]
**Style:** [style]
**Aspect Ratio:** [ratio]
**Resolution:** [resolution]
**Placement:** After [section] — [reason]
**file_urls:** [brand reference URLs or "none"]

### Image 4: Section [N] — [Title]
**Concept:** [context-specific concept]
**Prompt:** [300-500 word cinematic prompt]
**Model:** [model]
**Style:** [style]
**Aspect Ratio:** [ratio]
**Resolution:** [resolution]
**Placement:** After [section] — [reason]
**file_urls:** [brand reference URLs or "none"]

### Image 5: Section [N] — [Title]
**Concept:** [context-specific concept]
**Prompt:** [300-500 word cinematic prompt]
**Model:** [model]
**Style:** [style]
**Aspect Ratio:** [ratio]
**Resolution:** [resolution]
**Placement:** After [section] — [reason]
**file_urls:** [brand reference URLs or "none"]

---

## SEO Score: [N]/6 — [PASS/NEEDS OPTIMIZATION]
**Target Keyword:** [keyword]
| # | Metric | Value | Status |
|---|--------|-------|--------|
| 1 | Title Length | [N] chars | [GREEN/AMBER/RED] |
| 2 | Keyword in Title | [Yes/No] | [GREEN/RED] |
| 3 | Title Words | [N] words | [GREEN/AMBER/RED] |
| 4 | Body Keyword Density | [N]% | [GREEN/AMBER/RED] |
| 5 | Keyword in First 100 Words | [Yes/No] | [GREEN/RED] |
| 6 | Keyword in Headings | [N] times | [GREEN/AMBER/RED] |

## Virality Score: [N]/5
1. Social Currency: [PASS/FAIL] — [evidence]
2. High-Arousal Emotion: [PASS/FAIL] — [dominant emotion]
3. Practical Utility: [PASS/FAIL] — [formula usage]
4. Identity Signaling: [PASS/FAIL] — [target group]
5. Cognitive Gap Closure: [PASS/FAIL] — [resolution quality]

## Quality Gate Score: [N]/10
1. Clear: [PASS/FAIL] — [note]
2. Concise: [PASS/FAIL] — [note]
3. Compelling: [PASS/FAIL] — [note]
4. Credible: [PASS/FAIL] — [note]
5. Nested Loops: [PASS/FAIL] — [note]
6. Bucket Brigades: [PASS/FAIL] — [note]
7. Emotional Arc: [PASS/FAIL] — [note]
8. Scannability: [PASS/FAIL] — [note]
9. Benefit-First: [PASS/FAIL] — [note]
10. Dual CTA: [PASS/FAIL] — [note]

## AI Humanization Score: [N]/20
- Tier 1 violations: [count] words found ([list])
- Tier 2 clusters: [count] paragraphs with 2+ Tier 2 words
- Tier 3 density: [word]: [N]% ([status])
- AI patterns: [count] detected ([list])

## GEO Score: [N]/5
| # | Metric | Value | Status |
|---|--------|-------|--------|
| 1 | Answer-First H2s | [X/Y comply] | [GREEN/AMBER/RED] |
| 2 | Passage Citability | [assessment] | [GREEN/AMBER/RED] |
| 3 | FAQ Presence | [count] pairs | [GREEN/AMBER/RED] |
| 4 | Entity Clarity | [assessment] | [GREEN/AMBER/RED] |
| 5 | Freshness Signals | [count] current-year refs | [GREEN/AMBER/RED] |

## Combined Article Score: [N]/100 — [BAND]
| Category | Raw | Weight | Score |
|----------|-----|--------|-------|
| Content Quality | [N]/10 | x3 | [N]/30 |
| Virality | [N]/5 | x4 | [N]/20 |
| SEO | [N]/6 | x2.5 | [N]/15 |
| AI Humanization | [N]/20 | x1 | [N]/20 |
| GEO/AEO | [N]/5 | x3 | [N]/15 |

## Sources
[Numbered list of all citations used in the article with URLs where available]
```

---

## GeminiGen.AI API Call Reference

Use this API to generate images from the approved prompts in Step 4.

```bash
curl -X POST https://api.geminigen.ai/uapi/v1/generate_image \
  -H "Content-Type: multipart/form-data" \
  -H "x-api-key: ${GEMINIGEN_API_KEY}" \
  --form "prompt=[image prompt text]" \
  --form "model=nano-banana-pro" \
  --form "aspect_ratio=16:9" \
  --form "style=Photorealistic" \
  --form "output_format=jpeg" \
  --form "resolution=1K"
```

**Parameters:**
- `prompt` (required): The image prompt text from Step 4. Must be 20-80 words.
- `model` (required): One of `nano-banana-pro` (default, complex instructions + text rendering), `nano-banana-2` (faster + lower cost), or `imagen-4` (fine textures, nature).
- `aspect_ratio` (required): Default `16:9`. Options: `16:9`, `9:16`, `1:1`, `4:3`, `3:4`.
- `style` (required): Matches the style field from the image prompt (e.g., Photorealistic, Portrait Cinematic, Cinematic, Minimalist, etc.).
- `output_format` (required): Default `jpeg`. Options: `jpeg`, `png`, `webp`.
- `resolution` (required): Default `1K`. Options: `1K`, `2K`, `4K`.

**Environment variable:** Ensure `GEMINIGEN_API_KEY` is set in the environment before making API calls. Do not hardcode the API key in any prompt or output.
