#!/bin/bash

# Ejercicio 086 · 086_funcion_error.sh — Función de errores
# Bloque 9: Funciones · Dificultad: ★★★★★
#
# Crea una función error que muestre "Error: <mensaje>" y el uso, y termine
# con exit 1. El script recibe un número: si falta o no es un número, usa
# error. Si es correcto, muestra su cuadrado.
#
# Ejemplo:
#   $ ./086_funcion_error.sh
#   Error: falta el número
#   Uso: ./086_funcion_error.sh numero
#   $ ./086_funcion_error.sh 5
#   El cuadrado de 5 es 25
#
# Pista: Chuleta, apartados 3 y 9.

# Solución:

error() {
    echo "Error: $1"
    echo "Uso: $0 numero"
    exit 1
}

if [[ $# -eq 0 ]]; then
    error "falta el número"
fi
if [[ ! $1 =~ ^[0-9]+$ ]]; then
    error "$1 no es un número"
fi
echo "El cuadrado de $1 es $(( $1 * $1 ))"
