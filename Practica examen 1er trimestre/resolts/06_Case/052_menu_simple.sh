#!/bin/bash

# Ejercicio 052 · 052_menu_simple.sh — Menú simple
# Bloque 6: case · Dificultad: ★★★☆☆
#
# Muestra un menú con 3 opciones (1: fecha, 2: usuario, 3: directorio
# actual), pide una opción y ejecuta lo que toque. Solo una vez.
#
# Ejemplo:
#   $ ./052_menu_simple.sh
#   1) Fecha
#   2) Usuario
#   3) Directorio actual
#   Opción: 2
#   jose
#
# Pista: Chuleta, apartados 2 y 7.

# Solución:

echo "1) Fecha"
echo "2) Usuario"
echo "3) Directorio actual"
read -p "Opción: " opcion
case $opcion in
    1) date +%F ;;
    2) echo "$USER" ;;
    3) echo "$PWD" ;;
    *) echo "Opción no válida" ;;
esac
