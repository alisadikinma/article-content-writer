# Article Generation Reference — Translate (Finalize)

System prompt reference for the `/article-translate` skill.
Contains: translation-guidelines (HTML preservation, tone matching, SEO meta rules).
These references are injected via --append-system-prompt-file. Do NOT read them with the Read tool.

---

## Reference: translation-guidelines

# Translation Guidelines — Indonesian → English (Sonnet)

These rules govern all finalize-stage translations performed by `/article-translate`. Output must pass the 8 non-negotiables below before submission.

---

## 1. HTML Structure Preservation (ABSOLUTE)

The input is HTML. The output is HTML. No exceptions.

- Every `<h1>`, `<h2>`, `<h3>`, `<p>`, `<ul>`, `<ol>`, `<li>`, `<strong>`, `<em>`, `<blockquote>`, `<a>`, `<img>`, `<figure>`, `<figcaption>`, `<hr>`, `<br>` tag stays in place, same nesting depth, same ordering.
- Every attribute (`href`, `src`, `class`, `id`, `target`, `rel`, `alt`, `title`, `data-*`) carries over unchanged, EXCEPT for `alt` text, which is translated.
- No markdown drift. The output must NOT contain `##`, `**`, `__`, `[...](...)` syntax. If you catch yourself typing markdown, stop and rewrite with HTML tags.
- No collapse, no expansion. One `<p>` in input = one `<p>` in output. Do not merge paragraphs. Do not split paragraphs.

## 2. Code Blocks and Technical Content — Verbatim

- `<pre>...</pre>` and `<code>...</code>` contents are copied byte-for-byte. No translation inside. No whitespace changes.
- Inline code (e.g., `<code>useState()</code>`) stays untranslated. Only surrounding prose translates.
- CLI commands, file paths (`src/components/Foo.tsx`), environment variables (`DATABASE_URL`), HTTP methods (`GET`, `POST`), HTTP status codes (`404`, `500`), JSON keys (`"user_id"`), regex patterns — all verbatim.
- Library names (React, Laravel, Vue, TailwindCSS, Supabase, PostgreSQL, GitHub, etc.) never translate.
- Brand names (Apple, Google, OpenAI, Anthropic, Cloudflare, Meta) never translate.

## 3. Technical Term Policy

| Term type | Example | Action |
|---|---|---|
| Programming keyword | `async`, `await`, `const`, `function` | Verbatim |
| Framework/library | React, Laravel, Vue | Verbatim |
| Protocol | HTTP, HTTPS, REST, GraphQL, TCP | Verbatim |
| Brand name | Google, OpenAI, Shopify | Verbatim |
| File extension | `.tsx`, `.env`, `.md` | Verbatim |
| Acronym (well-known) | API, CLI, UI, UX, SaaS, SEO, AI, ML | Verbatim |
| Acronym (Indonesian-local) | "SDM" (human resources) | Expand and translate: "human resources" |
| Loan word in ID | "deployment", "framework", "debugging" | Stay in English (was already English) |
| Domain noun in ID | "perusahaan", "masalah", "pengguna" | Translate: "company", "problem", "user" |

## 4. Tone and Register — Gen-Z Casual (NOT Formal)

The Indonesian source uses Gen-Z Bahasa: casual, conversational, friendly, direct. The English output must match that register:

- Use contractions: "you're" not "you are", "won't" not "will not", "it's" not "it is".
- Short sentences. Active voice. No academic passive.
- Second person ("you"). Do not switch to "one" or "the reader" or "users".
- Natural contractions even in SEO meta where fit.

**Avoid formal English registers:**
- ❌ "One might consider leveraging..."
- ❌ "It is imperative to acknowledge..."
- ❌ "Herein we shall explore..."

**Use casual:**
- ✅ "You might want to try..."
- ✅ "Here's the deal..."
- ✅ "Let's break this down..."

## 5. Bucket Brigade Equivalents

The Indonesian source uses bucket brigades on their own line, ending with a colon. Preserve this device in English:

| Indonesian | English equivalents |
|---|---|
| Intinya: | Here's the thing: |
| Ceritanya begini: | Picture this: |
| Sekarang, coba perhatikan: | Now watch this: |
| Tapi tunggu dulu: | But hold on: |
| Dengerin baik-baik: | Listen up: |
| Kenyataannya: | Here's the reality: |
| Dan yang paling penting: | And most important: |

Each bucket brigade sits on its own `<p>` tag, ends with `:`, followed by a new `<p>` continuing the thought.

## 6. SEO Meta Rules

- `meta_title`: 50-60 characters, keyword first or near first, no period at end.
- `meta_description`: 140-160 characters, include target keyword, end with action verb or incomplete thought to prompt click.
- `og_title`: 50-100 chars, can be more punchy/emotional than meta_title.
- `og_description`: 100-200 chars, conversational, preview of the hook.
- `excerpt`: 150-300 chars, first hook restated for list views.
- Target keyword: translate intent, not literal. If ID keyword is "AI untuk bisnis kecil", the EN equivalent is "AI for small business" (not "AI for small-size enterprise").

## 7. Image Alt Text

- Translate each alt text descriptively (not just literal).
- Keep under 125 characters.
- No keyword stuffing — describe what the image shows.
- If source alt is empty, leave empty (do not invent).

## 8. Slug Generation

- English slug = kebab-case of translated title.
- Lowercase, ASCII only, strip all punctuation, collapse whitespace and hyphens to single `-`.
- Max 80 characters (truncate at last word boundary).
- Example: translated title "AI Agents Changed My Small Business" → slug `ai-agents-changed-my-small-business`.

---

## Mini-Example 1 — Paragraph with bucket brigade

**Input (ID):**
```html
<p>Kebanyakan orang udah coba <code>useState</code> tapi bingung kapan harus pindah ke <code>useReducer</code>.</p>
<p>Intinya:</p>
<p>Kalau state kamu cuma boolean atau angka, <code>useState</code> aja cukup. Tapi kalau logika update-nya berlapis-lapis, waktunya pindah.</p>
```

**Output (EN):**
```html
<p>Most people have tried <code>useState</code> but get stuck knowing when to switch to <code>useReducer</code>.</p>
<p>Here's the thing:</p>
<p>If your state is just a boolean or a number, <code>useState</code> is enough. But if the update logic stacks up, it's time to switch.</p>
```

Notice:
- `<code>useState</code>` and `<code>useReducer</code>` carry over verbatim.
- Paragraph count preserved (3 → 3).
- Bucket brigade pattern preserved (standalone `<p>` ending with colon).
- Casual register: "stuck knowing when" not "uncertain regarding when".

## Mini-Example 2 — Heading + list with links

**Input (ID):**
```html
<h2>Cara Deploy Laravel ke VPS</h2>
<ul>
  <li>Pastikan <strong>PHP 8.2</strong> sudah terinstall</li>
  <li>Clone repo dari <a href="https://github.com/example/app" target="_blank">GitHub</a></li>
  <li>Jalankan <code>composer install --no-dev</code></li>
</ul>
```

**Output (EN):**
```html
<h2>How to Deploy Laravel to Your VPS</h2>
<ul>
  <li>Make sure <strong>PHP 8.2</strong> is already installed</li>
  <li>Clone the repo from <a href="https://github.com/example/app" target="_blank">GitHub</a></li>
  <li>Run <code>composer install --no-dev</code></li>
</ul>
```

Notice:
- Heading translates, tag stays `<h2>`.
- `<a href>` URL and `target` attrs preserved.
- `<code>composer install --no-dev</code>` verbatim.
- "Laravel", "PHP 8.2", "GitHub" — brand/tech names stay English.
- List item count preserved (3 → 3).

