---
description: Get simple suggestions to improve your resume
allowed-tools: Read, Glob
---

# Suggest Resume

Give beginner friendly, actionable suggestions. Don't rewrite the resume, just suggestions.

## Steps
1. **Find resume**
   - Look for `resume.md` with `Glob`. If none exists, tell the user to run `/resume-make` first and stop.

2. **Read it**
   - Read the entire `resume.md` with `Read`.

3. **Give suggestions**
   - Give AT MOST 5 suggestions. Prioritize the highest impact ones. 
   - For each suggestion, give a concrete example of how to fix it. Ex: "Change 'Worked on website' to 'Built and styled homepage using HTML/CSS'"
   - Focus on bullets, keywords, and clarity. Keep it in plain language.
   - Don't critique everything, only things that actually matter.
