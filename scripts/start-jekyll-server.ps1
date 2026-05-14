$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path -Parent $PSScriptRoot
$Port = 4000
$LogDir = Join-Path $ProjectRoot "tmp"
$RunScript = Join-Path $PSScriptRoot "run-jekyll-server.ps1"

New-Item -ItemType Directory -Path $LogDir -Force | Out-Null

$listener = Get-NetTCPConnection -LocalPort $Port -State Listen -ErrorAction SilentlyContinue
if ($listener) {
  exit 0
}

Start-Process -FilePath "powershell.exe" `
  -ArgumentList @("-NoProfile", "-ExecutionPolicy", "Bypass", "-File", $RunScript) `
  -WindowStyle Hidden
