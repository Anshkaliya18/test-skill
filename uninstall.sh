#!/usr/bin/env bash
set -e

TARGET_DIR="C:\Users\anshk/.claude/skills"

echo "Uninstalling Claude Code resume skills from ..."

for skill in resume-make resume-update resume-suggest; do
  if [ -d "/" ]; then
    rm -rf "/"
    echo "  - Removed "
  else
    echo "  - Skipped  (not found)"
  fi
done

echo "Done! Resume skills have been uninstalled."