#!/bin/bash

# Gestione parametri
Dir = $1 	# directory per la find
Parola = $2 	# parola da trovare nei file

for file in $(find $Dir -type f); do
  if grep -q "$Parola" "$file"; then
    echo "$file" # mi segno il file
    code "$file" # lo metto su VSCode
  fi 
done
