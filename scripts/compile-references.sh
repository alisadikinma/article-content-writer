#!/bin/bash
# compile-references.sh — Build per-skill compiled reference files
# Combines individual reference .md files into 3 skill-specific bundles
# for use with --append-system-prompt-file (zero Read tool calls)
#
# Usage: bash scripts/compile-references.sh
# Output: references/compiled/refs-{prep,write,score}.md

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
REFS_DIR="$ROOT_DIR/references"
OUT_DIR="$REFS_DIR/compiled"

mkdir -p "$OUT_DIR"

# Helper: append a reference file with a section header
append_ref() {
  local outfile="$1"
  local reffile="$2"
  local basename
  basename="$(basename "$reffile")"
  echo "" >> "$outfile"
  echo "---" >> "$outfile"
  echo "" >> "$outfile"
  echo "## Reference: ${basename%.md}" >> "$outfile"
  echo "" >> "$outfile"
  cat "$reffile" >> "$outfile"
  echo "" >> "$outfile"
}

# Helper: append a reference file but SKIP specific ## sections
# Usage: append_ref_excluding OUTFILE REFFILE "pattern1" "pattern2" ...
# Patterns match against ## heading lines (substring match)
append_ref_excluding() {
  local outfile="$1"
  local reffile="$2"
  shift 2
  local -a patterns=("$@")

  local basename
  basename="$(basename "$reffile")"
  echo "" >> "$outfile"
  echo "---" >> "$outfile"
  echo "" >> "$outfile"
  echo "## Reference: ${basename%.md}" >> "$outfile"
  echo "" >> "$outfile"

  # Build awk pattern string: pipe-delimited
  local pat_str=""
  for p in "${patterns[@]}"; do
    if [ -n "$pat_str" ]; then
      pat_str="$pat_str|$p"
    else
      pat_str="$p"
    fi
  done

  awk -v patterns="$pat_str" '
  BEGIN { skip=0; split(patterns, pats, "|") }
  /^## / {
    skip=0
    for (i in pats) {
      if (index($0, pats[i]) > 0) { skip=1; break }
    }
  }
  { if (!skip) print }
  ' "$reffile" >> "$outfile"
  echo "" >> "$outfile"
}

# --- refs-prep.md (Steps 1-3: Research + Strategy + Outline) ---
PREP="$OUT_DIR/refs-prep.md"
cat > "$PREP" << 'HEADER'
# Article Generation Reference — Prep (Steps 1-3)

System prompt reference for the `/article-prep` skill.
Contains: global-config, frameworks-library, hook-repository, emotional-arcs, content-templates.
These references are injected via --append-system-prompt-file. Do NOT read them with the Read tool.
HEADER

append_ref "$PREP" "$REFS_DIR/global-config.md"
append_ref "$PREP" "$REFS_DIR/frameworks-library.md"
append_ref "$PREP" "$REFS_DIR/hook-repository.md"
append_ref "$PREP" "$REFS_DIR/emotional-arcs.md"
append_ref "$PREP" "$REFS_DIR/content-templates.md"

# --- refs-write.md (Step 4: Writing + Polish) ---
# Trimmed for writing speed: removes scoring-only sections, JS contract,
# callback schema, image config, and content templates.
WRITE="$OUT_DIR/refs-write.md"
cat > "$WRITE" << 'HEADER'
# Article Generation Reference — Write (Step 4)

System prompt reference for the `/article-write` skill.
Contains: global-config (trimmed), style-guide, retention-engine, seo-rules-engine (trimmed).
These references are injected via --append-system-prompt-file. Do NOT read them with the Read tool.
Note: image-prompt-guide is NOT included — image prompts are generated separately after article approval.
HEADER

# global-config: skip Image Generation (§11) and Content Templates (§16)
# — images handled post-approval, templates already in prep_data
append_ref_excluding "$WRITE" "$REFS_DIR/global-config.md" \
  "## 11. Image Generation" \
  "### Image Count by Article Length" \
  "## 16. Content Templates"

append_ref "$WRITE" "$REFS_DIR/style-guide.md"
append_ref "$WRITE" "$REFS_DIR/retention-engine.md"

# seo-rules-engine: skip Keyword Handling (§2, done in prep), JS Logic Contract (§4),
# Completion Callback JSON (§5), SEO Score Output Format (§6), Per-Metric Optimization (§7)
# — keep only: §1 (scoring table), §3 (placement rules), §8-9 (GEO rules+score)
append_ref_excluding "$WRITE" "$REFS_DIR/seo-rules-engine.md" \
  "## 2. Keyword Handling" \
  "## 4. JS Logic Contract" \
  "## 5. Completion Callback JSON" \
  "## 6. SEO Score Output Format" \
  "## GEO Score:" \
  "## SEO Score:" \
  "## 7. Per-Metric Optimization"

# --- refs-score.md (Step 5: Five Gates + Combined Score) ---
SCORE="$OUT_DIR/refs-score.md"
cat > "$SCORE" << 'HEADER'
# Article Generation Reference — Score (Step 5)

System prompt reference for the `/article-score` skill.
Contains: style-guide, seo-rules-engine, virality-triggers, quality-gate.
These references are injected via --append-system-prompt-file. Do NOT read them with the Read tool.
HEADER

append_ref "$SCORE" "$REFS_DIR/style-guide.md"
# seo-rules-engine: skip Keyword Handling (§2, done in prep), JS Logic Contract (§4),
# Completion Callback JSON (§5) — keep: §1 (scoring table), §3 (placement rules),
# §6-9 (output formats, per-metric strategies, GEO rules+score)
append_ref_excluding "$SCORE" "$REFS_DIR/seo-rules-engine.md" \
  "## 2. Keyword Handling" \
  "## 4. JS Logic Contract" \
  "## 5. Completion Callback JSON"
append_ref "$SCORE" "$REFS_DIR/virality-triggers.md"
append_ref "$SCORE" "$REFS_DIR/quality-gate.md"

# Report sizes
echo "Compiled reference files:"
for f in "$PREP" "$WRITE" "$SCORE"; do
  size=$(wc -c < "$f")
  echo "  $(basename "$f"): $size bytes"
done
echo "Done."
