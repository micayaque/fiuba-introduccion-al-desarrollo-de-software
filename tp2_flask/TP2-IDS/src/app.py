from flask import Flask, render_template
from datetime import datetime

nombre_cafeteria = "Ghirardelli"

app = Flask(__name__)

@app.route('/index')
def index():
    return render_template('index.html', nombre_cafeteria=nombre_cafeteria,)

@app.route('/menu')
def menu():
    return render_template('menu.html', nombre_cafeteria=nombre_cafeteria)

@app.route('/contact')
def contact():
    return render_template('contact.html', nombre_cafeteria=nombre_cafeteria)