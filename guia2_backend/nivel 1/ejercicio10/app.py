from flask import Flask, render_template, request, jsonify

app = Flask(__name__)

@app.route('/')
def inicio():
    return render_template('index.html')

@app.route('/datos')
def datos():
    persona = {
        "nombre": "Juan",
        "edad": 25,
    }
    return jsonify(persona)

@app.route('/saludo')
def saludo():
    return '¡Hola, mundo!'


if __name__ == '__main__':
    app.run(debug=True)