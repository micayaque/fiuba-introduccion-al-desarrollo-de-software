from flask import Flask, render_template
from datetime import datetime

nombre_cafeteria = "Ghirardelli"

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('base.html', nombre_cafeteria=nombre_cafeteria)


@app.route('/index')
def index():
    titulo_header = "The Best Coffee Restaurant in Brooklyn"
    return render_template('index.html', nombre_cafeteria=nombre_cafeteria, titulo_header=titulo_header)

@app.route('/menu')
def menu():
    titulo_header = "See Our Menu"
    return render_template('menu.html', nombre_cafeteria=nombre_cafeteria, titulo_header=titulo_header)

@app.route('/contact')
def contact():
    titulo_header = "Get in Touch"
    return render_template('contact.html', nombre_cafeteria=nombre_cafeteria, titulo_header=titulo_header)