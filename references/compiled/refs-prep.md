# Article Generation Reference — Prep (Steps 1-3)

System prompt reference for the `/article-prep` skill.
Contains: global-config, frameworks-library, hook-repository, emotional-arcs, content-templates.
These references are injected via --append-system-prompt-file. Do NOT read them with the Read tool.

---

## Reference: global-config

# Article Content Writer — Global Config

> Single source of truth for all configurable values. To change any setting, edit THIS file only.

---

## 1. Language

| Setting | Value |
|---------|-------|
| `primary_language` | English |
| `bilingual_support` | Yes — headline in primary language, subtitle as translation (configurable) |
| `prompt_language` | Always English (AI model instruction language) |
| `indonesian_mode` | Available — bilingual ID/EN with Gen-Z Bahasa for hooks |

---

## 2. Content Defaults

| Setting | Value | Source |
|---------|-------|--------|
| `default_framework` | PASO (Problem, Agitate, Solve, Outcome) | Most versatile for long-form — see frameworks-library.md |
| `article_length` | 1,900–2,400 words | SEO optimal per research: comprehensive guides rank higher [1] |
| `citation_density` | 1 data point or reputable citation per 400 words minimum | E-E-A-T signal density for search algorithms and AI Overviews [2] |
| `paragraph_max` | 3–4 lines | Scannability rule — more periods, fewer commas |
| `fluff_reduction` | 20% second-pass cut | Mandatory "rub out" pass after first draft |
| `readability_target` | Flesch-Kincaid Grade 5 (age 9–11) | Conversational, people-first language |

---

## 3. Hook Defaults

| Setting | Value | Source |
|---------|-------|--------|
| `hook_word_limit` | 15 words max | 2-second read time — pattern interrupt window |
| `hook_char_limit` | 25 characters | Mobile scannability constraint [3] |
| `pattern_interrupt_window` | 1.7–3 seconds | 71% of viewers decide within first 3 seconds, average at 1.7s [4] |
| `hook_types_available` | 8 | See hook-repository.md |
| `build_pacing` | 20 words max / 2 seconds | |
| `peak_pacing` | 25 words max / 3 seconds | |

---

## 4. Forbidden Vocabulary

**DO NOT USE these words in any article:**

`Unlock` · `Unleash` · `Supercharge` · `Empower` · `Enhance` · `Exceed` · `Maximize`

**Why:** These are AI-sounding cliches that break conversational tone and signal machine-generated content. Use people-first, conversational language instead.

**Replacements:**
| Instead of | Use |
|-----------|-----|
| Unlock your potential | Find what works for you |
| Unleash the power | Put it to work |
| Supercharge your workflow | Speed up your workflow |
| Empower your team | Give your team the tools |
| Enhance your results | Get better results |
| Maximize efficiency | Save more time |

---

## 5. Quality Gate

| Setting | Value |
|---------|-------|
| `quality_minimum` | 7/10 to publish |
| `quality_criteria_count` | 10 (all mandatory evaluation) |
| `second_pass_required` | Yes — 20% fluff reduction |
| `reference` | See quality-gate.md for full checklist |

---

## 6. Virality Score

| Setting | Value |
|---------|-------|
| `virality_minimum` | 3/5 to publish |
| `virality_triggers_count` | 5 (all mandatory evaluation) |
| `triggers` | Social Currency, High-Arousal Emotion, Practical Utility, Identity Signaling, Cognitive Gap Closure |
| `reference` | See virality-triggers.md Virality Scoring Guide |

---

## 7. Tone & Voice

| Setting | Value |
|---------|-------|
| `tone` | People-first, conversational |
| `punctuation` | More periods, fewer commas |
| `perspective` | Write as if speaking to one person, not an audience |
| `so_what_test` | Every sentence must answer "So what?" — feature without benefit = delete |
| `now_what_test` | Every numbered point must answer "Now what?" — reader must be able to act within 5 minutes |
| `actionable_depth` | Numbered points: minimum 150-250 words each with What + How + Example + Outcome structure |
| `hedging` | Avoid hedging language ("might", "could potentially", "it's possible that") — be direct |

---

## 8. E-E-A-T Density

| Setting | Value | Source |
|---------|-------|--------|
| `min_citations_per_400_words` | 1 | Satisfies search algorithms and AI Overviews [2] |
| `source_quality` | Reputable third-party (named publications, studies, official data) | |
| `experience_signals` | First-hand accounts, "front-line" reporting, original observations | Google Helpful Content System [5] |
| `expertise_depth` | Comprehensive guides — 1,900–2,400 words | Deeply answer customer questions [5] |
| `authoritativeness` | Detailed case studies, unique methodologies, original data | |
| `trustworthiness` | Facts, social proof, reputable citations | Increases AI Overview feature likelihood [5] |

## 8.1. Research Efficiency

| Setting | Value | Rationale |
|---------|-------|-----------|
| `max_web_searches` | 2-3 per article | Targeted queries reduce latency while maintaining E-E-A-T |
| `max_web_fetches` | 1-2 per article | Only fetch full pages when search snippets lack specific data |
| `research_strategy` | Upfront-only | ALL data collected in Step 1, zero web calls during writing |
| `min_data_points` | 5-8 per article | Enough to support 1 citation per 400 words across 2,000 words |
| `writing_web_calls` | 0 | Writing step uses ONLY Step 1 research — no re-verification |

---

## 9. Emotional Arc Defaults

| Setting | Value |
|---------|-------|
| `hook_intensity` | HIGH — fast emotional swing |
| `body_intensity` | Slow build — progressive intensity |
| `arcs_available` | 4 (see emotional-arcs.md) |
| `neurotransmitter_targets` | Oxytocin (empathy/trust via stories), Cortisol (attention/memory via stakes), Dopamine (reward via curiosity resolution) |

---

## 10. Completion-to-Share

| Setting | Value | Source |
|---------|-------|--------|
| `primary_metric` | Completion rate (over impressions) | 2025 metric shift [6] |
| `resolution_required` | Yes — narrative tension must resolve before share impulse triggers | |
| `end_reward` | Key insight or surprising resolution that validates reader's time | |
| `algorithm_priority` | Sustained attention + engagement depth (saves, pauses) over quick taps | Platform algorithm shift 2025 [6] |

---

## 11. Image Generation

| Setting | Value |
|---------|-------|
| `api_endpoint` | `https://api.geminigen.ai/uapi/v1/generate_image` |
| `api_key_env` | `GEMINIGEN_API_KEY` |
| `default_model` | `nano-banana-pro` (Gemini 3 Pro Image Preview — free tier) |
| `available_models` | `nano-banana-pro`, `nano-banana-2`, `imagen-4` |
| `default_style` | `Photorealistic` |
| `default_aspect_ratio` | `16:9` (widescreen for blog articles) |
| `default_resolution` | `1K` |
| `default_output_format` | `jpeg` |
| `image_count` | 3–5 per article (scales with length) |
| `image_allocation` | 1 feature/cover image (MANDATORY) + 2–4 inline section images |
| `prompt_length` | 20–80 words (descriptive, specific) |
| `rate_limit_nano_banana_pro` | 5 req/min, 100 req/hour, 1,000 req/day (free tier) |
| `text_in_image` | NO — text belongs in the article, not the image |
| `reference` | See image-prompt-guide.md for full API docs + prompt best practices |

### Image Count by Article Length

| Article Length | Cover | Inline | Total |
|---------------|-------|--------|-------|
| Short (1,900 words) | 1 | 2 | 3 |
| Standard (2,000–2,200 words) | 1 | 3 | 4 |
| Long (2,200–2,400+ words) | 1 | 4 | 5 |

---

## 12. SEO Rules Engine

| Setting | Value |
|---------|-------|
| `seo_minimum` | 4/6 to publish |
| `seo_metrics_count` | 6 (all mandatory evaluation) |
| `scoring_system` | Traffic light: Green (1 pt), Amber (0.5 pt), Red (0 pt) |
| `keyword_handling` | Auto-derive from topic + user confirmation |
| `title_length_optimal` | 50–60 characters |
| `title_words_optimal` | 6–10 words |
| `keyword_density_optimal` | 0.5–1.5% |
| `keyword_in_headings_optimal` | 1–2 times (>3 = stuffing) |
| `reference` | See seo-rules-engine.md for full scoring guide + JS logic contract |

---

## 13. AI Humanization

| Setting | Value |
|---------|-------|
| `ai_word_tiers` | 3 (Tier 1: always replace, Tier 2: cluster flag, Tier 3: density flag) |
| `tier1_word_count` | 52 (always replace on sight) |
| `tier2_word_count` | 43 (flag when 2+ in same paragraph) |
| `tier3_word_count` | 12 (flag when >3% density) |
| `ai_pattern_categories` | 36 (4 groups: Structural 10, Language 12, Tone 8, Advanced 6) |
| `ai_humanization_max_score` | 20 points (deduction-based) |
| `reference` | See style-guide.md Rules 3 + 8 |

---

## 14. GEO/AEO Readiness

| Setting | Value |
|---------|-------|
| `geo_minimum` | Not a blocking gate (contributes to combined score) |
| `geo_metrics_count` | 5 |
| `answer_first_target` | 40-60 words per H2 opening paragraph |
| `passage_citability_target` | 50-150 word self-contained chunks |
| `faq_minimum` | 2 Q&A pairs with 40-60 word answers |
| `freshness_target` | 3+ current-year references |
| `reference` | See seo-rules-engine.md Sections 8 + 9 |

---

## 15. Combined Scoring

| Setting | Value |
|---------|-------|
| `combined_score_max` | 100 points |
| `combined_minimum` | 70 (Acceptable band) |
| `scoring_bands` | Exceptional (90-100), Strong (80-89), Acceptable (70-79), Below Standard (60-69), Rewrite (<60) |
| `content_weight` | Quality Gate x3 = 30 pts max |
| `virality_weight` | Virality Score x4 = 20 pts max |
| `seo_weight` | SEO Score x2.5 = 15 pts max |
| `humanization_weight` | AI Humanization x1 = 20 pts max |
| `geo_weight` | GEO Score x3 = 15 pts max |
| `reference` | See quality-gate.md Combined Article Score section |

---

## 16. Content Templates

| Setting | Value |
|---------|-------|
| `template_count` | 12 |
| `template_auto_select` | Yes — based on topic characteristics |
| `template_override` | User can override auto-selection |
| `reference` | See content-templates.md |


---

## Reference: frameworks-library

# Copywriting Frameworks Library

This reference consolidates all 14 copywriting frameworks available to the article-content-writer plugin. Three **primary frameworks** (PASO, StoryBrand, AIDA) carry full command-level execution detail and serve as the default structural engines for long-form articles. Eleven **supporting frameworks** provide alternative structures optimized for specific goals, formats, or funnel stages. Use the Decision Matrix at the bottom to select the right framework for any given topic or objective.

---

## Primary Frameworks (3)

These frameworks include step-by-step commands that define exactly how to write each section.

### I. PASO (Problem, Agitate, Solve, Outcome)

- **Command — Identify the Problem:** Open by mirroring the specific, relatable conversation already happening in the reader's head. Demonstrate radical empathy to build immediate trust.
- **Command — Agitate the Pain:** "Pour salt on the wound." Use visceral language to describe the emotional and philosophical consequences of inaction until the reader is desperate for a way out.
- **Command — Present the Solution:** Introduce the product or service as the specific "balm." Focus on how it removes the agitated pain points.
- **Command — Define the Outcome:** Paint a vivid picture of the final transformation. Use social proof and testimonials to prove the "After" state is attainable.

**Best Use:** Detailed landing pages and long-form sales copy.
**Strengths:** More powerful than PAS — helps readers picture themselves after transformation.
**Weaknesses:** Requires more space.
**Article Topics:** Personal development, business strategy, travel/holiday planning.

---

### II. StoryBrand (7-Part Hero's Journey)

**Mental Model:** Use the Allstate "Mayhem" dynamic. The customer is the Hero; the brand is the Guide.

- **Command — Establish the Hero:** Immediately identify what the customer wants. The brand must never be the hero.
- **Command — Define the Conflict:** Identify the External (the surface problem), Internal (how it makes them feel), and Philosophical ("it shouldn't be this hard") problems.
- **Command — Introduce the Guide:** Position the brand with Empathy ("We know how it feels") and Authority ("We have helped thousands").
- **Command — Provide a Plan:** Give a simple 3–4 step path to success to eliminate cognitive load.
- **Command — Direct CTA:** Challenge the hero to act with a clear "Buy Now" or "Schedule Call" button.
- **Command — Success vs. Failure:** Explicitly contrast the happy ending with the cost of doing nothing (loss of time, money, or sanity).

**Best Use:** Website homepages, brand strategy.
**Strengths:** Customer as hero, brand as guide.
**Weaknesses:** Complex for short-form.
**Article Topics:** Brand identity, "About Us" pages, complex service descriptions.

---

### III. AIDA (Attention, Interest, Desire, Action)

- **Command — Attention:** Lead with a high-contrast Hook that stops the reader immediately.
- **Command — Interest:** Offer valuable insights to bridge the "Information Gap" — give the reader a reason to keep reading.
- **Command — Desire:** Use "people-first" language to build emotional resonance and help the reader see the product improving their life.
- **Command — Action:** Conclude with a singular, frictionless directive.

**Best Use:** Landing pages, sales pages, paid ads, email sequences.
**Strengths:** Most enduring and versatile framework in copywriting.
**Weaknesses:** Can be too linear for modern, non-linear buyer journeys.
**Article Topics:** Sales-focused content, product walkthroughs, promotional announcements.

---

## Supporting Frameworks (11)

Each framework below is summarized with its structure, best use, strengths, weaknesses, and recommended article topics.

### 1. PAS (Problem → Agitate → Solution)

- **Structure:** Identify a Problem, Agitate the consequences, offer the Solution.
- **Best Use:** Product pages, blog intros, service landing pages.
- **Strengths:** Highly effective for emotional resonance; "fingernail copy."
- **Weaknesses:** Risk of being overly negative.
- **Article Topics:** Troubleshooting guides, efficiency-improvement, health/safety.

---

### 2. BAB (Before → After → Bridge)

- **Structure:** Describe the Before (struggle), paint the After (ideal future), provide the Bridge (solution that connects the two).
- **Best Use:** Case studies, testimonials, social media.
- **Strengths:** Creates emotional momentum through transformation.
- **Weaknesses:** Requires a dramatic "after" to land effectively.
- **Article Topics:** Weight loss, financial growth, career transformations.

---

### 3. FAB (Features → Advantages → Benefits)

- **Structure:** List the Features, explain the Advantages, highlight the Benefits.
- **Best Use:** Product descriptions, eCommerce, B2B SaaS.
- **Strengths:** Forces a "so what?" focus — connects specs to reader value.
- **Weaknesses:** Lacks a narrative hook.
- **Article Topics:** Tech reviews, software comparisons, appliance guides.

---

### 4. The 4 Cs (Clear, Concise, Compelling, Credible)

- **Structure:** Principles, not a narrative. Apply as a quality-control overlay to any piece of writing.
- **Best Use:** All copywriting, white papers, blogs.
- **Strengths:** Works as a universal quality-control checklist.
- **Weaknesses:** No narrative flow — cannot drive structure on its own.
- **Article Topics:** Industry reports, academic summaries, professional guides.

---

### 5. The 4 Us (Urgent, Unique, Useful, Ultra-specific)

- **Structure:** Every element must satisfy urgency, uniqueness, usefulness, and ultra-specificity.
- **Best Use:** Headlines, email subject lines, short posts.
- **Strengths:** Excellent for stopping the scroll.
- **Weaknesses:** Hard to sustain across 2000-word articles.
- **Article Topics:** Flash sales, newsjacking, newsletters.

---

### 6. The 5 Ps (Promise, Picture, Prove, Push, Personal)

- **Structure:** Make a Promise, paint a Picture, Prove the claim, Push the reader to act, make it Personal.
- **Best Use:** Homepage hero sections, sales pages, lead-gen landing pages.
- **Strengths:** Highly aspirational — creates a vivid vision of success.
- **Weaknesses:** Requires strong proof elements to avoid feeling hollow.
- **Article Topics:** Real estate, luxury products, coaching programs.

---

### 7. SLAP (Stop → Look → Act → Purchase)

- **Structure:** Stop the scroll, get them to Look, prompt them to Act, drive the Purchase.
- **Best Use:** Paid social ads, email subject lines.
- **Strengths:** Optimized for short-form, fast-action contexts.
- **Weaknesses:** Not suitable for high-consideration items.
- **Article Topics:** Viral threads, seasonal sales, limited-time offers.

---

### 8. The Question Ladder

- **Structure:** Start with the primary search question (H1), then answer follow-up questions logically in descending priority.
- **Best Use:** SEO blog posts, FAQs, pillar pages.
- **Strengths:** Increases time on page, captures featured snippets.
- **Weaknesses:** More informational than persuasive.
- **Article Topics:** "How-to" guides, explainers, tutorials.

---

### 9. PASBO (Problem → Agitation → Solution → Benefits → Optimisation)

- **Structure:** Traditional PAS extended with a Benefits section and an SEO Optimisation layer.
- **Best Use:** SEO-driven product/service pages.
- **Strengths:** Connects emotional resonance with search-engine optimisation.
- **Weaknesses:** Can feel formulaic if not carefully written.
- **Article Topics:** Locally targeted service pages, product reviews.

---

### 10. Full-Funnel Method

- **Structure:** TOFU — Educate and build Trust. MOFU — Nurture and Differentiate. BOFU — Drive Action with Proof.
- **Best Use:** Content strategy, lead nurture sequences.
- **Strengths:** Matches reader intent at every funnel stage.
- **Weaknesses:** High-level framework — needs sub-frameworks to execute individual pieces.
- **Article Topics:** Marketing strategy guides, resource hubs.

---

### 11. Gary Bencivenga's Persuasion Equation

- **Structure:** Urgent Problem + Unique Promise + Unquestionable Proof + User-friendly Proposition.
- **Best Use:** High-stakes sales copy.
- **Strengths:** Capable of swaying skeptical, sophisticated buyers.
- **Weaknesses:** Needs genuinely "unquestionable proof" to work — falls flat without it.
- **Article Topics:** Scientific breakthroughs, investment proposals, SaaS launches.

---

## Decision Matrix

| If Your Topic/Goal Is...                        | Use This Framework        |
|-------------------------------------------------|---------------------------|
| Solving a specific, painful problem             | PAS or PASBO              |
| Showing a massive transformation                | BAB                       |
| Selling a complex B2B/SaaS product              | FAB or StoryBrand         |
| Ranking for specific user queries               | Question Ladder           |
| Short-form viral social media ads               | SLAP or 4 Us             |
| High-ticket aspirational sales                  | 5 Ps or Persuasion Equation |
| Step-by-step buyer journey (Cold to Sale)       | AIDA                      |
| Editing and quality control                     | 4 Cs or "So What?" Test   |


---

## Reference: hook-repository

# Hook Repository: 8 Viral Techniques for Article Writing

## The Science of First-Line Psychology

- **The 3-Second Rule:** 71% of viewers decide whether to continue within the first three seconds, with the average decision occurring at the 1.7-second mark [2].
- **The Orienting Response:** Effective hooks trigger an instinctual reflex where the brain turns its attention toward anything new, surprising, or different [3].
- **Cognitive Efficiency:** The brain is wired for efficiency and filters out the familiar; a hook must create cognitive dissonance or break a predictable rhythm to be noticed [2, 3].

## The 8 Core Hook Types

### 1. Curiosity Gap Hook

- **Psychological Driver:** Raises a question without immediate answer, creating "mental itch" for resolution
- **Engagement Boost:** +45% (highest retention rate)
- **When to Use:** Obscure features, counter-intuitive strategies, "hidden" truths

**Template Formulas:**
1. "What everyone gets wrong about [Topic]..."
2. "The #1 thing nobody tells you about [Topic]..."
3. "This changes everything you knew about [Topic]..."

**Real Examples:**
1. "The secret trick I used to land a $5,000 client"
2. "I wasn't going to tell you this..."
3. "Only 1% of people know this basic fact about India"

---

### 2. Controversial / Hot Take Hook

- **Psychological Driver:** Triggers immediate emotional response or disagreement
- **Engagement Boost:** +35% (drives high comments and shares)
- **When to Use:** Challenging popular beliefs or industry standards

**Template Formulas:**
1. "Everyone's doing [Task] wrong"
2. "Here's why [Popular Belief] is actually false"
3. "[Expert Opinion] that everyone hates"

**Real Examples:**
1. "Google hates AI content"
2. "You don't need a CS degree to be a great engineer"
3. "I hate content writing. There, I said it."

---

### 3. Numbered List Hook

- **Psychological Driver:** Promises certainty and specific, "chunked" value easy for brain to process
- **Engagement Boost:** +30% (reliable and highly shareable)
- **When to Use:** Practical guides, tool lists, "mistake" articles

**Template Formulas:**
1. "[Number] ways to [Benefit]..."
2. "[Number] biggest mistakes people make with [Topic]..."
3. "[Number] things that will [Outcome]..."

**Real Examples:**
1. "10 methods to build self-discipline habits"
2. "5 crazy things this AI can do that nobody talks about"
3. "7 time management tips to gain 2 extra hours daily"

---

### 4. Before / After Hook

- **Psychological Driver:** Showcases desirable transformation, leveraging aspiration and visual proof
- **Engagement Boost:** +50% (highly effective for case studies)
- **When to Use:** Revenue growth, personal journeys, product improvements

**Template Formulas:**
1. "From [Point A] to [Point B] in [Timeframe]"
2. "How I went from [Problem] to [Result]"
3. "[Before] vs. [After] using [Product/Tool]"

**Real Examples:**
1. "From $0 to $100K revenue in 6 months"
2. "Before I knew this trick, I was invisible. Now I get 3 inbound leads a week"
3. "The one mistake that killed my career (and how I came back)"

---

### 5. Question Hook

- **Psychological Driver:** Flips expectations, forces reader to pause and formulate internal answer
- **Engagement Boost:** +40% (thought-provoking)
- **When to Use:** Debunking myths or "What if?" scenarios

**Template Formulas:**
1. "What if you [Unexpected Action]?"
2. "What's a problem nobody in [Industry] talks about?"
3. "Why do the best [Subject] rarely [Common Action]?"

**Real Examples:**
1. "Still wondering how they're earning ₹1.5 lakhs/month from home?"
2. "What if you deleted your backlog?"
3. "Ever catch yourself slouching at your desk?"

---

### 6. Social Proof / Numbers Hook

- **Psychological Driver:** Leverages authority and FOMO using large-scale data
- **Engagement Boost:** +25% (builds high credibility)
- **When to Use:** Trend data, success rates, growth metrics

**Template Formulas:**
1. "[Number] out of [Number] [People] fail at [Task]"
2. "My [Product/Tool] reached [Number] users in [Time]"
3. "$[Number] in revenue from a single [Feature/Action]"

**Real Examples:**
1. "Trusted by over 50,000 businesses and rated 4.8/5 on Capterra"
2. "This man was rejected by 17 companies. Now he earns ₹24 lakhs/year"
3. "Only 2 days left to know how top writers charge $100/hour"

---

### 7. Story / Narrative Hook

- **Psychological Driver:** Humanizes topic through relatability, causes oxytocin release for deeper connection
- **Engagement Boost:** +55% (the most emotional and shareable type)
- **When to Use:** Founder stories, lessons from failure, life transitions

**Template Formulas:**
1. "I got rejected [Number] times before [Success]"
2. "I lost everything, then I built this instead"
3. "How a random conversation about [Topic] changed everything"

**Real Examples:**
1. "It was 4 AM, and I was still revising..."
2. "I made a mistake that nearly ruined my career—and I'm glad I did"
3. The "Len" story opening Joe Sugarman's BluBlocker ads

---

### 8. Trend / FOMO Hook

- **Psychological Driver:** Exploits fear of irrelevance or missing critical industry shift
- **Engagement Boost:** +35% (timely and actionable)
- **When to Use:** New technology adoption, emerging best practices

**Template Formulas:**
1. "AI is going to replace [Role]; here's what to do"
2. "Everyone's switching to [Tool]; should you?"
3. "The future of [Industry] is [New Concept]"

**Real Examples:**
1. "This might be your last chance..."
2. "Everyone's switching to this; here's what it means for [Role]"
3. "Still thinking about this?"

---

## Engagement Multipliers (Combining Hooks)

For maximum impact, combine two hook types into a single opening:

- **Curiosity + Numbers:** "This AI feature 95% of people don't know about"
- **Hot Take + Story:** "Everyone hated my approach, until [Result] happened"
- **Before/After + FOMO:** "Others are already using this to [Transformation]; don't get left behind"

## Hook Optimization Checklist

- **Word Constraint:** Keep hook under 15 words (25 characters for mobile scannability when possible)
- **Pacing:** Hook should take no longer than 2 seconds in text
- **Resolution Promise:** Always ensure the content actually delivers on the hook's promise — eroding trust kills future engagement
- **Testing:** Draft 3-5 headline variants and test. Prioritize completion rate and saves/shares over vanity metrics like impressions
- **Retention Analysis:** Use analytics to identify exact second viewers drop off — if before 3 seconds, hook failed

## Hook Type Rankings by Engagement

| Rank | Hook Type | Boost | Best For |
|------|-----------|-------|----------|
| 1 | Story / Narrative | +55% | Emotional, shareable |
| 2 | Before / After | +50% | Case studies |
| 3 | Curiosity Gap | +45% | Highest retention |
| 4 | Question | +40% | Thought-provoking |
| 5 | Controversial | +35% | Comments + shares |
| 6 | Trend / FOMO | +35% | Timely + actionable |
| 7 | Numbered List | +30% | Reliable + shareable |
| 8 | Social Proof | +25% | Credibility |


---

## Reference: emotional-arcs

# Emotional Arc Sequencing: 4 Patterns for Article Engagement

## Core Pacing Rule

The AI must vary pacing: **Fast emotional swings** in the introduction and **slow builds** in the body.

### Pacing Metrics

| Position | Time | Word Limit |
|----------|------|------------|
| Hook | 2 seconds | 15 words max |
| Build | 2 seconds | 20 words max |
| Peak / Insight | 3 seconds | 25 words max |

---

## The 4 Emotional Arcs

### Arc 1: Discovery
**Emotion Sequence:** Surprise → Curiosity → Resolution → Joy
**Best For:** AI breakthroughs, new technology reveals, unexpected findings, innovation stories
**Neurotransmitter Flow:**
- Surprise phase: **Cortisol** spike — attention grabbed via unexpected claim or data
- Curiosity phase: **Dopamine** buildup — brain craves resolution of the information gap
- Resolution phase: **Dopamine** release — satisfying "aha moment" payoff
- Joy phase: **Oxytocin** — warm connection, reader feels smarter/validated

**Section-Level Pacing:**
- Open FAST with a surprising stat or counterintuitive claim (1-2 sentences)
- Slow into exploration — unpack the "how" and "why" over 2-3 paragraphs
- Build to the peak insight gradually — let data accumulate
- Resolve with a clear, joyful "so this means..." conclusion

### Arc 2: Empowerment
**Emotion Sequence:** Frustration → Recognition → Confidence → Empowerment
**Best For:** Productivity articles, skill-building, workflow optimization, self-improvement
**Neurotransmitter Flow:**
- Frustration phase: **Cortisol** — mirror the reader's existing pain ("you've tried everything...")
- Recognition phase: **Oxytocin** — empathy and validation ("you're not alone, here's why it happens")
- Confidence phase: **Dopamine** — actionable steps that feel achievable
- Empowerment phase: **Oxytocin + Dopamine** — reader envisions their transformed future

**Section-Level Pacing:**
- Open FAST with a frustration mirror — name the exact pain in 1-2 punchy sentences
- Slow into recognition — validate the reader's experience with data or stories (2-3 paragraphs)
- Build confidence step by step — each actionable tip builds on the last
- Close with empowerment — paint the "after" picture vividly

### Arc 3: Myth-Busting
**Emotion Sequence:** Fear → Tension → Revelation → Relief
**Best For:** Controversial takes, debunking common beliefs, industry myth corrections, contrarian analysis
**Neurotransmitter Flow:**
- Fear phase: **Cortisol** — establish what's at stake ("if you believe X, you're in danger of Y")
- Tension phase: **Cortisol sustained** — deepen the stakes with evidence of the myth's harm
- Revelation phase: **Dopamine** spike — the "truth" drops, cognitive dissonance resolves
- Relief phase: **Oxytocin** — reader feels rescued, grateful for the correction

**Section-Level Pacing:**
- Open FAST with a fear-inducing claim or warning (1-2 sentences)
- Build SLOW tension — layer evidence that the common belief is wrong (3-4 paragraphs)
- Peak with the revelation — one powerful section that flips the narrative
- Resolve quickly with relief — clear action steps now that the truth is known

### Arc 4: Transformation
**Emotion Sequence:** Aspiration → Challenge → Doubt → Proof → Belief
**Best For:** Case studies, founder stories, before/after narratives, personal development journeys
**Neurotransmitter Flow:**
- Aspiration phase: **Dopamine** — paint an attractive future the reader wants
- Challenge phase: **Cortisol** — reveal the obstacles that make it hard
- Doubt phase: **Cortisol sustained** — the "dark night of the soul" moment
- Proof phase: **Dopamine** spike — concrete evidence it's possible (data, testimonials, results)
- Belief phase: **Oxytocin + Dopamine** — reader believes they can do it too

**Section-Level Pacing:**
- Open FAST with an aspirational hook — the transformation promise (1-2 sentences)
- Slow into the challenge — describe specific obstacles with empathy (2-3 paragraphs)
- Deepen into doubt — this is where most people quit; acknowledge it honestly
- Build to proof — stack evidence (numbers, quotes, screenshots, timelines)
- Close with belief — connect the proof back to the reader's situation

---

## Arc Selection Guide

| Article Goal / Topic | Recommended Arc | Why |
|---------------------|----------------|-----|
| AI / technology breakthrough | Discovery | Surprise drives curiosity, joy drives shares |
| Productivity / workflow | Empowerment | Readers come frustrated, leave confident |
| Controversial opinion / myth | Myth-Busting | Fear-to-relief creates strong memory + shares |
| Case study / journey | Transformation | Before/after proof builds aspiration + belief |
| Product review / comparison | Discovery or Empowerment | Discovery for innovative products, Empowerment for practical tools |
| Health / safety warning | Myth-Busting | Stakes are high, relief is powerful |
| Career / personal development | Transformation | Journey narrative is most relatable |
| Data / research findings | Discovery | Surprise-driven data reveals drive engagement |
| How-to / tutorial | Empowerment | Frustration-to-confidence is the natural flow |
| Industry trend analysis | Discovery or Myth-Busting | Discovery for positive trends, Myth-Busting for contrarian takes |

---

## Neurotransmitter Reference

| Neurotransmitter | Triggers | Effect on Reader | Best Arc Phases |
|-----------------|----------|-----------------|-----------------|
| **Cortisol** | High-stakes moments, fear, urgency, "what if you DON'T act" | Attention + memory formation | Fear, Frustration, Challenge, Doubt |
| **Dopamine** | Curiosity resolution, rewards, actionable insights, proof | Reward sensation + motivation | Curiosity, Resolution, Confidence, Proof, Joy |
| **Oxytocin** | Personal stories, empathy, relatability, shared identity | Trust + connection + shareability | Recognition, Relief, Empowerment, Belief, Joy |

### Neurotransmitter Targeting per Section

When writing each section of an article, intentionally target one primary neurotransmitter:

- **Stories and personal anecdotes** → Oxytocin (activates medial prefrontal cortex for self-processing — increases shareability)
- **Data, stats, and proof points** → Dopamine (brain rewards itself for learning something new)
- **Urgency, stakes, and warnings** → Cortisol (creates memory formation; reader remembers the content)
- **Relatable frustrations and validations** → Oxytocin (builds trust; "this person gets me")
- **Actionable steps and frameworks** → Dopamine (brain anticipates reward of implementation)
- **Self-reflection prompts** → Oxytocin (activates medial prefrontal cortex — "how does this apply to MY life?")

---

## Completion-to-Share Resolution

The final section of every article must serve as the **share trigger**. Research shows:

- **Completion rate** has replaced impressions as the primary success metric (2025 shift)
- For a share to occur, content must first **resolve the narrative tension** it created
- A real payoff — key insight or surprising resolution — **validates the reader's time investment**
- This validated feeling triggers the **final impulse to share**

### Engineering the Final Section

1. **Resolve all major open loops** — no loose ends
2. **Deliver one standout insight** that the reader didn't expect at the start
3. **Connect back to the hook** — show how far the reader has traveled
4. **End with a forward-looking statement** — the reader's future is now different
5. **Include the self-reflection trigger** — "Now that you know this, what will YOU do differently?"


---

## Reference: content-templates

# Content Templates — 12 Article Structures

> Pre-built section structures for common article types. Each template includes word count, section breakdown, recommended framework + arc pairing, tone guidance, and SEO/GEO strategy. Use with the Template Auto-Selection Guide below.

---

## Template Auto-Selection Guide

Match the topic characteristics to the right template:

| If the article is about... | Select Template |
|---------------------------|----------------|
| Step-by-step process or instructions | How-To Guide |
| Multiple items, tips, or tools | Listicle |
| A specific company/project success story | Case Study |
| Two or more alternatives side by side | Comparison |
| Comprehensive topic coverage (cornerstone) | Pillar Page |
| Evaluating a specific product/tool | Product Review |
| Original opinion or industry analysis | Thought Leadership |
| Curated collection from multiple sources | Roundup |
| Teaching a skill with examples | Tutorial |
| Reacting to recent news or event | News Analysis |
| Original research, survey, or data analysis | Data Research |
| Answering common questions about a topic | FAQ Knowledge Base |

**Override:** User can always override the auto-selection. Present the recommendation with rationale and allow the user to choose a different template.

---

## Template Summary

| # | Template | Words | Best Framework | Best Arc |
|---|---------|-------|---------------|---------|
| 1 | How-To Guide | 2,000-2,500 | PASO or Question Ladder | Empowerment |
| 2 | Listicle | 1,500-2,000 | AIDA | Discovery |
| 3 | Case Study | 1,500-2,000 | StoryBrand or BAB | Transformation |
| 4 | Comparison | 1,500-2,000 | FAB | Discovery |
| 5 | Pillar Page | 3,000-4,000 | Question Ladder | Empowerment |
| 6 | Product Review | 1,500-2,000 | FAB or PASO | Discovery |
| 7 | Thought Leadership | 1,500-2,500 | PASO or StoryBrand | Myth-Busting |
| 8 | Roundup | 1,500-2,000 | AIDA | Discovery |
| 9 | Tutorial | 2,000-3,000 | Question Ladder | Empowerment |
| 10 | News Analysis | 800-1,200 | AIDA | Myth-Busting |
| 11 | Data Research | 2,000-3,000 | PASO | Discovery |
| 12 | FAQ Knowledge Base | 1,500-2,000 | Question Ladder | Empowerment |

---

## Template 1: How-To Guide (2,000-2,500 words)

### Section Structure:
1. **Hook + Problem Statement** (150-200 words) — Name the pain. Why is this hard? What goes wrong without the solution?
2. **Why This Matters / Stakes** (200-300 words) — Quantify the cost of inaction. Data point on impact. Create urgency.
3. **What You'll Need / Prerequisites** (100-150 words) — Tools, accounts, skills, time estimate. Set expectations.
4. **Step-by-Step Process** (800-1,200 words) — Main body. Each step follows Actionable Depth: What + How + Example + Outcome. 4-8 steps typical.
5. **Common Mistakes to Avoid** (200-300 words) — 3-5 pitfalls with specific fixes. Saves reader from failing.
6. **Expected Results + Timeline** (150-200 words) — What success looks like. Realistic timeline. Metrics to track.
7. **FAQ Section** (2-3 Q&A pairs, 40-60 words each) — Address objections and edge cases. GEO-optimized.
8. **CTA** — Direct + Transitional

### Tone:
Instructional but conversational. Expert teaching a friend. Confident but not condescending. Use "you" throughout.

### Framework: PASO
Problem (pain) → Agitate (stakes) → Solve (steps) → Outcome (results + timeline)

### Arc: Empowerment
Frustration (problem) → Recognition (stakes) → Confidence (steps working) → Empowerment (results achieved)

### SEO Strategy:
Question-style H2 headings for featured snippet capture. "How to [keyword]" title pattern.

### GEO Strategy:
Each step is a 50-150 word extractable passage. FAQ section provides direct answers for AI citation.

---

## Template 2: Listicle (1,500-2,000 words)

### Section Structure:
1. **Hook + Context** (100-150 words) — Why this list matters now. What's changed? Why these specific items?
2. **List Items** (1,000-1,400 words) — 5-10 items. Each item follows Actionable Depth: What + How + Example + Outcome. 150-200 words per item.
3. **Bonus / Hidden Gem** (100-150 words) — One unexpected addition that surprises. Pattern interrupt after the main list.
4. **How to Choose / What to Do Next** (100-150 words) — Decision framework for the reader. Which items to prioritize.
5. **FAQ Section** (2-3 Q&A pairs, 40-60 words each) — Common follow-up questions.
6. **CTA** — Direct + Transitional

### Tone:
Energetic but credible. Each item earns its spot. No filler entries to pad the count.

### Framework: AIDA
Attention (hook) → Interest (list preview) → Desire (items with outcomes) → Action (next steps + CTA)

### Arc: Discovery
Curiosity (what will I learn?) → Engagement (each item delivers value) → Insight (patterns emerge) → Discovery (reader sees the bigger picture)

### SEO Strategy:
Number in title: "[N] Best/Fastest/Proven [keyword] in [year]". Each item as H3 with keyword variation.

### GEO Strategy:
Each list item is a self-contained passage. Numbered format is highly citable by AI systems.

---

## Template 3: Case Study (1,500-2,000 words)

### Section Structure:
1. **Hook + Result Preview** (100-150 words) — Lead with the outcome. "How [Company] achieved [result] in [timeframe]."
2. **The Challenge** (200-300 words) — Specific problem. Context, constraints, what they tried before. Make the reader feel the frustration.
3. **The Approach** (300-400 words) — What they did differently. Strategy, tools, decisions. Be specific about the methodology.
4. **The Execution** (300-400 words) — Step-by-step what happened. Timeline, milestones, pivots. Real details, not generalities.
5. **The Results** (200-300 words) — Hard numbers. Before vs. after metrics. Multiple data points.
6. **Key Takeaways** (150-200 words) — 3-5 lessons the reader can apply. Actionable, not abstract.
7. **FAQ Section** (2-3 Q&A pairs, 40-60 words each) — "Can this work for [different context]?"
8. **CTA** — Direct + Transitional

### Tone:
Narrative but data-rich. Storytelling with proof. The reader should feel like they're learning from someone else's experience.

### Framework: StoryBrand or BAB
StoryBrand: Character (company) → Problem → Guide (methodology) → Plan → Action → Success → Avoid Failure
BAB: Before (the challenge) → After (the results) → Bridge (how they got there)

### Arc: Transformation
Struggle (challenge) → Decision (approach) → Action (execution) → Transformation (results)

### SEO Strategy:
"[Company/Industry] Case Study: How [keyword] Led to [result]" title pattern. Results-focused H2s.

### GEO Strategy:
Results section is highly citable. Include specific numbers in 50-word extractable blocks.

---

## Template 4: Comparison (1,500-2,000 words)

### Section Structure:
1. **Hook + Decision Context** (100-150 words) — Why the reader needs to choose between these options. What's at stake.
2. **Quick Comparison Table** (100-150 words) — Side-by-side matrix: features, pricing, best for. Scannable at a glance.
3. **Option A Deep Dive** (300-400 words) — Strengths, weaknesses, best use case. Real user examples.
4. **Option B Deep Dive** (300-400 words) — Same structure as Option A. Fair and balanced.
5. **Option C Deep Dive (if applicable)** (200-300 words) — Third option if relevant. Can be briefer.
6. **Head-to-Head: Key Differences** (200-300 words) — Direct comparisons on the factors that matter most.
7. **Our Recommendation** (100-150 words) — Clear verdict with reasoning. "Choose A if... Choose B if..."
8. **FAQ Section** (2-3 Q&A pairs, 40-60 words each) — "Is X better than Y for [specific use case]?"
9. **CTA** — Direct + Transitional

### Tone:
Objective but opinionated. Fair analysis with a clear recommendation. The reader came for a decision — help them make one.

### Framework: FAB
Features (comparison table) → Advantages (deep dives) → Benefits (recommendation per use case)

### Arc: Discovery
Confusion (too many options) → Clarity (structured comparison) → Insight (key differences) → Discovery (right choice for them)

### SEO Strategy:
"[A] vs [B]: Which [keyword] Is Better in [year]?" title pattern. Comparison table for featured snippets.

### GEO Strategy:
Comparison table and recommendation section are highly extractable. Each deep dive is a self-contained passage.

---

## Template 5: Pillar Page (3,000-4,000 words)

### Section Structure:
1. **Hook + Topic Overview** (200-300 words) — Define the topic. Why it matters. What the reader will learn.
2. **Table of Contents** — Linked section list for navigation.
3. **Foundation / What Is [Topic]** (300-400 words) — Define core concepts. Beginner-friendly but not condescending.
4. **Why [Topic] Matters** (300-400 words) — Business impact. Data points. Industry trends.
5. **Core Subtopic 1** (400-500 words) — Deep coverage with examples and data.
6. **Core Subtopic 2** (400-500 words) — Same depth as Subtopic 1.
7. **Core Subtopic 3** (400-500 words) — Same depth as Subtopic 2.
8. **Advanced Considerations** (300-400 words) — Edge cases, scaling, advanced techniques.
9. **Tools and Resources** (200-300 words) — Named tools with specific use cases.
10. **FAQ Section** (4-5 Q&A pairs, 40-60 words each) — Comprehensive FAQ for the entire topic.
11. **CTA** — Direct + Transitional

### Tone:
Authoritative and comprehensive. The definitive resource on this topic. Accessible to beginners but valuable to intermediates.

### Framework: Question Ladder
Build complexity gradually. Each section answers a progressively deeper question.

### Arc: Empowerment
Overwhelm (topic is big) → Foundation (basics click) → Competence (subtopics build knowledge) → Empowerment (reader owns the topic)

### SEO Strategy:
Cornerstone content. "[Complete/Ultimate/Definitive] Guide to [keyword]" title pattern. Hub page linking to cluster content.

### GEO Strategy:
Each subtopic is a standalone extractable passage. FAQ section is a citation goldmine. Answer-first formatting on every H2.

---

## Template 6: Product Review (1,500-2,000 words)

### Section Structure:
1. **Hook + Verdict Preview** (100-150 words) — Quick take: is it worth it? Set expectations immediately.
2. **What Is [Product]** (150-200 words) — Brief description. What it does. Who it's for.
3. **Key Features** (300-400 words) — 4-6 features with real-use impressions, not spec sheets.
4. **What Works Well** (200-300 words) — Specific strengths with examples. What surprised you positively.
5. **What Could Be Better** (200-300 words) — Honest limitations. Specific scenarios where it falls short.
6. **Pricing and Value** (100-150 words) — Cost breakdown. Is the value proposition clear?
7. **Alternatives** (100-150 words) — 2-3 competitors with one-line comparisons.
8. **Final Verdict** (100-150 words) — Clear recommendation with use-case qualifier.
9. **FAQ Section** (2-3 Q&A pairs, 40-60 words each) — "Is [product] worth it for [audience]?"
10. **CTA** — Direct + Transitional

### Tone:
Honest and practical. First-person experience where possible. The reader trusts you because you show the downsides too.

### Framework: FAB or PASO
FAB: Features → Advantages → Benefits (per feature section)
PASO: Problem (need) → Agitate (current pain) → Solve (product) → Outcome (verdict)

### Arc: Discovery
Interest (is this for me?) → Evaluation (features + pros/cons) → Clarity (pricing + alternatives) → Discovery (verdict — yes/no/conditional)

### SEO Strategy:
"[Product] Review [year]: Honest Take After [timeframe] of Use" title pattern. Feature names as H3 keywords.

### GEO Strategy:
Verdict and pricing sections are highly citable. Feature descriptions as standalone passages.

---

## Template 7: Thought Leadership (1,500-2,500 words)

### Section Structure:
1. **Hook + Contrarian Claim** (100-200 words) — Challenge conventional wisdom. State a bold position immediately.
2. **The Current State** (200-300 words) — What most people believe. Why it feels right. Set up the myth.
3. **Why It's Wrong / Incomplete** (300-400 words) — Evidence against the conventional view. Data, examples, logical argument.
4. **The Real Picture** (400-600 words) — Your thesis. What's actually happening. Original insight backed by evidence.
5. **What This Means for [Audience]** (200-300 words) — Practical implications. What should the reader do differently?
6. **The Path Forward** (150-200 words) — Actionable steps. How to apply this insight.
7. **FAQ Section** (2-3 Q&A pairs, 40-60 words each) — Address counterarguments.
8. **CTA** — Direct + Transitional

### Tone:
Confident and provocative. The writer has a point of view and defends it with evidence. Not arrogant — thoughtful and data-backed.

### Framework: PASO or StoryBrand
PASO: Problem (broken assumption) → Agitate (consequences) → Solve (new perspective) → Outcome (better path)
StoryBrand: Reader as hero → Conventional wisdom as villain → Author as guide → New understanding as success

### Arc: Myth-Busting
Assumption (current state) → Doubt (evidence against) → Revelation (the real picture) → New Understanding (what this means)

### SEO Strategy:
Opinion-driven titles: "Why [Common Belief] Is Wrong About [keyword]" or "[keyword]: What Everyone Gets Wrong."

### GEO Strategy:
Contrarian claims with evidence are highly citable. "The Real Picture" section as a standalone extractable block.

---

## Template 8: Roundup (1,500-2,000 words)

### Section Structure:
1. **Hook + Curation Context** (100-150 words) — Why this roundup, why now. What was the selection criteria.
2. **Selection Methodology** (50-100 words) — How items were chosen. Criteria for inclusion.
3. **Roundup Items** (1,000-1,400 words) — 8-15 items. Each item: name, source, 1-2 sentence summary, why it matters, link/reference. 80-120 words per item.
4. **Patterns and Trends** (100-150 words) — What do these items have in common? What trend emerges?
5. **FAQ Section** (2-3 Q&A pairs, 40-60 words each) — "How were these selected?" "What's missing?"
6. **CTA** — Direct + Transitional

### Tone:
Curator voice. Knowledgeable and selective. The reader trusts your taste and judgment.

### Framework: AIDA
Attention (why this roundup) → Interest (methodology) → Desire (items deliver value) → Action (apply findings)

### Arc: Discovery
Anticipation (what will I find?) → Exploration (each item) → Pattern recognition (trends) → Discovery (bigger picture)

### SEO Strategy:
"[N] Best [keyword] [Resources/Tools/Examples] in [year]" title pattern. Each item as H3 for scanability.

### GEO Strategy:
Each roundup item is a self-contained citable passage. Methodology section adds credibility for AI systems.

---

## Template 9: Tutorial (2,000-3,000 words)

### Section Structure:
1. **Hook + What You'll Build/Learn** (150-200 words) — Show the end result. Screenshot or outcome description. Create desire.
2. **Prerequisites** (100-150 words) — Skills, tools, accounts needed. Time estimate. Difficulty level.
3. **Step 1: [First Action]** (200-400 words) — Actionable Depth. Include code/config snippets where relevant.
4. **Step 2: [Second Action]** (200-400 words) — Build on Step 1. Show intermediate result.
5. **Step 3: [Third Action]** (200-400 words) — Continue building. Address common errors at this stage.
6. **Step 4+: [Additional Steps]** (200-400 words each) — As many as needed. Each step standalone-testable.
7. **Testing / Verification** (150-200 words) — How to verify it works. Expected output. Troubleshooting.
8. **Next Steps / Extending** (100-150 words) — How to build on what was learned. Advanced variations.
9. **FAQ Section** (2-3 Q&A pairs, 40-60 words each) — Common troubleshooting questions.
10. **CTA** — Direct + Transitional

### Tone:
Patient and precise. Like a senior colleague walking you through something. Assumes intelligence but not prior knowledge.

### Framework: Question Ladder
Each step answers a progressively deeper question. "How do I...?" → "What if...?" → "How do I extend...?"

### Arc: Empowerment
Intimidation (looks complex) → Confidence (first step works) → Flow (steps build naturally) → Empowerment (reader built the thing)

### SEO Strategy:
"How to [keyword]: Step-by-Step [Tutorial/Guide] with [Examples/Code]" title pattern.

### GEO Strategy:
Each step is a self-contained extractable passage. Verification section provides concrete answers for troubleshooting queries.

---

## Template 10: News Analysis (800-1,200 words)

### Section Structure:
1. **Hook + News Summary** (100-150 words) — What happened. When. Key facts. Lead with the news, not commentary.
2. **Context / Why This Matters** (150-200 words) — Historical context. What led to this. Why readers should care.
3. **Analysis** (300-400 words) — What does this mean? Expert perspectives. Data-backed interpretation. Multiple angles.
4. **Impact on [Audience]** (150-200 words) — Specific implications for the target reader. What changes for them.
5. **What to Watch Next** (100-150 words) — Follow-up developments. What to monitor. Timeline for impact.
6. **CTA** — Direct + Transitional

### Tone:
Timely and informed. Analytical, not reactive. The reader wants to understand, not just know.

### Framework: AIDA
Attention (breaking news hook) → Interest (context) → Desire (analysis + implications) → Action (what to do about it)

### Arc: Myth-Busting
Surface reaction (what it seems) → Deeper context (what's actually happening) → Revelation (true implications) → New understanding (what to watch)

### SEO Strategy:
Timeliness-driven. "[Keyword]: What [News Event] Means for [Audience]" title pattern. Speed of publication matters.

### GEO Strategy:
News summary and impact sections are highly citable. Current-year data and specific dates for freshness signals.

---

## Template 11: Data Research (2,000-3,000 words)

### Section Structure:
1. **Hook + Key Finding** (150-200 words) — Lead with the most surprising data point. Why it matters.
2. **Methodology** (150-200 words) — How the data was collected. Sample size. Time period. Limitations.
3. **Finding 1: [Headline Stat]** (300-400 words) — Data + visualization description + analysis + implication.
4. **Finding 2: [Headline Stat]** (300-400 words) — Same structure. Build on Finding 1 if possible.
5. **Finding 3: [Headline Stat]** (300-400 words) — Same structure. Most counterintuitive finding works well here.
6. **What This Means** (200-300 words) — Synthesis of all findings. The story the data tells.
7. **Limitations and Future Research** (100-150 words) — Honest about what the data doesn't show.
8. **FAQ Section** (2-3 Q&A pairs, 40-60 words each) — "How was this data collected?" "Can I use these findings?"
9. **CTA** — Direct + Transitional

### Tone:
Evidence-first. Let the data speak. Analytical but accessible. No hyperbole — the numbers do the persuading.

### Framework: PASO
Problem (knowledge gap) → Agitate (cost of not knowing) → Solve (data reveals) → Outcome (implications)

### Arc: Discovery
Question (what's really happening?) → Evidence (findings) → Pattern (synthesis) → Discovery (actionable insight)

### SEO Strategy:
"[keyword] Statistics [year]: [N] Findings from [Data Source]" title pattern. Stat-rich H2s for snippet capture.

### GEO Strategy:
Every finding is a self-contained citable passage. Methodology section builds trust for AI citation. Individual stats as extractable blocks.

---

## Template 12: FAQ Knowledge Base (1,500-2,000 words)

### Section Structure:
1. **Hook + Topic Overview** (100-150 words) — What this FAQ covers. Why these questions matter. Who it's for.
2. **Getting Started Questions** (3-4 Q&A pairs, 60-100 words each) — Beginner-level questions. Foundation knowledge.
3. **How-To Questions** (3-4 Q&A pairs, 60-100 words each) — Implementation questions. Practical answers.
4. **Troubleshooting Questions** (3-4 Q&A pairs, 60-100 words each) — Problem-solving questions. Specific fixes.
5. **Advanced Questions** (2-3 Q&A pairs, 60-100 words each) — Expert-level questions. Edge cases and nuances.
6. **Still Have Questions?** (50-100 words) — Where to get more help. Community, support, resources.
7. **CTA** — Direct + Transitional

### Tone:
Helpful and direct. Every answer is complete — no "it depends" without explaining what it depends on. The reader should leave each answer satisfied.

### Framework: Question Ladder
Build complexity from Getting Started → How-To → Troubleshooting → Advanced. Natural learning progression.

### Arc: Empowerment
Confusion (I have questions) → Clarity (basics answered) → Competence (how-to mastered) → Empowerment (even edge cases covered)

### SEO Strategy:
"[keyword]: [N] Questions Answered" or "Everything You Need to Know About [keyword]" title pattern. Each Q as H3 for snippet capture.

### GEO Strategy:
Every Q&A pair is a standalone extractable passage. This entire template is optimized for AI citation — each answer is a self-contained chunk.

