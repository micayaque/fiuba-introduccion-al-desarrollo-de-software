#!/bin/bash

while true; do
    for archivo in "$RUTA_A_EPN1/entrada"/*.txt; do #tomamos cada archivo en la carpeta entrada

        cat "$archivo" >> "$RUTA_A_EPN1/salida/$FILENAME.txt"  #concatena los datos del archivo al final de FILENAME.txt, que si no existe lo crea
        
        mv "$archivo" "$RUTA_A_EPN1/procesado/"    #mueve el archivo a la carpeta procesado
    done
done