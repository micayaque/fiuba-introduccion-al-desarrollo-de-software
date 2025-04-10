#!/bin/bash

mkdir -p TP2-IDS/{.venv,src/static/{css,images,fonts,js},src/templates}
# el parámetro -p permite crear los directorios intermedios

cd TP2-IDS

#crear el entorno virtual
python3 -m venv .venv
source .venv/bin/activate
pip install flask
touch src/app.py

#copiar el contenido de css e images dado por la cátedra
cp -r ../template/css/* src/static/css/
cp -r ../template/fonts/* src/static/fonts/
cp -r ../template/images/* src/static/images/
cp -r ../template/js/* src/static/js/
#-r para para hacerlo recursivamente copiando carpetas

cp ../template/contact.html src/templates/contact.html
cp ../template/index.html src/templates/index.html
cp ../template/menu.html src/templates/menu.html

cd src

#escribo en app.py lo básico para iniciar Flask
echo $'from flask import Flask, render_template\n\napp = Flask(__name__)'"$(cat app.py)" > app.py
#echo imprime texto en la consola pero con > lo redirecciona a el archivo
#$ antes de el string permite caracteres como \n
#$ antes de el comando cat permite que se lea el contenido en app.py y junto con > se inserte al inicio el bloque de texto

flask run