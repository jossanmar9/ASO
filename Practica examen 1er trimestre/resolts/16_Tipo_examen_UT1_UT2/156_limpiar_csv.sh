#!/bin/bash

# Ejercicio 156 · 156_limpiar_csv.sh — Limpiar un CSV
# Bloque 16: Tipo examen UT1 + UT2 · Dificultad: ★★★★★
#
# sucio.csv tiene comentarios, líneas vacías, espacios sobrantes y
# mayúsculas. Genera limpio.csv: sin comentarios ni líneas vacías, sin
# espacios y en minúsculas. Después comprueba cada línea con la regex
# nombre,apellido,departamento (solo minúsculas, los 3 campos llenos) y di
# cuántas son válidas y cuáles no.
#
# Ejemplo:
#   $ ./156_limpiar_csv.sh
#   No válida: pedro,,administracion
#   Válidas: 3
#   Resultado en limpio.csv:
#   ana,garcia,informatica
#   luis,marti,contabilidad
#   marta,soler,informatica
#   pedro,,administracion
#
# Pista: grep -v/sed, tr -d ' ', tr 'A-Z' 'a-z', > fichero; regex ^[a-z]+,[a-z]+,[a-z]+$.

# Solución:

sed -n '/^[^#]/p' sucio.csv | tr -d ' ' | tr 'A-Z' 'a-z' > limpio.csv
re='^[a-z]+,[a-z]+,[a-z]+$'
validas=0
while read -r linea; do
    if [[ $linea =~ $re ]]; then
        ((validas++))
    else
        echo "No válida: $linea"
    fi
done < limpio.csv
echo "Válidas: $validas"
echo "Resultado en limpio.csv:"
cat limpio.csv
