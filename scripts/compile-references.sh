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
WRITE="$OUT_DIR/refs-write.md"
cat > "$WRITE" << 'HEADER'
# Article Generation Reference — Write (Step 4)

System prompt reference for the `/article-write` skill.
Contains: global-config, style-guide, retention-engine, seo-rules-engine.
These references are injected via --append-system-prompt-file. Do NOT read them with the Read tool.
Note: image-prompt-guide is NOT included — image prompts are generated separately after article approval.
HEADER

append_ref "$WRITE" "$REFS_DIR/global-config.md"
append_ref "$WRITE" "$REFS_DIR/style-guide.md"
append_ref "$WRITE" "$REFS_DIR/retention-engine.md"
append_ref "$WRITE" "$REFS_DIR/seo-rules-engine.md"

# --- refs-score.md (Step 5: Five Gates + Combined Score) ---
SCORE="$OUT_DIR/refs-score.md"
cat > "$SCORE" << 'HEADER'
# Article Generation Reference — Score (Step 5)

System prompt reference for the `/article-score` skill.
Contains: style-guide, seo-rules-engine, virality-triggers, quality-gate.
These references are injected via --append-system-prompt-file. Do NOT read them with the Read tool.
HEADER

append_ref "$SCORE" "$REFS_DIR/style-guide.md"
append_ref "$SCORE" "$REFS_DIR/seo-rules-engine.md"
append_ref "$SCORE" "$REFS_DIR/virality-triggers.md"
append_ref "$SCORE" "$REFS_DIR/quality-gate.md"

# Report sizes
echo "Compiled reference files:"
for f in "$PREP" "$WRITE" "$SCORE"; do
  size=$(wc -c < "$f")
  echo "  $(basename "$f"): $size bytes"
done
echo "Done."
