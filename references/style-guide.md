# Style Guide: Technical Writing Rules for Article Quality

> These 6 rules form the style enforcement layer. Every article draft must pass through ALL rules before quality gate scoring.

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

## Rule 3: Forbidden Vocabulary

**DO NOT USE these 7 words:**

| Forbidden Word | Why | Use Instead |
|---------------|-----|-------------|
| Unlock | AI cliche, overused, empty verb | Find, discover, access, open up |
| Unleash | Dramatic without substance | Put to work, apply, use |
| Supercharge | Hyperbolic, triggers skepticism | Speed up, boost, accelerate |
| Empower | Corporate jargon, vague | Give the tools, enable, help |
| Enhance | Bland, says nothing specific | Improve, sharpen, strengthen |
| Exceed | Promises without specifics | Beat, outperform, go beyond |
| Maximize | Business-speak, impersonal | Get the most from, make the most of |

**Additional AI Writing Patterns to Avoid:**

| Pattern | Example | Fix |
|---------|---------|-----|
| Hedging language | "It could potentially help you..." | "It helps you..." — be direct |
| Filler transitions | "In today's fast-paced world..." | Delete. Start with the point. |
| Listicle padding | "Another great option is..." | Lead with the specific value |
| Empty superlatives | "This incredible tool is amazing" | "This tool cut our load time by 40%" |
| Passive voice | "Mistakes were made" | "We made mistakes" |
| Throat-clearing | "It's worth noting that..." | Delete. Just note it. |
| Weasel words | "Many experts believe..." | Name the expert or cite the source |
| Double hedging | "It might possibly..." | Pick one or commit |

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

## Style Pass Checklist

Run this checklist on every draft before quality gate scoring:

- [ ] No paragraph exceeds 4 lines
- [ ] Every section passes the "So What?" test (benefit, not feature)
- [ ] Zero forbidden vocabulary words present
- [ ] 20% fluff reduction pass completed
- [ ] Readability at Grade 5 level (short sentences, common words, active voice)
- [ ] Minimum 1 citation per 400 words (E-E-A-T density)
- [ ] No AI writing patterns present (hedging, filler, passive voice, empty superlatives)
- [ ] No weasel words or unattributed claims
- [ ] Every numbered point passes "Now What?" test (reader can act within 5 minutes)
- [ ] Numbered points have minimum structure: What + How + Example + Outcome (150-250 words each)
