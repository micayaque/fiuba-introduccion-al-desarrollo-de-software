#!/bin/bash

mkdir -p TP2-IDS/{static/{css,images,fonts,js},src/templates}
# el parámetro -p permite crear los directorios intermedios

cd TP2-IDS

#crear el entorno virtual
python3 -m venv .venv
source .venv/bin/activate
pip install flask
touch src/app.py

#copiar el contenido dado por la cátedra
cp -r ../src/template/css/* static/css/
cp -r ../src/template/fonts/* static/fonts/
cp -r ../src/template/images/* static/images/
cp -r ../src/template/js/* static/js/
#-r es el parámetro para hacerlo recursivamente copiando carpetas

cp ../template/contact.html src/templates/contact.html
cp ../template/index.html src/templates/index.html
cp ../template/menu.html src/templates/menu.html