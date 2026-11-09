# Resume Skills (Universal Installer)

Beginner-friendly resume skills for **Claude Code**, **Codex/agents**, **Codex CLI**, **OpenCode**, **Kilo**, **Qwen**, and compatible agents. Same `SKILL.md` files, installed to the right global skills directory.

## One-line install (all agents)

**Windows (PowerShell 5.1+)**
```powershell
iwr -UseBasicParsing https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.ps1 -OutFile $env:TEMP\resume-skills.ps1; & $env:TEMP\resume-skills.ps1 -Target all
```

**macOS / Linux**
```bash
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.sh | bash -s -- all
```

## One-line uninstall (all agents)

**Windows (PowerShell 5.1+)**
```powershell
iwr -UseBasicParsing https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/uninstall.ps1 -OutFile $env:TEMP\resume-skills-uninstall.ps1; & $env:TEMP\resume-skills-uninstall.ps1 -Target all
```

**macOS / Linux**
```bash
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/uninstall.sh | bash -s -- all
```

## Targets

| Target | Installs to |
|---|---|
| `claude` | `~/.claude/skills/` (Win: `%USERPROFILE%\.claude\skills\`) |
| `codex` / `agents` | `~/.agents/skills/` (Win: `%USERPROFILE%\.agents\skills\`) |
| `codexcli` | `$CODEX_HOME/skills` or `~/.codex/skills/` (Win: `%CODEX_HOME%\skills` or `%USERPROFILE%\.codex\skills\`) |
| `opencode` | `~/.config/opencode/skills/` (Win: `%APPDATA%\opencode\skills\`) |
| `kilo` | `~/.config/kilo/skills/` (Win: `%USERPROFILE%\.config\kilo\skills\`) |
| `qwen` | `~/.qwen/skills/` (Win: `%USERPROFILE%\.qwen\skills\`) |
| `all` (default) | Installs/uninstalls **all six** above |
| custom dir | `-Dir <path>` (PS1) or 2nd arg (bash) |

## Examples

```powershell
# Specific targets
& $env:TEMP\resume-skills.ps1 -Target claude
& $env:TEMP\resume-skills.ps1 -Target opencode
& $env:TEMP\resume-skills.ps1 -Target kilo
& $env:TEMP\resume-skills.ps1 -Target qwen

# Custom path (any tool)
& $env:TEMP\resume-skills.ps1 -Dir "$env:USERPROFILE\.my-tool\skills"
```

```bash
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.sh | bash -s -- claude
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.sh | bash -s -- opencode
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.sh | bash -s -- kilo
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.sh | bash -s -- qwen
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.sh | bash -s -- claude "$HOME/.my-tool/skills"
```

## Skills

| Skill | What it does |
|---|---|
| `resume-make` | Create a new `resume.md` from scratch |
| `resume-update` | Update an existing `resume.md` |
| `resume-suggest` | Suggest improvements for `resume.md` |

## Architecture

```text
Repo (GitHub, source of truth)        Global install targets (-Target all)
skills/<name>/SKILL.md  ───────────►  ~/.claude/skills/<name>/SKILL.md
                               ├────►  ~/.agents/skills/<name>/SKILL.md
                               ├────►  ~/.codex/skills/<name>/SKILL.md
                               ├────►  ~/.config/opencode/skills/<name>/SKILL.md
                               ├────►  ~/.config/kilo/skills/<name>/SKILL.md
                               └────►  ~/.qwen/skills/<name>/SKILL.md
```

- Installers download from `main/skills/*/SKILL.md` and copy to global dirs.
- `skills/` is the distributable source of truth. `.claude/skills/` and `.agents/skills/` in this repo are for local testing.

## Project-local testing (optional)

Add project-local skill dirs if you want agents to auto-discover skills when opening this repo:

```bash
# OpenCode
mkdir -p .opencode/skills
cp -r skills/resume-* .opencode/skills/

# Kilo
mkdir -p .kilo/skills
cp -r skills/resume-* .kilo/skills/

# Qwen
mkdir -p .qwen/skills
cp -r skills/resume-* .qwen/skills/
```

## Notes
- PS1 scripts are ASCII/no-BOM and use `-UseBasicParsing` for PowerShell 5.1.
- OpenCode also reads `.claude/skills/` and `.agents/skills/` as compat paths.
- If your agent uses a different path, use `-Dir` / custom dir argument.

Repo: https://github.com/AnshKaliya18/test-skill