from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/datos')
def datos():
    persona = {
        "nombre": "Juan",
        "edad": 25,
    }
    return jsonify(persona)

if __name__ == '__main__':
    app.run(debug=True)