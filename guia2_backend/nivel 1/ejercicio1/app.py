from flask import Flask

app = Flask(__name__)

# el método de la ruta es GET por defecto
@app.route('/saludo')
def saludo():
    return '¡Hola, mundo!'

if __name__ == '__main__':
    app.run(debug=True)