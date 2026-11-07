# Resume Skills (Universal Installer)

Beginner-friendly resume skills for **Claude Code**, **Codex/agents**, and **Codex CLI**. Same `SKILL.md` files, installed to the right global skills directory.

## One-line install (all three: Claude + Codex/agents + Codex CLI)

**Windows (PowerShell 5.1+)**
```powershell
iwr -UseBasicParsing https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.ps1 -OutFile $env:TEMP\resume-skills.ps1; & $env:TEMP\resume-skills.ps1 -Target all
```

**macOS / Linux**
```bash
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.sh | bash -s -- all
```

## One-line uninstall (all three)

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
| `all` (default) | Installs/uninstalls **all three** above |
| custom dir | `-Dir <path>` (PS1) or 2nd arg (bash) |

## Examples

```powershell
# Specific targets
& $env:TEMP\resume-skills.ps1 -Target claude
& $env:TEMP\resume-skills.ps1 -Target codex
& $env:TEMP\resume-skills.ps1 -Target codexcli

# Custom path
& $env:TEMP\resume-skills.ps1 -Dir "$env:USERPROFILE\.my-tool\skills"
```

```bash
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.sh | bash -s -- claude
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.sh | bash -s -- codex
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.sh | bash -s -- codexcli
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
                               └────►  ~/.codex/skills/<name>/SKILL.md (or $CODEX_HOME/skills)
```

- Installers download from `main/skills/*/SKILL.md` and copy to global dirs; no repo folder needed for Codex CLI.
- `skills/` is the distributable source of truth. `.claude/skills/` in this repo is for local testing.

Repo: https://github.com/AnshKaliya18/test-skill