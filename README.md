# Claude Resume Skills (Test)

Beginner-friendly resume skills for Claude Code, packaged like small skills (HackathonOS-style structure, simplified). This repo is for learning how Claude skills work.

## Skills

| Skill | What it does |
|---|---|
| `resume-make` | Create a new `resume.md` from scratch |
| `resume-update` | Update an existing `resume.md` |
| `resume-suggest` | Suggest improvements for `resume.md` |

## Install (one command, global)

Installs to `~/.claude/skills/` (or `%USERPROFILE%\.claude\skills\`) so Claude Code can load them globally.

### macOS / Linux
```bash
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.sh | bash
```

### Windows (PowerShell 5.1+)
```powershell
iwr -UseBasicParsing https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.ps1 -OutFile $env:TEMP\resume-skill-install.ps1; & $env:TEMP\resume-skill-install.ps1
```
> Avoids the PS5.1 BOM issue with `irm | iex`.

## Uninstall

### macOS / Linux
```bash
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/uninstall.sh | bash
```

### Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/uninstall.ps1 | iex
```

## Usage

After install, open Claude Code in any project and ask to use the skill, e.g.:
- "Use the resume-make skill to create my resume"
- "Use resume-update skill to add my new job"
- "Use resume-suggest skill to review my resume"

(Invocation behavior depends on Claude Code version and `disable-model-invocation` in each `SKILL.md`.)

## Repo structure

```text
test-skill/
├── skills/                 # distributable skills (what installers download)
│   ├── resume-make/SKILL.md
│   ├── resume-update/SKILL.md
│   └── resume-suggest/SKILL.md
├── .claude/skills/         # local project copy (for testing in this repo)
├── commands/               # earlier slash-command experiment (optional)
├── install.sh
├── install.ps1
├── uninstall.sh
├── uninstall.ps1
└── README.md
```

## Publish to GitHub (full steps)

1. Ensure repo is public and on `main` branch:
   ```bash
   git branch --show-current   # should be main
   ```
2. Stage everything (skills + installers + README):
   ```bash
   git add skills/ install.sh install.ps1 uninstall.sh uninstall.ps1 README.md .claude/skills/
   ```
3. Commit:
   ```bash
   git commit -m "Publish resume skills with global installers"
   ```
4. Push:
   ```bash
   git push origin main
   ```
5. Verify raw URLs load (no 404):
   - `https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.ps1`
   - `https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/skills/resume-make/SKILL.md`

After that, anyone can install globally with the one-liner above.
