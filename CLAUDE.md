# Article Content Writer — Claude Project Instructions

## Project Overview

Claude Code plugin for AI-powered long-form article writing with inline image prompt generation. 4 skills + 1 agent + 13 reference documents as RAG knowledge base. Optimized 5-step pipeline generates articles in ~6-8 minutes with five scoring gates (Quality + Virality + SEO + AI Humanization + GEO), combined 100-point scoring, and 20 hard rules enforced on every output.

## Architecture

| Path | Purpose |
|------|---------|
| `.claude-plugin/plugin.json` | Plugin metadata (name, version, author) |
| `hooks/hooks.json` | SessionStart hook definition |
| `hooks/session-start.sh` | Session start script — announces available skills |
| `skills/article-gen/SKILL.md` | Main skill — end-to-end 5-step article generation with image prompts |
| `skills/article-validate/SKILL.md` | Five-gate scoring (Quality + Virality + SEO + AI Humanization + GEO) with combined 100-point score |
| `skills/article-seo/SKILL.md` | Standalone SEO + GEO/AEO analysis (6 SEO + 5 GEO metrics, traffic light) |
| `skills/article-brief/SKILL.md` | Brainstorm + outline with virality pre-assessment |
| `agents/article-writer.md` | Self-contained subagent for batch article writing (mirrors 5-step pipeline with all 20 rules + 5 gates) |
| `references/` | 13 reference docs read on-demand by skills/agent |
| `README.md` | Repo README |
| `LICENSE` | MIT license |

### Reference Files

| File | When Used |
|------|-----------|
| `global-config.md` | ALWAYS (read FIRST) — single source of truth for all configurable values (language, tone, readability, image gen, quality gate, virality score, SEO, AI humanization, GEO, combined scoring, templates) |
| `frameworks-library.md` | Step 2 Strategy — 14 copywriting frameworks (3 primary + 11 supporting) with decision matrix |
| `hook-repository.md` | Step 2 Strategy — 8 hook types with psychology, engagement boost %, templates, combining strategies |
| `content-templates.md` | Step 2 Strategy — 12 content templates with auto-selection guide, section structures, framework/arc pairings |
| `retention-engine.md` | Step 3 Outline — 6 retention techniques (slippery slide, Zeigarnik, open loops, bucket brigades, pattern interrupts, nested loops) |
| `emotional-arcs.md` | Step 2 Strategy — 4 arcs with neurotransmitter mapping, pacing metrics, completion-to-share resolution |
| `virality-triggers.md` | Step 5 Scoring — neuroscience of sharing, 5-point virality scoring guide with pass/fail definitions |
| `image-prompt-guide.md` | Step 3 Outline + Step 4 Write — GeminiGen.AI API docs, model/style guides, section-to-concept mapping, prompt best practices |
| `seo-rules-engine.md` | Step 4 Write + Step 5 Scoring — 6 SEO metrics + 5 GEO metrics with traffic light thresholds, JS logic contract, completion callback JSON schema |
| `style-guide.md` | Step 4 Write — 8 technical writing rules: paragraph structure, So What test, 107-word AI replacement system (3 tiers), fluff reduction, readability, E-E-A-T, actionable depth, 36 AI pattern categories |
| `quality-gate.md` | Step 5 Scoring — 10-point quality checklist, AI Humanization 20-point scoring, combined 100-point scale with bands |
| `sources-index.md` | Step 1 Research — 22 source documents from NotebookLM research |
| `writing-framework.md` | Master overview — original 7-section framework (structures, hooks, retention, arcs, virality, style, quality) |

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

- **Interactive mode:** 1 pause point after Step 3 (user reviews research + strategy + template + outline together, selects hook). Steps 4-5 run without pause after approval.
- **Pipeline mode:** 0 pause points. Fully automated via CLI flags with progress callbacks to Portfolio API at each step.
- **Research efficiency:** ALL web searches happen in Step 1 only. Zero web calls during writing (Step 4). Data collected upfront: 5-8 verified data points with sources.
- **Single-pass writing:** Step 4 applies all rules simultaneously (style, AI humanization, SEO, GEO, retention, readability) instead of separate passes.
- **Template-driven structure:** Step 2 auto-selects from 12 content templates based on topic characteristics. Template defines section structure, word count, tone.
- **article-writer agent:** Mirrors the exact same 5-step workflow but is self-contained (all rules inline, no "see SKILL.md" references).

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

## Key Concepts

- **AI Humanization** — 107-word tiered replacement system (52 Tier 1 always-replace + 43 Tier 2 cluster-flag + 12 Tier 3 density-flag) plus 36 AI pattern detection categories (10 structural + 12 language + 8 tone + 6 advanced). 20-point deduction scoring.
- **GEO/AEO Optimization** — Generative Engine Optimization for AI citation readiness. 5 rules: Answer-First formatting (40-60 word H2 openers), passage citability (50-150 word chunks), FAQ schema hints (2+ Q&A pairs), entity clarity (named sources), freshness signals (current-year refs). 5-metric traffic light scoring.
- **Content Templates** — 12 pre-built article structures (How-To, Listicle, Case Study, Comparison, Pillar Page, Product Review, Thought Leadership, Roundup, Tutorial, News Analysis, Data Research, FAQ Knowledge Base). Auto-selected based on topic characteristics with user override.
- **Combined 100-Point Scoring** — Weighted composite of all 5 gates: Quality x3 (30pts) + Virality x4 (20pts) + SEO x2.5 (15pts) + Humanization x1 (20pts) + GEO x3 (15pts). 5 scoring bands. Minimum 70 to publish.
- **Copywriting Frameworks** — PASO, StoryBrand, AIDA as primary + 11 supporting frameworks with decision matrix (topic/goal → framework)
- **Hook Psychology** — 8 hook types with engagement boost % (Story +55%, Before/After +50%, Curiosity +45%, Question +40%, etc.), 1.7-3 second pattern interrupt window, engagement multipliers for combining hooks
- **Retention Engine** — 6 techniques: slippery slide (short first line), Zeigarnik effect (open loops), bucket brigades (colon transitions), pattern interrupts (every 300-400 words), nested loops (additive tension), "trailer moment" teasers
- **Emotional Arc Sequencing** — 4 arcs (Discovery, Empowerment, Myth-Busting, Transformation), fast hook/slow build pacing, neurotransmitter targeting (oxytocin/cortisol/dopamine)
- **Image Prompt Generation** — GeminiGen.AI API with nano-banana-pro (free), 3-5 images per article (1 cover + 2-4 inline), section-to-concept mapping
- **Actionable Depth** — Numbered sections require What + How + Example + Outcome per point (150-250 words each). "Now What?" test: reader can act within 5 minutes
- **Pipeline Mode** — Automated article generation via CLI flags (`--idea-id`, `--api-url`, `--api-token`, `--topic`, `--keyword`, `--languages`, `--instructions`) with progress callbacks to Portfolio API at each step
- **Completion Callback** — Pipeline mode sends FULL structured JSON to Portfolio API on completion: `article`, `seo_analysis`, `virality_score`, `quality_gate`, `ai_humanization`, `geo_score`, `combined_score`, `image_prompts`, `research_data`. Full JSON schema in `references/seo-rules-engine.md` Section 5
- **JS Logic Contract** — `computeSeoAnalysis(content, title, keyword)` function in `references/seo-rules-engine.md` Section 4 defines exact SEO scoring logic for Portfolio website client-side re-implementation

## Capabilities

1. **End-to-end article generation** — 5-step optimized pipeline: research → strategy → outline → write+polish → five gates (~6-8 min)
2. **Five scoring gates** — Quality (10pt, min 7) + Virality (5pt, min 3) + SEO (6pt, min 4) + AI Humanization (20pt) + GEO (5pt)
3. **Combined 100-point scoring** — weighted composite with 5 bands (Exceptional/Strong/Acceptable/Below Standard/Rewrite), minimum 70 to publish
4. **20 hard rules** — non-negotiable quality enforcement on every article including AI humanization and GEO formatting
5. **107-word AI replacement system** — 3-tier detection (52 always-replace + 43 cluster-flag + 12 density-flag)
6. **36 AI pattern detection categories** — structural, language, tone, and advanced pattern removal
7. **12 content templates** — with auto-selection based on topic characteristics (How-To, Listicle, Case Study, etc.)
8. **GEO/AEO optimization** — answer-first formatting, passage citability, FAQ schema, entity clarity, freshness signals
9. **14 copywriting frameworks** — with automatic recommendation via decision matrix
10. **8 hook types** — with engagement boost rankings and combining strategies (PRIMARY + SECONDARY + WILDCARD)
11. **6 retention techniques** — psychologically-backed reader retention patterns
12. **4 emotional arcs** — with neurotransmitter targeting and pacing guidance
13. **Inline image prompts** — GeminiGen.AI compatible (nano-banana-pro/nano-banana-2/imagen-4), 3-5 per article
14. **Article validation** — score any existing article against all five gates with combined 100-point score and actionable fixes
15. **SEO + GEO analysis** — standalone keyword density, title optimization, heading analysis, AI citation readiness with traffic light scoring
16. **Article briefs** — structured outlines with virality pre-assessment and image concept planning
17. **Batch production** — via article-writer subagent for multiple articles in sequence
18. **Fact verification** — upfront web-verify all claims (Step 1 only), zero web calls during writing, E-E-A-T citation density enforcement
19. **Pipeline mode** — fully automated generation via CLI flags with progress callbacks and full JSON completion callback to Portfolio API

## Technical Defaults

> All configurable values are in `references/global-config.md`. This table shows setting NAMES — see global-config.md for current VALUES.

| Setting | Source |
|---------|--------|
| Primary language | Per global-config.md Language section |
| Default framework | Per global-config.md Content Defaults (`default_framework`) |
| Article length | Per global-config.md Content Defaults (`article_length`) |
| Readability target | Per global-config.md Content Defaults (`readability_target`) |
| Citation density | Per global-config.md E-E-A-T Density section |
| Forbidden vocabulary | Per global-config.md Forbidden Vocabulary section |
| Quality minimum | Per global-config.md Quality Gate section |
| Virality minimum | Per global-config.md Virality Score section |
| Image model | Per global-config.md Image Generation (`default_model`) |
| Image count | Per global-config.md Image Generation (`image_count` + allocation table) |
| Hook word limit | Per global-config.md Hook Defaults section |
| SEO minimum | Per global-config.md SEO Rules Engine (`seo_minimum`) |
| SEO keyword handling | Per global-config.md SEO Rules Engine (`keyword_handling`) |
| AI Humanization tiers | Per global-config.md AI Humanization (Section 13) |
| GEO metrics | Per global-config.md GEO/AEO Readiness (Section 14) |
| Combined score minimum | Per global-config.md Combined Scoring (Section 15) — 70 to publish |
| Content templates | Per global-config.md Content Templates (Section 16) — 12 templates, auto-select |
| Research web searches | Per global-config.md Research Efficiency (`max_web_searches`: 2-3) |
| Writing web calls | Per global-config.md Research Efficiency (`writing_web_calls`: 0) |

## Conventions for Contributors

### Changing a Global Setting
To change any configurable value (language, readability, image model, etc.):
1. Edit `references/global-config.md` — single source of truth
2. No need to edit other files — they all reference global-config.md

### Modifying the Workflow
When changing the article generation workflow:
1. Edit `skills/article-gen/SKILL.md` Section 3 (Workflow)
2. Mirror the same changes in `agents/article-writer.md` (agent is self-contained, all rules inline)
3. Update the 5-Step Pipeline table in this CLAUDE.md
4. Keep both files in sync — they must produce identical output

### Adding a New Reference File
1. Create `.md` file in `references/`
2. Add entry to the Reference Files table in relevant `SKILL.md` files
3. Add entry to `agents/article-writer.md` Reference Files table
4. Update this CLAUDE.md file (Reference Files table + relevant Key Concepts)

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
| SEO callback not sending | Check pipeline mode flags and completion callback JSON schema (now includes ai_humanization, geo_score, combined_score) |

---

**Version:** 2.0.0
**Last Updated:** April 2026
