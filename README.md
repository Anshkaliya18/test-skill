# Resume Skills (Universal Installer)

Beginner-friendly resume skills for **Claude Code**, **Codex/agents**, **Codex CLI**, **OpenCode**, **Kilo**, **Qwen**, and compatible agents. Same `SKILL.md` files, installed to the right global skills directory.

## Install Methods

### 1. Direct (one-line, no npm needed)
**Windows (PowerShell 5.1+)**
```powershell
iwr -UseBasicParsing https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.ps1 -OutFile $env:TEMP\resume-skills.ps1; & $env:TEMP\resume-skills.ps1 -Target all
```

**macOS / Linux**
```bash
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.sh | bash -s -- all
```

### 2. npm package (global install)
```bash
npm i -g @anshkaliya18/resume-skills
```
Runs postinstall script to install skills to all agent global directories.

### 3. npx skills (via skills.sh registry)
```bash
npx skills add AnshKaliya18/test-skill
```
Installs via skills.sh registry to compatible agent directories.

## Uninstall (all agents)

**Windows (PowerShell 5.1+)**
```powershell
iwr -UseBasicParsing https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/uninstall.ps1 -OutFile $env:TEMP\resume-skills-uninstall.ps1; & $env:TEMP\resume-skills-uninstall.ps1 -Target all
```

**macOS / Linux**
```bash
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/uninstall.sh | bash -s -- all
```

## Targets (for direct installer)

| Target | Installs to |
|---|---|
| `claude` | `~/.claude/skills/` (Win: `%USERPROFILE%\.claude\skills\`) |
| `codex` / `agents` | `~/.agents/skills/` (Win: `%USERPROFILE%\.agents\skills\`) |
| `codexcli` | `$CODEX_HOME/skills` or `~/.codex/skills/` (Win: `%CODEX_HOME%\skills` or `%USERPROFILE%\.codex\skills\`) |
| `opencode` | `~/.config/opencode/skills/` (Win: `%APPDATA%\opencode\skills\`) |
| `kilo` | `~/.config/kilo/skills/` (Win: `%USERPROFILE%\.config\kilo\skills\`) |
| `qwen` | `~/.qwen/skills/` (Win: `%USERPROFILE%\.qwen\skills\`) |
| `all` (default) | **All six above** |
| custom dir | `-Dir <path>` (PS1) or 2nd arg (bash) |

## Skills

| Skill | What it does |
|---|---|
| `resume-make` | Create a new `resume.md` from scratch |
| `resume-update` | Update an existing `resume.md` |
| `resume-suggest` | Suggest improvements for `resume.md` |

## Architecture

```text
Repo (GitHub, source of truth)        Global install targets
skills/<name>/SKILL.md  ───────────►  ~/.claude/skills/<name>/SKILL.md
                               ├────►  ~/.agents/skills/<name>/SKILL.md
                               ├────►  ~/.codex/skills/<name>/SKILL.md
                               ├────►  ~/.config/opencode/skills/<name>/SKILL.md
                               ├────►  ~/.config/kilo/skills/<name>/SKILL.md
                               └────►  ~/.qwen/skills/<name>/SKILL.md
```

- Installers download from `main/skills/*/SKILL.md` and copy to global dirs.
- `skills/` is the **only** source of truth in the repo.
- No project-local skill directories needed — global install works everywhere.

## Repo Structure

```text
test-skill/
├── skills/                 # distributable (source of truth)
│   ├── resume-make/SKILL.md
│   ├── resume-update/SKILL.md
│   └── resume-suggest/SKILL.md
├── scripts/
│   └── install-skills.js   # npm postinstall script
├── install.ps1             # universal installer
├── install.sh
├── uninstall.ps1
├── uninstall.sh
├── package.json            # npm package config
└── README.md
```

## Notes
- PS1 scripts are ASCII/no-BOM and use `-UseBasicParsing` for PowerShell 5.1.
- OpenCode also reads `.claude/skills/` and `.agents/skills/` as compat paths.
- If your agent uses a different path, use `-Dir` / custom dir argument.

Repo: https://github.com/AnshKaliya18/test-skill
Package: npm i -g @anshkaliya18/resume-skills (after publish)