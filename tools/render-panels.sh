#!/usr/bin/env bash
# render-panels.sh — bulk-render storyboard panels via Pollinations.ai (free, no API key).
#
# Usage:
#   tools/render-panels.sh output/negaareh/<slug>/prompts.tsv [width] [height] [model]
#
# Input TSV (one panel per row, tab-separated):
#   panel_id<TAB>prompt<TAB>seed
#
# Example:
#   01  A 65-year-old Iranian woman in black chador crosses a sunlit Safavid courtyard...  4271
#
# Output:
#   output/negaareh/<slug>/panels/panel-01.jpg   (one image per panel)
#
# Why this exists:
#   The HTML contact sheet fetches images on-demand via <img src=pollinations-url>.
#   That works for viewing but is slow for portable sharing. This script downloads
#   all panels as JPG files you can zip, email, drop into Keynote, etc.

set -euo pipefail

PROMPTS_FILE="${1:-}"
WIDTH="${2:-1024}"
HEIGHT="${3:-576}"
MODEL="${4:-flux}"

if [[ -z "$PROMPTS_FILE" || ! -f "$PROMPTS_FILE" ]]; then
  echo "Usage: $0 <prompts.tsv> [width] [height] [model]" >&2
  echo "  Example: $0 output/negaareh/pardeye-akhar/prompts.tsv 1024 576 flux" >&2
  exit 1
fi

OUT_DIR="$(dirname "$PROMPTS_FILE")/panels"
mkdir -p "$OUT_DIR"

urlencode() {
  # Pure-bash URL encoding (no external deps).
  local s="$1" i c
  for (( i=0; i<${#s}; i++ )); do
    c="${s:$i:1}"
    case "$c" in
      [a-zA-Z0-9._~-]) printf '%s' "$c" ;;
      *) printf '%%%02X' "'$c" ;;
    esac
  done
}

total=$(grep -c '^[^#]' "$PROMPTS_FILE" || true)
i=0
fails=0

while IFS=$'\t' read -r id prompt seed; do
  # Skip empty/comment lines.
  [[ -z "$id" || "${id:0:1}" == "#" ]] && continue
  i=$((i+1))

  out="$OUT_DIR/panel-${id}.jpg"
  if [[ -f "$out" && -s "$out" ]]; then
    printf '[%d/%d] panel-%s.jpg already exists — skipping\n' "$i" "$total" "$id"
    continue
  fi

  encoded=$(urlencode "$prompt")
  seed="${seed:-42}"
  url="https://image.pollinations.ai/prompt/${encoded}?width=${WIDTH}&height=${HEIGHT}&model=${MODEL}&nologo=true&seed=${seed}&enhance=true"

  printf '[%d/%d] rendering panel-%s.jpg … ' "$i" "$total" "$id"
  if curl -sS -L --max-time 60 -o "$out" "$url"; then
    bytes=$(wc -c < "$out")
    if [[ "$bytes" -lt 5000 ]]; then
      printf 'FAILED (got %s bytes — likely an error response)\n' "$bytes"
      rm -f "$out"
      fails=$((fails+1))
    else
      printf 'OK (%s KB)\n' "$((bytes/1024))"
    fi
  else
    printf 'FAILED (network)\n'
    fails=$((fails+1))
  fi

  # Be polite to the free API.
  sleep 1
done < "$PROMPTS_FILE"

echo
echo "Done. Rendered into $OUT_DIR"
[[ "$fails" -gt 0 ]] && echo "Failures: $fails — re-run to retry; existing files are skipped."
