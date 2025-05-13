## Saludo Personalizado

Añade un parámetro dinámico `<nombre>` en la URI para devolver saludos personalizados. Aprenderás a extraer variables de la ruta.

Lo que venga en lugar de `<nombre>` va a capturarse como un parámetro en la función `saludo_personalizado`.

Flask le pasa automáticamente el valor de `<nombre>` a esta variable (`nombre`).

* Definir la ruta `/saludo/<nombre>`.

```python
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
```

* Verificar que la respuesta incluya el **nombre** y un **código HTTP** `200`.

![](/ejercicio2/navegador.png)

![](/ejercicio2/postman.png)

* Documentar la ruta en Postman.

![](/ejercicio2/documentado.png)