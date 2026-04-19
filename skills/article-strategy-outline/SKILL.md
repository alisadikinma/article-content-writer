---
name: article-strategy-outline
description: "Pipeline-only skill for article generation Steps 2-3 (Strategy + Outline, Phase B split). Always runs on Sonnet with --append-system-prompt-file refs-strategy-outline.md injected. Reads research_data from DB (populated by /article-research). Outputs prep_data structure to generated_article.prep_data via PUT /save-prep (existing endpoint). Part of the split pipeline: article-research → article-strategy-outline → article-write → article-score."
---

# Article Strategy + Outline Skill (Steps 2-3, Phase B split)

Pipeline-only skill that handles Strategy (framework + arc + hooks + template) and Outline (retention + neurotransmitter mapping + image concepts) for the split article generation pipeline. Designed to run on **Sonnet**.

This skill assumes `/article-research` has already executed and persisted the research payload to `content_ideas.research_data`. Your job is Steps 2 + 3 only — do not re-run research, do not re-do web searches.

---

## 1. Pipeline Flags (Required)

This skill runs ONLY in pipeline mode. All inputs come from CLI flags.

| Flag | Required | Description |
|------|----------|-------------|
| `--idea-id {id}` | Yes | Content idea ID in the Portfolio database |
| `--api-url {url}` | Yes | Base API URL (e.g., `https://alisadikinma.com/api`) |
| `--api-token {token}` | Yes | Authentication bearer token |

`topic`, `languages`, `keyword`, `instructions`, `niche`, `pillar`, and `tags` are all read from the idea record in the DB (populated earlier in the pipeline). Do NOT accept them as flags — the DB is the single source of truth.

---

## 2. Don't Read Reference Files

> **DO NOT read reference files with the Read tool.** All references (global-config, frameworks-library, hook-repository, emotional-arcs, content-templates, retention-engine concepts, image-prompt-guide image_concept mapping) are injected via `--append-system-prompt-file refs-strategy-outline.md`. They are already in your system prompt. Reading them again wastes time and tokens.

---

## 3. Read Idea Data (input_collection, 17%)

Fetch the idea record from the backend to get the research payload and idea metadata:

```bash
curl -s -X GET "{api_url}/automation/content-ideas/{idea_id}" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json"
```

From the JSON response, extract:

- From `data.research_data`:
  - `data_points[]` — 5-8 verified stats with source names, URLs, years
  - `quotes[]` — expert quotes collected during research
  - `entities[]` — brands / products / tools mentioned, each with optional `visual_style` prose
  - `personas[]` — reader persona profiles with `pain`, `emotion`, `voice`
  - `written_guides[]` — source-derived how-to / step-by-step references
- From `data` (top-level):
  - `title` → your working topic
  - `description` — optional long-form framing
  - `languages[]` — `["en"]`, `["id"]`, or `["en","id"]`
  - `instructions` — custom generation directives (may be null)
  - `niche`, `pillar`, `tags[]` — editorial grouping

If `data.research_data` is missing or empty, abort with a `failed` progress report — Strategy + Outline require completed research.

**Report progress: 17% (input_collection)** — "Idea + research_data loaded from DB"

---

## 4. Progress Reporting

Report progress via curl after each sub-step:

```bash
curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/progress" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"step":"{step_name}","percentage":{pct},"message":"{description}"}'
```

| Sub-step | Step Name | Percentage | Description |
|----------|-----------|------------|-------------|
| Read input | `input_collection` | 17 | Idea + research_data loaded from DB |
| Strategy done | `strategy` | 25 | Framework + arc + hook + template selected |
| Outline done | `outline` | 35 | Full outline + retention + image concepts |

---

## 5. Step 2 — STRATEGY (25%)

Using references already in system prompt (frameworks-library, emotional-arcs, hook-repository, content-templates):

**Framework selection:**
1. Use Goal-Based Framework Selection table: match article goal (educate/sell/convert/engage) to primary framework
2. Cross-reference with Topic-Based Decision Matrix for topic-specific refinement
3. If both tables agree, use that framework. If they differ, prefer the Goal-Based table.
4. Select best framework with rationale

**Emotional arc selection:**
1. Match topic to arc type using Arc Selection Guide from emotional-arcs
2. When selecting emotional arc, prioritize the dominant emotion from `research_data.personas[].emotion` if personas have been captured.
3. Map arc phases to planned article sections
4. Define pacing plan (peaks, valleys, climax placement)

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

---

## 6. Step 3 — OUTLINE (35%)

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
5. **Plan citations** — minimum 1 per 400 words, map `research_data.data_points[]` to sections
6. **Plan Practical Utility section** — [Number]+[Superlative]+[Timeframe]+[Outcome]
7. **Plan Completion-to-Share resolution** — final payoff + reader reward
8. **Plan image concepts** — 1 cover + 2-4 inline per section type to concept mapping

**NEW for Phase B (brand-aware images):** When mapping `image_concept` for a section that primarily features a brand/product named in `research_data.entities[]`, include the entity name in the image_concept text so `/article-images` can resolve the brand's visual_style automatically. Example: `image_concept: "ChatGPT interface showing conversation flow"` — entity `ChatGPT` matches, and article-images appends the visual_style prose to the final prompt.

**Report progress: 35% (outline)**

---

## 7. Completion — Save Prep Data + Continue

After Step 3 completes, save the strategy + outline payload to the backend via the existing `/save-prep` endpoint. **USE FILE-BASED CURL** — inline `-d '...'` breaks at this payload size (5-15 KB with full outline).

> **IMPORTANT — do NOT nest `research_data` inside `prep_data`:** In Phase B, `research_data` lives on the top-level `content_ideas` column and is already persisted by `/article-research`. The payload schema below has ONLY `prep_data` at the root — no `research_data` key anywhere. Nesting it under `prep_data` would duplicate it and violate the save-prep contract. Legacy `/article-prep` behavior (which embedded research inside prep_data) is superseded. Read this warning before copying the example structure below.

```bash
cat > /tmp/article-prep-{idea_id}.json << 'PAYLOAD_EOF'
{
  "prep_data": {
    "topic": "the article topic from idea.title",
    "languages": ["en", "id"],
    "instructions": "custom instructions or null",
    "keyword": "confirmed target keyword",
    "framework": "PASO",
    "framework_rationale": "why this framework fits this topic + goal",
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
          "planned_citation": "data point reference from research_data.data_points",
          "image_concept": "concept or null (include entity name if section features a research_data.entities[] brand)",
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
PAYLOAD_EOF

curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/save-prep" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d @/tmp/article-prep-{idea_id}.json

rm -f /tmp/article-prep-{idea_id}.json
```

**CRITICAL:** Single-quoted heredoc delimiter (`<< 'PAYLOAD_EOF'`) prevents bash from interpolating `$`, `"`, or backticks inside your JSON. If save-prep returns `"success": false`, re-write the JSON file and retry before calling continue-pipeline.

Then trigger the next pipeline step. Use label `completed_step: prep` — the backend's `progress >= 35 → triggerWrite` branch uses this label regardless of which skill produced the payload, so `/article-strategy-outline` and the legacy `/article-prep` are interchangeable at this handoff:

```bash
curl -s -X POST "{api_url}/automation/content-ideas/{idea_id}/continue-pipeline" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"completed_step": "prep"}'
```

This tells the backend to launch the `/article-write` skill.

---

## 8. Error Handling

If any step fails, report it as progress with error detail:

```bash
curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/progress" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"step":"failed","percentage":{last_pct},"message":"Error at {step_name}: {error_detail}"}'
```

Do NOT call continue-pipeline on failure. The backend will handle retry/notification.
