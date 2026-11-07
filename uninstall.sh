#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-all}"
DIR_OVERRIDE="${2:-}"
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

uninstall_from() {
  local name="$1"
  local base_dir="$2"
  echo "Uninstalling resume skills for $name from $base_dir"
  for skill in "${SKILLS[@]}"; do
    if [ -d "$base_dir/$skill" ]; then
      rm -rf "$base_dir/$skill"
      echo "  - Removed $skill"
    else
      echo "  - Skipped $skill (not found)"
    fi
  done
}

if [ -n "$DIR_OVERRIDE" ]; then
  uninstall_from "Custom" "$DIR_OVERRIDE"
  echo "Done."
  exit 0
fi

case "$TARGET" in
  claude) uninstall_from "Claude Code" "$(get_target_path claude)" ;;
  codex|agents) uninstall_from "Codex/agents" "$(get_target_path codex)" ;;
  codexcli) uninstall_from "Codex CLI" "$(get_target_path codexcli)" ;;
  all)
    uninstall_from "Claude Code" "$(get_target_path claude)"
    uninstall_from "Codex/agents" "$(get_target_path codex)"
    uninstall_from "Codex CLI" "$(get_target_path codexcli)"
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