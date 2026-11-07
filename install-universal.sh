#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-all}"
REPO_BASE="https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/skills"
SKILLS=(resume-make resume-update resume-suggest)

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

case "$TARGET" in
  claude)
    install_to "Claude Code" "$HOME/.claude/skills"
    ;;
  codex|agents)
    install_to "Codex/agents" "$HOME/.agents/skills"
    ;;
  all)
    install_to "Claude Code" "$HOME/.claude/skills"
    install_to "Codex/agents" "$HOME/.agents/skills"
    ;;
  *)
    echo "Usage: $0 [claude|codex|agents|all]" >&2
    exit 1
    ;;
esac

echo "Done."