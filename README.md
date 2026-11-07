# Resume Skills (Universal Installer)

Beginner-friendly resume skills for Claude Code and Codex/agents-style clients. Same `SKILL.md` files, installed to the right global skills directory.

## Skills

| Skill | What it does |
|---|---|
| `resume-make` | Create a new `resume.md` from scratch |
| `resume-update` | Update an existing `resume.md` |
| `resume-suggest` | Suggest improvements for `resume.md` |

## Install (universal)

Installs to:
- **Claude Code**: `~/.claude/skills/` (Windows: `%USERPROFILE%\.claude\skills\`)
- **Codex/agents**: `~/.agents/skills/` (Windows: `%USERPROFILE%\.agents\skills\`)

Default target is `all` (installs to both). Targets: `claude`, `codex` (or `agents`), `all`.

### Windows (PowerShell 5.1+)
```powershell
# Install to both
iwr -UseBasicParsing https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.ps1 -OutFile $env:TEMP\resume-skills.ps1; & $env:TEMP\resume-skills.ps1 -Target all
```
Examples:
```powershell
# Claude only
& $env:TEMP\resume-skills.ps1 -Target claude
# Codex/agents only
& $env:TEMP\resume-skills.ps1 -Target codex
```

### macOS / Linux
```bash
# Install to both
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.sh | bash -s -- all
```
Examples:
```bash
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.sh | bash -s -- claude
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.sh | bash -s -- codex
```

## Uninstall

### Windows
```powershell
iwr -UseBasicParsing https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/uninstall.ps1 -OutFile $env:TEMP\resume-skills-uninstall.ps1; & $env:TEMP\resume-skills-uninstall.ps1 -Target all
```

### macOS / Linux
```bash
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/uninstall.sh | bash -s -- all
```

## Usage

After install, ask your agent to use the skill, e.g.:
- "Use the resume-make skill to create my resume"
- "Use resume-update skill to add my new job"
- "Use resume-suggest skill to review my resume"

## Repo structure

```text
test-skill/
├── skills/                 # distributable skills (downloaded by installers)
│   ├── resume-make/SKILL.md
│   ├── resume-update/SKILL.md
│   └── resume-suggest/SKILL.md
├── .claude/skills/         # local project copy (for testing)
├── install.ps1             # universal installer (claude/codex/all)
├── install.sh
├── uninstall.ps1
├── uninstall.sh
└── README.md
```

## Notes
- Windows scripts use `-UseBasicParsing` and are saved without BOM for PowerShell 5.1 compatibility.
- If your Codex client uses a different skills path (e.g. `~/.codex/skills`), change the target mapping in the scripts.
- `.agents/skills/` in this repo (if present) is for local testing only; `skills/` is the source of truth for installs.
- Repo: https://github.com/AnshKaliya18/test-skill