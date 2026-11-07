#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-all}"
DIR_OVERRIDE="${2:-}"
REPO_BASE="https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/skills"
SKILLS=(resume-make resume-update resume-suggest)

get_target_path() {
  case "$1" in
    claude) echo "$HOME/.claude/skills" ;;
    codex|agents) echo "$HOME/.agents/skills" ;;
    codexcli)
      if [ -n "${CODEX_HOME:-}" ]; then echo "$CODEX_HOME/skills"; else echo "$HOME/.codex/skills"; fi
      ;;
    *) return 1 ;;
  esac
}

install_to() {
  local name="$1"
  local base_dir="$2"
  echo "Installing resume skills for $name -> $base_dir"
  mkdir -p "$base_dir"
  for skill in "${SKILLS[@]}"; do
    mkdir -p "$base_dir/$skill"
    if ! curl -fsSL "$REPO_BASE/$skill/SKILL.md" -o "$base_dir/$skill/SKILL.md"; then
      echo "Failed to install $skill from $REPO_BASE/$skill/SKILL.md" >&2
      exit 1
    fi
    echo "  - Installed $skill"
  done
}

if [ -n "$DIR_OVERRIDE" ]; then
  install_to "Custom" "$DIR_OVERRIDE"
  echo "Done."
  exit 0
fi

case "$TARGET" in
  claude) install_to "Claude Code" "$(get_target_path claude)" ;;
  codex|agents) install_to "Codex/agents" "$(get_target_path codex)" ;;
  codexcli) install_to "Codex CLI" "$(get_target_path codexcli)" ;;
  all)
    install_to "Claude Code" "$(get_target_path claude)"
    install_to "Codex/agents" "$(get_target_path codex)"
    install_to "Codex CLI" "$(get_target_path codexcli)"
    ;;
  -h|--help)
    echo "Usage: $0 [claude|codex|agents|codexcli|all] [custom_dir]" >&2
    exit 0
    ;;
  *)
    echo "Usage: $0 [claude|codex|agents|codexcli|all] [custom_dir]" >&2
    exit 1
    ;;
esac

echo "Done."