---
description: Create a new resume from scratch
allowed-tools: Read, Write, Glob
---

# Make Resume

Your only job is to make a clean, simple markdown resume. Do this step by step, don't overcomplicate it. 

## Steps
1. **Check for existing resume**
   - Look for `resume.md` in the current directory with `Glob`. 
   - If it exists, ask the user: "There's already a resume.md. Do you want to overwrite it or use /resume-update instead?" Only proceed to overwrite if they explicitly say yes.

2. **Collect info (keep minimal)**
   - Ask for these one by one or all together. Only ask for what they don't give: 
     - Full Name
     - Email
     - Phone
     - Location (City, State/Country)
     - Education (School, Degree, Dates)
     - Work Experience (Job Title, Company, Dates, 2-4 bullets max)
     - Skills (list of them)
     - Projects (optional, name + short description)
   
   Don't ask for fluff like headshots, references, or objective statements.

3. **Generate the resume**
   - Write to `resume.md` in the current directory with a clean structure. Use sections: Contact, Education, Experience, Skills, Projects (only if given).
   - Keep bullets short and action oriented. Use plain markdown with no fancy HTML.
   
4. **Finish**
   - Show a short confirmation: "Created resume.md". Don't explain every line, just confirm.
