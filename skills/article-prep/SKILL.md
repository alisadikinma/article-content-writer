---
name: article-prep
description: "Pipeline-only skill for article generation Steps 1-3 (Research + Strategy + Outline). Runs on Sonnet with refs-prep.md injected via --append-system-prompt-file. Outputs structured JSON to backend API. Part of the split pipeline: article-prep → article-write → article-score."
---

# Article Prep Skill (Steps 1-3)

Pipeline-only skill that handles Research, Strategy, and Outline for the split article generation pipeline. Designed to run on **Sonnet** for speed.

> **DO NOT read reference files with the Read tool.** All references (global-config, frameworks-library, hook-repository, emotional-arcs, content-templates) are injected via `--append-system-prompt-file refs-prep.md`. They are already in your system prompt. Reading them again wastes time and tokens.

---

## 1. Pipeline Flags (Required)

This skill runs ONLY in pipeline mode. All inputs come from CLI flags.

| Flag | Required | Description |
|------|----------|-------------|
| `--idea-id {id}` | Yes | Content idea ID in the Portfolio database |
| `--api-url {url}` | Yes | Base API URL (e.g., `https://alisadikinma.com/api`) |
| `--api-token {token}` | Yes | Authentication bearer token |
| `--topic "{topic}"` | Yes | Article topic |
| `--languages {en,id}` | Yes | Comma-separated output languages |
| `--keyword "{keyword}"` | No | Target SEO keyword (auto-derived if not provided) |
| `--instructions "{text}"` | No | Custom generation instructions |

---

## 2. Progress Reporting

Report progress via curl after each sub-step:

```bash
curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/progress" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"step":"{step_name}","percentage":{pct},"message":"{description}"}'
```

| Sub-step | Step Name | Percentage | Description |
|----------|-----------|-----------|-------------|
| Input parsed | input_collection | 5 | Flags parsed, topic confirmed |
| Research done | research | 15 | Web research complete, data points collected |
| Strategy done | strategy | 25 | Framework + arc + hook + template selected |
| Outline done | outline | 35 | Full outline with retention + image concepts |

---

## 3. Workflow

### Step 1 — INPUT + RESEARCH (5% → 15%)

Parse inputs from CLI flags:
- Topic from `--topic`
- Languages from `--languages`
- Keyword from `--keyword` (or auto-derive)
- Instructions from `--instructions` (if provided)
- Audience: derive from topic/niche
- Goal: default "Educate" unless instructions specify otherwise

**Report progress: 5% (input_collection)**

**Web research (2-3 targeted searches):**
1. Search 1: "[topic] statistics data 2024 2025 2026" — recent stats, benchmarks, industry data
2. Search 2: "[topic] case study expert opinion" — real examples, expert quotes
3. Search 3 (if needed): "[topic] trends impact research" — only if first 2 lack sufficient data
4. Read top 2-3 results from snippets. Only WebFetch if snippet lacks specific data.
5. Collect **5-8 verified data points** with source names and URLs
6. Identify reader's primary pain point and emotional state
7. Keyword: if provided, validate. If not, auto-derive and select best option.

**Report progress: 15% (research)**

### Step 2 — STRATEGY (25%)

Using references already in system prompt (frameworks-library, emotional-arcs, hook-repository, content-templates):

**Framework selection:**
1. Use Goal-Based Framework Selection table: match article goal (educate/sell/convert/engage) to primary framework
2. Cross-reference with Topic-Based Decision Matrix for topic-specific refinement
3. If both tables agree, use that framework. If they differ, prefer the Goal-Based table.
4. Select best framework with rationale

**Emotional arc selection:**
1. Match topic to arc type using Arc Selection Guide from emotional-arcs
2. Map arc phases to planned article sections
3. Define pacing plan (peaks, valleys, climax placement)

**Hook generation (3 hooks):**
1. **PRIMARY:** Safest, highest-probability hook for this context
2. **SECONDARY:** Alternative angle, different psychological driver
3. **WILDCARD:** Engagement Multiplier — combines two hook types
4. Each hook: type, psychological driver, engagement boost %, actual text, word count, mobile preview (25 chars)

**Content template selection:**
1. Match topic to template using Auto-Selection Guide from content-templates
2. Template determines: target word count, section structure, tone, recommended framework + arc
3. If template's framework recommendation conflicts with Decision Matrix, prefer Decision Matrix

**Report progress: 25% (strategy)**

### Step 3 — OUTLINE (35%)

Using references already in system prompt (retention-engine concepts are embedded in the outline logic, image-prompt-guide for image concept mapping):

1. **Map framework sections to outline** — use selected framework's structure as skeleton
2. **Apply template section structure** — follow the selected content template's sections, word allocation, tone
3. **Overlay retention techniques per section:**
   - Bucket brigades at every major transition
   - 3+ open loops in first 500 words with planned resolution points
   - Nested loops: open new threads before closing previous ones
   - "Trailer moments" mid-section previewing upcoming value
   - Pattern interrupts every 300-400 words
4. **Map neurotransmitter targets per section:**
   - Oxytocin (stories/empathy), Cortisol (stakes/urgency), Dopamine (curiosity resolution)
5. **Plan citations** — minimum 1 per 400 words, map Step 1 data points to sections
6. **Plan Practical Utility section** — [Number]+[Superlative]+[Timeframe]+[Outcome]
7. **Plan Completion-to-Share resolution** — final payoff + reader reward
8. **Plan image concepts** — 1 cover + 2-4 inline per section type to concept mapping

**Report progress: 35% (outline)**

---

## 4. Completion — Save Prep Data

After Step 3 completes, save all prep data to the backend. **USE FILE-BASED CURL** — inline `-d '...'` breaks at this payload size (5-15 KB with outline + research data). Write to temp file first:

```bash
cat > /tmp/article-prep-{idea_id}.json << 'PAYLOAD_EOF'
{JSON_PAYLOAD}
PAYLOAD_EOF

curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/save-prep" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d @/tmp/article-prep-{idea_id}.json

rm -f /tmp/article-prep-{idea_id}.json
```

**CRITICAL:** Single-quoted heredoc delimiter (`<< 'PAYLOAD_EOF'`) prevents bash from interpolating `$`, `"`, or backticks inside your JSON. If save-prep returns `"success": false`, re-write the JSON file and retry before calling continue-pipeline.

**JSON payload structure:**

```json
{
  "prep_data": {
    "topic": "the article topic",
    "languages": ["en", "id"],
    "instructions": "custom instructions or null",
    "research_data": {
      "data_points": [
        {
          "stat": "specific statistic or finding",
          "source": "source name",
          "url": "source URL",
          "year": 2026
        }
      ],
      "primary_pain_point": "the core problem readers face",
      "reader_starting_emotion": "emotional state before reading",
      "sources": [
        {"name": "source name", "url": "source URL"}
      ]
    },
    "keyword": "confirmed target keyword",
    "framework": "PASO",
    "framework_rationale": "why this framework fits",
    "template": "How-To",
    "template_word_range": "1900-2200",
    "hooks": {
      "primary": {
        "type": "Curiosity Gap",
        "text": "hook text",
        "word_count": 12,
        "mobile_preview": "first 25 chars",
        "boost": "+45%",
        "driver": "information gap"
      },
      "secondary": {
        "type": "Story",
        "text": "hook text",
        "word_count": 15,
        "mobile_preview": "first 25 chars",
        "boost": "+55%",
        "driver": "narrative empathy"
      },
      "wildcard": {
        "type": "Curiosity+Numbers",
        "text": "hook text",
        "word_count": 14,
        "mobile_preview": "first 25 chars",
        "boost": "+65%",
        "driver": "dual trigger"
      }
    },
    "emotional_arc": "Discovery",
    "arc_pacing": "hook → build → peak → shift → resolution",
    "outline": {
      "sections": [
        {
          "position": 1,
          "title": "Section Title (information gap style)",
          "arc_phase": "Opening",
          "neurotransmitter": "Cortisol",
          "retention_techniques": ["open loops", "slippery slide"],
          "planned_citation": "data point reference",
          "image_concept": "concept or null",
          "word_target": 300,
          "open_loops": 3
        }
      ],
      "total_sections": 7,
      "total_word_target": 2100,
      "image_count": 4,
      "practical_utility_section": 3,
      "completion_to_share_plan": "resolution description",
      "dual_cta": {
        "direct": "CTA text",
        "transitional": "CTA text"
      }
    }
  }
}
```

---

## 5. Pipeline Continuation

After saving prep data, trigger the next pipeline step by calling:

```bash
curl -s -X POST "{api_url}/automation/content-ideas/{idea_id}/continue-pipeline" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"completed_step": "prep"}'
```

This tells the backend to launch the `/article-write` skill with Opus model.

---

## 6. Error Handling

If any step fails, report it as progress with error detail:

```bash
curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/progress" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"step":"failed","percentage":{last_pct},"message":"Error at {step_name}: {error_detail}"}'
```

Do NOT call continue-pipeline on failure. The backend will handle retry/notification.
