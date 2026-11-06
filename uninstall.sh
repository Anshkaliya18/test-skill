#!/usr/bin/env bash
set -e

TARGET_DIR="C:\Users\anshk/.claude/commands"

echo "Uninstalling Claude Code resume commands from ..."

for cmd in resume-make.md resume-update.md resume-suggest.md; do
  if [ -f "/" ]; then
    rm -f "/"
    echo "  - Removed "
  else
    echo "  - Skipped  (not found)"
  fi
done

echo "Done! Resume commands have been uninstalled."
