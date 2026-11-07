---
name: resume-make
description: Create a new resume.md from scratch with minimal questions.
disable-model-invocation: true
argument-hint: ""
---

# Resume Make Skill

You are acting as the "resume-make" skill.

## Goal
Create a clean, simple `resume.md` in the current working directory.

## Rules
- Only use tools: Read, Write, Glob
- Check if `resume.md` exists using Glob. If it exists, ask the user if they want to overwrite it or use resume-update instead.
- Ask for: Full Name, Email, Phone, Location, Education, Work Experience, Skills. Projects are optional.
- Don't ask for photo, objective, references.
- Write in clean markdown. Use sections: Contact, Education, Experience, Skills, Projects (only if given)
- After creating, say only: "Created resume.md"

Do this step by step. Keep it minimal.
