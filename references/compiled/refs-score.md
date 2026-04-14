# Article Generation Reference — Score (Step 5)

System prompt reference for the `/article-score` skill.
Contains: style-guide, seo-rules-engine, virality-triggers, quality-gate.
These references are injected via --append-system-prompt-file. Do NOT read them with the Read tool.

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

### Tier 1 — Always Replace (53 words)

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
| empower | enable, let, give the tools |
| enhance | improve, sharpen, strengthen |
| exceed | beat, outperform |
| maximize | get the most from |

### Tier 2 — Flag in Clusters (42 words)

Individually fine. **2+ in the same paragraph = AI signal.** Replace extras to break the cluster.

| Replace | With |
|---------|------|
| harness | use, take advantage of |
| navigate / navigating | work through, handle |
| foster | encourage, support, build |
| elevate | improve, raise |
| streamline | simplify, speed up |
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

**Cut 20% of the draft's fluff — whether inline during writing or as a dedicated pass.**

In the 5-step pipeline, this is applied as a tight-writing mindset during Step 4 (write lean from the start, not as a separate cut pass). In standalone editing or validation, apply it as a dedicated second pass. Either way, the goal is the same: remove 20% of filler without losing information or impact.

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

## Voice Exemplar — What the Target Voice Sounds Like

The rules above define what to AVOID. This section shows what the ideal output SOUNDS like. Use these samples as a tonal north star.

**English exemplar (Empowerment arc, PASO framework, productivity topic):**

> Your mornings are a mess. Not because you're lazy — because nobody taught you how to protect the first two hours of your day.
>
> Here's the thing:
>
> Cal Newport tracked 50 knowledge workers for six months. The ones who blocked their first 90 minutes for deep work shipped 3.2x more projects than those who started with email. Same hours. Same talent. Different sequence.
>
> So what does that look like in practice? Open your calendar right now. Block 8:00-9:30 tomorrow. Label it "Deep Work — No Meetings." Then pick ONE task — the one you've been avoiding because it requires actual thinking. That's your morning anchor.
>
> Don't check Slack first. Don't "just quickly" reply to that thread. The data is clear: every context switch costs you 23 minutes of recovery time. One "quick check" at 8:15 means you don't hit full focus until 8:38.

**Indonesian exemplar (Gen-Z Bahasa, Discovery arc, AI topic):**

> Gue kira AI cuma buat programmer. Ternyata salah besar.
>
> Tapi dengerin dulu:
>
> Riset McKinsey 2025 nunjukin 67% pekerjaan yang paling terbantu AI justru di bidang kreatif — copywriting, desain, strategi marketing. Bukan coding. Bukan data science. Marketing.
>
> Kok bisa? Karena AI paling jago di satu hal: mengolah pola dari jutaan data dan kasih output yang "cukup bagus" dalam hitungan detik. Dan di dunia kreatif, "cukup bagus" itu bukan pengganti lo — itu draft pertama yang bisa lo edit jadi luar biasa.
>
> Coba sekarang: buka ChatGPT, ketik "buatkan 5 angle berbeda untuk artikel tentang [topik lo]." Dalam 30 detik, lo punya 5 starting point yang biasanya butuh 2 jam brainstorm. Nah, dari situ lo pilih yang paling nyambung sama audience lo.

**What makes these samples right:**
- Short sentences (10-15 words average) — Grade 5 readability
- "You"/"lo" address — speaking to one person, not an audience
- Bucket brigades on own lines with colons
- Data with named sources woven naturally, not dumped
- Concrete actions the reader can do in 5 minutes
- Zero Tier 1 words, no AI patterns
- Conversational but credible — like a sharp friend explaining something over coffee

---

## Style Pass Checklist

Run this checklist on every draft before quality gate scoring:

- [ ] No paragraph exceeds 4 lines
- [ ] Every section passes the "So What?" test (benefit, not feature)
- [ ] Tier 1 words: zero present (scan all 53)
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


---

## Reference: virality-triggers

# Virality Triggers: The Science of Shareable Content

## 1. The Neuroscience of Shareable Content

Sharing activates two brain regions simultaneously:

- **Medial Prefrontal Cortex (self-processing):** Content triggering self-reflection is more likely shared. This is WHY self-reflection prompts ("How does this apply to YOUR situation?") increase share rates.
- **Ventral Striatum (reward circuitry):** Social validation from sharing creates dopamine reward, encouraging repeat behavior.

---

## 2. Social Currency and Identity Signaling

People share content that makes them look good. Two mechanisms:

- **Identity Signaling:** Users share to signal belonging to a specific group or reinforce professional/cultural identities.
- **Information Asymmetry:** Exclusive insights or counterintuitive findings let the sharer signal "insider knowledge," increasing perceived status.

---

## 3. Emotional Arousal and Share Rates

**High-Arousal (EFFECTIVE — target these):**
| Emotion | Share Impact | Type |
|---------|-------------|------|
| Awe | 25% of viral content | Positive |
| Amusement | 17% of viral content | Positive |
| Excitement | High share driver | Positive |
| Anger | Triggers immediate "need to act" | Negative |
| Anxiety | Triggers immediate sharing | Negative |

**Low-Arousal (INEFFECTIVE — avoid as dominant tone):**
| Emotion | Share Impact | Type |
|---------|-------------|------|
| Contentment | Very low share rate | Positive |
| Sadness | Low share rate | Negative |

**Rule:** If your article's dominant emotional tone is "contentment" or "mild interest," it will NOT be shared. Target awe, excitement, or productive anger instead.

---

## 4. The Completion-to-Share Pipeline

Completion rate is the primary metric. Content must resolve its narrative tension — if a user doesn't finish, the loop stays open and they won't share. A real payoff at the end (key insight, surprising resolution) validates the reader's time investment and triggers the share impulse.

---

## 5. Engineering Cognitive Gaps

Humans have a deep psychological intolerance for loose ends (Zeigarnik Effect).

- **Open Loops:** Starting a story or mentioning a "secret" and delaying the reveal creates a "mental itch" demanding resolution.
- **The Information Gap:** Effective hooks establish a gap between what the reader knows and what they need to know. Clicks occur because the perceived value of resolving that tension outweighs the cost of attention.

---

## 6. Practical Utility Formula

Content providing high value with low cognitive load spreads rapidly. The formula:

> **[Specific Number] + [Superlative] + [Timeframe] + [Outcome]**

**Examples:**
- "7 Best Productivity Hacks to Gain 2 Extra Hours Daily"
- "3 Fastest Ways to Rank on Google in 30 Days"
- "5 Proven Methods to Double Your Email Open Rate This Week"

Every actionable section in an article MUST use this formula at least once.

---

## 7. The 2025 Trend: Depth Over Micro-Content

- **Crowded Feeds:** Short-form has become "background noise" because everyone uses the same sounds and hooks. Substantial content stands out by being different and more useful.
- **Smarter Audiences:** Readers are tired of "fluff" dressed as insight. They now prioritize creators who respect their intelligence with nuanced, long-form explanations.
- **Algorithm Shifts:** Platforms now prioritize sustained attention and engagement depth (pauses, rewinds, and saves) over quick taps.

---

## 8. E-E-A-T Signals for Trust

E-E-A-T requirements: see `style-guide.md` Rule 6 for full details. Min 1 citation per 400 words. Prioritize: Experience (first-hand accounts) + Trustworthiness (named, dated, reputable citations).

---

## Virality Scoring Guide (5-Point Gate)

**Minimum score: 3/5 to publish.**

### Trigger 1: Social Currency (1 point)

**PASS if:** Article contains exclusive data, insider insights, counterintuitive findings, or original analysis that makes the sharer look knowledgeable to their network.

**FAIL if:** Content is generic, publicly available information with no "insider" angle. Reader gains no status from sharing it.

**How to boost:** Add original data, expert quotes, contrarian analysis, or "most people don't know this" framing. Provide information asymmetry — give the reader something their peers don't have yet.

### Trigger 2: High-Arousal Emotion (1 point)

**PASS if:** Article's dominant emotional tone triggers awe, excitement, or productive anger. Reader feels energized, surprised, or compelled to act after reading.

**FAIL if:** Dominant tone is contentment, mild interest, or sadness (low-arousal). Reader finishes feeling "that was nice" but has no urge to share.

**How to boost:** Lead with surprising data (awe), show dramatic transformation (excitement), or challenge a harmful industry practice (productive anger). Amplify emotional peaks in the arc.

### Trigger 3: Practical Utility (1 point)

**PASS if:** At least 1 section uses the [Number] + [Superlative] + [Timeframe] + [Outcome] formula. Advice is specific, quantified, and immediately actionable.

**FAIL if:** Advice is vague or unquantified ("improve your workflow" instead of "3 best ways to save 2 hours daily"). No section provides concrete, numbered, time-bound value.

**How to boost:** Convert vague advice into the formula. "Write better headlines" becomes "5 Proven Headline Formulas That Doubled Click-Through Rates in 2 Weeks." Add specificity to every actionable section.

### Trigger 4: Identity Signaling (1 point)

**PASS if:** Reader can share the article to reinforce their professional or cultural identity. Content speaks to a specific group ("must-read for marketers," "every developer should know," "founders who've been through this").

**FAIL if:** Content has no identity hook for any specific group. It's so generic that sharing it says nothing about the sharer.

**How to boost:** Call out a specific audience in the hook or subheadings. Use "If you're a [role]..." framing. Include industry-specific language that signals belonging. Make the content feel like it was written FOR a tribe, not for everyone.

### Trigger 5: Cognitive Gap Closure (1 point)

**PASS if:** Article creates strong narrative tension (open loops, Zeigarnik effect) that resolves satisfyingly. The Completion-to-Share Pipeline is intact — reader finishes feeling rewarded, which triggers the share impulse.

**FAIL if:** Article gives away conclusions upfront, has no narrative tension, or ends with a whimper. Reader has no "aha moment" to share. Loops are opened but never closed, or were never opened at all.

**How to boost:** Open 3+ loops in the first 500 words. Build to a clear "revelation" moment. Close major loops with satisfying payoffs. End with a standout insight the reader didn't expect. Connect back to the hook.

---

## Virality Score Output Format

```
## Virality Score: [N]/5
1. Social Currency: [PASS/FAIL] — [evidence]
2. High-Arousal Emotion: [PASS/FAIL] — [dominant emotion identified]
3. Practical Utility: [PASS/FAIL] — [formula usage quote]
4. Identity Signaling: [PASS/FAIL] — [target identity group]
5. Cognitive Gap Closure: [PASS/FAIL] — [resolution quality assessment]
```


---

## Reference: quality-gate

# Quality Gate: 10-Point Article Scoring Checklist

> **Minimum score: 7/10 to publish.** All 10 criteria are mandatory evaluation — no skipping.

---

## Scoring Rules

- Each criterion scores **1 point** (pass) or **0 points** (fail)
- Provide **specific evidence** for each score (quote the line that passes/fails)
- Total score: **[N]/10**
- **>= 7/10:** PASS — article is ready to publish
- **< 7/10:** NEEDS REVISION — fix failing criteria, re-score

---

## The 10 Criteria

### 1. Clear
**Question:** Is the message Grade 5 readable and jargon-free?

**PASS (1 point):** Article uses short sentences (10-15 word average), common vocabulary, active voice. A 10-year-old could follow the main ideas. No unexplained jargon or acronyms.

**FAIL (0 points):** Contains sentences over 25 words, uses jargon without explanation, relies on passive voice, or requires industry expertise to understand the core message.

**Evidence format:** Quote the longest/most complex sentence. If it's under 20 words with common vocabulary, PASS.

---

### 2. Concise
**Question:** Was 20% of the fluff "rubbed out" in the second pass?

**PASS (1 point):** Article feels tight — no redundant phrases, no filler transitions ("In today's world..."), no repeated ideas in different words. Every sentence earns its place via the Slippery Slide test.

**FAIL (0 points):** Contains throat-clearing openings, redundant phrasing, filler sentences that don't move the reader forward, or paragraphs that could be cut without losing meaning.

**Evidence format:** Identify 2+ sentences that could be cut without information loss. If you can't find any, PASS.

---

### 3. Compelling
**Question:** Does it address a specific, urgent pain point immediately?

**PASS (1 point):** The first 100 words name a specific reader problem, the hook creates urgency, and the article maintains emotional stakes throughout. The reader feels "this is about ME."

**FAIL (0 points):** Opens with a generic statement ("AI is changing the world"), takes more than 100 words to get to the point, or fails to establish why the reader should care NOW.

**Evidence format:** Quote the hook and the first pain-point mention. If both are in the first 100 words and specific, PASS.

---

### 4. Credible
**Question:** Is there a citation or data point every 400 words?

**PASS (1 point):** Article contains at least 1 reputable third-party citation per 400 words. Citations are named (not "studies show" — which studies?). E-E-A-T density is maintained throughout.

**FAIL (0 points):** Citation density below 1 per 400 words, uses vague attributions, or makes factual claims without backing. Experience signals (first-hand accounts) are absent.

**Evidence format:** Count citations, divide by word count / 400. If ratio >= 1.0, PASS. List the citations found.

---

### 5. Nested Loops
**Question:** Are there at least three unresolved loops in the first 500 words?

**PASS (1 point):** First 500 words contain 3+ open loops — questions raised, stories started but not finished, promises made but not yet delivered. Reader is cognitively invested in getting answers.

**FAIL (0 points):** First 500 words are self-contained — no unanswered questions, no promised revelations, no incomplete stories. Reader could stop here without feeling they missed anything.

**Evidence format:** Quote each open loop found in the first 500 words. If 3+ identified, PASS.

---

### 6. Bucket Brigades
**Question:** Are transitions placed on their own lines with colons (:)?

**PASS (1 point):** Article uses bucket brigade phrases ("But here's the problem:", "Think about it:", "Check this out:") on their own lines between paragraphs. At least 3 bucket brigades present in the article.

**FAIL (0 points):** Transitions are buried inside paragraphs, don't use colons, or are absent entirely. Sections flow together without conversational bridges.

**Evidence format:** Quote each bucket brigade found. If 3+ present on own lines with colons, PASS.

---

### 7. Emotional Arc
**Question:** Does the pacing follow the "Fast Hook / Slow Build" model?

**PASS (1 point):** Hook is fast (under 15 words, high intensity). Body builds progressively. Emotional intensity varies intentionally (not flat). The arc matches one of the 4 patterns (Discovery, Empowerment, Myth-Busting, Transformation).

**FAIL (0 points):** Hook is long or low-energy. Body has flat emotional intensity throughout. No discernible arc — reads like a list rather than a journey. Pacing is uniform from start to finish.

**Evidence format:** Identify the arc pattern used and quote the hook. If hook is under 15 words and body builds progressively, PASS.

---

### 8. Scannability
**Question:** Are there bold subheadings and no paragraphs longer than 4 lines?

**PASS (1 point):** Every 200-300 words has a bold subheading. No paragraph exceeds 4 lines. Headers use Information Gap format (not summary-style). Visual hierarchy is clear.

**FAIL (0 points):** Large text blocks without headers. Paragraphs exceeding 4 lines. Summary-style headers ("Our Results"). Reader can't quickly scan to find relevant sections.

**Evidence format:** Identify the longest paragraph (line count) and the longest stretch without a subheading. If max paragraph is 4 lines and headers appear every 200-300 words, PASS.

---

### 9. Benefit-First + Actionable Depth
**Question:** Does every section pass both the "So What?" test AND the "Now What?" test?

**PASS (1 point):** Every section leads with a reader benefit ("So What?"). AND for numbered/list-based sections, each point has actionable depth — the reader can start implementing within 5 minutes of reading ("Now What?"). Each numbered point includes: What (the action), How (step-by-step), Example (real company/numbers), Outcome (measurable result). Minimum 150-250 words per numbered point.

**FAIL (0 points):** Sections describe features without benefits. OR numbered points are one-liners without implementation depth — reader knows "what" but not "how." Lists that read like a table of contents instead of actionable guidance.

**Evidence format:** Check 3 random sections. For each, identify the benefit AND the actionable depth. For numbered sections: check that each point has What + How + Example + Outcome. If any numbered point is a single line without implementation detail, FAIL.

---

### 10. Dual CTA
**Question:** Does it include both a "Direct CTA" (Order) and a "Transitional CTA" (Learn)?

**PASS (1 point):** Article ends with two distinct calls to action: (1) a Direct CTA — strong, specific action ("Sign up now", "Buy today", "Start your free trial") and (2) a Transitional CTA — softer, lower-commitment action ("Download the free guide", "Read the case study", "Join the newsletter").

**FAIL (0 points):** Article has no CTA, only one CTA, or a vague CTA ("Learn more"). Missing either the direct or transitional element.

**Evidence format:** Quote both CTAs. If both a direct and transitional CTA are present, PASS.

---

## Revision Priority Guide

When an article scores below 7/10, fix criteria in this order (highest impact first):

| Priority | Criterion | Why Fix First |
|----------|-----------|---------------|
| 1 | Compelling (3) | If the reader doesn't care, nothing else matters |
| 2 | Clear (1) | If they can't understand it, they'll leave |
| 3 | Nested Loops (5) | Early engagement determines completion rate |
| 4 | Emotional Arc (7) | Pacing drives retention through the full article |
| 5 | Credible (4) | Trust determines whether they share |
| 6 | Bucket Brigades (6) | Transitions prevent mid-article drop-off |
| 7 | Concise (2) | Tightness improves everything else |
| 8 | Scannability (8) | Visual structure aids skimmers |
| 9 | Benefit-First (9) | Ensures value is communicated |
| 10 | Dual CTA (10) | Conversion — but only matters if they read to the end |

---

## Quality Gate Output Format

```
## Quality Gate Score: [N]/10 — [PASS / NEEDS REVISION]

| # | Criterion | Score | Evidence |
|---|-----------|-------|----------|
| 1 | Clear | [0/1] | [quote or observation] |
| 2 | Concise | [0/1] | [quote or observation] |
| 3 | Compelling | [0/1] | [quote or observation] |
| 4 | Credible | [0/1] | [citation count / density] |
| 5 | Nested Loops | [0/1] | [loops identified in first 500 words] |
| 6 | Bucket Brigades | [0/1] | [count + examples] |
| 7 | Emotional Arc | [0/1] | [arc pattern + hook quote] |
| 8 | Scannability | [0/1] | [max paragraph lines + header frequency] |
| 9 | Benefit-First | [0/1] | [3 sections checked] |
| 10 | Dual CTA | [0/1] | [both CTAs quoted] |

### Fix Recommendations (Priority Order)
1. [Criterion]: [Specific, actionable fix]
```

---

## CTA Copy Formulas

Use these templates when writing the Dual CTA (criterion #10). Pick one Direct + one Transitional.

**Direct CTA Templates (asks for the sale/action):**

| Pattern | Template | Example |
|---------|----------|---------|
| Imperative + Benefit | "Start [action] today — [outcome] in [timeframe]" | "Start tracking today — save 2 hours by Friday" |
| Social Proof + Action | "Join [number] [role]s who already [outcome]" | "Join 12,000 marketers who already doubled their open rates" |
| Scarcity + Urgency | "[Resource] is free for now — [action] before [trigger]" | "The template is free for now — grab it before we paywall it" |
| Challenge + Dare | "Think you can't [outcome]? Try [action] for [timeframe]" | "Think you can't write viral content? Try this system for 7 days" |
| Question + Action | "Ready to [outcome]? Here's your first step" | "Ready to 3x your traffic? Here's your first step" |

**Transitional CTA Templates (lower commitment alternative):**

| Pattern | Template | Example |
|---------|----------|---------|
| Lead Magnet | "Want the full [resource]? Grab the free [format]" | "Want the full checklist? Grab the free PDF" |
| Next Content | "Liked this? Read [related article] next" | "Liked this? Read our SEO teardown next" |
| Community | "Share your [result] in the comments / with your team" | "Share your first headline test in the comments" |
| Bookmark | "Save this for when you [relevant situation]" | "Save this for when you write your next landing page" |
| Micro-Commitment | "Try just [smallest step] this week — then come back and tell me what happened" | "Try just one bucket brigade this week — then come back and tell me what happened" |

---

## AI Humanization Scoring (20 Points)

Measures how human-sounding the article is. Scored by deductions from a 20-point base. Uses the 3-tier word system and 36 AI pattern categories from `style-guide.md` Rules 3 + 8.

### Deduction Rules

| Violation Type | Deduction | Max Deduction | Source |
|---------------|-----------|---------------|--------|
| Tier 1 word found | -2 points per word | -10 | style-guide.md Rule 3, Tier 1 (53 words) |
| Tier 2 cluster (2+ in same paragraph) | -1 point per violating paragraph | -5 | style-guide.md Rule 3, Tier 2 (42 words) |
| Tier 3 density exceeded (>3%) | -1 point per word exceeding threshold | -3 | style-guide.md Rule 3, Tier 3 (12 words) |
| AI pattern detected | -0.5 points per category found | -2 | style-guide.md Rule 8 (36 categories) |

**Base score:** 20 points.
**Final score:** max(0, 20 - total_deductions).
**Target:** 18+ for publication-ready content.

### AI Humanization Output Format

```
## AI Humanization Score: [N]/20

- Tier 1 violations: [count] words found ([list of words])
- Tier 2 clusters: [count] paragraphs with 2+ Tier 2 words
- Tier 3 density: [word]: [N]% ([status])
- AI patterns: [count] detected ([list of categories])

Total deductions: [N] points
```

---

## Combined Article Score (100-Point Scale)

All scoring gates combine into a single weighted score. This provides a holistic quality assessment.

### Weight Table

| Category | Source | Raw Score | Weight | Weighted Max |
|----------|--------|-----------|--------|-------------|
| Content Quality | Quality Gate (10 criteria) | 0-10 | x3 | 30 pts |
| Virality | Virality Score (5 triggers) | 0-5 | x4 | 20 pts |
| SEO | SEO Score (6 metrics) | 0-6 | x2.5 | 15 pts |
| AI Humanization | AI Humanization check | 0-20 | x1 | 20 pts |
| GEO/AEO Readiness | GEO Score (5 metrics) | 0-5 | x3 | 15 pts |
| **Total** | | | | **100 pts** |

### Scoring Bands

| Band | Score | Meaning |
|------|-------|---------|
| Exceptional | 90-100 | Top-tier content ready for premium publication |
| Strong | 80-89 | High quality, minor improvements possible |
| Acceptable | 70-79 | Meets minimum standard for publication |
| Below Standard | 60-69 | Needs significant revision before publishing |
| Rewrite | <60 | Fundamental issues — start over or major overhaul |

**Minimum to publish: 70 (Acceptable)**

### Combined Score Output Format

```
## Combined Article Score: [N]/100 — [BAND]

| Category | Raw | Weight | Score |
|----------|-----|--------|-------|
| Content Quality | [N]/10 | x3 | [N]/30 |
| Virality | [N]/5 | x4 | [N]/20 |
| SEO | [N]/6 | x2.5 | [N]/15 |
| AI Humanization | [N]/20 | x1 | [N]/20 |
| GEO/AEO | [N]/5 | x3 | [N]/15 |
```

