### 10- Listar los archivos del directorio donde se encuentre que comiencen con la letra “D”. Del resultado obtenido, seleccione las líneas que contienen el texto “top” y el resultado grábelo en un archivo de texto llamado salida.txt


```bash
ls -l | grep ^D | grep top > salida.txt
```

```bash
ls D* 2>/dev/null | grep top > salida.txt
```

`ls D*` lista los archivos en el directorio actual cuyo nombre empieza con "D"

Si no hay archivos con "D", puede generar un error. Para evitarlo, usamos `2>/dev/null` que redirige cualquier mensaje de error a un lugar "vacío" (en este caso, `/dev/null`)

`grep top` filtra las líneas que contienen el texto "top"  

`> salida.txt` redirige el resultado final a un archivo llamado `salida.txt`. Si el archivo ya existe, lo sobrescribe.

Usando `find`: Si quisieramos buscar en todos los subdirectorios también (no solo en el directorio actual)

```bash
find . -type f -name 'D*' 2>/dev/null | grep top > salida.txt
```

`find . -type f -name 'D*'` busca archivos (`-type f`) que empiecen con "D" en el directorio actual y subdirectorios, filtra con `grep top` y redirige la salida a `salida.txt`.

Usando `ls -d` (para solo directorios)
```bash
ls -d D*/ 2>/dev/null | grep top > salida.txt
```
`-d` hace que `ls` liste solo los directorios, no los archivos, el `/` después de `D*` asegura que solo se muestren directorios.

