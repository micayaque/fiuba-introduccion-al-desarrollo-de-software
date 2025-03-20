#!/bin/bash

if [[ "$1" == "-d" ]]; then
    # Si el usuario corre el script con el parámetro -d  

    rm -r "$RUTA_A_EPN1"   # se borrará todo el entorno creado recursivamente desde el directorio EPN1
    pkill consolidar.sh  # y se matarán los procesos creados en background
    exit
fi

export FILENAME="datos-alumnos"    #con export para que esté disponible para el script y para cualquier proceso hijo que se inicie (consolidar)

mostrar_menu() {
    echo "1) Crear entorno"
    echo "2) Correr proceso"
    echo "3) Mostrar alumnos"
    echo "4) Mostrar las 10 notas más altas"
    echo "5) Mostrar los datos de un alumno"
    echo "6) Salir"
}

export RUTA_A_EPN1="$HOME/EPNro1"

crear_entorno() {
    mkdir -p "$RUTA_A_EPN1/entrada" "$RUTA_A_EPN1/salida" "$RUTA_A_EPN1/procesado" #crea el directorio EPNro1 y las carpetas entrada, salida y procesado (-p parent crea el padre si no fue creado antes)
    cp ./consolidar.sh "$RUTA_A_EPN1/"
    cp ./datos1.txt "$RUTA_A_EPN1/entrada/"
    cp ./datos2.txt "$RUTA_A_EPN1/entrada/"
    cp ./datos3.txt "$RUTA_A_EPN1/entrada/"
}

correr_proceso() {
    if [[ ! -d "$RUTA_A_EPN1" || ! -d "$RUTA_A_EPN1/entrada" || ! -d "$RUTA_A_EPN1/salida" || ! -d "$RUTA_A_EPN1/procesado" ]]; then
        echo "El entorno no existe o no fue creado correctamente. Debe crearlo con la opción 1)."
        return
    fi

    bash "$RUTA_A_EPN1/consolidar.sh" > /dev/null 2>&1 &   #corre el script consolidar.sh en background (&) se descarta la salida a null (>/dev/null) y también la salida de "errores" ej "no hay más archivos" (2>&1) para poder ver el menú en la terminal
}

#formato de los datos en el archivo FILENAME.txt: padrón, nombre, apellido, email, nota

mostrar_alumnos() {
    if [[ -f "$RUTA_A_EPN1/salida/$FILENAME.txt" ]]; then    #si existe el archivo FILENAME.txt en la carpeta salida
        sort -n "$RUTA_A_EPN1/salida/$FILENAME.txt"         #muestra el contenido ordenado por número de padrón  
    fi
}

mostrar_notas_altas() {
    if [[ -f "$RUTA_A_EPN1/salida/$FILENAME.txt" ]]; then                #si existe el archivo FILENAME.txt en la carpeta salida
        sort -k4 -nr "$RUTA_A_EPN1/salida/$FILENAME.txt" | head -n 10     #muestra las 10 notas más altas
    fi
}

mostrar_datos_alumno() {
    read -p "Ingrese el padrón del alumno: " padron
    grep "^$padron " "$RUTA_A_EPN1/salida/$FILENAME.txt" || echo "No se encontró el padrón."     #busca una coincidencia con el padrón en el archivo FILENAME.txt y muestra los datos del alumno
}

salir() {
    exit
}

until false; do
    mostrar_menu
    read -p "Seleccione una opción: " opcion

    case $opcion in
        1) crear_entorno ;;
        2) correr_proceso ;;
        3) mostrar_alumnos ;;
        4) mostrar_notas_altas ;;
        5) mostrar_datos_alumno ;;
        6) salir ;;
    esac

done