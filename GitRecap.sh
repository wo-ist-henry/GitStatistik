#!/bin/bash

# Überprüfen, ob ein Argument übergeben wurde
if [ -z "$1" ]
then
    echo "Bitte geben Sie den Pfad zum Git-Repository als Argument an."
    exit 1
fi

# In das Git-Repository wechseln
cd $1

# Anzahl der Commits
commits=$(git rev-list --all --count)

# Anzahl der hinzugefügten und gelöschten Zeilen
lines=$(git log --all --pretty=tformat: --numstat | awk '{ added += $1; deleted += $2; } END { print added, deleted }')

# Anzahl der Mitwirkenden
contributors=$(git shortlog -sn --all | wc -l)

# Ausgabe formatieren
echo -e "Anzahl der Commits: $commits\nAnzahl der hinzugefügten Zeilen: $(echo $lines | cut -d' ' -f1)\nAnzahl der gelöschten Zeilen: $(echo $lines | cut -d' ' -f2)\nAnzahl der Mitwirkenden: $contributors"