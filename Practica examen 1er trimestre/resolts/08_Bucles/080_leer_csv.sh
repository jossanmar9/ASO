#!/bin/bash

# Ejercicio 080 · 080_leer_csv.sh — Leer un CSV
# Bloque 8: Bucles · Dificultad: ★★★★☆
#
# Lee el fichero alumnos.csv (está en esta misma carpeta) con el formato nombre,nota y
# muestra si cada alumno aprueba (nota >= 5) o suspende.
#
# Ejemplo:
#   $ ./080_leer_csv.sh alumnos.csv
#   Ana: aprobado (7)
#   Luis: suspenso (4)
#   ...
#
# Pista: Chuleta, apartado 8: while IFS=, read -r ... < fichero.

# Solución:

if [[ ! -f $1 ]]; then
    echo "Uso: $0 fichero.csv"
    exit 1
fi
while IFS=, read -r nombre nota; do
    if [[ $nota -ge 5 ]]; then
        echo "$nombre: aprobado ($nota)"
    else
        echo "$nombre: suspenso ($nota)"
    fi
done < "$1"
