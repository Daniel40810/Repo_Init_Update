# Git-Hilfsskripte

Zwei kleine Windows-Batch-Skripte für Git, mit passenden Icons im Stil von `heidelberg.ico`.

## Inhalt

| Datei | Zweck |
|---|---|
| `Git_Init.bat` | Ersteinrichtung eines Projekts: `git init`, Projekt-Identität setzen, `.gitignore` aus der Vorlage anlegen, Initial-Commit, Remote `origin` anlegen und nach `master` pushen. |
| `Git_Update.bat` | Änderungen eines bestehenden Repos: `git add .`, Commit (Nachricht abfragbar, Standard „Update“), Push nach `origin/master`. |
| `gitignore-netbeans.txt` | Vorlage für `.gitignore` in NetBeans/Ant-Projekten (`build/`, `dist/`, `nbproject/private/`, …) |
| `Git_Init.ico` | Icon für `Git_Init.bat` (Commit-Graph) |
| `Git_Update.ico` | Icon für `Git_Update.bat` (Aktualisierungs-Pfeil) |
| `.gitattributes` | Zeilenenden und Binärdateien für Git |

## Verwendung

1. `Git_Init.bat` doppelklicken, Projektpfad und GitHub-Repo-URL eingeben.
2. Für spätere Änderungen `Git_Update.bat` doppelklicken und den Projektpfad eingeben.

Beide Skripte brechen ab, sobald ein Git-Befehl fehlschlägt, und zeigen die Ursache an. `Git_Init.bat` bricht außerdem ab, wenn der Ordner schon ein Git-Repo ist.

## Icons einer .bat-Datei zuweisen

Eine `.bat`-Datei kann kein eigenes Icon tragen. Dafür eine Verknüpfung nutzen:

1. Rechtsklick auf `Git_Init.bat` → *Senden an* → *Desktop (Verknüpfung erstellen)*.
2. Rechtsklick auf die Verknüpfung → *Eigenschaften* → *Anderes Symbol…*.
3. `Git_Init.ico` (bzw. `Git_Update.ico` für die Update-Verknüpfung) auswählen.

## Hinweise

- Die Git-Identität wird nur lokal im jeweiligen Projekt gesetzt, nicht global.
- Die Skripte setzen `git.exe` direkt auf, damit Windows nicht versehentlich `Git_Init.bat` erneut startet.
- Zeilenenden der `.bat`-Dateien bleiben über `.gitattributes` als CRLF erhalten.
