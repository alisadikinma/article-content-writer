# Article Content Writer — Global Config

> Single source of truth for all configurable values. To change any setting, edit THIS file only.

---

## 1. Language

| Setting | Value |
|---------|-------|
| `primary_language` | English |
| `bilingual_support` | Yes — headline in primary language, subtitle as translation (configurable) |
| `prompt_language` | Always English (AI model instruction language) |
| `indonesian_mode` | Available — bilingual ID/EN with Gen-Z Bahasa for hooks |

---

## 2. Content Defaults

| Setting | Value | Source |
|---------|-------|--------|
| `default_framework` | PASO (Problem, Agitate, Solve, Outcome) | Most versatile for long-form — see frameworks-library.md |
| `article_length` | 1,900–2,400 words | SEO optimal per research: comprehensive guides rank higher [1] |
| `citation_density` | 1 data point or reputable citation per 400 words minimum | E-E-A-T signal density for search algorithms and AI Overviews [2] |
| `paragraph_max` | 3–4 lines | Scannability rule — more periods, fewer commas |
| `fluff_reduction` | 20% second-pass cut | Mandatory "rub out" pass after first draft |
| `readability_target` | Flesch-Kincaid Grade 5 (age 9–11) | Conversational, people-first language |

---

## 3. Hook Defaults

| Setting | Value | Source |
|---------|-------|--------|
| `hook_word_limit` | 15 words max | 2-second read time — pattern interrupt window |
| `hook_char_limit` | 25 characters | Mobile scannability constraint [3] |
| `pattern_interrupt_window` | 1.7–3 seconds | 71% of viewers decide within first 3 seconds, average at 1.7s [4] |
| `hook_types_available` | 8 | See hook-repository.md |
| `build_pacing` | 20 words max / 2 seconds | |
| `peak_pacing` | 25 words max / 3 seconds | |

---

## 4. Forbidden Vocabulary

**DO NOT USE these words in any article:**

`Unlock` · `Unleash` · `Supercharge` · `Empower` · `Enhance` · `Exceed` · `Maximize`

**Why:** These are AI-sounding cliches that break conversational tone and signal machine-generated content. Use people-first, conversational language instead.

**Replacements:**
| Instead of | Use |
|-----------|-----|
| Unlock your potential | Find what works for you |
| Unleash the power | Put it to work |
| Supercharge your workflow | Speed up your workflow |
| Empower your team | Give your team the tools |
| Enhance your results | Get better results |
| Maximize efficiency | Save more time |

---

## 5. Quality Gate

| Setting | Value |
|---------|-------|
| `quality_minimum` | 7/10 to publish |
| `quality_criteria_count` | 10 (all mandatory evaluation) |
| `second_pass_required` | Yes — 20% fluff reduction |
| `reference` | See quality-gate.md for full checklist |

---

## 6. Virality Score

| Setting | Value |
|---------|-------|
| `virality_minimum` | 3/5 to publish |
| `virality_triggers_count` | 5 (all mandatory evaluation) |
| `triggers` | Social Currency, High-Arousal Emotion, Practical Utility, Identity Signaling, Cognitive Gap Closure |
| `reference` | See virality-triggers.md Virality Scoring Guide |

---

## 7. Tone & Voice

| Setting | Value |
|---------|-------|
| `tone` | People-first, conversational |
| `punctuation` | More periods, fewer commas |
| `perspective` | Write as if speaking to one person, not an audience |
| `so_what_test` | Every sentence must answer "So what?" — feature without benefit = delete |
| `now_what_test` | Every numbered point must answer "Now what?" — reader must be able to act within 5 minutes |
| `actionable_depth` | Numbered points: minimum 150-250 words each with What + How + Example + Outcome structure |
| `hedging` | Avoid hedging language ("might", "could potentially", "it's possible that") — be direct |

---

## 8. E-E-A-T Density

| Setting | Value | Source |
|---------|-------|--------|
| `min_citations_per_400_words` | 1 | Satisfies search algorithms and AI Overviews [2] |
| `source_quality` | Reputable third-party (named publications, studies, official data) | |
| `experience_signals` | First-hand accounts, "front-line" reporting, original observations | Google Helpful Content System [5] |
| `expertise_depth` | Comprehensive guides — 1,900–2,400 words | Deeply answer customer questions [5] |
| `authoritativeness` | Detailed case studies, unique methodologies, original data | |
| `trustworthiness` | Facts, social proof, reputable citations | Increases AI Overview feature likelihood [5] |

## 8.1. Research Efficiency

| Setting | Value | Rationale |
|---------|-------|-----------|
| `max_web_searches` | 2-3 per article | Targeted queries reduce latency while maintaining E-E-A-T |
| `max_web_fetches` | 1-2 per article | Only fetch full pages when search snippets lack specific data |
| `research_strategy` | Upfront-only | ALL data collected in Step 1, zero web calls during writing |
| `min_data_points` | 5-8 per article | Enough to support 1 citation per 400 words across 2,000 words |
| `writing_web_calls` | 0 | Writing step uses ONLY Step 1 research — no re-verification |

---

## 9. Emotional Arc Defaults

| Setting | Value |
|---------|-------|
| `hook_intensity` | HIGH — fast emotional swing |
| `body_intensity` | Slow build — progressive intensity |
| `arcs_available` | 4 (see emotional-arcs.md) |
| `neurotransmitter_targets` | Oxytocin (empathy/trust via stories), Cortisol (attention/memory via stakes), Dopamine (reward via curiosity resolution) |

---

## 10. Completion-to-Share

| Setting | Value | Source |
|---------|-------|--------|
| `primary_metric` | Completion rate (over impressions) | 2025 metric shift [6] |
| `resolution_required` | Yes — narrative tension must resolve before share impulse triggers | |
| `end_reward` | Key insight or surprising resolution that validates reader's time | |
| `algorithm_priority` | Sustained attention + engagement depth (saves, pauses) over quick taps | Platform algorithm shift 2025 [6] |

---

## 11. Image Generation

| Setting | Value |
|---------|-------|
| `api_endpoint` | `https://api.geminigen.ai/uapi/v1/generate_image` |
| `api_key_env` | `GEMINIGEN_API_KEY` |
| `default_model` | `nano-banana-pro` (Gemini 3 Pro Image Preview — free tier) |
| `available_models` | `nano-banana-pro`, `nano-banana-2`, `imagen-4` |
| `default_style` | `Photorealistic` |
| `default_aspect_ratio` | `16:9` (widescreen for blog articles) |
| `default_resolution` | `1K` |
| `default_output_format` | `jpeg` |
| `image_count` | 3–5 per article (scales with length) |
| `image_allocation` | 1 feature/cover image (MANDATORY) + 2–4 inline section images |
| `prompt_length` | 20–80 words (descriptive, specific) |
| `rate_limit_nano_banana_pro` | 5 req/min, 100 req/hour, 1,000 req/day (free tier) |
| `text_in_image` | NO — text belongs in the article, not the image |
| `reference` | See image-prompt-guide.md for full API docs + prompt best practices |

### Image Count by Article Length

| Article Length | Cover | Inline | Total |
|---------------|-------|--------|-------|
| Short (1,900 words) | 1 | 2 | 3 |
| Standard (2,000–2,200 words) | 1 | 3 | 4 |
| Long (2,200–2,400+ words) | 1 | 4 | 5 |

---

## 12. SEO Rules Engine

| Setting | Value |
|---------|-------|
| `seo_minimum` | 4/6 to publish |
| `seo_metrics_count` | 6 (all mandatory evaluation) |
| `scoring_system` | Traffic light: Green (1 pt), Amber (0.5 pt), Red (0 pt) |
| `keyword_handling` | Auto-derive from topic + user confirmation |
| `title_length_optimal` | 50–60 characters |
| `title_words_optimal` | 6–10 words |
| `keyword_density_optimal` | 0.5–1.5% |
| `keyword_in_headings_optimal` | 1–2 times (>3 = stuffing) |
| `reference` | See seo-rules-engine.md for full scoring guide + JS logic contract |
