# Article Content Writer — Claude Project Instructions

## Project Overview

Claude Code plugin for AI-powered long-form article writing with inline image prompt generation. 7 skills + 1 agent + 11 reference documents as RAG knowledge base. Optimized 5-step pipeline generates articles in ~6-8 minutes with five scoring gates (Quality + Virality + SEO + AI Humanization + GEO), combined 100-point scoring, and 20 hard rules enforced on every output. Split pipeline architecture (article-prep → article-write → article-score) with compiled reference injection and model switching (Sonnet/Opus) for optimized backend automation.

## Architecture

| Path | Purpose |
|------|---------|
| `.claude-plugin/plugin.json` | Plugin metadata (name, version, author) |
| `hooks/hooks.json` | SessionStart hook definition |
| `hooks/session-start.sh` | Session start script — announces available skills |
| `skills/article-gen/SKILL.md` | Main skill — end-to-end 5-step article generation with image prompts (interactive + single-session fallback) |
| `skills/article-prep/SKILL.md` | Pipeline-only Steps 1-3 (Research + Strategy + Outline) — runs on Sonnet with `refs-prep.md` |
| `skills/article-write/SKILL.md` | Pipeline-only Step 4 (Write + Polish + Images) — runs on Opus with `refs-write.md` |
| `skills/article-score/SKILL.md` | Pipeline-only Step 5 (Five Gates + Combined Score) — runs on Sonnet with `refs-score.md` |
| `skills/article-validate/SKILL.md` | Five-gate scoring (Quality + Virality + SEO + AI Humanization + GEO) with combined 100-point score |
| `skills/article-seo/SKILL.md` | Standalone SEO + GEO/AEO analysis (6 SEO + 5 GEO metrics, traffic light) |
| `skills/article-brief/SKILL.md` | Brainstorm + outline with virality pre-assessment |
| `agents/article-writer.md` | Self-contained subagent for batch article writing (mirrors 5-step pipeline with all 20 rules + 5 gates) |
| `scripts/compile-references.sh` | Builds 3 per-skill compiled reference files from individual refs |
| `references/` | 11 reference docs read on-demand by skills/agent |
| `references/compiled/` | 3 compiled ref bundles for system prompt injection (`refs-prep.md`, `refs-write.md`, `refs-score.md`) |
| `README.md` | Repo README |
| `LICENSE` | MIT license |

### Reference Files

| File | When Used |
|------|-----------|
| `global-config.md` | ALWAYS (read FIRST) — single source of truth for all configurable values (language, tone, readability, image gen, quality gate, virality score, SEO, AI humanization, GEO, combined scoring, templates) |
| `frameworks-library.md` | Step 2 Strategy — 14 copywriting frameworks (3 primary + 11 supporting) with decision matrix |
| `hook-repository.md` | Step 2 Strategy — 8 hook types with psychology, engagement boost %, templates, combining strategies |
| `content-templates.md` | Step 2 Strategy — 12 content templates with auto-selection guide, section structures, framework/arc pairings |
| `retention-engine.md` | Step 3 Outline — 5 retention techniques (slippery slide, open loops/Zeigarnik, bucket brigades, pattern interrupts, nested loops) |
| `emotional-arcs.md` | Step 2 Strategy — 4 arcs with neurotransmitter mapping, pacing metrics, completion-to-share resolution |
| `virality-triggers.md` | Step 5 Scoring — neuroscience of sharing, 5-point virality scoring guide with pass/fail definitions |
| `image-prompt-guide.md` | Step 3 Outline + Step 4 Write — GeminiGen.AI API docs, model/style guides, section-to-concept mapping, prompt best practices |
| `seo-rules-engine.md` | Step 4 Write + Step 5 Scoring — 6 SEO metrics + 5 GEO metrics with traffic light thresholds, JS logic contract, completion callback JSON schema |
| `style-guide.md` | Step 4 Write — 8 technical writing rules: paragraph structure, So What test, 107-word AI replacement system (3 tiers), fluff reduction, readability, E-E-A-T, actionable depth, 36 AI pattern categories |
| `quality-gate.md` | Step 5 Scoring — 10-point quality checklist, AI Humanization 20-point scoring, combined 100-point scale with bands |

## 5-Step Optimized Pipeline

The article-gen skill and article-writer agent both use this consolidated 5-step workflow.

| Step | Name | What Happens | Refs Read | Pipeline % |
|------|------|-------------|-----------|------------|
| 1 | **Input + Research** | Collect topic/audience/goal, 2-3 web searches, 5-8 data points, keyword derive | `global-config.md` | 15% |
| 2 | **Strategy** | Template auto-select + framework via Decision Matrix + emotional arc + 3 hooks | `frameworks-library.md`, `emotional-arcs.md`, `hook-repository.md`, `content-templates.md` | 25% |
| 3 | **Outline** | Full section structure with retention techniques, citations, image concepts mapped | `retention-engine.md`, `image-prompt-guide.md` | 35% |
| 4 | **Write + Polish + Images** | Single-pass writing with all rules inline (style, AI humanization, SEO, GEO, readability, retention), then image prompts | `style-guide.md`, `seo-rules-engine.md` | 85% |
| 5 | **Five Gates + Output** | Score all 5 gates, calculate combined 100-point score, fix failures, assemble final output | `virality-triggers.md`, `quality-gate.md`, `seo-rules-engine.md` | 100% |

### Key Pipeline Behaviors

- **Interactive mode:** 1 pause point after Step 3 (user reviews research + strategy + template + outline together, selects hook). Steps 4-5 run without pause after approval. Uses `article-gen` skill.
- **Pipeline mode (single-session):** 0 pause points. Fully automated via CLI flags with progress callbacks to Portfolio API at each step. Uses `article-gen` skill as fallback.
- **Pipeline mode (split):** Backend calls 3 separate skills: `article-prep` (Sonnet) → `article-write` (Opus) → `article-score` (Sonnet). Each skill has compiled references injected via `--append-system-prompt-file`, eliminating Read tool calls. Data flows via backend API between skills.
- **Research efficiency:** ALL web searches happen in Step 1 only. Zero web calls during writing (Step 4). Data collected upfront: 5-8 verified data points with sources.
- **Single-pass writing:** Step 4 applies all rules simultaneously (style, AI humanization, SEO, GEO, retention, readability) instead of separate passes.
- **Template-driven structure:** Step 2 auto-selects from 12 content templates based on topic characteristics. Template defines section structure, word count, tone.
- **article-writer agent:** Mirrors the exact same 5-step workflow but is self-contained (all rules inline, no "see SKILL.md" references).

### Split Pipeline Architecture

For optimized backend automation, the pipeline is split into 3 skills with model switching:

```
Backend → article-prep (Sonnet, refs-prep.md)     → 5%, 15%, 25%, 35%
       → article-write (Opus, refs-write.md)       → 50%, 70%, 78%, 82%, 85%
       → article-score (Sonnet, refs-score.md)     → 90%, 94%, 97%, 100%
```

| Compiled Ref | Contents | Size |
|-------------|----------|------|
| `refs-prep.md` | global-config, frameworks-library, hook-repository, emotional-arcs, content-templates | ~55 KB |
| `refs-write.md` | global-config (trimmed), style-guide, retention-engine, seo-rules-engine (trimmed) | ~42 KB |
| `refs-score.md` | style-guide, seo-rules-engine, virality-triggers, quality-gate | ~58 KB |

**refs-write.md trimming:** The compile script excludes scoring-only content from refs-write to reduce token load during writing (~25% smaller). Removed: JS Logic Contract, Completion Callback JSON, SEO/GEO Score Output Formats, Per-Metric Optimization Strategies, Keyword Handling (done in prep), Image Generation config (images generated post-approval), Content Templates (already in prep_data). Full content remains in refs-score.md.

**Data flow:** article-prep saves prep_data to backend API → article-write fetches prep_data, saves article → article-score fetches article, sends completion callback. Each skill triggers the next via `POST /continue-pipeline`.

**Rebuilding compiled refs:** Run `bash scripts/compile-references.sh` after editing any reference file. Script is idempotent. The compile script supports section-level filtering via `append_ref_excluding` for per-skill trimming.

## 20 Hard Rules

Every article must pass all 20 rules. These are enforced in `skills/article-gen/SKILL.md` Section 2 and `agents/article-writer.md` Hard Rules section. Summary:

| # | Rule | Key Constraint |
|---|------|---------------|
| 1 | Forbidden vocabulary | Tier 1 of 107-word system — 52 always-replace words (includes the original 7) |
| 2 | Grade 5 readability | Flesch-Kincaid age 9-11, short sentences, active voice |
| 3 | E-E-A-T citation density | Min 1 data point per 400 words |
| 4 | Zeigarnik open loops | 3+ in first 500 words |
| 5 | Information gap headers | No summary-style headers |
| 6 | Bucket brigades | Own line, ending with colon |
| 7 | Paragraph length | Max 3-4 lines |
| 8 | "So What?" test | Every section delivers concrete benefit |
| 9 | Dual CTA | Direct + Transitional at article end |
| 10 | 20% fluff reduction | Cut filler words, redundant phrases |
| 11 | Web-verify facts | All claims verified in Step 1; zero web calls in Step 4 |
| 12 | Hook word limit | 15 words target, 25 max; 25 chars mobile |
| 13 | Virality score | Min 3/5 to publish |
| 14 | Completion-to-Share | Narrative tension resolves at end |
| 15 | High-arousal emotions | Awe, excitement, productive anger — never contentment |
| 16 | Practical Utility section | [Number]+[Superlative]+[Timeframe]+[Outcome] formula |
| 17 | SEO score | Min 4/6 to publish |
| 18 | Actionable Depth | Numbered points: What+How+Example+Outcome, 150-250 words each |
| 19 | AI Humanization | Zero Tier 1 words, no Tier 2 clusters, Tier 3 under 3%, no AI patterns (36 categories) |
| 20 | GEO/AEO formatting | Answer-First H2s, passage citability, 2+ FAQ pairs, entity clarity, 3+ freshness signals |

## Five Scoring Gates + Combined 100-Point Score

All blocking gates must pass AND combined score must reach 70+ before an article is considered publication-ready.

| Gate | Criteria | Minimum | Weight | Max Pts | Reference |
|------|----------|---------|--------|---------|-----------|
| **Quality Gate** | 10-point: clear, concise, compelling, credible, nested loops, bucket brigades, emotional arc, scannability, benefit-first, dual CTA | 7/10 | x3 | 30 | `quality-gate.md` |
| **Virality Score** | 5 triggers: social currency, high-arousal emotion, practical utility, identity signaling, cognitive gap closure | 3/5 | x4 | 20 | `virality-triggers.md` |
| **SEO Score** | 6 metrics: title length, keyword in title, title words, keyword density, keyword in first 100, keyword in headings | 4/6 | x2.5 | 15 | `seo-rules-engine.md` |
| **AI Humanization** | 20-point deduction-based: Tier 1 (-2/word), Tier 2 (-1/cluster), Tier 3 (-1/word), AI patterns (-0.5/cat) | — | x1 | 20 | `style-guide.md` Rules 3+8, `quality-gate.md` |
| **GEO Score** | 5 metrics: answer-first H2s, passage citability, FAQ presence, entity clarity, freshness signals | — | x3 | 15 | `seo-rules-engine.md` Sections 8+9 |
| **Combined** | Weighted sum of all 5 gates | **70/100** | — | **100** | `quality-gate.md` Combined section |

**Scoring bands:** Exceptional (90-100), Strong (80-89), Acceptable (70-79), Below Standard (60-69), Rewrite (<60)

## Capabilities

See Architecture table above for full skill/agent inventory. Key: end-to-end article generation (5-step pipeline), five scoring gates with combined 100-point scoring, 20 hard rules, 11 reference documents as RAG knowledge base, split pipeline for backend automation with compiled reference injection.

## Technical Defaults

All configurable values (language, readability, frameworks, image model, scoring thresholds, etc.) are in `references/global-config.md` — single source of truth. Edit that file to change any setting.

## Conventions for Contributors

### Changing a Global Setting
To change any configurable value (language, readability, image model, etc.):
1. Edit `references/global-config.md` — single source of truth
2. No need to edit other files — they all reference global-config.md

### Modifying the Workflow
When changing the article generation workflow:
1. Edit `skills/article-gen/SKILL.md` Section 3 (Workflow)
2. Mirror the same changes in `agents/article-writer.md` (agent is self-contained, all rules inline)
3. Mirror relevant changes in the split pipeline skills (`skills/article-prep/`, `skills/article-write/`, `skills/article-score/`)
4. Update the 5-Step Pipeline table in this CLAUDE.md
5. Keep all files in sync — they must produce identical output

### Rebuilding Compiled References
After editing any file in `references/`:
1. Run `bash scripts/compile-references.sh`
2. Verify output sizes are reasonable
3. Redeploy compiled files to VPS if in production

### Adding a New Reference File
1. Create `.md` file in `references/`
2. Add entry to the Reference Files table in relevant `SKILL.md` files
3. Add entry to `agents/article-writer.md` Reference Files table
4. Update this CLAUDE.md file (Reference Files table + relevant Key Concepts)
5. Add to the appropriate compiled ref bundle in `scripts/compile-references.sh`
6. Run `bash scripts/compile-references.sh` to rebuild

### Adding a New Hard Rule
1. Add to `skills/article-gen/SKILL.md` Section 2 (Hard Rules) — update rule count in intro
2. Add to `agents/article-writer.md` Hard Rules section — update rule count in intro
3. Update the Hard Rules table in this CLAUDE.md (update count if changed)
4. Ensure the rule is enforced in the workflow steps

### Adding a New Scoring Gate
1. Add scoring criteria to the relevant reference file
2. Add the gate to Step 5 in both `skills/article-gen/SKILL.md` and `agents/article-writer.md`
3. Update the Combined Score weight table in `references/quality-gate.md`
4. Update `references/global-config.md` with new section
5. Update output format in both SKILL.md and agent with new score section
6. Update completion callback JSON schema if pipeline mode is affected

### File Naming
- Reference files: lowercase, kebab-case (e.g., `virality-triggers.md`)
- No spaces in filenames
- Skills: `skills/<skill-name>/SKILL.md`
- Agents: `agents/<agent-name>.md`

## Debugging

| Issue | Check |
|-------|-------|
| Article too long/short | Check global-config.md `article_length` (1,900-2,400 words) |
| Forbidden words in output | Verify Step 4 AI Humanization rules — check style-guide.md Rule 3 (107 words, 3 tiers) |
| AI-sounding text | Check style-guide.md Rule 8 (36 AI pattern categories) — look for structural, language, tone patterns |
| Tier 1 word violations | style-guide.md Rule 3 Tier 1 — 52 words that must be replaced on sight |
| Tier 2 clusters detected | style-guide.md Rule 3 Tier 2 — max 1 per paragraph, replace extras |
| Low AI Humanization score | Check deduction breakdown — fix Tier 1 violations first (-2 each), then clusters, then patterns |
| Low quality score | Read quality-gate.md revision priority guide — fix Compelling first |
| Low virality score | Read virality-triggers.md per-trigger boost strategies |
| Low combined score | Check quality-gate.md Combined Score section — fix lowest-scoring gate first (highest weighted impact) |
| Wrong framework selected | Check frameworks-library.md Decision Matrix — match goal to framework |
| Wrong template selected | Check content-templates.md Auto-Selection Guide — match topic to template |
| Flat emotional arc | Check emotional-arcs.md — ensure arc phases map to sections in Step 2 |
| No image prompts | Check image-prompt-guide.md — verify model/style/aspect_ratio in global-config |
| Readability too high | Target Grade 5 — short sentences, common words, active voice per style-guide.md |
| Missing citations | E-E-A-T requires 1 per 400 words — verify data points collected in Step 1 |
| Numbered points too shallow | Each point needs What+How+Example+Outcome (150-250 words) — check Hard Rule 18 |
| Hook too long | Max 15 words / 25 chars mobile — check hook-repository.md constraints |
| Low SEO score | Check seo-rules-engine.md per-metric optimization — fix Red metrics first |
| Low GEO score | Check seo-rules-engine.md Sections 8+9 — add Answer-First H2 openers, FAQ pairs, entity names |
| No FAQ pairs in article | GEO requires 2+ FAQ Q&A pairs (40-60 word answers) — add near end before CTA |
| Vague attributions | Entity Clarity requires named sources — replace "studies show" with specific names + dates |
| No current-year data | Freshness Signals need 3+ current-year references — add recent data points |
| Web searches during writing | Step 4 must use ONLY Step 1 research — zero web calls. Check global-config.md Research Efficiency |
| SKILL.md and agent out of sync | Both must have identical 5-step workflow with 20 rules + 5 gates — mirror changes to both files |
| Split skills out of sync | article-prep, article-write, article-score must match article-gen's workflow — mirror changes to all |
| SEO callback not sending | Check pipeline mode flags and completion callback JSON schema (now includes ai_humanization, geo_score, combined_score) |
| Compiled refs outdated | Run `bash scripts/compile-references.sh` after editing any reference file |
| refs-write too large | Check `append_ref_excluding` patterns in compile script — verify scoring-only sections are excluded |
| Split pipeline data flow broken | Check backend API endpoints: GET /{id}, PUT /save-prep, PUT /save-article, POST /continue-pipeline |
| Wrong model used | article-prep + article-score use Sonnet, article-write uses Opus — check backend config |

---

**Version:** 2.3.0
**Last Updated:** April 2026
