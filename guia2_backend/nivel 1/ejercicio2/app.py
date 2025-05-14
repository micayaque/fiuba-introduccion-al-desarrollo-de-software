from flask import Flask

app = Flask(__name__)

@app.route('/saludo')
def saludo():
    return '¡Hola, mundo!'

# nueva ruta con parámetro dinámico <nombre>
@app.route('/saludo/<nombre>')
def saludo_personalizado(nombre):
    return f'¡Hola, {nombre}!'

if __name__ == '__main__':
    app.run(debug=True)