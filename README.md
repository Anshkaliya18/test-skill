# Resume Skills (Universal Installer)

Beginner-friendly resume skills for **Claude Code**, **Codex/agents**, **Codex CLI**, **OpenCode**, **Kilo**, **Qwen**, and compatible agents.

## Install

### npm package (recommended for projects)
Install the package in your project, then run the installer explicitly (no automatic postinstall):

```bash
npm install @anshkaliya/resume-skills
node node_modules/@anshkaliya/resume-skills/scripts/install-skills.js
```

- Default: installs skills into the **current project** (`./.claude/skills`, `./.agents/skills`, `./.codex/skills`, `./.opencode/skills`, `./.kilo/skills`, `./.qwen/skills`)
- Global (user home): `node node_modules/@anshkaliya/resume-skills/scripts/install-skills.js --global`

### Direct (one-line, no npm needed)
**Windows (PowerShell 5.1+)**
```powershell
iwr -UseBasicParsing https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.ps1 -OutFile $env:TEMP\resume-skills.ps1; & $env:TEMP\resume-skills.ps1 -Target all
```

**macOS / Linux**
```bash
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.sh | bash -s -- all
```

### npx skills (via skills.sh registry)
```bash
npx skills add AnshKaliya18/test-skill
```

## Uninstall (global/direct installer targets)

**Windows (PowerShell 5.1+)**
```powershell
iwr -UseBasicParsing https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/uninstall.ps1 -OutFile $env:TEMP\resume-skills-uninstall.ps1; & $env:TEMP\resume-skills-uninstall.ps1 -Target all
```

**macOS / Linux**
```bash
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/uninstall.sh | bash -s -- all
```

## Skills

| Skill | What it does |
|---|---|
| `resume-make` | Create a new `resume.md` from scratch |
| `resume-update` | Update an existing `resume.md` |
| `resume-suggest` | Suggest improvements for `resume.md` |

## Repo Structure

```text
test-skill/
├── skills/                 # source of truth
│   ├── resume-make/SKILL.md
│   ├── resume-update/SKILL.md
│   └── resume-suggest/SKILL.md
├── scripts/
│   └── install-skills.js   # explicit installer (project by default, --global optional)
├── install.ps1             # direct global/custom installer
├── install.sh
├── uninstall.ps1
├── uninstall.sh
├── package.json
└── README.md
```

## Notes
- npm installs do **not** run postinstall automatically (no extra install-script permission/approval required).
- Direct `install.ps1`/`install.sh` scripts install to global agent directories by default (or a custom dir via `-Dir` / 2nd arg).
- OpenCode also reads `.claude/skills/` and `.agents/skills/` as compat paths.
- If your agent uses a different path, copy from `skills/<name>/SKILL.md`.

Repo: https://github.com/AnshKaliya18/test-skill
Package: `npm install @anshkaliya/resume-skills`