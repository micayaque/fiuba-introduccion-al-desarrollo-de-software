### 8- Diga cuántos usuarios pueden hay definidos en el sistema (tip: consultar archivos passwd)

`/etc/passwd` es un archivo que contiene información sobre todos los usuarios del sistema. Cada línea representa un usuario.

```bash
wc -l /etc/passwd
```

- `wc` = word count  
- `-l` = cuenta la cantidad de **líneas**  
- Cada línea = **un usuario registrado**