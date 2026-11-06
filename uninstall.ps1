$TargetDir = "$env:USERPROFILE\.claude\commands"

Write-Host "Uninstalling Claude Code resume commands from $TargetDir..."

@("resume-make.md", "resume-update.md", "resume-suggest.md") | ForEach-Object {
  $path = Join-Path $TargetDir $_
  if (Test-Path $path) {
    Remove-Item $path -Force
    Write-Host "  - Removed $_"
  } else {
    Write-Host "  - Skipped $_ (not found)"
  }
}

Write-Host "Done! Resume commands have been uninstalled."
