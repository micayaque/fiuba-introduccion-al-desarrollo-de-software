#!/bin/bash

if [ -z "$archivo" ]; then
    read -p "Por favor, proporciona el nombre del archivo como argumento." archivo
fi

archivo=$1

if [ ! -f "$archivo" ]; then
    echo "El archivo $archivo no existe."
    exit 1
fi

while true; do

    echo "Selecciona una opción:"
    echo "1. Ingresar una palabra y reemplazarla por ****"
    echo "2. Abrir el archivo"
    echo "3. Realizar una copia del archivo llamada menu_copia.sh"
    echo "4. Ingresar un email y validarlo mediante RE"
    echo "5. Salir"

    read accion
    case $accion in
        1)
            echo "Ingresa la palabra a reemplazar:"
            read palabra
            sed -i "s/$palabra/****/g" "$archivo"
            ;;
        2)
            echo "Abriendo el archivo $archivo..."
            cat "$archivo"
            ;;
        3)
            cp "$archivo" menu_copia.sh
            ;;
        4)
            echo "Ingresa un email para validar:"
            read email
            if [[ $email =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
                echo "El email $email es válido."
            else
                echo "El email $email no es válido."
            fi
            ;;
        5)
            exit 0
            ;;
        *)
            echo "Opción no válida. Por favor, selecciona una opción del menú."
            ;;
    esac

done