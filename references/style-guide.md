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
