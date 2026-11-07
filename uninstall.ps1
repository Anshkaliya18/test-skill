$TargetDir = "$env:USERPROFILE\.claude\skills"

Write-Host "Uninstalling Claude Code resume skills from $TargetDir..."

@("resume-make", "resume-update", "resume-suggest") | ForEach-Object {
  $path = Join-Path $TargetDir $_
  if (Test-Path $path) {
    Remove-Item $path -Recurse -Force
    Write-Host "  - Removed $_"
  } else {
    Write-Host "  - Skipped $_ (not found)"
  }
}

Write-Host "Done! Resume skills have been uninstalled."