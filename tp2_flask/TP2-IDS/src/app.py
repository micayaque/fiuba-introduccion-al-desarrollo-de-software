from flask import Flask, render_template, request, redirect, flash
from datetime import datetime
from email import Mail, Message

nombre_cafeteria = "Ghirardelli"

app = Flask(__name__)

# Configuración del servidor de correo
app.config['MAIL_SERVER'] = 'smtp.gmail.com'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USE_TLS'] = True
app.config['MAIL_USE_SSL'] = False
app.config['MAIL_USERNAME'] = 'tu-email@gmail.com'
app.config['MAIL_PASSWORD'] = 'tu-contraseña-o-clave-de-aplicacion'
app.config['MAIL_DEFAULT_SENDER'] = 'tu-email@gmail.com'

mail = Mail(app)

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
    return render_template('menu.html', nombre_cafeteria=nombre_cafeteria, titulo_header=titulo_header, platos=info_menu)

@app.route('/contact')
def contact():
    titulo_header = "Get in Touch"

    if request.method == 'POST':
        nombre = request.form['nombre']
        email = request.form['email']
        mensaje = request.form['mensaje']

        # Armar el cuerpo del correo
        cuerpo = f"Nombre: {nombre}\nEmail: {email}\nMensaje: {mensaje}"

        # Crear y enviar el correo
        msg = Message('Nuevo contacto desde la web', recipients=['destinatario@gmail.com'])
        msg.body = cuerpo
        mail.send(msg)

        flash('Mensaje enviado correctamente.')
        return redirect('/contacto')

    return render_template('contacto.html')


info_menu = {
    "Espresso": {
        "nombre": "Espresso",
        "descripcion": "A strong and bold coffee shot.",
        "precio": 3.00,
        "imagen": "espresso.jpg"
    },
    "Cappuccino": {
        "nombre": "Cappuccino",
        "descripcion": "A perfect blend of espresso, steamed milk, and foam.",
        "precio": 4.50,
        "imagen": "cappuccino.jpg"
    },
    "Latte": {
        "nombre": "Latte",
        "descripcion": "Smooth and creamy with a hint of coffee.",
        "precio": 4.00,
        "imagen": "latte.jpg"
    },
    "Mocha": {
        "nombre": "Mocha",
        "descripcion": "A delicious mix of chocolate and coffee.",
        "precio": 4.75,
        "imagen": "mocha.jpg"
    },
    "Americano": {
        "nombre": "Americano",
        "descripcion": "Espresso with hot water for a rich flavor.",
        "precio": 3.50,
        "imagen": "americano.jpg"
    },
    "Macchiato": {
        "nombre": "Macchiato",
        "descripcion": "Espresso with a touch of foam.",
        "precio": 3.75,
        "imagen": "macchiato.jpg"
    }    
}