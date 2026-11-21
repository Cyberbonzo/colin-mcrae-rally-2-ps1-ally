#!/usr/bin/env bash
set -uo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
export DISPLAY="${DISPLAY:-:0}"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
unset LD_PRELOAD
exec 9>"$ROOT/.cmr2.lock"
flock -n 9 || { printf 'Colin McRae Rally 2.0 ja esta aberto.\n'; exit 1; }
SESSION="$ROOT/logs/session-$(date +%Y%m%d-%H%M%S)-$$"
mkdir -p "$SESSION"
args=()
for arg in "$@"; do [ -n "$arg" ] && args+=("$arg"); done
if [ "${#args[@]}" -eq 0 ]; then args=(--no-launcher); fi
cd "$ROOT/build-release"
"$ROOT/build-release/Colin_McRae_Rally_2_0_Recompiled" \
 --game "$ROOT/game.toml" --bios "$ROOT/bios/SCPH1001.bin" \
 --disc "$ROOT/input-disc/Colin McRae Rally 2.0 (USA) (En,Fr,Es).cue" \
 --memcard-dir "$ROOT/saves" --renderer opengl --debug-port 32972 \
 "${args[@]}" >"$SESSION/console.log" 2>&1
rc=$?
printf '%s\n' "$rc" >"$SESSION/exit-code.txt"
exit "$rc"
