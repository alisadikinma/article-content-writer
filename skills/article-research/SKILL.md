---
name: article-research
description: "Pipeline-only skill for article generation Step 1 — Research (Phase B split). Runs on Sonnet (quick tier) OR Opus (deep tier) per --research-tier flag. Uses --append-system-prompt-file refs-research.md (~35 KB). Outputs research_data schema v2 (data_points + quotes + entities with visual_style + personas + written_guides). Persists to content_ideas.research_data via PUT /save-research. Part of the split pipeline: article-research → article-strategy-outline → article-write → article-score."
---

# Article Research Skill (Step 1 — Deep/Quick Research, Phase B split)

Pipeline-only skill that handles the Research step of the split article generation pipeline. Replaces the Research portion of the legacy `/article-prep`. Runs on **Opus** for the deep tier (5-8 min, full 4-layer framework) or **Sonnet** for the quick tier (1-2 min, collapsed to a single 2-3 query sweep). The resolved model + `--research-tier` flag are passed by the Portfolio backend's [ArticleGenerationService](D:/Projects/Portfolio_v2/backend/app/Services/ArticleGenerationService.php).

> **DO NOT read reference files with the Read tool.** All research references (voice rules, 4-layer framework, entity extraction rules, written-guide rules, source diversity matrix, Opus prompt skeleton, output schema v2) are injected via `--append-system-prompt-file refs-research.md`. They are already in your system prompt. Reading them again wastes time and tokens. Trust the system prompt.

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
| `--research-tier {quick\|deep}` | Yes | Tier flag — Opus for `deep`, Sonnet for `quick`. Backend resolves this before dispatch. |
| `--keyword "{keyword}"` | No | Target SEO keyword (used to sharpen query wording) |
| `--instructions "{text}"` | No | Custom generation instructions (angle, must-cover, forbidden claims) |

---

## 2. Don't Read Reference Files

References (the 7 sections of `refs-research.md` — Voice, Research Framework, Entity Extraction, Written Guides, Source Diversity, Opus Prompt Skeleton, Output Schema v2) are pre-injected into the system prompt by the backend when it launches the Claude CLI with `--append-system-prompt-file refs-research.md`. Attempting to Read `refs-research.md` or its source fragments (global-config, research-framework, entity-rules, etc.) wastes tokens and does not re-load them — they are already in context. Trust the system prompt.

---

## 3. Progress Reporting

Report progress via curl after each sub-step. The Portfolio frontend's Progress Modal keys off the `step` field names below — do **not** rename them.

```bash
curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/progress" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"step":"{step_name}","percentage":{pct},"message":"{description}"}'
```

| Sub-step | Step Name | Percentage | Description |
|----------|-----------|-----------|-------------|
| Input parsed | `input_collection` | 2 | Flags parsed, topic confirmed |
| Layer 1 started | `research_layer_1` | 5 | Broader discovery (6-8 parallel WebSearch queries) |
| Layer 2 started | `research_layer_2` | 9 | Deep reading (WebFetch top 5-8 sources) + entity extraction |
| Layer 3 started | `research_layer_3` | 12 | Synthesis + gap analysis |
| Layer 4 + Self-review | `research_layer_4` | 14 | Psychology + written guides + self-review gate |
| Research saved | `research` | 15 | PUT /save-research complete |

Quick tier still emits all 6 progress rows — collapse the work, not the telemetry. Frontend modal sub-step highlighting depends on receiving the full sequence.

---

## 4. Workflow

The 4-layer framework below is the procedural handoff — the detailed rules (query matrix wording, WebFetch heuristics, cluster/gap analysis rubric, persona format) live in `refs-research.md` §2 and are already in your system prompt. Do not duplicate those rules here; execute them.

### Layer 1 — Broader Discovery (5% → research_layer_1)

Fire WebSearch queries across the category matrix in parallel (single batch, no awaiting between queries).

**Deep tier — all 6-8 categories:**
1. `"[topic]" statistics benchmarks 2025 2026` (hard data)
2. `"[topic]" case study success story` (real examples)
3. `"[topic]" expert opinion interview` (authoritative quotes)
4. `"[topic]" reddit OR quora OR hackernews` (community pain)
5. `"[topic]" counter-argument problem issue` (balance)
6. `"[topic]" trend adoption growth market` (momentum)
7. `"[topic]" official documentation getting started` (step-by-step for how-to topics)
8. `site:github.com "[topic]"` (technical depth, conditional — skip for non-technical topics)

**Quick tier — only 2-3 queries:**
- Query 1: statistics/benchmarks (data spine)
- Query 2: case study or expert opinion (named example spine)
- Query 3 (optional): reddit/forum query (persona voice seed, only if Layer 4 needs 1 persona)

### Layer 2 — Deep Reading + Entity Extraction (9% → research_layer_2)

**Deep tier only.** Pick the top 5-8 URLs from Layer 1 by source-tier quality (primary research > expert blog > forum > news > listicle) and WebFetch the full content. For each fetched page extract:

- Direct quotes with full attribution (name + role + publication + date + URL)
- Specific numbers with denominators (e.g. "47% of 2,400 surveyed devs")
- Named entities — every company, tool, person, or product mentioned. For each entity, **visit its landing page via WebFetch** and write a single prose `visual_style` paragraph (color palette + layout pattern + typography + hero element + mood — see §3 of refs-research.md for the 5 required elements)
- Staleness flag — any page >24 months old: either flag inline ("per 2023 data — may have shifted") or drop for a fresher source

**Quick tier: SKIP Layer 2 entirely.** No WebFetch, no entity landing-page visits. Trust snippets from Layer 1. `entities[]` carries 0-2 entries max, and their `visual_style` can be `null` if the snippet does not provide enough detail.

### Layer 3 — Synthesis + Gap Analysis (12% → research_layer_3)

**Deep tier only.** With Layer 2 output in hand:

- Cluster data_points by theme into 3-5 angles (adoption, productivity delta, risk, team dynamics, tool-specific deltas — whatever the topic surfaces)
- Identify competitor coverage by spot-checking the top 3 ranking articles for the target keyword; note blind spots
- Generate 3 contrarian angles via 1-2 targeted queries challenging the dominant framing; capture 1-2 supporting quotes per counter-angle
- Map data → intended outline sections: sketch 4-6 candidate H2 headings and annotate which data_points / quotes / entities each would cite. This is scratchpad for strategy-outline phase, not a saved field — but it surfaces gaps early (e.g. "Setup Guide H2 has zero written_guides → fire follow-up query before wrapping")

**Quick tier: SKIP Layer 3 entirely.** No clustering, no contrarian sweep, no gap analysis. The quick-tier payload is small enough that the strategy-outline phase handles mapping directly.

### Layer 4 — Reader Psychology + Written Guides + Self-Review (14% → research_layer_4)

**Personas (both tiers, different counts).**

- Re-read the forum fetches (deep) or forum snippets (quick) from Layer 1/2. Extract **verbatim** user voice — copy the actual quote, do not paraphrase, do not combine multiple users.
- Each persona entry: `name` (3-5 word role+disposition label), `pain` (one concrete sentence), `emotion` (adjective + contextual clause), `voice` (single verbatim quote string — not array).
- Deep tier target: 3-5 distinct personas (solo founder, team lead, skeptic, etc. — different angles serve different body sections downstream).
- Quick tier target: 1 persona only.

**Written guides (how-to topics only, both tiers but quick rarely hits).**

- Trigger: topic/keyword/instructions contain any of `setup · configure · install · how to · getting started · tutorial · guide · walkthrough · step by step · first time`.
- Extract step-by-step sequences from official docs via targeted `site:docs.* / site:developer.* / site:help.* / site:support.*` queries.
- Schema: `task` (noun phrase, 6-10 words), `steps[]` (flat array of imperative sentences, 4-10 entries, each starts with a verb), `source_url` (actual docs page, not vendor homepage).
- Deep tier target: 1-3 guides for how-to topics; `[]` for non-how-to.
- Quick tier target: 0 (time budget does not fit docs WebFetch; strategy-outline falls back to prose-only How-To section).

**Self-review gate (deep tier only).** Before save, run the §6 checklist (see Section 6 below — summarized here, full rules in refs-research.md §6.3).

### Step through tier branching explicitly

See Section 5 for the full tier branch logic (quick vs deep, target counts, time budget).

---

## 5. Tier Branching

The `--research-tier` flag routes behavior. Do not run deep-tier work on a quick-tier invocation — the backend dispatched Sonnet and expects Sonnet-scope output; overshooting exhausts the time budget and risks timeout.

### `--research-tier quick` (Sonnet, 1-2 min budget)

- Layer 1: fire **only 2-3 queries** from the category matrix — stats + case_study (both mandatory), + reddit/forum if a persona is needed. Do not fire the full 8-query sweep.
- Layer 2: **SKIP entirely.** No WebFetch. No entity landing-page visits.
- Layer 3: **SKIP entirely.** No clustering. No contrarian sweep.
- Layer 4: persona-only — extract 1 persona from the forum snippet. Skip written_guides unless topic is explicitly how-to AND a docs result surfaced in Layer 1 snippets.
- Self-review gate: **waived.** Save whatever Layer 1 produced, even if targets are borderline — quick tier trusts what surfaces.

**Target counts (from refs-research.md §7.3, Quick column):**

| Field | Quick target |
|-------|--------------|
| `data_points` | 5-8 |
| `quotes` | 0-1 |
| `entities` | 0-2 (visual_style may be `null`) |
| `personas` | 1 |
| `written_guides` | 0 |
| Time budget | 1-2 min |

### `--research-tier deep` (Opus, 5-8 min budget)

- Layer 1: fire all **6-8 queries** in parallel (single batch). `site:github.com` query conditional on technical topic.
- Layer 2: WebFetch top 5-8 URLs, full content reads, entity landing-page visits for `visual_style` prose paragraphs.
- Layer 3: full synthesis + gap analysis + 3 contrarian angles.
- Layer 4: 3-5 personas (verbatim forum quotes) + 1-3 written_guides for how-to topics.
- Self-review gate: **mandatory** (Section 6). Run fill-in queries until all checks pass, or record `self_review_gaps` and save.

**Target counts (from refs-research.md §7.3, Deep column):**

| Field | Deep target |
|-------|-------------|
| `data_points` | 20-30 |
| `quotes` | 5+ |
| `entities` (with visual_style) | 10+ |
| `personas` | 3-5 |
| `written_guides` (how-to only) | 1-3 tasks |
| Time budget | 5-8 min |

---

## 6. Self-Review Gate (Deep Tier Only)

Before calling PUT `/save-research`, verify the following. Full rules: refs-research.md §6.3 (already in your system prompt). Summary below.

**Count check:**
- `data_points.length >= 20`
- `entities.length >= 10` (each with non-null `url`; `visual_style` either full paragraph or `null` for fetch-failures — never a half-written paragraph)
- `personas.length` in [3, 5]
- `quotes.length >= 5`
- `written_guides.length >= 1` if topic is how-to; `[]` acceptable otherwise

**Source diversity matrix** (across all captured sources — data_points + quotes + entities + written_guides URLs combined):
- `>= 4` primary_research (academic studies, industry surveys with n, government data, peer-reviewed journals)
- `>= 3` forum (Reddit, Quora, HackerNews, Stack Exchange)
- `>= 3` expert (named practitioner blog, conference talk, podcast interview)
- `>= 2` counter (sources arguing against dominant thesis)
- `>= 2` case_study (named company + quantified outcome)
- `>= 3` news (established publications with editorial oversight)

**Freshness check:**
- Every `data_points[].year` set to a 4-digit integer
- Any year `<= current_year - 2` either has inline stale note in the stat text OR is replaced by a fresher source

**JSON schema validation (§7 of refs-research.md):**
- Top-level has exactly 5 keys: `data_points`, `quotes`, `entities`, `personas`, `written_guides`. No stray `tier`, `model`, `researched_at`, `counter_arguments`, `content_gaps`, `trending_momentum`, `fresh_tier`, `source_type`, `confidence`, or nested visual_style objects (those are v1 fields, explicitly removed).
- `personas[].voice` is a single string, not array
- `written_guides[].steps` is a flat string array, not nested object array
- JSON parses cleanly (no trailing commas, no unquoted keys)

**If any check fails:** run targeted fill-in queries (broader specificity or alternate source tier), re-check. Do NOT save incomplete research. If after 2-3 fill-in rounds a tier remains short, save with a `self_review_gaps: [...]` note in the payload so downstream phases know what is missing. Never fabricate.

---

## 7. Save Research — File-Based Curl

After Layer 4 + self-review completes, save research data to the backend via the Phase B.5 endpoint. **USE FILE-BASED CURL** — inline `-d '...'` breaks at this payload size (deep tier routinely hits 15-30 KB with 20-30 data_points + 10 entities). Write to a temp file first:

```bash
cat > /tmp/article-research-{idea_id}.json << 'PAYLOAD_EOF'
{
  "research_data": {
    "data_points": [
      {
        "stat": "47% of 2,400 surveyed developers use an AI coding assistant daily in 2026, up from 31% in 2025",
        "source": "Stack Overflow Developer Survey 2026",
        "url": "https://survey.stackoverflow.co/2026/#ai-tools-usage",
        "year": 2026
      }
    ],
    "quotes": [
      {
        "text": "The biggest productivity gains don't come from autocomplete — they come from AI that holds the whole repository in context while you refactor",
        "attribution": "Guillermo Rauch, CEO Vercel, on Lenny's Podcast February 2026",
        "url": "https://lennysnewsletter.com/p/guillermo-rauch-feb-2026"
      }
    ],
    "entities": [
      {
        "name": "Cursor",
        "url": "https://cursor.com",
        "visual_style": "Deep charcoal editor background (#1A1A1A) with electric-blue accent on AI suggestion highlights and command palette. Three-panel IDE layout — file tree left, code buffer center, AI chat right. JetBrains Mono for code, Inter for chat chrome. Hero element is the Cmd+K inline edit overlay with a prompt input and preview diff. Dense and professional mood — engineered for long-session pair programming, zero decorative chrome."
      }
    ],
    "personas": [
      {
        "name": "Skeptical Senior Engineer",
        "pain": "AI suggestions look plausible but silently fail on edge cases unique to the team's legacy codebase; review burden has increased",
        "emotion": "Frustrated — productivity story doesn't match the lived reality of reviewing AI code",
        "voice": "Copilot writes plausible-looking code that silently breaks in edge cases we haven't tested"
      }
    ],
    "written_guides": [
      {
        "task": "Setting up Cursor for a new repository",
        "steps": [
          "Download Cursor from cursor.com and sign in with GitHub or Google",
          "Open the target repository folder via File > Open or drag-and-drop onto the Cursor window",
          "Wait 30-90 seconds for Cursor to index the codebase (progress shown in status bar)",
          "Open settings (Cmd+,) and paste your Anthropic or OpenAI API key under Models if you want to use your own keys",
          "Create a .cursorrules file at repo root with project-specific instructions (coding style, framework, conventions)",
          "Test inline edit with Cmd+K on any line — type a plain-English instruction and review the diff preview before accepting"
        ],
        "source_url": "https://docs.cursor.com/get-started/installation"
      }
    ]
  }
}
PAYLOAD_EOF

curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/save-research" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d @/tmp/article-research-{idea_id}.json

rm -f /tmp/article-research-{idea_id}.json
```

**CRITICAL:** Use the single-quoted heredoc delimiter (`<< 'PAYLOAD_EOF'`) — this prevents bash from interpolating `$`, `"`, or backticks inside your JSON. A double-quoted delimiter (`<< PAYLOAD_EOF`) will corrupt any quote or dollar sign inside stat text, URLs, or persona voice strings. Always single-quote the delimiter.

If `save-research` returns `"success": false`, re-read the response, fix the payload (usually a schema validation miss — see §6 JSON check), re-write the temp file, and retry the PUT **before** calling continue-pipeline. Never call continue-pipeline on a failed save.

**Then report the final progress row:**

```bash
curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/progress" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"step":"research","percentage":15,"message":"Research saved — {data_points_count} data points, {entities_count} entities, {personas_count} personas"}'
```

---

## 8. Continue Pipeline

After the save-research PUT succeeds, trigger the next phase by calling the continue-pipeline endpoint:

```bash
curl -s -X POST "{api_url}/automation/content-ideas/{idea_id}/continue-pipeline" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"completed_step": "research"}'
```

> **IMPORTANT — routing contract:** The backend routes to the next skill based on `idea.progress_percentage`, NOT on the `completed_step` field in this POST body. The Phase B.6 branch (`progress >= 15 && progress < 35 && split_enabled`) in `backend/routes/api.php`'s continue-pipeline closure is what dispatches `/article-strategy-outline`. You MUST have reported progress = 15% via the `PUT /progress` endpoint (see §7's final progress row, `step: "research", percentage: 15`) BEFORE calling continue-pipeline. If progress is still < 15 when continue-pipeline fires, the router will not match the strategy-outline branch and the pipeline will silently stall.
>
> The `completed_step` body field is preserved for forward compatibility and plugin-side logging, but does not affect backend dispatch. Sending `"prep"` or `"research_complete"` or `"research"` all behave identically at the router — the load-bearing step is the `PUT /progress` at 15% that must precede this call.

> **Deployment prerequisite:** The Phase B.6 split branch only fires when the Portfolio backend has `ARTICLE_GEN_SKILL_SPLIT_ENABLED=true` in its `.env`. With the flag OFF, the `continue-pipeline` call after `/save-research` will match no dispatch branch and the pipeline will stall silently at 15% progress. If you're seeing the pipeline stall immediately after research completes, verify this flag on the backend first.

---

## 9. Error Handling

If any layer fails (WebSearch timeout, WebFetch 403/rate limit, JSON validation error after remediation, save-research hard failure), report the failure via progress with `step: failed` and STOP. Do NOT call continue-pipeline on failure — the backend handles retry/notification logic and will flag the idea for user review in the admin UI.

```bash
curl -s -X PUT "{api_url}/automation/content-ideas/{idea_id}/progress" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"step":"failed","percentage":{last_pct},"message":"Error at {step_name}: {error_detail}"}'
```

Common failure modes and correct response:

- **Layer 1 query batch returns zero useful results** — fire 2-3 broader fill-in queries; if still empty, fail with `Error at research_layer_1: no usable sources for topic "{topic}"`.
- **Layer 2 WebFetch 403/paywall on a primary source** — swap to the next-best Layer 1 URL and continue. Do not fail on a single fetch miss.
- **Entity landing page fetch fails for a named brand** — set `visual_style: null` for that entity, do not fabricate, continue.
- **Self-review count check fails after 3 fill-in rounds** — save anyway with `self_review_gaps` note; do NOT fail. The strategy-outline phase degrades gracefully on thin research.
- **PUT /save-research returns `success: false`** — re-validate JSON schema locally, fix, retry once. On second failure, report `step: failed` with the API error detail and stop.
