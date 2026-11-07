#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="C:\Users\anshk/.claude/skills"
REPO_BASE="https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/skills"

echo "Installing Claude Code resume skills to ..."
mkdir -p ""

for skill in resume-make resume-update resume-suggest; do
  mkdir -p "/"
  if ! curl -fsSL "//SKILL.md" -o "//SKILL.md"; then
    echo "Failed to install  from //SKILL.md" >&2
    exit 1
  fi
  echo "  - Installed "
done

echo "Done! Resume skills installed globally."