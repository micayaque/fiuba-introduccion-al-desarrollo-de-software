## Parcial Introducción al Desarrollo de Software

### 08/05/2025

### $\color{purple}{1)} \hspace{0.1cm} \text{ Se ha creado una aplicación FrontEnd para listar y filtrar los artículos de librería de un mayorista.}$
### $\color{purple}\hspace{0.5cm} \text{Esta aplicación debe correr en el puerto 5001.}$
### $\color{purple}\hspace{0.5cm} \text{Los datos de los artículos serán guardados en un diccionario.}$

### $\color{purple}{a)} \hspace{0.1cm} \text{ Dado el archivo}$ `base.html`:

```html
<!DOCTYPE html>
<html>
    <head>
        <title>Primer parcial de Introducción al Desarrollo de Software</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
        <link rel="stylesheet" href="{{ url_for('static', filename='styles.css', _external=True) }}">
    </head>

    <body>
        <div id="header">
            <img src="{{ url_for('static', filename='images/fiuba_logo.jpeg', _external=True) }}" alt="FIUBA">
        </div>

        ?????
        ?????

    </body>
</html>
```

### $\color{purple}{i)} \hspace{0.1cm} \text{Utilice bloques de Flask para poder incorporar el body del resto de los templates, complete los ????? que aparecen.}$

```html
<body>
    <!--Header-->
    {% block content %}
    {% endblock %}
</body>
```

---

$\color{purple}{ii)} \hspace{0.1cm} \text{Explique qué realiza la línea 7 del código y por qué utiliza url\_for.}$

La línea 7 del código utiliza la función `url_for` de Flask para generar la URL de la imagen del logo de FIUBA. Esta función es útil porque permite construir URLs de manera dinámica, asegurando que se utilicen las rutas correctas incluso si la estructura de la aplicación cambia. Al usar `url_for`, se evita la necesidad de hardcodear rutas, lo que hace que el código sea más mantenible y menos propenso a errores.

---

### $\color{purple}{b)} \hspace{0.1cm} \text{ Dado el archivo}$ `app.py`:

```python
@app.route('/products')
def products():
    articles = {1:{ "nombre" : "Martillo mecánico", "precio" : 9800, "descripcion" : "Martillo de la marca Gamma con potencia de 5000W"}, 
    2:{"nombre" : "Destornillador plano", "precio" : 5900, "descripcion" : "Destornillador bahco"}}

    return render_template('products.html', data=?????)
```

### $\color{purple}{i)} \hspace{0.1cm} \text{Explique la línea de código 10}$ `@app.route('/products')`.

La línea `@app.route('/products')` es un decorador de Flask que asocia la función `products()` con la ruta `/products`. Esto significa que cuando un usuario accede a la URL `/products` en el navegador, Flask ejecutará la función `products()`. Este decorador permite definir las rutas de la aplicación web y especificar qué función se debe ejecutar para cada ruta.

---

### $\color{purple}{ii)} \hspace{0.1cm} \text{Complete los ????? que aparecen en la línea 14.}$

```python
return render_template('products.html', data=articles)
```

---

### $\color{purple}{c)} \hspace{0.1cm} \text{Dado el archivo}$ `products.html`:

```html
{% ????? %}
    <div class="col-md-3 col-sm-6 col-xs-6 col-xxs-12 fh5co-item-wrap>
        <div class="fh5co-item animate-box">
            <img src="../static/images/gallery_1.jpeg" class="img-responsive" alt="article">
            <h3>{{ art['nombre'] }}</h3>
            <span class="fh5co-price">${{ art['precio'] }}</span>
            <p>{{ art['descripcion'] }}</p>
        </div>
    </div>
{% ????? %}
```

---

### $\color{purple}{i)} \hspace{0.1cm} \text{Complete el código necesario en los ????? de las líneas 1 y 12, para poder listar los datos que vienen del código pto b}$

```html
{% for art in data %}
    <div class="col-md-3 col-sm-6 col-xs-6 col-xxs-12 fh5co-item-wrap>
        <div class="fh5co-item animate-box">
            <img src="../static/images/gallery_1.jpeg" class="img-responsive" alt="article">
            <h3>{{ art['nombre'] }}</h3>
            <span class="fh5co-price">${{ art['precio'] }}</span>
            <p>{{ art['descripcion'] }}</p>
        </div>
    </div>
{% endfor %}
```

---

### $\color{purple}{ii)} \hspace{0.1cm} \text{Qué hace falta incluir en la línea 4 para que sea correcto el funcionamiento en Flask}$

### Línea 4: `<img src="../static/images/gallery_1.jpeg" class="img-responsive" alt="article">`

Para que sea correcto el funcionamiento en Flask, se debe utilizar la función `url_for` para generar la URL de la imagen de manera dinámica:

```html
<img src="{{ url_for('static', filename='images/gallery_1.jpeg') }}" class="img-responsive" alt="article">
```

---

### $\color{purple}{d)} \hspace{0.1cm} \text{En base al archivo products.html (pto c)}$

### $\color{purple}{i)} \hspace{0.1cm} \text{¿Qué código de estilos debería incluir para que el precio de los articulos sea color rojo, este en negrita y su tamaño sea de 1.2em?}$

```css
.fh5co-price {
    color: red;
    font-weight: bold;
    font-size: 1.2em;
}
```

---

### $\color{purple}{ii)} \hspace{0.1cm} \text{¿Dónde debería incluir el código del pto i)?}$

El código del punto i) debería incluirse en el archivo `styles.css` que se encuentra en la carpeta `static` de la aplicación Flask. Este archivo es el encargado de contener los estilos CSS que se aplicarán a los elementos HTML de la aplicación.

---

### $\color{purple}{2}) \hspace{0.1cm} \text{ Dado el siguiente script Bash para crear un entorno virtual de desarrollo, se pide ordenar el mismo, colocando el nro de línea correspondiente en cada círculo.}$

```bash
(1) #!/bin/bash
(2) mkdir EntornoIDS
(3) cd EntornoIDS
(4) mkdir static
(5) cd static
(6) mkdir css
(7) mkdir images
(8) cd ..
(9) mkdir templates
(10) touch app.py
(11) export FLASK_APP=app.py
(12) export FLASK_DEBUG=1
(13) pipenv install flask
(14) pipenv shell
(15) flask run
```

---


### $\color{purple}{b)} \hspace{0.1cm} \text{Dadas las siguientes afirmaciones determinar cuáles son verdaderas y cuáles falsas.}$

### $\color{purple}{i.} \text{ El back end (o backend), también conocido como desarrollo del lado del cliente, se refiere a la parte de un sitio web o aplicación web que es visible para los usuarios.}\textcolor{red}{FALSA}$

### $\color{purple}{ii.} \text{ Las APIs permiten que sus productos y servicios se comuniquen con otros, sin necesidad de saber cómo están implementados.}\textcolor{green}{VERDADERA}$

### $\color{purple}{iii.} \text{El verbo GET es utilizado para "crear recursos".}\textcolor{red}{FALSA}$

### $\color{purple}{iv.} \text{El uso de API-RestFul, permite que varios dispositivos y sistemas puedan acceder a la vez.}\textcolor{green}{VERDADERA}$

### $\color{purple}{c)} \hspace{0.1cm} \text{Nombre las 3 variables que afectan a un proyecto y qué rol tiene la calidad.}$

Las tres variables que afectan a un proyecto son:
1. **Alcance**: Se refiere a las funcionalidades y características que debe tener el proyecto.
2. **Tiempo**: Es el plazo en el que se debe completar el proyecto.
3. **Costo**: Es el presupuesto asignado para llevar a cabo el proyecto.

El rol de la calidad en un proyecto es asegurar que el producto final cumpla con los requisitos y expectativas del cliente, garantizando que se entregue un producto funcional, confiable y satisfactorio. La calidad debe ser considerada en todas las etapas del proyecto, desde la planificación hasta la entrega final, para minimizar errores y retrabajos.

### $\color{purple}{d)} \hspace{0.1cm} \text{Explique la técnica de planning poker.}$

El planning poker consiste en que cada miembro del equipo de desarrollo utiliza un conjunto de cartas con números para estimar el esfuerzo o complejidad de una tarea o historia de usuario.
Cada miembro del equipo selecciona una carta en secreto y, al mismo tiempo, revela su elección. Si hay discrepancias significativas entre las estimaciones, se discute el razonamiento detrás de cada estimación. Esta técnica fomenta la colaboración, la comunicación y la participación activa de todos los miembros del equipo, permitiendo obtener estimaciones más precisas.

### $\color{purple}{3)} \hspace{0.1cm} \text{Dado el siguiente código HTML.}$

```html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Página Web</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <h1 id="product">{{ art['nombre'] }}</h1>
        <h3> {{ art['descripcion'] }}</h3>
        <button onmouseover="changeColor()" id="change-color">Ver</button>

        ???

    </body>
</html>
```

### $\color{purple}a) \hspace{0.1cm} \text{Cree una función Javascript llamada changeColor para que al pasar el mouse por encima del botón "Ver", cambie el color del nombre del producto a rgb(233, 12, 12).}$

```javascript
function changeColor() {
    document.getElementById("change-color").style.color = "rgb(233, 12, 12)";
}
```

### $\color{purple}b) \hspace{0.1cm} \text{¿Qué falta en la línea 16 del código HTML para que esto funcione.}$

Para que la función `changeColor` funcione correctamente, se debe incluir el script de JavaScript dentro del archivo HTML. Esto se puede hacer de dos maneras: 

* Incluyendo el código directamente en el archivo HTML:

```html
<script>
    function changeColor() {
        document.getElementById("change-color").style.color = "rgb(233, 12, 12)";
    }
</script>
```

* O bien, enlazando un archivo externo de JavaScript que contenga la función:

```html
    <script src="{{ url_for('static', filename='script.js') }}"></script>