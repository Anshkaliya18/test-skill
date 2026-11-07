$TargetDir = "$env:USERPROFILE\.claude\skills"
$RepoBase = "https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/skills"

Write-Host "Installing Claude Code resume skills to $TargetDir..."
New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null

@("resume-make", "resume-update", "resume-suggest") | ForEach-Object {
  $skillDir = Join-Path $TargetDir $_
  New-Item -ItemType Directory -Force -Path $skillDir | Out-Null
  $url = "$RepoBase/$_/SKILL.md"
  $out = Join-Path $skillDir "SKILL.md"
  try {
    Invoke-WebRequest -Uri $url -OutFile $out -ErrorAction Stop
    Write-Host "  - Installed $_"
  } catch {
    Write-Error "Failed to install $_ from $url. $($_.Exception.Message)"
    exit 1
  }
}

Write-Host "Done! Resume skills installed globally."