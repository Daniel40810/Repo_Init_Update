@echo off
setlocal EnableExtensions
title Git Update
echo === Git Update ===
set "projectPath="
set /p "projectPath=Projektpfad eingeben: "

if not defined projectPath goto :nopath
if not exist "%projectPath%\" (
    echo Ordner existiert nicht: %projectPath%
    goto :fail
)
cd /d "%projectPath%" || goto :fail

if not exist ".git" (
    echo Kein Git-Repo in diesem Ordner. Bitte zuerst Git.bat ausfuehren.
    goto :fail
)

set "commitMsg=Update"
set /p "commitMsg=Commit-Nachricht (Enter = Update): "

echo.
echo === Dateien hinzufuegen ===
git.exe add . || goto :fail

echo.
echo === Commit erstellen ===
git.exe diff --cached --quiet
if errorlevel 1 (
    git.exe commit -m "%commitMsg%" || goto :fail
) else (
    echo Keine neuen Aenderungen zum Committen.
)

echo.
echo === Push zu origin/master ===
git.exe push origin master || goto :fail

echo.
echo === Fertig! ===
pause
exit /b 0

:nopath
echo Kein Projektpfad angegeben.

:fail
echo.
echo !!! Abbruch: Ein Schritt ist fehlgeschlagen. Bitte die Meldung oben pruefen. !!!
pause
exit /b 1
