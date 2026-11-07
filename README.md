# Resume Skills (Universal Installer)

Beginner-friendly resume skills for Claude Code, Codex/agents clients, and Codex CLI-style setups. Same `SKILL.md` files, installed to the right skills directory.

## Skills

| Skill | What it does |
|---|---|
| `resume-make` | Create a new `resume.md` from scratch |
| `resume-update` | Update an existing `resume.md` |
| `resume-suggest` | Suggest improvements for `resume.md` |

## Install

Targets:
- `claude` → `~/.claude/skills/` (Windows: `%USERPROFILE%\.claude\skills\`)
- `codex` / `agents` → `~/.agents/skills/` (Windows: `%USERPROFILE%\.agents\skills\`)
- `codexcli` → `$CODEX_HOME/skills` if set, else `~/.codex/skills/` (Windows: `%CODEX_HOME%\skills` or `%USERPROFILE%\.codex\skills\`)
- `all` (default) → installs to `claude` + `codex/agents` (use `codexcli` explicitly if your CLI reads `~/.codex/skills`)

You can also pass a custom directory as the second arg / `-Dir`.

### Windows (PowerShell 5.1+)
```powershell
# Download installer
iwr -UseBasicParsing https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.ps1 -OutFile $env:TEMP\resume-skills.ps1

# Install to Claude + Codex/agents
& $env:TEMP\resume-skills.ps1 -Target all

# Codex CLI default (~/.codex/skills or $CODEX_HOME/skills)
& $env:TEMP\resume-skills.ps1 -Target codexcli

# Custom path (any tool)
& $env:TEMP\resume-skills.ps1 -Dir "$env:USERPROFILE\.my-tool\skills"
```

### macOS / Linux
```bash
# Claude + Codex/agents
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.sh | bash -s -- all

# Codex CLI (~/.codex/skills or $CODEX_HOME/skills)
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.sh | bash -s -- codexcli

# Custom path
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/install.sh | bash -s -- claude "$HOME/.my-tool/skills"
```

## Uninstall

```powershell
iwr -UseBasicParsing https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/uninstall.ps1 -OutFile $env:TEMP\resume-skills-uninstall.ps1
& $env:TEMP\resume-skills-uninstall.ps1 -Target all
& $env:TEMP\resume-skills-uninstall.ps1 -Target codexcli
```

```bash
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/uninstall.sh | bash -s -- all
curl -fsSL https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/uninstall.sh | bash -s -- codexcli
```

## Codex CLI architecture

```text
Repo (GitHub)                          Your machine (global)
skills/<name>/SKILL.md  --download-->  $CODEX_HOME/skills/<name>/SKILL.md
                                       or ~/.codex/skills/<name>/SKILL.md
                                       or custom via -Dir/2nd arg
```

- **Source of truth:** `skills/` in this repo (installed by scripts).
- **Skill unit:** `resume-*/SKILL.md` with frontmatter (`name`, `description`, etc.) + instructions.
- **Codex CLI path varies by tool/version**: some read `~/.codex/skills`, some use `$CODEX_HOME`, some use `.agents/skills`. Use `-Target codexcli` for the common default, or `-Dir` for your exact CLI skills directory.
- **No code changes needed** to the skills themselves; only the install location changes.

## Usage

After install, ask your agent/CLI to use the skill, e.g.:
- "Use the resume-make skill to create my resume"
- "Use resume-update skill to add my new job"
- "Use resume-suggest skill to review my resume"

## Repo structure

```text
test-skill/
├── skills/                 # distributable (source of truth)
│   ├── resume-make/SKILL.md
│   ├── resume-update/SKILL.md
│   └── resume-suggest/SKILL.md
├── .claude/skills/         # local project test copy
├── install.ps1 / install.sh
├── uninstall.ps1 / uninstall.sh
└── README.md
```

## Notes
- PS1 scripts are ASCII/no-BOM and use `-UseBasicParsing` for PowerShell 5.1.
- If your Codex CLI expects a different layout (manifest, command registration, etc.), tell me the CLI name/version and I’ll adapt the packaging.

Repo: https://github.com/AnshKaliya18/test-skill