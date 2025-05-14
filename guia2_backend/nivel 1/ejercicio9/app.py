from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/suma/<int:a>/<int:b>')
def suma_uri(a, b):
    resultado = a + b
    return jsonify({'result': resultado}), 200

@app.route('/suma', methods=['POST'])
def suma():
    data = request.get_json()
    if 'a' in data and 'b' in data:
        a = data['a']
        b = data['b']
        result = a + b
        return jsonify({'result': result}), 200
    else:
        return jsonify({'error': 'Datos inválidos'}), 400

if __name__ == '__main__':
    app.run(debug=True)