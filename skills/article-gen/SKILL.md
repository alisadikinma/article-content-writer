---
name: article-gen
description: End-to-end long-form article generator with inline image prompts. Use whenever the user needs blog posts, articles, sales copy, or any long-form written content. Triggers on article, blog post, write article, content writing, long-form, copywriting, tulis artikel, buat artikel, or any request to generate written content.
---

# Article Generation Skill

End-to-end long-form article generator with inline image prompts, retention engineering, emotional arc mapping, and virality optimization.

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
| Final scoring | + `references/quality-gate.md` |

**How to use this table:** Each row adds (+) to the base requirement. For example, when writing the body you read `global-config.md` first, then `retention-engine.md`. Multiple tasks in one step means reading all listed files for those tasks.

---

## 2. Hard Rules (NON-NEGOTIABLE)

These 16 rules apply to EVERY article generated. Violation of any rule requires immediate correction before output.

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

11. **ALWAYS web-verify factual claims before including them.** Every statistic, data point, or factual claim must be verified via web search before inclusion. Do not fabricate or hallucinate data. If a claim cannot be verified, either find a verified alternative or remove it.

12. **NEVER exceed 25 words in the hook (15 preferred, 25 characters for mobile scannability).** The hook is the first sentence. It must be brutally short. 15 words is the target. 25 words is the absolute maximum. The social share preview on mobile shows roughly 25 characters — the hook must land within that window.

13. **ALWAYS score Virality Score (5 triggers) — minimum 3/5 to publish.** Every article must be scored against the 5 virality triggers. A score below 3/5 means the article is not ready. Apply improvement strategies and re-score until the threshold is met.

14. **ALWAYS plan Completion-to-Share resolution.** The article must resolve all narrative tension by the end and deliver a reward. The final section is where the reader feels a sense of completion and is most likely to share. Plan this explicitly during the outline phase.

15. **ALWAYS target high-arousal emotions (awe, excitement, productive anger).** High-arousal emotions drive sharing. NEVER settle for low-arousal emotions like contentment, relaxation, or mild satisfaction. Every article must make the reader feel something strong enough to act on.

16. **ALWAYS include at least 1 Practical Utility section.** This section uses the formula: [Number] + [Superlative] + [Timeframe] + [Outcome]. Example: "7 fastest ways to double your conversion rate in 30 days." This formula signals immediate, concrete value and drives both clicks and shares.

17. **ALWAYS score SEO Score (6 metrics) — minimum 4/6 to publish.** Every article must be scored against the 6 SEO metrics (title length, keyword in title, title words, body keyword density, keyword in first 100 words, keyword in headings). A score below 4/6 means the article is not SEO-ready. Apply optimization strategies and re-score until the threshold is met.

18. **ALWAYS enforce Actionable Depth in numbered sections.** When an article includes numbered lists ("7 ways," "5 steps," etc.), each point MUST have: What (the action, 1-2 sentences), How (implementation steps, 2-4 sentences), Example (real company/tool/person + numbers, 2-3 sentences), Outcome (measurable result, 1-2 sentences). Minimum 150-250 words per point. A one-liner with a dash explanation is a table of contents, not an article. Apply the "Now What?" test: can the reader start doing this within 5 minutes?

---

## 3. Workflow: Full Article Generation

Follow these steps in exact order. Do not skip steps. Do not combine steps. Present output to the user at each checkpoint before proceeding.

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
| 0 | input_collection | 5 | Input parsed from CLI flags |
| 1 | topic_research | 10 | Topic research completed |
| 2 | framework_selection | 15 | Framework selected |
| 3 | emotional_arc | 20 | Emotional arc mapped |
| 4 | hook_generation | 25 | Hook generated |
| 5 | outline_generation | 35 | Full outline created |
| 6 | article_writing | 70 | Article draft completed |
| 7 | style_pass | 78 | Style editing pass done |
| 7.5 | seo_optimization | 82 | SEO optimization pass done |
| 8 | image_prompts | 85 | Image prompts generated |
| 9 | virality_score | 90 | Virality scoring done |
| 10 | quality_gate | 94 | Quality gate passed |
| 10.5 | seo_score | 97 | SEO score passed |
| 11 | completed | 100 | Article ready |

**Completion callback:** After all gates pass (Quality + Virality + SEO), send the FULL data package to the Portfolio API. See `references/seo-rules-engine.md` Section 5 for the complete JSON schema.

```bash
curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/complete" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{
    "article": {
      "title": "{article_title}",
      "content": "{full_html_content}",
      "keyword": "{target_keyword}",
      "word_count": {word_count},
      "citation_count": {citation_count},
      "image_count": {image_count},
      "framework": "{framework_name}",
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
      "concept": "{concept}",
      "prompt": "{full_prompt}",
      "model": "{model}",
      "style": "{style}",
      "aspect_ratio": "{ratio}",
      "resolution": "{resolution}"
    }],
    "research_data": {
      "key_data_points": ["{data_points}"],
      "primary_pain_point": "{pain_point}",
      "sources": [{"name": "{source}", "url": "{url}"}]
    }
  }'
```

**Error handling:** If any step fails, report it as progress with error detail:
```bash
curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/progress" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"step":"failed","percentage":{last_pct},"message":"Error at {step_name}: {error_detail}"}'
```

---

### Step 0 — INPUT COLLECTION

**Pipeline mode:** Parse inputs from CLI flags. Set topic, audience (derive from niche/topic), goal (default: Educate), product (default: None), keyword (from `--keyword` flag or auto-derive). Report progress at 5%.

**Interactive mode:** Collect the following information from the user:

1. **Topic:** What is the article about? Get as specific as possible. "Marketing" is too broad. "How SaaS startups can reduce churn using onboarding emails" is specific.
2. **Product/Service (optional):** Is there a product, service, or brand to weave into the article? If yes, get the name, what it does, and the key value proposition.
3. **Target Audience:** Who is reading this? Get demographics, role, experience level, and primary pain point. "Small business owners who struggle with cash flow" is better than "business people."
4. **Article Goal:** What should the reader DO after reading? Options: Educate (learn something new), Sell (buy a product/service), Convert (sign up, download, subscribe), Engage (share, comment, discuss).
5. **Target Keyword (optional):** Does the user have a specific SEO keyword? If yes, collect it. If no, explain that a keyword will be auto-derived during topic research (Step 1) and presented for confirmation.
6. **Output Path (optional):** Does the user want the article written to a file? If yes, collect the directory path. If no, output to console.

If the user provides a brief or vague request, ask clarifying questions for items 1-4 before proceeding. Do not assume. Do not guess. Get explicit answers.

Format the collected input as a confirmation block:

```
CONFIRMED INPUT:
- Topic: [topic]
- Product/Service: [product or "None"]
- Target Audience: [audience]
- Goal: [educate/sell/convert/engage]
- Target Keyword: [keyword or "Auto-derive in Step 1"]
- Output Path: [path or "Console"]
```

Wait for user confirmation before proceeding to Step 1 (interactive mode only).

---

### Step 1 — TOPIC RESEARCH

**Read:** `references/global-config.md` (if not already read)

Perform web research on the topic to gather current, verified information:

1. **Search for current facts and data points.** Run 3-5 web searches targeting: recent statistics (within 2 years), industry benchmarks, expert opinions, case studies, and counterarguments.
2. **Collect 3-5 reputable sources for E-E-A-T.** Prioritize: peer-reviewed studies, government data, industry reports (McKinsey, Gartner, HubSpot, etc.), established publications, and recognized experts. Avoid: personal blogs without credentials, content farms, and unverified social media claims.
3. **Identify the reader's primary pain point.** Based on research, define the single biggest problem the target audience faces related to this topic. This becomes the emotional anchor for the entire article.
4. **Identify the reader's emotional state.** What does the reader feel BEFORE reading? Frustrated? Confused? Overwhelmed? Skeptical? This determines the emotional starting point for the arc.

5. **Keyword research.** If a keyword was provided in Step 0, validate it (is it specific, natural, intent-matched?). If no keyword was provided, auto-derive 2-3 keyword suggestions from the topic research. Consider: search intent, specificity, natural fit in title, and audience alignment.

Present findings to the user in this format:

```
TOPIC RESEARCH FINDINGS:
- Key Data Points: [3-5 verified statistics with sources]
- Primary Pain Point: [the core problem]
- Reader's Starting Emotion: [emotional state before reading]
- Recommended Angle: [the unique perspective or hook angle]
- Sources Collected: [numbered list of 3-5 sources with URLs]

KEYWORD OPTIONS:
1. [keyword phrase] — [rationale: specificity, intent match, natural title fit]
2. [keyword phrase] — [rationale]
3. [keyword phrase] — [rationale]
RECOMMENDATION: #[N] — [keyword] because [reason tied to topic + audience]
```

User reviews keywords and confirms, modifies, or inputs a custom keyword. The confirmed keyword is used in all subsequent SEO steps.

**Pipeline mode:** If `--keyword` flag provided, use it directly. Otherwise auto-derive and auto-select top recommendation. Report progress: `step=topic_research, percentage=10`.

**Interactive mode:** Wait for user confirmation or adjustments before proceeding to Step 2.

---

### Step 2 — FRAMEWORK SELECTION

**Read:** `references/frameworks-library.md`

Use the Decision Matrix from the frameworks library to match the article goal to the optimal framework:

1. **Map goal to framework candidates.** Each goal (educate, sell, convert, engage) maps to 2-3 frameworks that perform best for that intent.
2. **Evaluate topic fit.** Not every framework suits every topic. A storytelling framework works for case studies but not for technical how-tos.
3. **Present 2-3 options with rationale.** For each option, explain: why this framework fits the goal, how it structures the content, and what makes it effective for this specific topic/audience combination.

Present to the user:

```
FRAMEWORK OPTIONS:
1. [Framework Name] — [1-line rationale why it fits]
2. [Framework Name] — [1-line rationale why it fits]
3. [Framework Name] — [1-line rationale why it fits]

RECOMMENDATION: [#] — [Framework Name] because [specific reason tied to topic and goal]
```

**Pipeline mode:** Auto-select recommended framework. Report progress: `step=framework_selection, percentage=15`.

**Interactive mode:** Wait for the user to pick a framework before proceeding to Step 3.

---

### Step 3 — EMOTIONAL ARC SELECTION

**Read:** `references/emotional-arcs.md`

Match the topic and audience to an emotional arc that will carry the reader from their starting emotion to the desired end state:

1. **Match topic to arc type.** The emotional arc defines the reader's emotional journey from start to finish. Different topics demand different arcs (e.g., a cautionary tale uses a rise-fall arc, an inspirational piece uses a progressive build).
2. **Present recommendation with pacing plan.** Show how the arc maps to article length — where the peaks hit, where the valleys create contrast, and where the climax lands.
3. **Map arc phases to article sections.** Each section of the article corresponds to a phase of the emotional arc. Make this mapping explicit so the writing stays on track.

Present to the user:

```
EMOTIONAL ARC:
- Arc Type: [name]
- Starting Emotion: [from research] → Ending Emotion: [target]
- Pacing Plan:
  - Opening (0-15%): [emotion + intensity]
  - Build (15-40%): [emotion + intensity]
  - Peak (40-60%): [emotion + intensity]
  - Shift (60-80%): [emotion + intensity]
  - Resolution (80-100%): [emotion + intensity]
- Section Mapping:
  - Section 1 → [arc phase]
  - Section 2 → [arc phase]
  - [... etc.]
```

**Pipeline mode:** Auto-proceed. Report progress: `step=emotional_arc, percentage=20`.

**Interactive mode:** Wait for user confirmation before proceeding to Step 4.

---

### Step 4 — HOOK GENERATION

**Read:** `references/hook-repository.md`

Generate exactly 3 hooks for the user to choose from:

1. **PRIMARY HOOK:** The safest, highest-probability hook based on the topic and audience. Uses the single most effective hook type for this context.
2. **SECONDARY HOOK:** An alternative angle — different hook type, different psychological driver. Provides contrast to the primary.
3. **WILDCARD HOOK:** Uses the Engagement Multiplier technique — combines two hook types for compounding effect. Examples: Curiosity + Numbers ("The 3 metrics nobody tracks that predict startup failure"), HotTake + Story ("I fired our best salesperson — here's why revenue went up"), Before/After + FOMO ("This abandoned strategy is outperforming every growth hack in 2026").

For each hook, provide:

```
HOOK [1/2/3]: [PRIMARY / SECONDARY / WILDCARD]
- Type: [hook type from repository]
- Psychological Driver: [why this works on the brain]
- Engagement Boost: [estimated % from repository data]
- Hook Text: "[the actual hook sentence]"
- Word Count: [X] words (target: 15, max: 25)
- Mobile Preview: "[first 25 characters]..."
- Constraint Check: [PASS/FAIL on 15-word target, 25-word max, 25-char mobile preview]
```

**Pipeline mode:** Auto-select the PRIMARY hook. Report progress: `step=hook_generation, percentage=25`.

**Interactive mode:** Present all 3 hooks and wait for the user to pick one (or request modifications) before proceeding to Step 5.

---

### Step 5 — OUTLINE GENERATION

**Read:** `references/retention-engine.md`, `references/image-prompt-guide.md`

Build the complete article structure by combining the selected framework, emotional arc, and hook:

1. **Map framework sections to outline.** Use the selected framework's structure as the skeleton. Each framework defines specific section types and their order.
2. **Overlay retention techniques per section.** For each section, plan which retention techniques will be used:
   - **Bucket brigades:** Plan placement at every major transition point
   - **Open loops:** Plant 3+ in the first 500 words, plan where each one resolves
   - **Nested loops:** Open new narrative threads before closing previous ones — keeps the reader trapped in unresolved tension
   - **"Trailer moments":** Mid-article teases that preview upcoming high-value content ("In section 4, I'll show you the exact template — but first, you need to understand why most templates fail")
3. **Map neurotransmitter targets per section:**
   - **Oxytocin** (stories, empathy, personal anecdotes) → activates medial prefrontal cortex → drives shareability
   - **Cortisol** (stakes, urgency, consequences of inaction) → encodes into long-term memory
   - **Dopamine** (curiosity resolution, reward delivery, surprise reveals) → creates reward anticipation loops
4. **Plan citations.** Minimum 1 per 400 words. Map specific data points from Step 1 research to their target sections.
5. **Plan Practical Utility section(s).** At least 1 section using the [Number] + [Superlative] + [Timeframe] + [Outcome] formula. Identify where it fits naturally in the flow.
6. **Plan Completion-to-Share resolution.** Define the final payoff — what narrative tension gets resolved, what reward the reader receives, and what makes them want to share at that exact moment.
7. **Plan self-reflection trigger.** Identify at least 1 section where the reader is prompted to evaluate their own situation, beliefs, or actions. Self-reflection creates personal investment in the content.
8. **Plan image concepts per section.** Read image-prompt-guide.md Section Type to Concept Mapping. For each planned image, note the section it belongs to, the emotional moment it captures, and the visual concept direction.

Present the full outline:

```
ARTICLE OUTLINE:
Title: [working title]
Framework: [selected]
Arc: [selected]
Hook: [selected]
Target Word Count: [range]
Target Citations: [count]
Target Images: [count]

SECTION BREAKDOWN:
---
Section 1: [Title — information gap style]
- Arc Phase: [phase]
- Neurotransmitter: [target]
- Retention: [techniques planned]
- Citation: [planned data point]
- Image: [Yes/No — concept if yes]
- Open Loops Planted: [count and brief description]
---
Section 2: [Title]
- Arc Phase: [phase]
- Neurotransmitter: [target]
- Retention: [techniques planned]
- Citation: [planned data point]
- Image: [Yes/No — concept if yes]
- Nested Loop: [what opens, what from previous remains unresolved]
---
[... continue for all sections ...]
---
Final Section: [Title]
- Arc Phase: Resolution
- Completion-to-Share: [how tension resolves + reader reward]
- Self-Reflection Trigger: [planned in section X — description]
- Dual CTA: [Direct CTA + Transitional CTA]
---

PRACTICAL UTILITY SECTION:
- Location: Section [N]
- Formula: [Number] + [Superlative] + [Timeframe] + [Outcome]
- Example: "[the actual header]"
```

**Pipeline mode:** Auto-proceed. Report progress: `step=outline_generation, percentage=35`.

**Interactive mode:** Wait for user approval (or revision requests) before proceeding to Step 6.

---

### Step 6 — ARTICLE WRITING (Section by Section)

**Read:** `references/retention-engine.md` (if not already loaded)

Write the article following the approved outline, framework commands, and emotional arc. Apply all Hard Rules throughout.

**Opening rules:**
- The first line of the article MUST be short. This is the Slippery Slide principle — a short first sentence creates momentum. Target: 5-8 words.
- The hook (from Step 4) is delivered within the first 1-2 sentences.
- Plant 3+ open loops within the first 500 words. Each loop is a question, tease, or promise that remains unresolved.

**Per-section rules:**
- **Bucket brigades** at every transition between sections and at major thought shifts within sections. Each sits on its own line and ends with a colon.
- **Pattern interrupts** every 300-400 words. Types: tone shift (serious to conversational), vulnerability moment (personal admission), format play (single-line paragraph, rhetorical question, list break), or direct reader address.
- **Nested loops:** Open a new narrative thread before the previous one resolves. The reader cannot leave because there are always unresolved threads pulling them forward.
- **"Trailer Moments"** placed mid-section to preview upcoming high-value content. These function like movie trailers — they show just enough to create anticipation without delivering the payoff.
- **Neurotransmitter targeting per section:**
  - Oxytocin sections: Include stories, personal anecdotes, empathy-driven language. Target the medial prefrontal cortex to increase shareability.
  - Cortisol sections: Raise stakes, create urgency, describe consequences of inaction. These sections encode into long-term memory.
  - Dopamine sections: Resolve curiosity gaps, deliver surprising insights, provide "aha" moments. These create the reward cycle that keeps readers engaged.
- **Citations per E-E-A-T:** Weave data points naturally into the narrative. Do not dump statistics — contextualize them. "A 2025 HubSpot study found that..." is better than "(Source: HubSpot, 2025)."
- **End each section with a Zeigarnik cliffhanger.** The last line of every section (except the final one) must leave something unresolved — a question unanswered, a story unfinished, a promise unfulfilled.
- **Slippery Slide:** Every sentence must earn the next. If a sentence does not create enough curiosity, tension, or value to pull the reader into the following sentence, rewrite it.
- **Actionable Depth (for numbered/list sections):** When writing numbered points ("7 ways," "5 steps," etc.), each point MUST include:
  - **What:** The specific action (1-2 sentences)
  - **How:** Step-by-step implementation — concrete enough to follow (2-4 sentences)
  - **Example:** Real company, tool, or person with specific numbers (2-3 sentences). NOT generic "Company X saved time."
  - **Outcome:** Measurable result with numbers (1-2 sentences)
  - **Pitfall** (optional): Common mistake to avoid (1-2 sentences)
  - Minimum 150-250 words per point. A one-liner is a table of contents, not an article.
  - Apply the "Now What?" test: can the reader start doing this within 5 minutes of reading?

**Final section rules:**
- Deliver the key insight — the single most important takeaway.
- Include a surprise resolution — resolve the primary open loop from the introduction in an unexpected way.
- Execute the Completion-to-Share plan — the reader should feel both satisfied (tension resolved) and energized (high-arousal emotion) simultaneously. This is the moment they share.
- Include the self-reflection trigger if not already placed earlier.
- Close with Dual CTA: Direct CTA for ready buyers + Transitional CTA for those not yet ready.

Write each section sequentially. After completing the full draft, proceed to Step 7.

**Pipeline mode:** Report progress: `step=article_writing, percentage=70`.

---

### Step 7 — STYLE PASS

**Read:** `references/style-guide.md`

Perform a complete editorial pass on the draft. This is a revision step — do not skip it.

1. **Forbidden vocabulary scan.** Search the entire draft for: Unlock, Unleash, Supercharge, Empower, Enhance, Exceed, Maximize. Replace every instance with a concrete, specific alternative.
2. **Paragraph length check.** No paragraph exceeds 4 lines. Split any that do. Add white space generously — it is a retention tool, not wasted space.
3. **"So What?" test.** Read each section and ask: "If the reader stopped here, did they get a concrete benefit?" Any section that only describes without delivering value gets rewritten to lead with the benefit.
4. **20% fluff reduction.** Cut at least 20% of filler. Targets: "very," "really," "just," "actually," "basically," "literally," "in order to," "the fact that," "it is important to note that," "it goes without saying," and any sentence that restates the previous one without adding new information.
5. **Grade 5 readability check.** Review sentence length (target: 15-20 words average), word complexity (prefer 1-2 syllable words), and structure (active voice, subject-verb-object). If any passage reads above a Grade 7 level, simplify it.
6. **AI writing pattern removal.** Scan for and eliminate: hedging language ("It's worth noting that," "One could argue that"), filler transitions ("In today's fast-paced world," "When it comes to"), passive voice where active is possible, and generic conclusions ("In conclusion," "To sum up").

After completing the style pass, proceed to Step 7.5.

**Pipeline mode:** Report progress: `step=style_pass, percentage=78`.

---

### Step 7.5 — SEO OPTIMIZATION

**Read:** `references/seo-rules-engine.md` (Sections 3 + 4)

Optimize the article for the confirmed target keyword from Step 1. This is an optimization pass — not a scoring step. The goal is to ensure the article meets SEO thresholds BEFORE scoring in Step 10.5.

1. **Title optimization.** Check current title against SEO rules:
   - Length: adjust to 50–60 characters if outside range
   - Keyword: verify keyword is present naturally in the title
   - Word count: adjust to 6–10 words if outside range
   - Title must still follow the Information Gap rule — keyword inclusion must serve the hook, not replace it

2. **First 100 words.** Verify the target keyword appears within the first 100 words of the article body. If missing, weave it into the opening hook, problem statement, or first bucket brigade naturally.

3. **H2/H3 headings.** Count keyword occurrences in all H2 and H3 headings:
   - If 0: add keyword to 1–2 headings where it fits the information gap naturally
   - If 1–2: optimal, no change needed
   - If >3: replace some heading instances with synonyms to avoid keyword stuffing

4. **Body keyword density.** Calculate: (keyword occurrences / total body words) × 100
   - If <0.5%: add keyword naturally in topic sentences of 2–3 key sections
   - If 0.5–1.5%: optimal, no change needed
   - If >1.5%: replace some instances with synonyms or related terms

5. **Natural integration check.** Re-read all keyword placements. If any sentence reads awkwardly due to keyword insertion, rephrase to sound natural. Readability always trumps keyword density.

**Pipeline mode:** Report progress: `step=seo_optimization, percentage=82`.

---

### Step 8 — IMAGE PROMPT GENERATION

**Read:** `references/image-prompt-guide.md`

Generate image prompts that complement the article's emotional journey. Images are not decoration — they are retention tools placed at emotional turning points.

**Image count by article length:**
- Short articles (under 1,900 words): 1 cover + 2 inline = 3 total
- Standard articles (2,000-2,200 words): 1 cover + 3 inline = 4 total
- Long articles (2,200+ words): 1 cover + 4 inline = 5 total

**Image 1: FEATURE/COVER IMAGE (MANDATORY)**
- Purpose: Hero visual that stops the scroll. Works as the article header and social share thumbnail.
- Requirements: Must visually represent the article's core theme. Must be scroll-stopping — bold, high-contrast, emotionally resonant. Must work at thumbnail size for social media previews.
- Style: Portrait Cinematic or Photorealistic (best performing for cover images).
- This image is always generated first regardless of article length.

**Images 2-5: INLINE IMAGES**
- Placement: At emotional turning points within the article — not evenly spaced, but at moments where the emotional arc shifts.
- Concept mapping by section type:
  - **Problem sections:** Dark, tense, cool-toned imagery. Shadows, isolation, visual weight. Creates visceral discomfort that mirrors the reader's pain point.
  - **Solution sections:** Bright, warm, expansive imagery. Open space, light, forward motion. Creates relief and hope.
  - **Data sections:** Clean, professional, structured imagery. Geometric patterns, clear compositions, neutral tones. Signals credibility and precision.
  - **Story sections:** Cinematic, human-centered imagery. Close-ups, natural settings, emotional expressions. Triggers empathy and connection.
  - **CTA sections:** Aspirational, warm, inviting imagery. Depicts the desired outcome. Creates forward pull toward action.

**Prompt specifications:**
- Length: 20-80 words per prompt. Descriptive and specific — not vague.
- NO text-in-image: Never include words, letters, numbers, or text of any kind in the image prompt. Text in AI images renders poorly and looks unprofessional.
- Consistent color palette: All images in a single article must share a cohesive color palette. Define the palette in the cover image and carry it through.
- Parameters for each prompt:
  - **model:** Default `nano-banana-pro`. Use `nano-banana-2` for stylized/artistic needs. Use `imagen-4` for photorealism requiring maximum fidelity.
  - **style:** Match the section type and emotional moment.
  - **aspect_ratio:** Default `16:9` for blog headers and inline. Use `1:1` for social thumbnails if specified.
  - **resolution:** Default `1K`. Use `2K` for cover images if high-res needed. Use `4K` only when explicitly requested.

Present all image prompts to the user for approval:

```
IMAGE PROMPTS ([N] images):

Image 1: FEATURE/COVER IMAGE
- Concept: [1-line description]
- Prompt: "[20-80 word prompt]"
- Model: [model]
- Style: [style]
- Aspect Ratio: [ratio]
- Resolution: [resolution]
- Placement: Article header / social share thumbnail

Image 2: Section [N] — [Section Title]
- Concept: [1-line description]
- Prompt: "[20-80 word prompt]"
- Model: [model]
- Style: [style]
- Aspect Ratio: [ratio]
- Resolution: [resolution]
- Placement: After [section name] — [reason this is an emotional turning point]

[... remaining images ...]
```

**Pipeline mode:** Auto-approve all image prompts. Report progress: `step=image_prompts, percentage=85`.

**Interactive mode:** Wait for user approval before proceeding to Step 9.

---

### Step 9 — VIRALITY SCORE

**Read:** `references/virality-triggers.md` (Scoring Guide section)

Score the article against the 5 virality triggers. Each trigger is worth 1 point. The article must score 3/5 or higher to proceed.

**Scoring criteria:**

1. **Social Currency (1 point):** Does the article make the sharer look smart, informed, or ahead of the curve? Does sharing it signal insider knowledge or good taste? If the reader would feel proud posting this to their LinkedIn or Twitter, it passes.

2. **High-Arousal Emotion (1 point):** Does the article trigger awe, excitement, productive anger, anxiety, or surprise? These are high-arousal emotions that drive action. Low-arousal emotions (contentment, sadness, relaxation) do NOT pass. Identify the dominant emotion and verify it is high-arousal.

3. **Practical Utility (1 point):** Does the article contain at least one section using the [Number] + [Superlative] + [Timeframe] + [Outcome] formula? Is there actionable, immediately usable advice? Would the reader bookmark or save this for future reference?

4. **Identity Signaling (1 point):** Does sharing this article say something about who the reader IS? Does it align with a group identity, professional tribe, or value system? "I'm the kind of person who reads/shares this" must be a positive statement for the target audience.

5. **Cognitive Gap Closure (1 point):** Does the article open a knowledge gap early and close it satisfyingly by the end? Is the resolution surprising or counterintuitive? Does the reader feel smarter after reading?

**If score >= 3/5: PASS.** Proceed to Step 10.

**If score < 3/5: FAIL.** Apply the following per-trigger improvement strategies:

- **Social Currency failing:** Add a counterintuitive finding, an insider framework, or exclusive data that makes the sharer look informed.
- **High-Arousal Emotion failing:** Increase stakes in the problem section, add a provocative hot take, or amplify the transformation contrast.
- **Practical Utility failing:** Add or strengthen the Practical Utility section with a clearer [Number] + [Superlative] + [Timeframe] + [Outcome] formula.
- **Identity Signaling failing:** Sharpen the audience targeting — make the reader feel seen. Add "If you're the kind of [role] who [specific behavior]..." language.
- **Cognitive Gap Closure failing:** Strengthen the opening gap (make the question more compelling) and improve the resolution (make it more surprising or satisfying).

After applying improvements, re-score. Repeat until the article scores 3/5 or higher.

**Pipeline mode:** Report progress: `step=virality_score, percentage=90`.

---

### Step 10 — QUALITY GATE

**Read:** `references/quality-gate.md`

Score the article against 10 quality criteria. Each criterion is worth 1 point. The article must score 7/10 or higher to proceed.

**Scoring criteria:**

1. **Clear (1 point):** Can a Grade 5 reader understand the main message? Is the thesis stated explicitly within the first 200 words? Are there zero ambiguous pronouns or unclear references?

2. **Concise (1 point):** Has the 20% fluff reduction been applied? Is every sentence necessary? Are there zero instances of restating the same idea in different words?

3. **Compelling (1 point):** Does the hook grab attention within 2 seconds? Are there 3+ open loops in the first 500 words? Does the article maintain forward momentum from start to finish?

4. **Credible (1 point):** Is there at least 1 citation per 400 words? Are all sources reputable and verifiable? Have all factual claims been web-verified?

5. **Nested Loops (1 point):** Are there narrative threads that open before previous ones close? Does the reader always have at least one unresolved question pulling them forward?

6. **Bucket Brigades (1 point):** Are bucket brigades present at every major transition? Do they sit on their own line? Do they end with a colon?

7. **Emotional Arc (1 point):** Does the article follow the planned emotional arc from Step 3? Are there clear emotional peaks and valleys? Does the ending deliver a high-arousal emotional payoff?

8. **Scannability (1 point):** Are paragraphs 3-4 lines max? Are headers creating information gaps (not summarizing)? Is there sufficient white space? Would a scanner get the gist from headers alone?

9. **Benefit-First (1 point):** Does every section pass the "So What?" test? Are benefits stated before features? Does the reader gain something from each section?

10. **Dual CTA (1 point):** Is there a Direct CTA for ready buyers? Is there a Transitional CTA for those not yet ready? Are both CTAs specific and actionable?

**If score >= 7/10: PASS.** Proceed to Step 11.

**If score < 7/10: FAIL.** Fix issues in priority order:

1. **Critical (fix first):** Clear, Credible, Compelling — these affect whether the article gets read at all.
2. **High (fix second):** Emotional Arc, Nested Loops, Benefit-First — these affect whether the article gets finished.
3. **Medium (fix third):** Bucket Brigades, Scannability, Dual CTA — these affect conversion and retention.
4. **Low (fix last):** Concise — polish after structural issues are resolved.

After fixing, re-score. Repeat until the article scores 7/10 or higher.

**Pipeline mode:** Report progress: `step=quality_gate, percentage=94`.

---

### Step 10.5 — SEO SCORE

**Read:** `references/seo-rules-engine.md` (Section 1 — Scoring System)

Score the article against the 6 SEO metrics. Each metric uses the traffic light system: Green = 1 point, Amber = 0.5 points, Red = 0 points. Maximum 6/6. Minimum 4/6 to proceed.

**Scoring criteria:**

1. **Title Length (1 point max):** Count characters in the title. Green: 50–60. Amber: 40–50 or 60–70. Red: <40 or >70.

2. **Keyword in Title (1 point max):** Check if the target keyword (case-insensitive) is present in the title. Green: present. Red: missing. (Binary — no Amber.)

3. **Title Word Count (1 point max):** Count words in the title. Green: 6–10. Amber: 5 or 11–12. Red: <5 or >12.

4. **Body Keyword Density (1 point max):** Count keyword occurrences in body text, divide by total words, multiply by 100. Green: 0.5–1.5%. Amber: 0.3–0.5% or 1.5–2.5%. Red: <0.3% or >3%.

5. **Keyword in First 100 Words (1 point max):** Check if keyword appears in the first 100 words. Green: present. Red: missing. (Binary — no Amber.)

6. **Keyword in H2/H3 Headings (1 point max):** Count headings containing the keyword. Green: 1–2. Amber: 0. Red: >3 (keyword stuffing).

Present the SEO score:

```
SEO SCORE: [N]/6 — [PASS/NEEDS OPTIMIZATION]
Target Keyword: [keyword]

| # | Metric | Value | Status |
|---|--------|-------|--------|
| 1 | Title Length | [N] chars | [GREEN/AMBER/RED] |
| 2 | Keyword in Title | [Yes/No] | [GREEN/RED] |
| 3 | Title Words | [N] words | [GREEN/AMBER/RED] |
| 4 | Body Keyword Density | [N]% ([count]/[total]) | [GREEN/AMBER/RED] |
| 5 | Keyword in First 100 | [Yes/No] | [GREEN/RED] |
| 6 | Keyword in Headings | [N] times | [GREEN/AMBER/RED] |
```

**If score >= 4/6: PASS.** Proceed to Step 11.

**If score < 4/6: FAIL.** Apply per-metric optimization strategies from `references/seo-rules-engine.md` Section 7. Focus on Red metrics first (0 points), then Amber (0.5 points). Re-score after fixes. Repeat until 4/6 or higher.

**Pipeline mode:** Report progress: `step=seo_score, percentage=97`.

---

### Step 11 — OUTPUT

Assemble the final output with all components.

**Pipeline mode:** Send the completed article to the Portfolio API via the completion callback (see Pipeline Mode section above). The `generated_article` JSON must include: `title`, `content` (full HTML), `word_count`, `quality_score`, `virality_score`, `framework`, `hook_type`, `emotional_arc`, `image_prompts` (array of prompt objects), and `sources` (array of source objects). Report final progress: `step=completed, percentage=100`.

**If output path was provided in Step 0:**
- Write the complete article to `{path}/article.md`
- Include the full metadata header, article content, image prompts, virality score, quality gate score, and sources list
- Confirm the file path to the user

**If no output path was provided:**
- Print the complete article to the console
- Include all the same components as the file output

The output must follow the exact format specified in Section 4 below.

---

## 4. Output Format

Every article output MUST follow this exact structure:

```
# [Article Title]

**Framework:** [Selected] | **Hook:** [Type] ([engagement boost %]) | **Arc:** [Selected]
**Keyword:** [target keyword]
**Words:** [count] | **Citations:** [count] | **Images:** [count]
**Quality:** [N]/10 | **Virality:** [N]/5 | **SEO:** [N]/6

---

[Full article content with all sections, bucket brigades, retention techniques, and inline image placement markers]

---

## Image Prompts ([N] images)

### Image 1: FEATURE/COVER IMAGE
**Concept:** [1-line hero concept]
**Prompt:** [20-80 words]
**Model:** [nano-banana-pro / nano-banana-2 / imagen-4]
**Style:** [style]
**Aspect Ratio:** [16:9]
**Resolution:** [1K / 2K / 4K]
**Placement:** Article header / social share thumbnail

### Image 2: Section [N] — [Title]
**Concept:** [1-line concept]
**Prompt:** [20-80 words]
**Model:** [model]
**Style:** [style]
**Aspect Ratio:** [ratio]
**Resolution:** [resolution]
**Placement:** After [section] — [emotional turning point reason]

### Image 3: Section [N] — [Title]
**Concept:** [1-line concept]
**Prompt:** [20-80 words]
**Model:** [model]
**Style:** [style]
**Aspect Ratio:** [ratio]
**Resolution:** [resolution]
**Placement:** After [section] — [emotional turning point reason]

### Image 4: Section [N] — [Title]
**Concept:** [1-line concept]
**Prompt:** [20-80 words]
**Model:** [model]
**Style:** [style]
**Aspect Ratio:** [ratio]
**Resolution:** [resolution]
**Placement:** After [section] — [emotional turning point reason]

### Image 5: Section [N] — [Title]
**Concept:** [1-line concept]
**Prompt:** [20-80 words]
**Model:** [model]
**Style:** [style]
**Aspect Ratio:** [ratio]
**Resolution:** [resolution]
**Placement:** After [section] — [emotional turning point reason]

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

## Sources
[Numbered list of all citations used in the article with URLs where available]
```

---

## GeminiGen.AI API Call Reference

Use this API to generate images from the approved prompts in Step 8.

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
- `prompt` (required): The image prompt text from Step 8. Must be 20-80 words.
- `model` (required): One of `nano-banana-pro` (default, best general purpose), `nano-banana-2` (stylized/artistic), or `imagen-4` (maximum photorealism fidelity).
- `aspect_ratio` (required): Default `16:9`. Options: `16:9`, `9:16`, `1:1`, `4:3`, `3:4`.
- `style` (required): Matches the style field from the image prompt (e.g., Photorealistic, Portrait Cinematic, Cinematic, Minimalist, etc.).
- `output_format` (required): Default `jpeg`. Options: `jpeg`, `png`, `webp`.
- `resolution` (required): Default `1K`. Options: `1K`, `2K`, `4K`.

**Environment variable:** Ensure `GEMINIGEN_API_KEY` is set in the environment before making API calls. Do not hardcode the API key in any prompt or output.
