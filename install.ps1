param(
  [ValidateSet("claude","codex","agents","codexcli","opencode","kilo","qwen","all")]
  [string]$Target = "all",
  [string]$Dir = ""
)

$RepoBase = "https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/skills"
$Skills = @("resume-make","resume-update","resume-suggest")

function Get-TargetPath([string]$t) {
  switch ($t) {
    "claude"    { return (Join-Path $env:USERPROFILE ".claude\skills") }
    "codex"     { return (Join-Path $env:USERPROFILE ".agents\skills") }
    "agents"    { return (Join-Path $env:USERPROFILE ".agents\skills") }
    "codexcli"  {
      if ($env:CODEX_HOME) { return (Join-Path $env:CODEX_HOME "skills") }
      return (Join-Path $env:USERPROFILE ".codex\skills")
    }
    "opencode"  {
      if ($env:APPDATA) { return (Join-Path $env:APPDATA "opencode\skills") }
      return (Join-Path $env:USERPROFILE ".config\opencode\skills")
    }
    "kilo"      { return (Join-Path $env:USERPROFILE ".config\kilo\skills") }
    "qwen"      { return (Join-Path $env:USERPROFILE ".qwen\skills") }
  }
}

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

if ($Dir) {
  Install-To "Custom" $Dir
  Write-Host "Done."
  exit 0
}

if ($Target -eq "agents") { $Target = "codex" }

switch ($Target) {
  "claude"    { Install-To "Claude Code" (Get-TargetPath "claude") }
  "codex"     { Install-To "Codex/agents" (Get-TargetPath "codex") }
  "codexcli"  { Install-To "Codex CLI" (Get-TargetPath "codexcli") }
  "opencode"  { Install-To "OpenCode" (Get-TargetPath "opencode") }
  "kilo"      { Install-To "Kilo" (Get-TargetPath "kilo") }
  "qwen"      { Install-To "Qwen" (Get-TargetPath "qwen") }
  "all" {
    Install-To "Claude Code" (Get-TargetPath "claude")
    Install-To "Codex/agents" (Get-TargetPath "codex")
    Install-To "Codex CLI" (Get-TargetPath "codexcli")
    Install-To "OpenCode" (Get-TargetPath "opencode")
    Install-To "Kilo" (Get-TargetPath "kilo")
    Install-To "Qwen" (Get-TargetPath "qwen")
  }
}

Write-Host "Done."