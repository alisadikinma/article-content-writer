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
