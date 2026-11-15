#!/bin/bash

# Ejercicio 082 · 082_funcion_suma.sh — Función que devuelve un dato
# Bloque 9: Funciones · Dificultad: ★★★★★
#
# Crea una función sumar que reciba dos números y "devuelva" la suma con
# echo. Guarda el resultado en una variable y muéstralo.
#
# Ejemplo:
#   $ ./082_funcion_suma.sh 3 5
#   El resultado es 8
#
# Pista: Chuleta, apartado 9: devolver un dato con echo.

# Solución:

sumar() {
    echo $(( $1 + $2 ))
}

r=$(sumar "$1" "$2")
echo "El resultado es $r"
