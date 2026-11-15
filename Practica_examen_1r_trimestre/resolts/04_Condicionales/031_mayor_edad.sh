#!/bin/bash

# Ejercicio 031 · 031_mayor_edad.sh — Mayor de edad
# Bloque 4: Condicionales · Dificultad: ★★☆☆☆
#
# Recibe una edad y dice si es mayor o menor de edad.
#
# Ejemplo:
#   $ ./031_mayor_edad.sh 20
#   Eres mayor de edad
#   $ ./031_mayor_edad.sh 15
#   Eres menor de edad
#
# Pista: Chuleta, apartados 5 (números) y 7.

# Solución:

if [[ $1 -ge 18 ]]; then
    echo "Eres mayor de edad"
else
    echo "Eres menor de edad"
fi
