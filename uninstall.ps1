param(
  [ValidateSet("claude","codex","agents","all")]
  [string]$Target = "all"
)

$Skills = @("resume-make","resume-update","resume-suggest")

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

if ($Target -eq "agents") { $Target = "codex" }

switch ($Target) {
  "claude" { Uninstall-From "Claude Code" (Join-Path $env:USERPROFILE ".claude\skills") }
  "codex"  { Uninstall-From "Codex/agents" (Join-Path $env:USERPROFILE ".agents\skills") }
  "all" {
    Uninstall-From "Claude Code" (Join-Path $env:USERPROFILE ".claude\skills")
    Uninstall-From "Codex/agents" (Join-Path $env:USERPROFILE ".agents\skills")
  }
}

Write-Host "Done."