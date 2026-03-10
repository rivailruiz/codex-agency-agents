#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="$(pwd)"
DEST_REL=".codex/agency-agents"
REMOVE_GLOBAL_SKILLS=0
CODEX_HOME_DIR="${CODEX_HOME:-$HOME/.codex}"

print_help() {
  cat <<'HELP'
Usage: ./scripts/uninstall.sh [options]

Options:
  --target <path>            Target project directory (default: current dir)
  --dest <relative-path>     Installation path inside target (default: .codex/agency-agents)
  --remove-global-skills     Remove global skills prefixed with codex-agency-
  -h, --help                 Show help
HELP
}

abs_path() {
  local input="$1"
  if [[ -d "$input" ]]; then
    (cd "$input" && pwd)
  else
    local parent
    parent="$(cd "$(dirname "$input")" && pwd)"
    echo "$parent/$(basename "$input")"
  fi
}

remove_agents_block() {
  local agents_file="$1"
  local marker_start="<!-- codex-agency-agents:start -->"
  local marker_end="<!-- codex-agency-agents:end -->"

  if [[ ! -f "$agents_file" ]]; then
    return
  fi

  if ! grep -q "$marker_start" "$agents_file"; then
    return
  fi

  local tmp_file
  tmp_file="$(mktemp)"
  awk -v start="$marker_start" -v end="$marker_end" '
    $0 ~ start {skip=1; next}
    $0 ~ end {skip=0; next}
    !skip {print}
  ' "$agents_file" > "$tmp_file"

  mv "$tmp_file" "$agents_file"
  echo "Removed codex-agency block from: $agents_file"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      TARGET_DIR="$2"
      shift 2
      ;;
    --dest)
      DEST_REL="$2"
      shift 2
      ;;
    --remove-global-skills)
      REMOVE_GLOBAL_SKILLS=1
      shift
      ;;
    -h|--help)
      print_help
      exit 0
      ;;
    *)
      echo "Unknown argument: $1"
      print_help
      exit 1
      ;;
  esac
done

TARGET_DIR="$(abs_path "$TARGET_DIR")"
DEST_ABS="$TARGET_DIR/$DEST_REL"

if [[ -e "$DEST_ABS" ]]; then
  rm -rf "$DEST_ABS"
  echo "Removed: $DEST_ABS"
else
  echo "Nothing to remove at: $DEST_ABS"
fi

remove_agents_block "$TARGET_DIR/AGENTS.md"

if [[ "$REMOVE_GLOBAL_SKILLS" -eq 1 ]]; then
  if [[ -d "$CODEX_HOME_DIR/skills" ]]; then
    find "$CODEX_HOME_DIR/skills" -maxdepth 1 -type d -name 'codex-agency-*' -exec rm -rf {} +
    echo "Removed global skills with prefix codex-agency- from: $CODEX_HOME_DIR/skills"
  fi
fi

echo "Done."
