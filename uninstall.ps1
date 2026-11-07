param(
  [ValidateSet("claude","codex","agents","codexcli","all")]
  [string]$Target = "all",
  [string]$Dir = ""
)

$Skills = @("resume-make","resume-update","resume-suggest")

function Get-TargetPath([string]$t) {
  switch ($t) {
    "claude"   { return (Join-Path $env:USERPROFILE ".claude\skills") }
    "codex"    { return (Join-Path $env:USERPROFILE ".agents\skills") }
    "agents"   { return (Join-Path $env:USERPROFILE ".agents\skills") }
    "codexcli" {
      if ($env:CODEX_HOME) { return (Join-Path $env:CODEX_HOME "skills") }
      return (Join-Path $env:USERPROFILE ".codex\skills")
    }
  }
}

function Uninstall-From([string]$Name, [string]$BaseDir) {
  Write-Host "Uninstalling resume skills for $Name from $BaseDir"
  foreach ($skill in $Skills) {
    $path = Join-Path $BaseDir $skill
    if (Test-Path $path) {
      Remove-Item $path -Recurse -Force
      Write-Host "  - Removed $skill"
    } else {
      Write-Host "  - Skipped $skill (not found)"
    }
  }
}

if ($Dir) { Uninstall-From "Custom" $Dir; Write-Host "Done."; exit 0 }
if ($Target -eq "agents") { $Target = "codex" }

switch ($Target) {
  "claude"   { Uninstall-From "Claude Code" (Get-TargetPath "claude") }
  "codex"    { Uninstall-From "Codex/agents" (Get-TargetPath "codex") }
  "codexcli" { Uninstall-From "Codex CLI" (Get-TargetPath "codexcli") }
  "all" {
    Uninstall-From "Claude Code" (Get-TargetPath "claude")
    Uninstall-From "Codex/agents" (Get-TargetPath "codex")
    Uninstall-From "Codex CLI" (Get-TargetPath "codexcli")
  }
}

Write-Host "Done."