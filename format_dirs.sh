#!/bin/bash

# Percorso della cartella principale
cartella=$1

# Utilizza find per ottenere una lista di tutti i file
find "$cartella" -type f -print0 | while IFS= read -r -d '' file; do
    # Estrai il percorso della cartella e il nome del file
    directory=$(dirname "$file")
    filename=$(basename "$file")

    # Rinomina sostituendo / e spazi con _
    nuovo_nome=$(echo "$filename" | sed -e 's/[\/\ ]/_/g')

    # Rinomina il file solo se il nuovo nome è diverso
    if [ "$filename" != "$nuovo_nome" ]; then
        mv -v "$file" "$directory/$nuovo_nome"
    fi
done
