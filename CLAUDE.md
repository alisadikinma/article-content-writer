# Article Content Writer — Claude Project Instructions

## Project Overview

Claude Code plugin for AI-powered long-form article writing with inline image prompt generation. 4 skills + 1 agent + 12 reference documents as RAG knowledge base.

## Architecture

| Path | Purpose |
|------|---------|
| `.claude-plugin/plugin.json` | Plugin metadata (name, version, author) |
| `hooks/hooks.json` | SessionStart hook definition |
| `hooks/session-start.sh` | Session start script — announces available skills |
| `skills/article-gen/SKILL.md` | Main skill — end-to-end article generation with image prompts |
| `skills/article-validate/SKILL.md` | Triple scoring gate (Quality 10-point + Virality 5-point + SEO 6-point) |
| `skills/article-seo/SKILL.md` | Standalone SEO analysis + optimization (6 metrics, traffic light) |
| `skills/article-brief/SKILL.md` | Brainstorm + outline with virality pre-assessment |
| `agents/article-writer.md` | Subagent for batch article writing |
| `references/` | 12 reference docs read on-demand by skills/agent |
| `README.md` | Repo README |
| `LICENSE` | MIT license |

### Reference Files

| File | When Used |
|------|-----------|
| `global-config.md` | ALWAYS (read FIRST) — single source of truth for all configurable values (language, tone, readability, image gen, quality gate, virality score) |
| `frameworks-library.md` | Framework selection — 14 copywriting frameworks (3 primary + 11 supporting) with decision matrix |
| `hook-repository.md` | Hook writing — 8 hook types with psychology, engagement boost %, templates, combining strategies |
| `retention-engine.md` | Body writing — 6 retention techniques (slippery slide, Zeigarnik, open loops, bucket brigades, pattern interrupts, nested loops) |
| `emotional-arcs.md` | Emotional planning — 4 arcs with neurotransmitter mapping, pacing metrics, completion-to-share resolution |
| `virality-triggers.md` | Shareability — neuroscience of sharing, 5-point virality scoring guide with pass/fail definitions |
| `image-prompt-guide.md` | Image prompts — GeminiGen.AI API docs, model/style guides, section→concept mapping, prompt best practices |
| `seo-rules-engine.md` | SEO scoring — 6 metrics with traffic light thresholds, JS logic contract for Portfolio website, completion callback JSON schema |
| `style-guide.md` | Style editing — 6 technical writing rules with before/after examples, forbidden vocabulary, AI pattern avoidance |
| `quality-gate.md` | Final scoring — 10-point checklist with pass/fail definitions, revision priority guide |
| `sources-index.md` | Research citations — 22 source documents from NotebookLM research |
| `writing-framework.md` | Master overview — original 7-section framework (structures, hooks, retention, arcs, virality, style, quality) |

## Key Concepts

- **Copywriting Frameworks** — PASO, StoryBrand, AIDA as primary + 11 supporting frameworks with decision matrix (topic/goal → framework)
- **Hook Psychology** — 8 hook types with engagement boost % (Story +55%, Before/After +50%, Curiosity +45%, Question +40%, etc.), 1.7-3 second pattern interrupt window, engagement multipliers for combining hooks
- **Retention Engine** — 6 techniques: slippery slide (short first line), Zeigarnik effect (open loops), bucket brigades (colon transitions), pattern interrupts (every 300-400 words), nested loops (additive tension), "trailer moment" teasers
- **Emotional Arc Sequencing** — 4 arcs (Discovery, Empowerment, Myth-Busting, Transformation), fast hook/slow build pacing, neurotransmitter targeting (oxytocin/cortisol/dopamine)
- **Virality Score** — 5-point gate (min 3/5): social currency, high-arousal emotion, practical utility, identity signaling, cognitive gap closure
- **Completion-to-Share Pipeline** — Strategic resolution + end reward triggers share impulse; completion rate > impressions (2025 metric shift)
- **Quality Gate** — 10-point checklist (min 7/10): clear, concise, compelling, credible, nested loops, bucket brigades, emotional arc, scannability, benefit-first, dual CTA
- **E-E-A-T Density** — 1 citation per 400 words; Experience, Expertise, Authoritativeness, Trustworthiness
- **Neuroscience of Sharing** — Medial prefrontal cortex (self-processing → shareability), ventral striatum (reward), emotional arousal spectrum (high-arousal effective, low-arousal ineffective)
- **SEO Rules Engine** — 6-metric traffic light scoring (title length, keyword in title, title words, keyword density, keyword in first 100 words, keyword in headings), 4/6 minimum, keyword auto-derive + user confirmation, JS logic contract for Portfolio website
- **Image Prompt Generation** — GeminiGen.AI API with nano-banana-pro (free), 3-5 images per article (1 cover + 2-4 inline), section→concept mapping
- **Forbidden Vocabulary** — 7 banned AI-sounding words (Unlock, Unleash, Supercharge, Empower, Enhance, Exceed, Maximize)
- **Grade 5 Readability** — Flesch-Kincaid age 9-11, conversational people-first language
- **2025 Depth Trend** — Algorithms reward sustained attention + engagement depth over quick taps; long-form (1,900-2,400 words) outperforms micro-content

## Capabilities

1. **End-to-end article generation** — topic research → framework selection → hook → outline → writing → style pass → image prompts → virality score → quality gate → output
2. **Triple scoring gates** — Quality Gate (10-point, min 7/10) + Virality Score (5-point, min 3/5) + SEO Score (6-point, min 4/6)
3. **14 copywriting frameworks** — with automatic recommendation via decision matrix
4. **8 hook types** — with engagement boost rankings and combining strategies
5. **6 retention techniques** — psychologically-backed reader retention patterns
6. **4 emotional arcs** — with neurotransmitter targeting and pacing guidance
7. **Inline image prompts** — GeminiGen.AI compatible (nano-banana-pro/nano-banana-2/imagen-4), 3-5 per article
8. **Virality engineering** — 5-trigger scoring with per-trigger improvement strategies
9. **Article validation** — score any existing article against all three gates with actionable fix recommendations
10. **SEO analysis** — standalone keyword density, title optimization, heading analysis with traffic light scoring
11. **Article briefs** — structured outlines with virality pre-assessment and image concept planning
12. **Batch production** — via article-writer subagent for multiple articles in sequence
13. **Fact verification** — web-verify all claims before including, E-E-A-T citation density enforcement

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
| Image style | Per global-config.md Image Generation (`default_style`) |
| Image aspect ratio | Per global-config.md Image Generation (`default_aspect_ratio`) |
| Image count | Per global-config.md Image Generation (`image_count` + allocation table) |
| Hook word limit | Per global-config.md Hook Defaults section |
| SEO minimum | Per global-config.md SEO Rules Engine (`seo_minimum`) |
| SEO keyword handling | Per global-config.md SEO Rules Engine (`keyword_handling`) |
| Title length optimal | Per global-config.md SEO Rules Engine (`title_length_optimal`) |
| Keyword density optimal | Per global-config.md SEO Rules Engine (`keyword_density_optimal`) |

## Conventions for Contributors

### Changing a Global Setting
To change any configurable value (language, readability, image model, etc.):
1. Edit `references/global-config.md` — single source of truth
2. No need to edit other files — they all reference global-config.md

### Adding a New Reference File
1. Create `.md` file in `references/`
2. Add entry to the Reference Files table in relevant `SKILL.md` files
3. Add entry to `agents/article-writer.md` Reference Files table
4. Update this CLAUDE.md file (Reference Files table + relevant Key Concepts)

### File Naming
- Reference files: lowercase, kebab-case (e.g., `virality-triggers.md`)
- No spaces in filenames
- Skills: `skills/<skill-name>/SKILL.md`
- Agents: `agents/<agent-name>.md`

## Debugging

| Issue | Check |
|-------|-------|
| Article too long/short | Check global-config.md `article_length` (1,900-2,400 words) |
| Forbidden words in output | Verify style pass ran — check style-guide.md forbidden list |
| Low quality score | Read quality-gate.md revision priority guide — fix Compelling first |
| Low virality score | Read virality-triggers.md per-trigger boost strategies |
| Wrong framework selected | Check frameworks-library.md Decision Matrix — match goal to framework |
| Flat emotional arc | Check emotional-arcs.md — ensure arc phases map to sections |
| No image prompts | Check image-prompt-guide.md — verify model/style/aspect_ratio in global-config |
| Image too generic | Add article topic context to prompt — see image-prompt-guide.md best practices |
| Readability too high | Target Grade 5 — short sentences, common words, active voice per style-guide.md |
| Missing citations | E-E-A-T requires 1 per 400 words — verify citation placement in outline |
| Hook too long | Max 15 words / 25 chars mobile — check hook-repository.md constraints |
| No open loops | Zeigarnik mandates 3+ in first 500 words — check retention-engine.md |
| No bucket brigades | Must be on own lines with colons — check retention-engine.md phrase library |
| GeminiGen API error | Check GEMINIGEN_API_KEY env var, rate limit 5/min for nano-banana-pro |
| Images don't match article tone | Verify section→concept mapping from image-prompt-guide.md |
| Low SEO score | Check seo-rules-engine.md per-metric optimization strategies — fix Red metrics first |
| Keyword stuffing in headings | Max 2 keyword appearances in H2/H3 — replace extras with synonyms |
| Title too long/short | Target 50-60 chars — see seo-rules-engine.md title optimization |
| Keyword density too high | >1.5% triggers warning, >3% is Red — replace with synonyms |
| Keyword missing from first 100 words | Weave into opening hook or problem statement naturally |
| SEO callback not sending | Check pipeline mode flags (--api-url, --api-token) and completion callback JSON schema in seo-rules-engine.md |

---

**Version:** 1.1.0
**Last Updated:** April 2026
