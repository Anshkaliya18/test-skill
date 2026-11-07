#!/usr/bin/env bash
set -e

TARGET_DIR="$HOME/.claude/skills"
REPO_BASE="https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/skills"

echo "Installing Claude Code resume skills to $TARGET_DIR..."
mkdir -p "$TARGET_DIR"

for skill in resume-make resume-update resume-suggest; do
  mkdir -p "$TARGET_DIR/$skill"
  curl -fsSL "$REPO_BASE/$skill/SKILL.md" -o "$TARGET_DIR/$skill/SKILL.md"
  echo "  - Installed $skill"
done

echo "Done! Resume skills installed globally. Use them in Claude Code (e.g. ask to use resume-make skill)."
