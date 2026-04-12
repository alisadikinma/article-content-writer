# Article Content Writer — Claude Code Plugin

AI-powered long-form article writer with inline image prompt generation. Generates high-converting articles using research-backed copywriting frameworks, viral hook techniques, psychological retention patterns, emotional arc sequencing, and GeminiGen.AI image prompts. Dual scoring gates: Quality (10-point) + Virality (5-point).

## Install

```bash
# Via ai-content-suite marketplace
claude plugins marketplace add alisadikinma/ai-content-suite
claude plugins install article-content-writer

# Or direct
claude plugins install alisadikinma/article-content-writer
```

## Skills

| Skill | Description |
|-------|-------------|
| `article-gen` | End-to-end article generation: research → framework → hook → outline → write → style pass → image prompts → virality score → quality gate |
| `article-validate` | Dual scoring gate — Quality (10-point, min 7/10) + Virality (5-point, min 3/5) — for any existing article |
| `article-brief` | Brainstorm + outline planning with virality pre-assessment and image concept mapping |

## Agent

| Agent | Description |
|-------|-------------|
| `article-writer` | Self-contained subagent for batch article writing with full pipeline |

## Quick Start

```
# Generate an article
/article-gen

# Validate an existing article
/article-validate

# Plan an article before writing
/article-brief
```

### Example: Generate an Article

```
User: /article-gen
Agent: What topic, audience, and goal?
User: Topic: "Why long-form content beats micro-content in 2025"
       Audience: Content marketers
       Goal: Educate + convert to newsletter signup
```

The agent will:
1. Research the topic (web search for current data)
2. Recommend a framework (likely PASO or Myth-Busting arc)
3. Generate 3 hook options with engagement boost %
4. Build an outline with retention techniques mapped per section
5. Write the article section by section
6. Run style pass (Grade 5 readability, 20% fluff cut)
7. Generate 3-5 image prompts (GeminiGen.AI compatible)
8. Score Virality (5 triggers, min 3/5)
9. Score Quality (10 criteria, min 7/10)
10. Output the complete package

## What's Inside

- **14 copywriting frameworks** with automatic recommendation
- **8 hook types** ranked by engagement boost (Story +55% to Social Proof +25%)
- **6 retention techniques** (slippery slide, Zeigarnik, open loops, bucket brigades, pattern interrupts, nested loops)
- **4 emotional arcs** with neurotransmitter targeting (oxytocin, cortisol, dopamine)
- **5-point virality scoring** (social currency, high-arousal emotion, practical utility, identity signaling, cognitive gap closure)
- **10-point quality gate** (clear, concise, compelling, credible, nested loops, bucket brigades, emotional arc, scannability, benefit-first, dual CTA)
- **GeminiGen.AI image prompts** (nano-banana-pro free tier, 3-5 images per article)
- **11 reference documents** as RAG knowledge base

## Image Generation

Image prompts are generated for GeminiGen.AI API. Set your API key:

```bash
export GEMINIGEN_API_KEY=your_key_here
```

Default model: `nano-banana-pro` (free tier — 5 req/min, 100 req/hour).

## License

MIT
