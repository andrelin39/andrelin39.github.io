$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path -Parent $PSScriptRoot
$LogDir = Join-Path $ProjectRoot "tmp"
$LogFile = Join-Path $LogDir "jekyll-server.log"
$ErrFile = Join-Path $LogDir "jekyll-server.err.log"

New-Item -ItemType Directory -Path $LogDir -Force | Out-Null
Set-Location -LiteralPath $ProjectRoot

bundle exec jekyll serve --config _config.yml,_config_local.yml --host 127.0.0.1 --port 4000 1>> $LogFile 2>> $ErrFile
