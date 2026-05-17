#!/usr/bin/env bash
# render-panels.sh — bulk-render storyboard panels via multiple free backends.
#
# Usage:
#   tools/render-panels.sh <prompts.tsv> [backend] [width] [height]
#
# Backends (try in this order; first one that works wins):
#   horde       — Stable Horde (free, anonymous, ~30-90s queue, no auth)
#   pollinations — Pollinations.ai (often blocked, fallback only)
#   a1111       — local Automatic1111 at http://localhost:7860
#   forge       — local Stable Diffusion WebUI Forge at http://localhost:7860
#   auto        — try horde -> a1111 -> pollinations (default)
#
# Input TSV (tab-separated, one panel per row):
#   panel_id<TAB>prompt<TAB>seed
#
# Output:
#   <dir-of-tsv>/panels/panel-NN.jpg
#
# No API keys required by default. For Stable Horde, an anonymous account
# (apikey "0000000000") works but is slow. Set HORDE_APIKEY to use a real
# account (faster).

set -euo pipefail

PROMPTS_FILE="${1:-}"
BACKEND="${2:-auto}"
WIDTH="${3:-1024}"
HEIGHT="${4:-576}"

if [[ -z "$PROMPTS_FILE" || ! -f "$PROMPTS_FILE" ]]; then
  cat >&2 <<EOF
Usage: $0 <prompts.tsv> [backend] [width] [height]

Backends:
  auto         — try horde, then a1111, then pollinations (default)
  horde        — Stable Horde (free, anonymous)
  pollinations — pollinations.ai (often blocked)
  a1111        — local Automatic1111 at http://localhost:7860

Example:
  $0 output/negaareh/pardeye-akhar/prompts.tsv horde 1024 576
EOF
  exit 1
fi

OUT_DIR="$(dirname "$PROMPTS_FILE")/panels"
mkdir -p "$OUT_DIR"

HORDE_APIKEY="${HORDE_APIKEY:-0000000000}"
A1111_URL="${A1111_URL:-http://localhost:7860}"

urlencode() {
  local s="$1" i c
  for (( i=0; i<${#s}; i++ )); do
    c="${s:$i:1}"
    case "$c" in
      [a-zA-Z0-9._~-]) printf '%s' "$c" ;;
      *) printf '%%%02X' "'$c" ;;
    esac
  done
}

# ---- Pollinations ----
render_pollinations() {
  local out="$1" prompt="$2" seed="$3"
  local encoded; encoded=$(urlencode "$prompt")
  local url="https://image.pollinations.ai/prompt/${encoded}?width=${WIDTH}&height=${HEIGHT}&model=flux&nologo=true&seed=${seed}&enhance=true"
  if curl -sS -L --max-time 90 -o "$out" "$url"; then
    [[ "$(wc -c < "$out")" -gt 5000 ]] && return 0
    rm -f "$out"
  fi
  return 1
}

# ---- Stable Horde (free anonymous) ----
render_horde() {
  local out="$1" prompt="$2" seed="$3"
  local body
  body=$(jq -n --arg p "$prompt" --argjson w "$WIDTH" --argjson h "$HEIGHT" --argjson s "$seed" '{
    prompt: $p,
    params: { width: $w, height: $h, steps: 28, cfg_scale: 7, sampler_name: "k_euler_a", seed: ($s|tostring), n: 1 },
    nsfw: false, censor_nsfw: true,
    models: ["AlbedoBase XL (SDXL)", "Deliberate", "Anything Diffusion"]
  }')
  local resp; resp=$(curl -sS --max-time 30 -X POST "https://stablehorde.net/api/v2/generate/async" \
    -H "apikey: $HORDE_APIKEY" -H "Client-Agent: negaaregar:1.0:contact@local" \
    -H "Content-Type: application/json" -d "$body") || return 1
  local jobid; jobid=$(echo "$resp" | jq -r '.id // empty')
  [[ -z "$jobid" ]] && { echo "horde submit failed: $resp" >&2; return 1; }

  # Poll up to 5 minutes
  for i in $(seq 1 60); do
    sleep 5
    local check; check=$(curl -sS --max-time 15 "https://stablehorde.net/api/v2/generate/check/$jobid") || continue
    local done; done=$(echo "$check" | jq -r '.done // false')
    local qp; qp=$(echo "$check" | jq -r '.queue_position // -1')
    printf '\r    horde queue: %s (poll %d/60) ' "$qp" "$i" >&2
    if [[ "$done" == "true" ]]; then
      printf '\r' >&2
      local status; status=$(curl -sS --max-time 30 "https://stablehorde.net/api/v2/generate/status/$jobid")
      local img_url; img_url=$(echo "$status" | jq -r '.generations[0].img // empty')
      [[ -z "$img_url" ]] && return 1
      curl -sS -L --max-time 60 -o "$out" "$img_url" || return 1
      [[ "$(wc -c < "$out")" -gt 5000 ]] && return 0
      rm -f "$out"; return 1
    fi
  done
  printf '\r' >&2
  return 1
}

# ---- Local Automatic1111 ----
render_a1111() {
  local out="$1" prompt="$2" seed="$3"
  local body
  body=$(jq -n --arg p "$prompt" --argjson w "$WIDTH" --argjson h "$HEIGHT" --argjson s "$seed" '{
    prompt: $p, width: $w, height: $h, seed: $s, steps: 28, cfg_scale: 7,
    sampler_name: "Euler a", negative_prompt: "low quality, blurry, watermark, text, signature, distorted faces, extra limbs"
  }')
  local resp; resp=$(curl -sS --max-time 180 -X POST "$A1111_URL/sdapi/v1/txt2img" \
    -H "Content-Type: application/json" -d "$body") || return 1
  local b64; b64=$(echo "$resp" | jq -r '.images[0] // empty')
  [[ -z "$b64" ]] && return 1
  echo "$b64" | base64 -d > "$out" || return 1
  [[ "$(wc -c < "$out")" -gt 5000 ]] && return 0
  rm -f "$out"; return 1
}

# ---- Dispatcher ----
render_panel() {
  local out="$1" prompt="$2" seed="$3"
  case "$BACKEND" in
    pollinations) render_pollinations "$out" "$prompt" "$seed" ;;
    horde)        render_horde "$out" "$prompt" "$seed" ;;
    a1111|forge)  render_a1111 "$out" "$prompt" "$seed" ;;
    auto)
      render_horde "$out" "$prompt" "$seed" && return 0
      render_a1111 "$out" "$prompt" "$seed" && return 0
      render_pollinations "$out" "$prompt" "$seed" && return 0
      return 1 ;;
    *) echo "Unknown backend: $BACKEND" >&2; return 2 ;;
  esac
}

# ---- Dependencies ----
command -v jq >/dev/null || { echo "ERROR: jq is required. Install: apt install jq / brew install jq" >&2; exit 1; }
command -v curl >/dev/null || { echo "ERROR: curl is required." >&2; exit 1; }

# ---- Main loop ----
echo "Rendering with backend: $BACKEND  (output: $OUT_DIR)"
total=$(grep -cv '^[#[:space:]]*$' "$PROMPTS_FILE" || true)
i=0
fails=0

while IFS=$'\t' read -r id prompt seed; do
  [[ -z "${id:-}" || "${id:0:1}" == "#" ]] && continue
  i=$((i+1))
  out="$OUT_DIR/panel-${id}.jpg"
  if [[ -f "$out" && -s "$out" ]]; then
    printf '[%d/%d] panel-%s already exists — skipping\n' "$i" "$total" "$id"
    continue
  fi
  printf '[%d/%d] panel-%s ... ' "$i" "$total" "$id"
  if render_panel "$out" "$prompt" "${seed:-42}"; then
    printf 'OK (%s KB)\n' "$(($(wc -c < "$out")/1024))"
  else
    printf 'FAILED\n'
    fails=$((fails+1))
  fi
done < "$PROMPTS_FILE"

echo
echo "Done. Output: $OUT_DIR"
[[ "$fails" -gt 0 ]] && echo "Failures: $fails — re-run to retry; existing files are skipped."
exit 0
