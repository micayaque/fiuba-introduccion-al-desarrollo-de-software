### 9- Genere un archivo `lines.txt` con 100 líneas donde cada una de ellas debe estar el nro de línea

```bash
seq 1 100 > lines.txt
```
`seq` genera una secuencia de números

`seq 100` genera una secuencia de números del 1 al 100, uno por línea.
   
`> lines.txt` redirige esa secuencia de números al archivo `lines.txt`. Si el archivo no existe, lo crea; si ya existe, lo sobreescribe.

**Alternativa con `for`**

```bash
for i in $(seq 1 100); do 
    echo $i; 
done > lines.txt
```