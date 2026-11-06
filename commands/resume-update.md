---
description: Update an existing resume
allowed-tools: Read, Edit, Glob
---

# Update Resume

Edit an existing resume based off of what the user wants changed. Keep changes minimal and only touch what's asked for. 

## Steps
1. **Find resume**
   - Look for `resume.md` with `Glob`. If none exists, tell the user to run `/resume-make` first and stop.
   
2. **Read it**
   - Read the entire `resume.md` with `Read` so you know the exact current wording. 

3. **Ask what to change**
   - Ask the user: "What do you want to update? (e.g. add a job, fix a bullet, change skills)". Be specific and only change what they say.

4. **Apply the change**
   - Use `Edit` to make the smallest possible change to fit their request. Don't rewrite the whole file unless they explicitly ask for a full rewrite.

5. **Finish**
   - Show what you changed in 1-2 sentences. Don't summarize the entire resume.
