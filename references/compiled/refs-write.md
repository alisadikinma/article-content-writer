# Article Generation Reference — Write (Step 4)

System prompt reference for the `/article-write` skill.
Contains: global-config (trimmed), style-guide, retention-engine, seo-rules-engine (trimmed).
These references are injected via --append-system-prompt-file. Do NOT read them with the Read tool.
Note: image-prompt-guide is NOT included — image prompts are generated separately after article approval.

---

## Reference: global-config

# Article Content Writer — Global Config

> Single source of truth for all configurable values. To change any setting, edit THIS file only.

---

## 1. Language

| Setting | Value |
|---------|-------|
| `primary_language` | Indonesian |
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



---

## Reference: style-guide

# Style Guide: Technical Writing Rules for Article Quality

> These 8 rules form the style enforcement layer. Every article draft must pass through ALL rules before quality gate scoring.

---

## Rule 1: Paragraph Structure

**Max 3–4 lines per paragraph. More periods, fewer commas.**

Short paragraphs create visual breathing room. Dense walls of text trigger the brain's "skip" reflex. Each paragraph should contain one idea, expressed in 2-4 sentences.

**Before (FAIL):**
> The evolution of artificial intelligence has been a fascinating journey spanning decades of research and development, with early pioneers like Alan Turing laying the groundwork for what would eventually become one of the most transformative technologies in human history, affecting everything from healthcare to finance, education to entertainment, and fundamentally reshaping how we think about the relationship between human intelligence and machine capability.

**After (PASS):**
> AI has been evolving for decades. Alan Turing laid the groundwork. Now it's reshaping healthcare, finance, education, and entertainment.
>
> But here's what most people miss:
>
> The real transformation isn't in what AI can do. It's in how it changes the way we think about our own intelligence.

---

## Rule 2: The "So What?" Test

**If a sentence describes a feature without a reader benefit, delete it.**

Every sentence must answer the reader's unconscious question: "So what? Why should I care?" Feature descriptions are not enough — they must connect to a benefit the reader personally experiences.

**Before (FAIL — feature only):**
> Our platform uses a microservices architecture with Kubernetes orchestration and a Redis caching layer.

**After (PASS — benefit-first):**
> Your pages load in under 2 seconds, even during traffic spikes. That means fewer bounced visitors and more conversions.

**The Test:** Read each sentence and ask "So what?" If you can't answer with a direct reader benefit, rewrite or delete.

---

## Rule 3: AI Word Replacement System (107 Words, 3 Tiers)

**Three-tier system for detecting and replacing AI-sounding vocabulary.** Words are classified by how strongly they signal machine-generated text.

### Tier 1 — Always Replace (52 words)

These appear 5-20x more frequently in AI text than human text. Replace on sight. Zero tolerance.

| Replace | With |
|---------|------|
| delve / delve into | explore, dig into, look at |
| landscape (metaphor) | field, space, industry, world |
| tapestry | describe the actual complexity |
| realm | area, field, domain |
| paradigm | model, approach, framework |
| embark | start, begin |
| beacon | rewrite entirely |
| testament to | shows, proves, demonstrates |
| robust | strong, reliable, solid |
| comprehensive | thorough, complete, full |
| cutting-edge | latest, newest, advanced |
| leverage (verb) | use |
| pivotal | important, key, critical |
| underscores | highlights, shows |
| meticulous / meticulously | careful, detailed, precise |
| seamless / seamlessly | smooth, easy, without friction |
| game-changer / game-changing | describe what specifically changed |
| utilize | use |
| watershed moment | turning point, shift |
| nestled | is located, sits |
| vibrant | describe what makes it active, or cut |
| thriving | growing, active |
| showcasing | showing, demonstrating |
| deep dive / dive into | look at, examine, explore |
| unpack / unpacking | explain, break down, walk through |
| bustling | busy, active |
| intricate / intricacies | complex, detailed |
| ever-evolving | changing, growing |
| daunting | hard, difficult, challenging |
| holistic / holistically | complete, full, whole |
| actionable | practical, useful, concrete |
| impactful | effective, significant |
| learnings | lessons, findings, takeaways |
| thought leader / thought leadership | expert, authority |
| best practices | what works, proven methods |
| at its core | cut — just state the thing |
| synergy / synergies | describe actual combined effect |
| interplay | relationship, connection |
| in order to | to |
| due to the fact that | because |
| serves as | is |
| features (verb) | has, includes |
| boasts | has |
| commence | start, begin |
| ascertain | find out, determine |
| endeavor | effort, attempt, try |
| symphony (metaphor) | describe actual coordination |
| embrace (metaphor) | adopt, accept, use |
| unlock | find, discover, access |
| unleash | release, enable, put to work |
| supercharge | speed up, boost |
| enhance | improve, sharpen, strengthen |
| exceed | beat, outperform |
| maximize | get the most from |

### Tier 2 — Flag in Clusters (43 words)

Individually fine. **2+ in the same paragraph = AI signal.** Replace extras to break the cluster.

| Replace | With |
|---------|------|
| harness | use, take advantage of |
| navigate / navigating | work through, handle |
| foster | encourage, support, build |
| elevate | improve, raise |
| streamline | simplify, speed up |
| empower | enable, let, allow |
| bolster | support, strengthen |
| spearhead | lead, drive |
| resonate / resonates with | connect with, matter to |
| revolutionize | change, reshape |
| facilitate | enable, help, allow |
| underpin | support, form the basis of |
| nuanced | specific, subtle |
| crucial | important, key |
| multifaceted | describe actual facets |
| ecosystem (metaphor) | system, community, market |
| myriad | many |
| plethora | many, a lot of |
| encompass | include, cover |
| catalyze | start, trigger |
| reimagine | rethink, redesign |
| augment | add to, expand |
| cultivate | build, develop, grow |
| illuminate | clarify, explain |
| elucidate | explain, spell out |
| juxtapose | compare, contrast |
| paradigm-shifting | describe what actually shifted |
| transformative / transformation | describe what changed and how |
| cornerstone | foundation, key part |
| paramount | most important |
| poised (to) | ready, about to |
| burgeoning | growing, emerging |
| nascent | new, early-stage |
| quintessential | typical, classic |
| overarching | main, central |
| galvanize | motivate, rally |
| underpinning / underpinnings | basis, foundation |
| optimal / optimize | best, improve |
| stakeholder | people involved, team, customer |
| bandwidth | time, capacity |
| synergize | work together |
| ideate | brainstorm, plan |
| iterate | repeat, refine, try again |

### Tier 3 — Flag at High Density (12 words)

Only flag when **>3% of total words.** These are normal words that become AI signals at high density.

| Word | Replace with |
|------|-------------|
| significant / significantly | cite specific numbers |
| innovative / innovation | describe what's actually new |
| effective / effectively | say how or cite a metric |
| dynamic / dynamics | name actual forces or changes |
| scalable / scalability | describe what scales and to what |
| compelling | say why it compels |
| unprecedented | name the precedent it breaks |
| exceptional / exceptionally | cite what makes it the exception |
| remarkable / remarkably | say what's worth remarking on |
| sophisticated | describe the sophistication |
| instrumental | say what role it played |
| world-class / state-of-the-art / best-in-class | cite benchmark or comparison |

---

## Rule 4: 20% Fluff Reduction

**Execute a "second pass" to rub out 20% of the draft's fluff.**

After the first draft is complete, do a dedicated editing pass with one goal: cut 20% of the word count without losing any information or impact.

**What to cut:**
- Redundant phrases ("in order to" → "to", "at this point in time" → "now")
- Throat-clearing openings ("It's important to note that..." → delete)
- Repeated ideas stated in different words
- Adjectives that don't add specificity ("very unique" → "unique")
- Filler sentences that don't move the reader forward (Slippery Slide test)
- Prepositional phrase chains ("the impact of the implementation of the new system" → "the new system's impact")

**Fluff Reduction Checklist:**
1. Read the full draft once for flow
2. Highlight every sentence that could be deleted without losing meaning
3. Delete highlighted sentences
4. Tighten remaining sentences (remove unnecessary words)
5. Verify word count reduction is approximately 20%
6. Read again — if it flows better, the cut was correct

---

## Rule 5: Flesch-Kincaid Grade 5

**Target readability: Grade 5 (age 9–11).**

Grade 5 readability does NOT mean dumbing down content. It means expressing complex ideas in clear, simple language. The smartest writers in the world write at Grade 5 — it respects the reader's time.

**How to achieve Grade 5:**
- Short sentences (aim for 10-15 words average)
- Common words over jargon ("use" not "utilize", "help" not "facilitate")
- Active voice over passive ("we tested" not "tests were conducted")
- One idea per sentence
- Concrete nouns over abstract ones ("sales grew 40%" not "we experienced significant growth")

**Before (Grade 12 — FAIL):**
> The implementation of artificial intelligence paradigms in contemporary organizational frameworks necessitates a comprehensive reassessment of existing operational methodologies to facilitate optimal synergistic outcomes.

**After (Grade 5 — PASS):**
> When your company starts using AI, you need to rethink how you work. Old processes won't cut it anymore.

---

## Rule 6: E-E-A-T Density

**Minimum 1 data point or reputable third-party citation per 400 words.**

E-E-A-T (Experience, Expertise, Authoritativeness, Trustworthiness) signals satisfy both search algorithms and reader trust. An article without external proof points is an opinion piece, not authoritative content.

**What counts as a citation:**
- Named statistics from reputable sources ("According to a 2025 McKinsey report...")
- Expert quotes with attribution ("As Dr. Sarah Chen, AI researcher at Stanford, explains...")
- Study results with publication names ("A Harvard Business Review study found...")
- Official data from institutions ("The Bureau of Labor Statistics reports...")
- Named case studies with real numbers ("Shopify merchants saw a 23% increase...")

**What does NOT count:**
- Vague attributions ("Studies show..." — which studies?)
- Self-referential claims ("Our research indicates..." without methodology)
- Common knowledge ("The sun rises in the east")
- Unverified statistics ("90% of marketers agree..." — source?)

**Citation Placement Strategy:**
| Article Position | Citation Purpose |
|-----------------|-----------------|
| First 400 words | Establish credibility early — reader decides trust in opening |
| Every 400 words after | Maintain E-E-A-T density throughout |
| Key claims | Every factual claim must be backed |
| Transformation proof | Case studies, before/after data |
| Closing section | Final authoritative data point for share confidence |

---

## Rule 7: Actionable Depth (The "Now What?" Test)

**Every numbered point in a list-based section must be implementable, not just readable.**

When an article promises "7 ways," "5 steps," or any numbered framework, each point must contain enough detail that a reader can **open their laptop and start doing it within 5 minutes** of reading. A one-liner with a dash explanation is a table of contents, not an article.

### Minimum Structure per Numbered Point

Every point in a Practical Utility or list-based section MUST include:

| Element | Purpose | Min Length |
|---------|---------|-----------|
| **What** | The specific action — name it clearly | 1-2 sentences |
| **How** | Step-by-step implementation — concrete enough to follow | 2-4 sentences |
| **Example** | Real company/tool/person + specific numbers — NOT generic | 2-3 sentences |
| **Outcome** | Measurable result with numbers — what happens when you do this | 1-2 sentences |
| **Pitfall** (optional) | Common mistake to avoid — saves reader from failing | 1-2 sentences |

**Minimum: 150-250 words per point.** A single line is never enough.

### The "Now What?" Test

After writing each numbered point, ask: **"Can the reader start doing this within 5 minutes of reading?"**

- If YES → the point has actionable depth
- If NO → add more specificity: which tool, which spreadsheet, which metric, which first step

The "Now What?" test extends the "So What?" test. "So What?" ensures benefit. "Now What?" ensures the reader can **act on** that benefit.

### Before/After Examples

**Before (FAIL — too shallow):**
> 2. Petakan pola keputusan — temukan di mana manusia membuat pilihan berulang

**After (PASS — actionable depth):**
> ### 2. Petakan pola keputusan — temukan di mana manusia membuat pilihan berulang
>
> Selama satu minggu, minta setiap anggota tim menandai setiap kali mereka membuat keputusan yang terasa "autopilot" — keputusan yang jawabannya selalu sama.
>
> Kumpulkan hasilnya di spreadsheet sederhana: kolom A = keputusan, kolom B = frekuensi per minggu, kolom C = waktu rata-rata per keputusan.
>
> Ketika Deloitte melakukan ini untuk divisi procurement mereka, mereka menemukan 340 keputusan per minggu yang jawabannya identik 95% dari waktu. Setelah mengotomasi keputusan-keputusan ini dengan rule-based AI, approval time turun dari 48 jam menjadi 12 menit.
>
> Mulai dengan: Notion database atau Google Sheets sederhana. Buat form singkat (3 field: keputusan, frekuensi, waktu) dan share ke tim via Slack.
>
> Jangan jatuh ke jebakan ini: Jangan mencoba memetakan SEMUA keputusan sekaligus. Fokus ke satu departemen atau satu workflow dulu — hasilnya lebih cepat terlihat dan lebih mudah di-scale.

### When to Apply This Rule

| Section Type | Depth Required? |
|-------------|----------------|
| Numbered list / "X ways to..." | YES — full depth per point |
| Step-by-step tutorial | YES — full depth per step |
| Comparison points | YES — each comparison needs specifics |
| Narrative sections | NO — storytelling follows different rules |
| Opening/closing | NO — hooks and CTAs have their own rules |
| Data/statistics sections | PARTIAL — cite source + explain implication |

---

## Rule 8: AI Pattern Detection (36 Categories)

**Detect and eliminate structural, linguistic, tonal, and advanced patterns that signal AI-generated text.** These patterns are invisible to the writer but obvious to experienced readers and AI detection systems.

### Structural Patterns (10)

| # | Pattern | Fix |
|---|---------|-----|
| 1 | Em-dash overuse | Replace with commas, periods, or rewrite the sentence |
| 2 | Bold overuse | Strip most bold; restructure sentences to emphasize through word choice |
| 3 | Excessive bullet lists | Convert to prose paragraphs — not everything needs a list |
| 4 | Compulsive rule of three | Vary groupings — use two or four instead of always three |
| 5 | Numbered list inflation | Use lists only when items are genuinely parallel |
| 6 | Inline-header lists | Remove bold headers within lists; write directly |
| 7 | Title case headings | Use sentence case for subheadings (capitalize first word only) |
| 8 | Uniform paragraph length | Vary sentence and paragraph lengths — mix short and long |
| 9 | Missing bridge sentences | Add connective tissue between paragraphs |
| 10 | Excessive structure | Too many headers or lists — let prose breathe |

### Language Patterns (12)

| # | Pattern | Fix |
|---|---------|-----|
| 11 | Formulaic openings | Lead with news or insight, not broad context ("In today's world...") |
| 12 | "It's not X — it's Y" construction | Rewrite as a direct positive statement |
| 13 | Hollow intensifiers | Cut "genuine", "real", "truly", "quite frankly" |
| 14 | Hedging language | Cut "perhaps", "could potentially", "it's important to note" |
| 15 | Copula avoidance | Default to "is" or "has" instead of fancy substitutes |
| 16 | Synonym cycling | Repeat the clearest word instead of forcing variation |
| 17 | Vague attributions | Name specific sources or drop the attribution entirely |
| 18 | Transition phrase overuse | Replace "Moreover", "Furthermore", "Additionally" with direct flow |
| 19 | Superficial -ing analyses | Replace present-participle chains with specific facts |
| 20 | Promotional language | Replace tourism-brochure prose with plain description |
| 21 | Formulaic challenges | Name actual challenges, not vague resilience claims |
| 22 | False ranges | List actual topics instead of unrelated extremes ("from X to Y") |

### Tone Patterns (8)

| # | Pattern | Fix |
|---|---------|-----|
| 23 | Generic conclusions | Cut "The future looks bright", "Only time will tell" |
| 24 | Chatbot artifacts | Remove "I hope this helps!", "Great question!" |
| 25 | "Let's" constructions | Cut transition-functioning "let's"; start with the point |
| 26 | Sycophantic tone | Remove conversational rewards validating the reader |
| 27 | Acknowledgment loops | Cut restatements of the prompt or prior section |
| 28 | Emotional flatline | Show emotion through content, not by announcing it |
| 29 | Confidence calibration phrases | Cut "Interestingly", "Notably", "It's worth noting" |
| 30 | Rhetorical question openers | State the answer directly instead |

### Advanced Patterns (6)

| # | Pattern | Fix |
|---|---------|-----|
| 31 | Notability name-dropping | Use one specific source with context, not a list of famous names |
| 32 | Parenthetical hedging | Give asides their own sentence or cut them |
| 33 | Vague endorsement ("worth verbing") | Replace with specific reasons why |
| 34 | False concession structure | Make concessions specific or pick a side |
| 35 | Reasoning chain artifacts | State conclusions then evidence; cut scaffolding |
| 36 | Cutoff disclaimers | Remove "As of my last update" or "I don't have real-time data" |

---

## Style Pass Checklist

Run this checklist on every draft before quality gate scoring:

- [ ] No paragraph exceeds 4 lines
- [ ] Every section passes the "So What?" test (benefit, not feature)
- [ ] Tier 1 words: zero present (scan all 52)
- [ ] Tier 2 words: no clusters (max 1 per paragraph)
- [ ] Tier 3 words: density under 3%
- [ ] AI patterns: none of the 36 categories detected
- [ ] 20% fluff reduction pass completed
- [ ] Readability at Grade 5 level (short sentences, common words, active voice)
- [ ] Minimum 1 citation per 400 words (E-E-A-T density)
- [ ] No weasel words or unattributed claims
- [ ] Every numbered point passes "Now What?" test (reader can act within 5 minutes)
- [ ] Numbered points have minimum structure: What + How + Example + Outcome (150-250 words each)


---

## Reference: retention-engine

# Retention Engine: 5 Psychological Techniques for Reader Retention

Overview: These techniques form the "psychological cement" that keeps readers scrolling. Every sentence has one purpose: to compel the reader to read the NEXT sentence. If a sentence does not move the reader forward, it is "dead weight" and must be deleted.

## 1. The Slippery Slide (Sugarman's Rule)

**What it is:** Named after legendary copywriter Joseph Sugarman, this technique ensures that the sole purpose of every line of copy is to get the reader to read the next one. It creates an "irresistible descent" from the headline to the CTA.

**Psychological Principle:** The slide taps into human curiosity and the brain's natural desire to see a journey through once started. Once a person begins their "descent" into an engaging story or claim, reaching the bottom becomes nearly effortless.

**Implementation Rules for Blog Articles:**
- **Keep the first line short:** A brief opening sentence lowers the barrier to entry
- **Break up paragraphs:** Use subheadings and short sentences to keep content digestible
- **Transition smoothly:** Every element must flow naturally into the next to maintain momentum

**Concrete Examples:**
1. Starting an article with a relatable 4-word sentence (e.g., "It happened at midnight.") to force a second-line read
2. Using a personal story about a friend (as Sugarman did with his "Len" story) to humanize the product early on
3. Leading with a bold statement that makes the reader think, "I want to know more!"

---

## 2. Open Loops (Zeigarnik Effect)

**What it is:** The Zeigarnik Effect — the brain remembers incomplete tasks better than completed ones. Open loops are the rhetorical application: introduce a compelling story, question, or "secret" and intentionally delay the conclusion.

**Psychological Principle:** Incomplete tasks create cognitive tension — a "mental itch" that persists in working memory and demands resolution. The brain has a deep intolerance for loose ends, making the reader compelled to keep reading until the payoff.

**Implementation Rules for Blog Articles:**
- **Open early, close late:** Introduce a narrative or problem in the intro but don't reveal the fix until the end
- **Sprinkle multiple loops:** Introduce secondary questions throughout the middle to prevent "mid-point bounce"
- **Avoid summarization:** Do not give the "answer" in the headline; summary-style headlines satisfy the brain and kill the urge to click
- **The "Closure Test":** Ensure your lead creates an information gap between what the reader knows and what they need to know
- **Always deliver:** Close every loop to maintain trust; "clickbait" without resolution devalues future content
- **MANDATE:** 3+ open loops in the first 500 words of any article
- **MANDATE:** FORBID summary-style headers (e.g., "Our results were good"). USE "Information Gaps" (e.g., "The one metric that predicted our failure")
- **End every section** with a cliffhanger that only the subsequent section resolves

**Concrete Examples:**
1. The "Mistake" Hook: "I made a mistake that nearly ruined my career—and I'm glad I did."
2. Netflix-style cliffhangers: "But then, the data showed something we didn't expect..."
3. Mid-story interruption: "But before I tell you what happened in that room, let's look at why most pitches fail."
4. Headline teases: "The secret trick I used to land a $5,000 client"

---

## 3. Bucket Brigades (Joanna Wiebe's Transitions)

**What it is:** Short, conversational transition phrases used to pull readers deeper into the copy by bridging the gap between paragraphs.

**Psychological Principle:** Bucket brigades function by maintaining conversational energy. They mimic one-to-one dialogue, making the content feel like a real-time interaction rather than a static wall of text. The colon at the end acts as a visual prompt that the thought is incomplete.

**Implementation Rules for Blog Articles:**
- **Use on a new line:** Break up a long thought into two parts, using the brigade as the bridge
- **Always end with a colon:** This forces the reader to look at the next line for the payoff
- **Don't over-edit:** Use natural, conversational language — if you wouldn't say it in a chat, don't use it as a brigade

**Bucket Brigade Phrase Library:**

| Type | Phrases |
|------|---------|
| **Setups** | But here's the problem: / Look: / The only problem: |
| **Curiosity** | What is it? / Want to know more? / Sound impressive? |
| **Explaining** | Think about it: / It could be this: / Here is how: |
| **Hooks** | Check this out: / Fact: / Newsflash: |
| **Transitional** | Wait, there's more: / The best part? / But it doesn't end there... |
| **Empathy** | I know the feeling. / We've all been there. / Picture this: |

**Concrete Examples:**
1. Setting a scene: "Picture this:" followed by the story on the next line
2. Highlighting a transition: "But it doesn't end there..."
3. Aligning with the reader: "I know the feeling." or "We've all been there."

---

## 4. Pattern Interrupts

**What it is:** A deliberate disruption of an expected rhythm that forces the brain out of "autopilot" to refocus on the content.

**Psychological Principle:** It triggers the orienting response, an instinctual reflex to turn attention toward anything new or different. Since the brain filters out repetitive or predictable information to save energy, a pattern interrupt "wakes up" the mind.

**Implementation Rules for Blog Articles:**
- **Frequency:** Every 300-400 words in the article
- **Visual contrast:** Use bold text-only sections in image-heavy feeds or raw, human photos instead of polished graphics
- **Tone shifts:** Suddenly change pacing or tone mid-article (e.g., "Stop manual prompts!" in a technical guide)
- **Lowercasing:** Using lowercase in subheaders to mimic a casual text from a friend

**Three Core Techniques:**
1. **Tone Shift** — suddenly casual in a technical guide, or suddenly serious in a lighthearted piece
2. **Vulnerability** — "We messed up" or "I hate content writing" to shock the reader into attention
3. **Format Play** — dropping a single, high-impact bold statement in the middle of wide white space

**Concrete Examples:**
1. A question hook mid-article: "Ever catch yourself slouching at your desk?" in a productivity guide
2. Vulnerability interrupts: Starting a section with "We messed up" or "I hate content writing"
3. Format play: A single bold statement centered in white space

---

## 5. Nested Loops (Serial Dependency)

**What it is:** A sophisticated storytelling technique where the writer opens a new curiosity loop before closing the previous one.

**Psychological Principle:** Cognitive tension is ADDITIVE. The brain does not abandon an unresolved question when a new one appears; instead, it holds both simultaneously, creating a cascading chain of tension that pulls the reader deeper into the "funnel."

**Implementation Rules for Blog Articles:**
- **Layer the loops:** Start one anecdote, transition to a tactical point (opening a second loop), then circle back to resolve both at once
- **The "Trailer" Moment:** Use a "coming up later" teaser while you are in the middle of providing value on a current point
- **Serial Dependency:** Resolution of a previous loop must occur only AFTER a new curiosity loop has been opened

**Concrete Examples:**
1. The Multi-Story Technique: "I'll show you the 3-sentence script that got me my biggest client—but first, let me tell you about the disaster that happened right before."
2. Nested Video Logic: Promise a solution in the intro, then ask a new question just as the first point is being delivered
3. The "Serial Dependency" Loop: Each section resolves the previous section's question while opening a new one for the next

---

## Retention Technique Placement Guide

| Article Position | Primary Technique | Why |
|-----------------|-------------------|-----|
| First line | Slippery Slide (short sentence) | Lower barrier to entry |
| First 500 words | 3+ Open Loops (Zeigarnik) | Create cognitive tension early |
| Every major transition | Bucket Brigade | Maintain momentum between sections |
| Every 300-400 words | Pattern Interrupt | Re-engage wandering attention |
| Throughout body | Nested Loops | Additive tension prevents exits |
| End of every section | Open Loop cliffhanger | Drive to next section |
| Final section | Close major loops | Satisfy reader for share trigger |

---

## Section Transition Patterns

Beyond bucket brigades, use these 5 patterns to maintain narrative thread between sections:

| Pattern | When to Use | Template |
|---------|------------|----------|
| **Callback** | Reference something from 2+ sections ago | "Remember the [thing] we mentioned earlier? Here's where it pays off:" |
| **Foreshadow** | Tease the next section's key insight | "This works even better when combined with [next section topic] — which we'll get to in a moment." |
| **Contrast** | Flip perspective between sections | "We've seen what TO do. Now let's look at what destroys all of this." |
| **Escalation** | Raise the stakes progressively | "That was the easy part. The next technique is where most people fail:" |
| **Synthesis** | Connect dots between prior sections | "If [Section A concept] gives you the foundation, [this section concept] gives you the speed." |

**Usage rule:** Use at least 2 different transition patterns per article (in addition to bucket brigades). Vary the patterns — don't repeat the same one consecutively.


---

## Reference: seo-rules-engine

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

## 3. SEO Optimization Rules

These rules are enforced during article-gen Step 7.5 (SEO Optimization pass):

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

## 8. GEO/AEO Optimization Rules

These rules ensure articles are optimized for AI citation in Google AI Overviews, ChatGPT web search, Perplexity, and other AI-powered search systems. GEO (Generative Engine Optimization) and AEO (Answer Engine Optimization) target the extractability and citability of content by AI systems.

### 8.1 Answer-First Formatting

Every H2 section must open with a **40-60 word stat-rich paragraph** that directly answers the section heading. This paragraph must be self-contained — extractable by AI systems as a standalone answer.

- Lead with the fact or answer, then explain
- Bad: "In recent years, there has been a growing trend toward AI-powered onboarding systems that many companies are beginning to adopt across various industries."
- Good: "Companies using AI-powered onboarding see 34% higher retention within 90 days, according to a 2025 Gartner report. Here's how that works."

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

