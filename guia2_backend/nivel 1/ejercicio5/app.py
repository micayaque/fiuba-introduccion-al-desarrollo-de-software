from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/error')
def error():
    return jsonify({"error": "Petición inválida"}), 400

if __name__ == '__main__':
    app.run(debug=True)