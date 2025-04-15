#!/bin/bash

for archivo in *.html; do

    #reemplazar archivos js
    sed -i 's|src="static/js/\([^"]*\)"|src="{{ url_for('\''static'\'', filename='\''js/\1'\'') }}"|g' "$archivo"
    #i = in-place para modificar el archivo
    
    #reemplazar archivos css
    sed -i 's|href="static/css/\([^"]*\)"|href="{{ url_for('\''static'\'', filename='\''css/\1'\'') }}"|g' "$archivo"

    #reemplazar imágenes (etiquetas <img> y estilos en línea)
    sed -i 's|src="static/images/\([^"]*\)"|src="{{ url_for('\''static'\'', filename='\''images/\1'\'') }}"|g' "$archivo"
    sed -i 's|url(static/images/\([^)]*\))|url({{ url_for('\''static'\'', filename='\''images/\1'\'') }})|g' "$archivo"

done