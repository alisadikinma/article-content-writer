# Article Content Writer — Claude Code Plugin

AI-powered long-form article writer with inline image prompt generation. Optimized 5-step pipeline generates publication-ready articles in ~6-8 minutes using 14 copywriting frameworks, 8 hook types, 6 retention techniques, 4 emotional arcs, and GeminiGen.AI image prompts. Every article must pass 20 hard rules and five scoring gates (Quality 7/10 + Virality 3/5 + SEO 4/6 + AI Humanization 20pt + GEO 5pt) with a combined 100-point score before output. Split pipeline architecture with model switching (Sonnet/Opus) for optimized backend automation.

## Install

```bash
# Via ai-content-suite marketplace
claude plugins marketplace add alisadikinma/ai-content-suite
claude plugins install article-content-writer

# Or direct
claude plugins install alisadikinma/article-content-writer
```

## Skills

| Skill | Trigger | Description |
|-------|---------|-------------|
| `article-gen` | `/article-gen` | End-to-end 5-step article generation: research → strategy → outline → write+polish → five gates (interactive + single-session fallback) |
| `article-prep` | `/article-prep` | Pipeline-only Steps 1-3 (research+strategy+outline) — runs on Sonnet with compiled refs |
| `article-write` | `/article-write` | Pipeline-only Step 4 (write+polish+images) — runs on Opus with compiled refs |
| `article-score` | `/article-score` | Pipeline-only Step 5 (five-gate scoring+completion) — runs on Sonnet with compiled refs |
| `article-validate` | `/article-validate` | Five-gate scoring (Quality + Virality + SEO + AI Humanization + GEO) with combined 100-point score |
| `article-seo` | `/article-seo` | Standalone SEO + GEO analysis with 6 SEO + 5 GEO metrics and traffic light scoring |
| `article-brief` | `/article-brief` | Brainstorm + outline planning with virality pre-assessment and image concept mapping |

## Agent

| Agent | Description |
|-------|-------------|
| `article-writer` | Self-contained subagent for batch article writing — mirrors the same 5-step pipeline with all rules inline |

## 5-Step Optimized Pipeline

Collapsed from the original 14-step pipeline for ~50% faster generation while maintaining identical output quality.

| Step | Name | What Happens | Refs Read |
|------|------|-------------|-----------|
| 1 | **Input + Research** | Collect topic/audience/goal, 2-3 web searches, 5-8 verified data points, keyword derive | `global-config.md` |
| 2 | **Strategy** | Framework via Decision Matrix + emotional arc + 3 hooks (PRIMARY/SECONDARY/WILDCARD) | `frameworks-library.md`, `emotional-arcs.md`, `hook-repository.md` |
| 3 | **Outline** | Full section structure with retention techniques, citations, image concepts mapped | `retention-engine.md`, `image-prompt-guide.md` |
| 4 | **Write + Polish + Images** | Single-pass writing with all rules inline (style, SEO, readability, retention), then image prompts | `style-guide.md`, `seo-rules-engine.md` |
| 5 | **Five Gates + Output** | Score all 5 gates, calculate combined 100-point score, fix failures, assemble final output | `virality-triggers.md`, `quality-gate.md`, `seo-rules-engine.md` |

- **Interactive mode:** 1 pause point after Step 3 — user reviews research, strategy, and outline together, selects hook. Steps 4-5 run without pause. Uses `article-gen`.
- **Pipeline mode (single):** 0 pause points — fully automated via CLI flags with progress callbacks. Uses `article-gen`.
- **Pipeline mode (split):** Backend calls `article-prep` (Sonnet) → `article-write` (Opus) → `article-score` (Sonnet) with compiled references injected via `--append-system-prompt-file`.
- **Research efficiency:** ALL web searches happen in Step 1 only. Zero web calls during writing.

## Quick Start

```
# Generate an article
/article-gen

# Validate an existing article
/article-validate

# Analyze SEO of an existing article
/article-seo

# Plan an article before writing
/article-brief
```

### Example

```
User: /article-gen
Agent: What topic, audience, and goal?
User: Topic: "Why long-form content beats micro-content in 2025"
       Audience: Content marketers
       Goal: Educate + convert to newsletter signup
```

## Five Scoring Gates + Combined 100-Point Score

All blocking gates must pass AND combined score must reach 70+ before output.

| Gate | Criteria | Minimum | Weight | Max Pts |
|------|----------|---------|--------|---------|
| **Quality Gate** | 10-point: clear, concise, compelling, credible, nested loops, bucket brigades, emotional arc, scannability, benefit-first, dual CTA | 7/10 | x3 | 30 |
| **Virality Score** | 5 triggers: social currency, high-arousal emotion, practical utility, identity signaling, cognitive gap closure | 3/5 | x4 | 20 |
| **SEO Score** | 6 metrics: title length (50-60ch), keyword in title, title words (6-10), keyword density (0.5-1.5%), keyword in first 100 words, keyword in headings (1-2) | 4/6 | x2.5 | 15 |
| **AI Humanization** | 20-point deduction: Tier 1 (-2/word), Tier 2 (-1/cluster), Tier 3 (-1/word), AI patterns (-0.5/cat) | — | x1 | 20 |
| **GEO Score** | 5 metrics: answer-first H2s, passage citability, FAQ presence, entity clarity, freshness signals | — | x3 | 15 |
| **Combined** | Weighted sum of all 5 gates | **70/100** | — | **100** |

Bands: Exceptional (90-100), Strong (80-89), Acceptable (70-79), Below Standard (60-69), Rewrite (<60)

## 20 Hard Rules

Every article must pass all 20 rules. No exceptions.

| # | Rule | Key Constraint |
|---|------|---------------|
| 1 | Forbidden vocabulary | Tier 1 of 107-word system — 52 always-replace words |
| 2 | Grade 5 readability | Flesch-Kincaid age 9-11 |
| 3 | E-E-A-T citations | Min 1 data point per 400 words |
| 4 | Zeigarnik open loops | 3+ in first 500 words |
| 5 | Information gap headers | No summary-style headers |
| 6 | Bucket brigades | Own line, ending with colon |
| 7 | Paragraph length | Max 3-4 lines |
| 8 | "So What?" test | Every section delivers concrete benefit |
| 9 | Dual CTA | Direct + Transitional at article end |
| 10 | 20% fluff reduction | Cut filler words, redundant phrases |
| 11 | Web-verify facts | All claims verified in Step 1; zero web calls in Step 4 |
| 12 | Hook word limit | 15 words target, 25 max |
| 13 | Virality score | Min 3/5 to publish |
| 14 | Completion-to-Share | Narrative tension resolves at end |
| 15 | High-arousal emotions | Awe, excitement, productive anger |
| 16 | Practical Utility section | [Number]+[Superlative]+[Timeframe]+[Outcome] |
| 17 | SEO score | Min 4/6 to publish |
| 18 | Actionable Depth | Numbered points: What+How+Example+Outcome, 150-250 words each |
| 19 | AI Humanization | Zero Tier 1 words, no Tier 2 clusters, Tier 3 under 3%, no AI patterns (36 categories) |
| 20 | GEO/AEO formatting | Answer-First H2s, passage citability, 2+ FAQ pairs, entity clarity, 3+ freshness signals |

## What's Inside

- **14 copywriting frameworks** with automatic recommendation via decision matrix (PASO, StoryBrand, AIDA primary)
- **8 hook types** ranked by engagement boost (Story +55%, Before/After +50%, Curiosity +45%, Question +40%)
- **6 retention techniques** (slippery slide, Zeigarnik, open loops, bucket brigades, pattern interrupts, nested loops)
- **4 emotional arcs** with neurotransmitter targeting (oxytocin, cortisol, dopamine)
- **GeminiGen.AI image prompts** (nano-banana-pro/nano-banana-2/imagen-4), 3-5 per article with section-to-concept mapping
- **13 reference documents** as RAG knowledge base — read on-demand per step (or compiled into 3 bundles for split pipeline)
- **Split pipeline architecture** — 3-skill split (article-prep/article-write/article-score) with model switching and compiled reference injection

## Pipeline Mode

For automated content production via the Portfolio Content Engine:

**Single-session (fallback):**
```bash
claude -p "/article-gen --idea-id 123 --api-url https://example.com/api --api-token TOKEN --topic 'Your topic' --languages en,id" --dangerously-skip-permissions
```

**Split pipeline (optimized):**
```bash
# Step 1-3: Research + Strategy + Outline (Sonnet)
claude -p "/article-prep --idea-id 123 ..." --model sonnet --append-system-prompt-file refs-prep.md --dangerously-skip-permissions

# Step 4: Write + Polish + Images (Opus)
claude -p "/article-write --idea-id 123 ..." --model opus --append-system-prompt-file refs-write.md --dangerously-skip-permissions

# Step 5: Five Gates + Completion (Sonnet)
claude -p "/article-score --idea-id 123 ..." --model sonnet --append-system-prompt-file refs-score.md --dangerously-skip-permissions
```

Optional: `--keyword "target keyword"`, `--instructions "custom guidance"`

**Progress callbacks** across all phases (5% → 15% → 25% → 35% → 50% → 70% → 78% → 82% → 85% → 90% → 94% → 97% → 100%). **Completion callback** sends full structured JSON: article content, SEO analysis, virality score, quality gate, AI humanization, GEO score, combined 100-point score, image prompts, and research data.

## Image Generation

Image prompts are generated for GeminiGen.AI API. Set your API key:

```bash
export GEMINIGEN_API_KEY=your_key_here
```

| Model | Use Case | Tier |
|-------|----------|------|
| `nano-banana-pro` | Default — best general purpose | Free (5 req/min, 100 req/hour) |
| `nano-banana-2` | Stylized/artistic content | Free |
| `imagen-4` | Maximum photorealism fidelity | Premium |

## Configuration

All configurable values live in `references/global-config.md` — single source of truth. Edit that file to change language, readability target, image model, scoring thresholds, research limits, or any other setting. No other files need editing.

## License

MIT
