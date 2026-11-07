$TargetDir = "$env:USERPROFILE\.claude\skills"
$RepoBase = "https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/skills"

Write-Host "Installing Claude Code resume skills to $TargetDir..."
New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null

@("resume-make", "resume-update", "resume-suggest") | ForEach-Object {
  $skillDir = Join-Path $TargetDir $_
  New-Item -ItemType Directory -Force -Path $skillDir | Out-Null
  $url = "$RepoBase/$_/SKILL.md"
  $out = Join-Path $skillDir "SKILL.md"
  Invoke-WebRequest -Uri $url -OutFile $out
  Write-Host "  - Installed $_"
}

Write-Host "Done! Resume skills installed globally. Use them in Claude Code (e.g. ask to use resume-make skill)."
