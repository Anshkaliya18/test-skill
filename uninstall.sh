#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-all}"
SKILLS=(resume-make resume-update resume-suggest)

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

case "$TARGET" in
  claude)
    uninstall_from "Claude Code" "$HOME/.claude/skills"
    ;;
  codex|agents)
    uninstall_from "Codex/agents" "$HOME/.agents/skills"
    ;;
  all)
    uninstall_from "Claude Code" "$HOME/.claude/skills"
    uninstall_from "Codex/agents" "$HOME/.agents/skills"
    ;;
  *)
    echo "Usage: $0 [claude|codex|agents|all]" >&2
    exit 1
    ;;
esac

echo "Done."