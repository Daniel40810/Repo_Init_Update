@echo off
setlocal

REM Quellordner = Ordner, in dem dieses Script liegt
set SRC=%~dp0
set DESK=%USERPROFILE%\Desktop

REM Dateien
set BAT=%SRC%Git_Init.bat
set ICO=%SRC%Git_Init.ico
set LNK=%DESK%\Git Init.lnk

REM Prüfen
if not exist "%BAT%" echo Fehler: %BAT% fehlt & exit /b
if not exist "%ICO%" echo Fehler: %ICO% fehlt & exit /b

REM Verknüpfung erstellen
echo Erstelle Verknuepfung Git Init...
powershell -NoProfile -Command ^
  "$s=(New-Object -ComObject WScript.Shell).CreateShortcut('%LNK%');" ^
  "$s.TargetPath='%BAT%';" ^
  "$s.WorkingDirectory='%SRC%';" ^
  "$s.IconLocation='%ICO%';" ^
  "$s.Save()"

echo Fertig.
pause
