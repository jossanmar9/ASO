#!/bin/bash

# Ejercicio 081 · 081_funcion_saludo.sh — Primera función
# Bloque 9: Funciones · Dificultad: ★★★★★
#
# Crea una función saluda que reciba un nombre y lo salude. Llámala con
# tres nombres distintos.
#
# Ejemplo:
#   $ ./081_funcion_saludo.sh
#   Hola Ana
#   Hola Luis
#   Hola Marta
#
# Pista: Chuleta, apartado 9.

# Solución:

saluda() {
    echo "Hola $1"
}

saluda Ana
saluda Luis
saluda Marta
