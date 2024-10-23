REM must be run as administrator
@echo off
setlocal

REM Define the directories to watch and their corresponding commands
set WATCH_DIR1=%~dp0deno\www\app-dotlake\Modules
set COMMAND1=docker restart cont-deno-dotlake

set WATCH_DIR2=%~dp0deno\www\app-translator\Modules
set COMMAND2=docker restart cont-deno-translator

echo Watching directories:
echo %WATCH_DIR1%
echo %WATCH_DIR2%
echo.

REM Use PowerShell to watch for changes
powershell -Command ^
    "$watcher1 = New-Object System.IO.FileSystemWatcher '%WATCH_DIR1%';" ^
    "$watcher1.IncludeSubdirectories = $true;" ^
    "$watcher1.NotifyFilter = [System.IO.NotifyFilters]'FileName, LastWrite';" ^
    "$action1 = { Write-Output 'Change detected in %WATCH_DIR1%: ' + $_.FullPath; Start-Process cmd -ArgumentList '/c %COMMAND1%' -WindowStyle Hidden };" ^
    "Register-ObjectEvent $watcher1 'Changed' -Action $action1;" ^
    "Register-ObjectEvent $watcher1 'Created' -Action $action1;" ^
    "Register-ObjectEvent $watcher1 'Deleted' -Action $action1;" ^
    "Register-ObjectEvent $watcher1 'Renamed' -Action $action1;" ^
    "$watcher1.EnableRaisingEvents = $true;" ^
    "$watcher2 = New-Object System.IO.FileSystemWatcher '%WATCH_DIR2%';" ^
    "$watcher2.IncludeSubdirectories = $true;" ^
    "$watcher2.NotifyFilter = [System.IO.NotifyFilters]'FileName, LastWrite';" ^
    "$action2 = { Write-Output 'Change detected in %WATCH_DIR2%: ' + $_.FullPath; Start-Process cmd -ArgumentList '/c %COMMAND2%' -WindowStyle Hidden };" ^
    "Register-ObjectEvent $watcher2 'Changed' -Action $action2;" ^
    "Register-ObjectEvent $watcher2 'Created' -Action $action2;" ^
    "Register-ObjectEvent $watcher2 'Deleted' -Action $action2;" ^
    "Register-ObjectEvent $watcher2 'Renamed' -Action $action2;" ^
    "$watcher2.EnableRaisingEvents = $true;" ^
    "while ($true) { Start-Sleep -Seconds 1; }"