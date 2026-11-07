param(
  [ValidateSet("claude","codex","agents","all")]
  [string]$Target = "all"
)

$RepoBase = "https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/skills"
$Skills = @("resume-make","resume-update","resume-suggest")

function Install-To([string]$Name, [string]$BaseDir) {
  Write-Host "Installing resume skills for $Name -> $BaseDir"
  New-Item -ItemType Directory -Force -Path $BaseDir | Out-Null
  foreach ($skill in $Skills) {
    $dir = Join-Path $BaseDir $skill
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
    $url = "$RepoBase/$skill/SKILL.md"
    $out = Join-Path $dir "SKILL.md"
    try {
      Invoke-WebRequest -Uri $url -OutFile $out -UseBasicParsing -ErrorAction Stop
      Write-Host "  - Installed $skill"
    } catch {
      Write-Error "Failed to install $skill from $url. $($_.Exception.Message)"
      exit 1
    }
  }
}

if ($Target -eq "agents") { $Target = "codex" }

switch ($Target) {
  "claude" { Install-To "Claude Code" (Join-Path $env:USERPROFILE ".claude\skills") }
  "codex"  { Install-To "Codex/agents" (Join-Path $env:USERPROFILE ".agents\skills") }
  "all" {
    Install-To "Claude Code" (Join-Path $env:USERPROFILE ".claude\skills")
    Install-To "Codex/agents" (Join-Path $env:USERPROFILE ".agents\skills")
  }
}

Write-Host "Done."