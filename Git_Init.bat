@echo off
setlocal EnableExtensions
title Git Ersteinrichtung

echo === Git Ersteinrichtung ===
set "projectPath="
set "repoUrl="
set /p "projectPath=Projektpfad eingeben: "
set /p "repoUrl=GitHub-Repo-URL eingeben: "

if not defined projectPath goto :nopath
if not exist "%projectPath%\" (
    echo Ordner existiert nicht: %projectPath%
    goto :fail
)
cd /d "%projectPath%" || goto :fail

rem Diese Datei heisst Git.bat. Deshalb immer git.exe aufrufen,
rem damit Windows nicht versehentlich dieses Skript erneut startet.

if exist ".git" (
    echo Dieser Ordner ist bereits ein Git-Repo. Abbruch, damit nichts doppelt angelegt wird.
    goto :fail
)

git.exe init || goto :fail
rem Identitaet nur fuer dieses Projekt setzen, nicht global
git.exe config user.name "Daniel40810" || goto :fail
git.exe config user.email "daniel40810@users.noreply.github.com" || goto :fail

rem .gitignore aus der Vorlage nur anlegen, wenn im Projekt noch keine vorhanden ist
if not exist ".gitignore" (
    copy /y "%~dp0gitignore-netbeans.txt" ".gitignore" >nul
    echo .gitignore aus Vorlage angelegt.
)

git.exe add . || goto :fail
git.exe commit -m "Initial commit" || goto :fail
git.exe branch -M master || goto :fail
git.exe remote add origin "%repoUrl%" || goto :fail
git.exe push -u origin master || goto :fail

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
