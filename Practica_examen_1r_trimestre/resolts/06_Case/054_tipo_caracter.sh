#!/bin/bash

# Ejercicio 054 · 054_tipo_caracter.sh — Tipo de carácter
# Bloque 6: case · Dificultad: ★★★☆☆
#
# Pide un carácter y di si es un dígito, una minúscula, una mayúscula u otra
# cosa.
#
# Ejemplo:
#   $ ./054_tipo_caracter.sh
#   Carácter: 7
#   Es un dígito
#
# Pista: Chuleta, apartado 7: patrones [0-9]) en case.

# Solución:

read -p "Carácter: " c
case $c in
    [0-9]) echo "Es un dígito" ;;
    [a-z]) echo "Es una minúscula" ;;
    [A-Z]) echo "Es una mayúscula" ;;
    *)     echo "Es otra cosa" ;;
esac
