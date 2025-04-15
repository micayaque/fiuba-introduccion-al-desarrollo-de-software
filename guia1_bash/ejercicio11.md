### Listar por pantalla el primer campo del archivo passwd y luego grabar esa misma información en una archivo de texto

```bash
cut -d: -f1 /etc/passwd > usuarios.txt
```

`cut` se utiliza para extraer partes de un archivo. En este caso, queremos extraer un campo específico de cada línea.

`-d:` define que el delimitador de los campos es el carácter `:`. Esto es porque cada campo en `/etc/passwd` está separado por dos puntos.

`-f1` selecciona el **primer campo** de cada línea

`/etc/passwd` es el archivo del que estamos extrayendo la información.

Para guardar ese resultado en un archivo de texto `usuarios.txt`, redirigimos la salida con `>`