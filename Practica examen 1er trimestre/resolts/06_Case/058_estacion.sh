#!/bin/bash

# Ejercicio 058 · 058_estacion.sh — Estación del año
# Bloque 6: case · Dificultad: ★★★☆☆
#
# Recibe un mes (1-12) y muestra la estación: 12, 1, 2 invierno; 3, 4, 5
# primavera; 6, 7, 8 verano; 9, 10, 11 otoño.
#
# Ejemplo:
#   $ ./058_estacion.sh 7
#   Verano
#
# Pista: Chuleta, apartado 7: varios valores con |.

# Solución:

case $1 in
    12|1|2)  echo "Invierno" ;;
    3|4|5)   echo "Primavera" ;;
    6|7|8)   echo "Verano" ;;
    9|10|11) echo "Otoño" ;;
    *)       echo "Error: mes no válido" ;;
esac
