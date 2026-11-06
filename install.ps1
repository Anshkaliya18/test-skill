$TargetDir = "$env:USERPROFILE\.claude\commands"
$RepoBase = "https://raw.githubusercontent.com/AnshKaliya18/test-skill/main/commands"

Write-Host "Installing Claude Code resume commands to $TargetDir..."
New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null

@("resume-make.md", "resume-update.md", "resume-suggest.md") | ForEach-Object {
  $url = "$RepoBase/$_"
  $out = Join-Path $TargetDir $_
  Invoke-WebRequest -Uri $url -OutFile $out
  Write-Host "  - Installed $_"
}

Write-Host "Done! You can now use /resume-make, /resume-update, and /resume-suggest in Claude Code."
