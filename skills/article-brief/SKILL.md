---
name: article-brief
description: Brainstorm and outline planning for articles with virality pre-assessment. Use when the user wants to plan, brainstorm, or outline an article before writing. Triggers on brief, brainstorm, outline, plan article, article plan, rencana artikel, or any request to plan written content before generation.
---

# Article Brief — Brainstorm + Outline Planning

Plan an article before writing: topic exploration, audience definition, framework selection, hook generation, emotional arc, virality pre-assessment, and structured outline.

## Reference Files

- ALWAYS read: `references/global-config.md`
- Framework: + `references/frameworks-library.md`
- Hooks: + `references/hook-repository.md`
- Arcs: + `references/emotional-arcs.md`
- Virality: + `references/virality-triggers.md`
- Image concepts: + `references/image-prompt-guide.md`

## Workflow: Article Brief

### Step 1 — TOPIC EXPLORATION

- User provides topic or general direction
- Web search for trending angles, pain points, audience questions
- Present 3-5 angle options to user with rationale for each

### Step 2 — AUDIENCE DEFINITION

- Identify target reader persona (role, experience level, industry)
- Define their primary pain point (the specific problem that brought them here)
- Define emotional state BEFORE reading (frustrated, curious, anxious, hopeful)
- Define desired emotional state AFTER reading (empowered, relieved, confident, inspired)

### Step 3 — FRAMEWORK RECOMMENDATION

- Read frameworks-library.md Decision Matrix
- Match article goal/topic → framework
- Recommend 2-3 frameworks with rationale (why each fits this topic)
- User selects

### Step 4 — HOOK GENERATION

- Read hook-repository.md
- Generate 3 hooks with specific roles (same structure as article-gen):
  1. **PRIMARY:** Safest, highest-probability hook for this context
  2. **SECONDARY:** Alternative angle — different hook type, different psychological driver
  3. **WILDCARD:** Engagement Multiplier — combines two hook types (e.g., Curiosity+Numbers, HotTake+Story)
- Each hook includes: type, psychological driver, engagement boost %, actual text
- Score each on: word count (15 target, 25 max), read time (max 2s), mobile chars (max 25)
- User selects one

### Step 5 — ARC + RETENTION PLAN

- Read emotional-arcs.md
- Select emotional arc matching topic (use Arc Selection Guide)
- Map retention techniques to outline sections:
  - Where bucket brigades go (every major transition)
  - Where open loops open/close (3+ in first 500 words)
  - Where nested loops layer
  - Where "trailer moments" tease upcoming content
  - Where pattern interrupts break rhythm (every 300-400 words)
- Plan neurotransmitter targeting per section:
  - Which sections trigger oxytocin (stories/empathy → medial prefrontal cortex → shareability)
  - Which sections trigger cortisol (stakes/urgency → memory formation)
  - Which sections trigger dopamine (curiosity resolution → reward circuitry)
- Plan Completion-to-Share resolution: what is the final reward/insight that validates reader's time and triggers share impulse?
- Plan citation placement (minimum 1 per 400 words for E-E-A-T)

### Step 6 — VIRALITY PRE-ASSESSMENT

- Read virality-triggers.md
- Assess which of 5 triggers the current outline activates:
  1. Social Currency — is there insider/exclusive info?
  2. High-Arousal Emotion — which high-arousal emotion will dominate?
  3. Practical Utility — which section uses [Number]+[Superlative]+[Timeframe]+[Outcome]?
  4. Identity Signaling — what professional/cultural identity can readers reinforce?
  5. Cognitive Gap Closure — is the narrative tension + resolution pipeline strong?
- If < 3 triggers active: recommend outline adjustments to boost virality BEFORE writing
- Present assessment to user

### Step 7 — OUTLINE OUTPUT

- Read image-prompt-guide.md Section Type → Concept Mapping
- Generate structured outline with all planning integrated
- Present to user for final approval

## Output Format

```
## Article Brief: [Topic]

**Audience:** [persona — role, experience, industry]
**Pain Point:** [primary pain point]
**Before State:** [emotional state before reading]
**After State:** [desired emotional state after reading]
**Framework:** [selected framework]
**Hook:** [selected hook text] ([type], [engagement boost %])
**Arc:** [selected arc] ([emotion sequence])
**Target Length:** [word count]
**Image Count:** [3-5 based on length]
**Virality Pre-Score:** [N]/5 active triggers
**Completion Reward:** [planned final insight/resolution]

---

### Virality Pre-Assessment
| # | Trigger | Active? | Planned Activation |
|---|---------|---------|-------------------|
| 1 | Social Currency | [YES/NO] | [how the article provides insider value] |
| 2 | High-Arousal Emotion | [YES/NO] | [target emotion: awe/excitement/anger] |
| 3 | Practical Utility | [YES/NO] | [which section uses the formula] |
| 4 | Identity Signaling | [YES/NO] | [target identity group] |
| 5 | Cognitive Gap Closure | [YES/NO] | [loop structure + resolution plan] |

---

### Outline

**Section 1: [Title]** — [Framework phase]
- Emotional beat: [arc phase] ([intensity])
- Retention: [technique to apply]
- Neurotransmitter: [oxytocin/cortisol/dopamine] — [how]
- Key point: [what this section delivers]
- Citation: [planned data point / source]
- Open loop: [opens/closes which loop]
- Image concept: [1-line visual concept] | Style: [recommended style]

**Section 2: [Title]** — [Framework phase]
- Emotional beat: [arc phase] ([intensity])
- Retention: [technique to apply]
- Neurotransmitter: [oxytocin/cortisol/dopamine] — [how]
- Key point: [what this section delivers]
- Citation: [planned data point / source]
- Open loop: [opens/closes which loop]
- Image concept: [1-line visual concept] | Style: [recommended style]

**Section 3: [Title]** — [Framework phase]
- Emotional beat: [arc phase] ([intensity])
- Retention: [technique to apply]
- Neurotransmitter: [oxytocin/cortisol/dopamine] — [how]
- Key point: [what this section delivers]
- Citation: [planned data point / source]
- Open loop: [opens/closes which loop]
- Image concept: [1-line visual concept] | Style: [recommended style]

**Section 4: [Title]** — [Framework phase]
- Emotional beat: [arc phase] ([intensity])
- Retention: [technique to apply]
- Neurotransmitter: [oxytocin/cortisol/dopamine] — [how]
- Key point: [what this section delivers]
- Citation: [planned data point / source]
- Open loop: [opens/closes which loop]
- Image concept: [1-line visual concept] | Style: [recommended style]

**Section 5: [Title]** — [Framework phase]
- Emotional beat: [arc phase] ([intensity])
- Retention: [technique to apply]
- Neurotransmitter: [oxytocin/cortisol/dopamine] — [how]
- Key point: [what this section delivers]
- Citation: [planned data point / source]
- Open loop: [opens/closes which loop]
- Image concept: [1-line visual concept] | Style: [recommended style]

[... continue for all sections as needed ...]

**CTA:**
- Direct: [specific action — "Sign up now", "Start free trial"]
- Transitional: [softer action — "Download the guide", "Read the case study"]
```
