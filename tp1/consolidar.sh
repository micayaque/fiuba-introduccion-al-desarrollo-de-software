#!/bin/bash

while true; do
    for archivo in "$RUTA_A_EPN1/entrada"/*.txt; do #tomamos cada archivo en la carpeta entrada

        if [[  -e "$archivo" ]] then 
        	cat "$archivo" >> "$RUTA_A_EPN1/salida/$FILENAME.txt"
	        mv "$archivo" "$RUTA_A_EPN1/procesado/"    #mueve el archivo a la carpeta procesado
        fi

        #awk '1; END { print "" }' "$archivo" >> "$RUTA_A_EPN1/salida/$FILENAME.txt"
        #printf "%s\n" "$(cat "$archivo")" >> "$RUTA_A_EPN1/salida/$FILENAME.txt
    done
done
