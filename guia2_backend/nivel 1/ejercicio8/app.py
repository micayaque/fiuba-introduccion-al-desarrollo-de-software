from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/datos', methods=['POST'])
def procesar_datos():
    data = request.get_json()
    data.update({"mensaje": "Recibido"})
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True)