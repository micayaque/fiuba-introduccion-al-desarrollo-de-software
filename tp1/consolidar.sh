#!/bin/bash

while true; do
    for archivo in "$RUTA_A_EPN1/entrada"/*.txt; do #tomamos cada archivo en la carpeta entrada

        [[ -e "$archivo" ]] || continue

        #awk '1; END { print "" }' "$archivo" >> "$RUTA_A_EPN1/salida/$FILENAME.txt"
        #printf "%s\n" "$(cat "$archivo")" >> "$RUTA_A_EPN1/salida/$FILENAME.txt"

        #cat "$archivo" >> "$RUTA_A_EPN1/salida/$FILENAME.txt"

        # Asegurar un salto de línea al final del archivo de salida
        #echo "" >> "$RUTA_A_EPN1/salida/$FILENAME.txt"

        mv "$archivo" "$RUTA_A_EPN1/procesado/"    #mueve el archivo a la carpeta procesado
    done
done