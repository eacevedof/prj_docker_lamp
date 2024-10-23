@echo off
setlocal

REM Get the directory of the current script
set SCRIPT_DIR=%~dp0

REM Set the watch directory relative to the script directory
set WATCH_DIR=%SCRIPT_DIR%deno\www\app-dotlake\Modules
set COMMAND=docker restart cont-deno-dotlake

echo Watching directory: %WATCH_DIR%
echo Command to execute: %COMMAND%
echo.

REM Use PowerShell to watch for changes
powershell -Command ^
    "$watcher = New-Object System.IO.FileSystemWatcher '%WATCH_DIR%';" ^
    "$watcher.IncludeSubdirectories = $true;" ^
    "$watcher.NotifyFilter = [System.IO.NotifyFilters]'FileName, LastWrite';" ^
    "$action = { Write-Output 'Change detected: ' + $_.FullPath; Start-Process cmd -ArgumentList '/c %COMMAND%' };" ^
    "Register-ObjectEvent $watcher 'Changed' -Action $action;" ^
    "Register-ObjectEvent $watcher 'Created' -Action $action;" ^
    "Register-ObjectEvent $watcher 'Deleted' -Action $action;" ^
    "Register-ObjectEvent $watcher 'Renamed' -Action $action;" ^
    "$watcher.EnableRaisingEvents = $true;" ^
    "while ($true) { Start-Sleep -Seconds 1; }"