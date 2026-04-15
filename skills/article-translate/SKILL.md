---
name: article-translate
description: "Pipeline-only skill for finalize-stage translation. Reads a published Post from backend, translates title + content (HTML) + SEO meta + image alt text into target locale (default English). Runs on Sonnet with refs-translate.md injected. Part of finalize flow: Gate 2 approve → post created → article-translate → post_translations.en row."
---

# Article Translate Skill (Finalize — Post-Publish Translation)

Pipeline-only skill that translates a just-published Post from its primary language (typically Indonesian) to a target locale (typically English). Runs AFTER the backend has created the `posts` row + primary `post_translations` row. Writes the translated output back via automation endpoint.

> **DO NOT read reference files with the Read tool.** All translation rules (HTML preservation, tone matching, SEO meta, bucket brigade equivalents) are injected via `--append-system-prompt-file refs-translate.md`. They are already in your system prompt. Reading them again wastes time and tokens.

---

## 1. Pipeline Flags (Required)

| Flag | Required | Description |
|------|----------|-------------|
| `--post-id {id}` | Yes | Published Post ID in the Portfolio database |
| `--api-url {url}` | Yes | Base API URL (e.g., `https://alisadikinma.com/api`) |
| `--api-token {token}` | Yes | Authentication bearer token |
| `--idempotency-key {uuid}` | Yes | UUID passed by backend to dedupe retries |
| `--target-locale {code}` | No | Target locale code (default `en`). Currently only `en` supported. |

All source data comes from the post's primary `post_translations` row.

---

## 2. Don't Read Reference Files

Translation rules (`translation-guidelines.md`) are pre-injected into the system prompt by the backend when it launches the Claude CLI with `--append-system-prompt-file refs-translate.md`. Attempting to Read them wastes tokens. Trust the system prompt.

---

## 3. Read Post Data

On start, fetch the post's primary-language content to translate FROM:

```bash
curl -s -X GET "{api_url}/automation/posts/{post_id}/for-translation" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json"
```

Extract from the response:

- `title` — primary-language title (string)
- `slug` — primary-language slug (string; for reference only, you'll generate a new English slug)
- `content` — primary-language HTML body (string)
- `excerpt` — short summary (may be null)
- `meta_title` — SEO title 50-60 chars (may be null)
- `meta_description` — SEO description 140-160 chars (may be null)
- `og_title` — social share title (may be null)
- `og_description` — social share description (may be null)
- `ai_summary` — AI-friendly summary (may be null)
- `image_alt_map` — object keyed by image URL, value = current alt text (may be empty `{}`)

**Report progress: 10% (loaded)**

```bash
curl -s -X PUT "{api_url}/automation/posts/{post_id}/progress" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"step":"loaded","percentage":10,"message":"Post data loaded"}'
```

---

## 4. Progress Reporting

Progress is reported against the POST (not the content_idea). Use the same callback URL pattern as other skills but targeting `/automation/posts/{post_id}/progress`.

| Sub-step | Step Name | Percentage | Description |
|----------|-----------|-----------|-------------|
| Post loaded | loaded | 10 | Primary-language data fetched |
| Translating | translating | 40 | Running per-field translation |
| Saving | saving | 80 | Submitting translation to backend |
| Complete | completed | 100 | Translation row persisted |

---

## 5. Translation Rules (summary — full rules in refs-translate.md)

Every field must follow the rules in your system prompt (`translation-guidelines.md`). Core non-negotiables:

1. **HTML structure preserved absolute** — every tag, every attr, every nesting level intact
2. **Code blocks verbatim** — `<pre>`, `<code>`, file paths, CLI commands, brand names, framework names unchanged
3. **Gen-Z casual register** — "you're", "let's", "here's the deal" — not academic passive
4. **Bucket brigades preserved** — standalone `<p>` ending with colon, English equivalent mapped from reference table
5. **SEO meta constraints** — title 50-60 chars, description 140-160 chars, keep target keyword intent
6. **Zero markdown drift** — output has no `##`, `**`, `__`, `[...]` — only HTML

**Report progress: 40% (translating)**

---

## 6. Slug Generation

Generate `target_locale` slug:
- Kebab-case of translated title
- Lowercase, ASCII only
- Strip punctuation, collapse whitespace/hyphens to single `-`
- Max 80 chars (truncate at word boundary)

Example: translated title "How to Deploy Laravel to Your VPS" → slug `how-to-deploy-laravel-to-your-vps`

---

## 7. Output Format

Build a single JSON payload:

```json
{
  "idempotency_key": "{idempotency_key}",
  "target_locale": "en",
  "translation": {
    "title": "<translated title>",
    "slug": "<generated-english-slug>",
    "excerpt": "<translated excerpt, 150-300 chars, null if source null>",
    "content": "<translated HTML body — structure identical to source>",
    "meta_title": "<translated SEO title 50-60 chars>",
    "meta_description": "<translated SEO description 140-160 chars>",
    "og_title": "<translated social title>",
    "og_description": "<translated social description>",
    "ai_summary": "<translated ai_summary, null if source null>",
    "image_alt_map": {
      "<image_url_1>": "<translated alt 1>",
      "<image_url_2>": "<translated alt 2>"
    }
  }
}
```

**Field mapping discipline:**
- If source field is `null` or empty, output the same `null` (do NOT invent content)
- `image_alt_map` keys are the SAME URLs as the source (do not rewrite URLs)
- `content` HTML structure MUST match source: same tag tree, same order, only text content translated

**Report progress: 80% (saving)**

---

## 8. Save via Callback

PUT the full payload to the backend:

```bash
curl -s -X PUT "{api_url}/automation/posts/{post_id}/save-translation" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{JSON_PAYLOAD}'
```

The backend UPSERTs the `post_translations` row keyed by `(post_id, language=target_locale)`. If `image_alt_map` is present, the backend rewrites `alt` attributes in the stored `post_translations.content` HTML.

---

## 9. Mark Complete

After save returns 200, mark translation complete:

```bash
curl -s -X POST "{api_url}/automation/posts/{post_id}/translation-complete" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"idempotency_key":"{idempotency_key}"}'
```

This flips `posts.translation_pending = false` and updates `posts.last_translation_attempt`.

**Report progress: 100% (completed)**

---

## 10. Error Handling

If any step fails:

```bash
curl -s -X PUT "{api_url}/automation/posts/{post_id}/progress" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  -d '{"step":"failed","percentage":{last_pct},"message":"Error at {step_name}: {error_detail}"}'
```

Do NOT call translation-complete on failure. The backend cron `ProcessPendingTranslations` will retry up to 3 times every 5 minutes.

---

## Self-Verification Before Submit

Before calling `/save-translation`, verify your output against these checks (quick mental pass):

- [ ] `content` contains ZERO markdown syntax (`##`, `**`, `__`, `[...](...)`)
- [ ] `content` HTML tag count matches source tag count
- [ ] All `<code>` / `<pre>` contents byte-identical to source
- [ ] All `<a href>` URLs unchanged
- [ ] No brand name translated (React stays React, Laravel stays Laravel)
- [ ] `meta_title` length 50-60 chars
- [ ] `meta_description` length 140-160 chars
- [ ] `slug` is kebab-case, lowercase, ASCII only
- [ ] If source field is null, output field is null

If any check fails, rewrite that field before submitting.
