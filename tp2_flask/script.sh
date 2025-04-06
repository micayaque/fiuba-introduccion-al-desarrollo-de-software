#!/bin/bash

mkdir -p TP2-IDS/{static/{css,images},templates,src}
# el parámetro -p permite crear los directorios intermedios

cd TP2-IDS

#crear el entorno virtual
python3 -m venv .venv
source .venv/bin/activate
pip install flask
touch src/app.py

#copiar el contenido de css e images dado por la cátedra
cp -r ../tp2_flask/css/* static/css/
cp -r ../tp2_flask/images/* static/images/
#-r es el parámetro para hacerlo recursivamente copiando carpetas