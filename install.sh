#!/usr/bin/env bash
set -e

TARGET_DIR="$HOME/.claude/commands"
REPO_BASE="https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/commands"

echo "Installing Claude Code resume commands to $TARGET_DIR..."
mkdir -p "$TARGET_DIR"

for cmd in resume-make.md resume-update.md resume-suggest.md; do
  curl -fsSL "$REPO_BASE/$cmd" -o "$TARGET_DIR/$cmd"
  echo "  - Installed $cmd"
done

echo "Done! You can now use /resume-make, /resume-update, and /resume-suggest in Claude Code."
