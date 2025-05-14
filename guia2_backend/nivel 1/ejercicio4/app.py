from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/saludo')
def saludo():
    return '¡Hola, mundo!'

@app.route('/form', methods=['GET'])
def mostrar_form():
    return render_template('form.html')

@app.route('/submit', methods=['POST'])
def procesar_datos_form():
    nombre = request.form['nombre']
    apellido = request.form['apellido']
    return f'Hola {nombre} {apellido}'

if __name__ == '__main__':
    app.run(debug=True)