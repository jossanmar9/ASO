#!/bin/bash

# Ejercicio 094 · 094_estadisticas_notas.sh — Estadísticas de notas
# Bloque 10: Tipo examen (solo chuleta) · Dificultad: ★★★★★
#
# Lee notas.csv (está en esta misma carpeta) con el formato nombre,nota. Muestra: número de
# alumnos, aprobados, suspensos, la nota media con 2 decimales y quién tiene
# la mejor nota.
#
# Ejemplo:
#   $ ./094_estadisticas_notas.sh notas.csv
#   Alumnos: 6
#   Aprobados: 4
#   Suspensos: 2
#   Media: 5.83
#   Mejor nota: Marta (9)
#
# Pista: Chuleta, apartados 4 (bc), 7 y 8 (IFS=,).

# Solución:

if [[ ! -f $1 ]]; then
    echo "Uso: $0 fichero.csv"
    exit 1
fi

alumnos=0
aprobados=0
suspensos=0
suma=0
mejor=-1
mejor_nombre=""
while IFS=, read -r nombre nota; do
    ((alumnos++))
    suma=$(( suma + nota ))
    if [[ $nota -ge 5 ]]; then
        ((aprobados++))
    else
        ((suspensos++))
    fi
    if [[ $nota -gt $mejor ]]; then
        mejor=$nota
        mejor_nombre=$nombre
    fi
done < "$1"

if [[ $alumnos -eq 0 ]]; then
    echo "El fichero está vacío"
    exit 1
fi
media=$(echo "scale=2; $suma / $alumnos" | bc)
echo "Alumnos: $alumnos"
echo "Aprobados: $aprobados"
echo "Suspensos: $suspensos"
echo "Media: $media"
echo "Mejor nota: $mejor_nombre ($mejor)"
