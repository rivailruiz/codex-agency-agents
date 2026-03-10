#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MODE="copy"
TARGET_DIR="$(pwd)"
DEST_REL=".codex/agency-agents"
FORCE=0
BOOTSTRAP_AGENTS=0
INSTALL_GLOBAL_SKILLS=0
CODEX_HOME_DIR="${CODEX_HOME:-$HOME/.codex}"

print_help() {
  cat <<'HELP'
Usage: ./scripts/install.sh [options]

Install this Codex agency kit into another project.

Options:
  --target <path>            Target project directory (default: current dir)
  --dest <relative-path>     Destination inside target (default: .codex/agency-agents)
  --mode <copy|symlink>      Install mode (default: copy)
  --bootstrap-agents         Add/append a pointer block in target AGENTS.md
  --install-global-skills    Copy skills to $CODEX_HOME/skills with codex-agency- prefix
  --force                    Backup existing destination and replace
  -h, --help                 Show this help

Examples:
  ./scripts/install.sh --target /path/to/project
  ./scripts/install.sh --target /path/to/project --mode symlink --bootstrap-agents
  ./scripts/install.sh --target /path/to/project --install-global-skills
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

backup_if_exists() {
  local path="$1"
  if [[ -e "$path" ]]; then
    if [[ "$FORCE" -ne 1 ]]; then
      echo "ERROR: destination already exists: $path"
      echo "Use --force to replace (existing path will be backed up)."
      exit 1
    fi
    local backup="${path}.bak.$(date +%Y%m%d%H%M%S)"
    mv "$path" "$backup"
    echo "Backed up existing path to: $backup"
  fi
}

append_agents_block() {
  local agents_file="$1"
  local marker_start="<!-- codex-agency-agents:start -->"
  local marker_end="<!-- codex-agency-agents:end -->"

  local block
  block=$(cat <<BLOCK
$marker_start
## Codex Agency Agents (Installed)

Use the installed multi-agent kit at "$DEST_REL".

Primary docs:
- $DEST_REL/AGENTS.md
- $DEST_REL/agents/
- $DEST_REL/skills/
- $DEST_REL/playbooks/handoff-standard.md
- $DEST_REL/playbooks/final-review-flow.md
$marker_end
BLOCK
)

  if [[ ! -f "$agents_file" ]]; then
    cat > "$agents_file" <<NEWFILE
# Project AGENTS

$block
NEWFILE
    echo "Created: $agents_file"
    return
  fi

  if grep -q "$marker_start" "$agents_file"; then
    echo "AGENTS.md already contains codex-agency block. Skipping append."
    return
  fi

  {
    printf "\n\n%s\n" "$block"
  } >> "$agents_file"
  echo "Appended codex-agency block to: $agents_file"
}

install_project_files_copy() {
  local dest="$1"
  mkdir -p "$dest"

  cp "$ROOT_DIR/AGENTS.md" "$dest/AGENTS.md"
  cp -R "$ROOT_DIR/agents" "$dest/agents"
  cp -R "$ROOT_DIR/skills" "$dest/skills"
  cp -R "$ROOT_DIR/playbooks" "$dest/playbooks"
  cp -R "$ROOT_DIR/examples" "$dest/examples"

  echo "Installed (copy mode) to: $dest"
}

install_project_files_symlink() {
  local dest="$1"
  mkdir -p "$dest"

  ln -s "$ROOT_DIR/AGENTS.md" "$dest/AGENTS.md"
  ln -s "$ROOT_DIR/agents" "$dest/agents"
  ln -s "$ROOT_DIR/skills" "$dest/skills"
  ln -s "$ROOT_DIR/playbooks" "$dest/playbooks"
  ln -s "$ROOT_DIR/examples" "$dest/examples"

  echo "Installed (symlink mode) to: $dest"
}

install_global_skills() {
  local skills_target="$CODEX_HOME_DIR/skills"
  mkdir -p "$skills_target"

  local skill_dir
  for skill_dir in "$ROOT_DIR"/skills/*; do
    [[ -d "$skill_dir" ]] || continue
    local skill_name
    skill_name="$(basename "$skill_dir")"
    local out_dir="$skills_target/codex-agency-$skill_name"

    if [[ -e "$out_dir" ]]; then
      if [[ "$FORCE" -ne 1 ]]; then
        echo "Skipping existing global skill: $out_dir (use --force to replace)"
        continue
      fi
      local backup="${out_dir}.bak.$(date +%Y%m%d%H%M%S)"
      mv "$out_dir" "$backup"
      echo "Backed up existing global skill to: $backup"
    fi

    cp -R "$skill_dir" "$out_dir"
    echo "Installed global skill: $out_dir"
  done
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
    --mode)
      MODE="$2"
      shift 2
      ;;
    --bootstrap-agents)
      BOOTSTRAP_AGENTS=1
      shift
      ;;
    --install-global-skills)
      INSTALL_GLOBAL_SKILLS=1
      shift
      ;;
    --force)
      FORCE=1
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

if [[ "$MODE" != "copy" && "$MODE" != "symlink" ]]; then
  echo "ERROR: --mode must be copy or symlink"
  exit 1
fi

TARGET_DIR="$(abs_path "$TARGET_DIR")"
if [[ ! -d "$TARGET_DIR" ]]; then
  echo "ERROR: target directory does not exist: $TARGET_DIR"
  exit 1
fi

DEST_ABS="$TARGET_DIR/$DEST_REL"
backup_if_exists "$DEST_ABS"

if [[ "$MODE" == "copy" ]]; then
  install_project_files_copy "$DEST_ABS"
else
  install_project_files_symlink "$DEST_ABS"
fi

if [[ "$BOOTSTRAP_AGENTS" -eq 1 ]]; then
  append_agents_block "$TARGET_DIR/AGENTS.md"
fi

if [[ "$INSTALL_GLOBAL_SKILLS" -eq 1 ]]; then
  install_global_skills
fi

echo
printf 'Done.\n- Target: %s\n- Installed kit: %s\n- Mode: %s\n' "$TARGET_DIR" "$DEST_ABS" "$MODE"
