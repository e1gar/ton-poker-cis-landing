#requires -Version 5.1
param(
    [Parameter(Mandatory = $false, HelpMessage = 'Путь public_html сайта из панели Beget, напр. /home/uXXXXX/webpoker.info/public_html')]
    [string] $RemotePath = '',

    [string] $BegetUser = 'elgar',
    [string] $BegetHost = 'elgar.beget.tech'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$cisLanding = Split-Path -Parent $PSScriptRoot
$dist = Join-Path $cisLanding 'dist'

Push-Location $cisLanding
try {
    npm run build
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

    if (-not $RemotePath) {
        Write-Host 'Не задан -RemotePath. Возьми полный путь в Beget: Хостинг -> Сайты -> webpoker.info -> каталог public_html' -ForegroundColor Yellow
        Write-Host 'Пример: .\scripts\deploy-beget.ps1 -RemotePath "/home/u12345/webpoker.info/public_html"' -ForegroundColor Yellow
        exit 1
    }

    $unixDist = ($dist -replace '\\', '/').TrimEnd('/') + '/.'

    $remoteDir = $RemotePath.TrimEnd('/').TrimEnd('\') + '/'
    $remoteTarget = '{0}@{1}:{2}' -f $BegetUser, $BegetHost, $remoteDir

    Write-Host "Копирую $unixDist -> $remoteTarget" -ForegroundColor Cyan

    & scp -r $unixDist $remoteTarget
    Write-Host 'Готово. Проверь https://webpoker.info/ и /partner/web' -ForegroundColor Green
}
finally {
    Pop-Location
}
