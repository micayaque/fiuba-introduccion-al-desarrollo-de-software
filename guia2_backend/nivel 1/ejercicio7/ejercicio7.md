## JSON Básico

Crea un endpoint `/datos` que devuelva un objeto `JSON`estático. 

Verás cómo Flask serializa datos.

* Utilizar `jsonify` para enviar `{ "nombre": "Juan", "edad": 25
}`.

```python
@app.route('/datos')
def datos():
    persona = {
        "nombre": "Juan",
        "edad": 25,
    }
    return jsonify(persona)

if __name__ == '__main__':
    app.run(debug=True)
```

![](postman_body.png)

* Verificar que `Content-Type` sea `application/json`.

![](postman_headers.png)