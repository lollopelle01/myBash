#!/bin/bash

color_codes=(0 1 2 3 4 5 6 7)
color_names=("Nessun colore" "Grigio" "Verde" "Viola" "Blu" "Giallo" "Rosso" "Arancione")

print_all_colors=false

while getopts ":c:d:a" opt; do
  case $opt in
    c)
      color="$OPTARG"
      ;;
    d)
      directory="$OPTARG"
      ;;
    a)
      print_all_colors=true
      ;;
    \?)
      echo "Opzione non riconosciuta: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "L'opzione -$OPTARG richiede un argomento." >&2
      exit 1
      ;;
  esac
done

# Stampa la legenda dei colori se l'opzione -a è attivata
if [ "$print_all_colors" = true ]; then
  for ((i=0; i<${#color_codes[@]}; i++)); do
    echo "Codice ${color_codes[$i]}: ${color_names[$i]}"
  done
else
	# Filtra e stampa solo i nomi dei file nella directory specificata con l'etichetta di colore desiderata
	find "$directory" -print0 | while IFS= read -r -d '' file; do
  		file_color=$(mdls -name kMDItemFSLabel -raw "$file" | xargs -0 -n 1 echo)
  		if [ "$file_color" = "$color" ]; then
    			basename "$file"
  		fi
	done
fi
