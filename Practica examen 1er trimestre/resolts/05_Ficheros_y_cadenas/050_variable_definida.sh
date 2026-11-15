#!/bin/bash

# Ejercicio 050 · 050_variable_definida.sh — ¿Está definida?
# Bloque 5: Ficheros y cadenas · Dificultad: ★★★☆☆
#
# Comprueba si la variable CIUDAD tiene valor. Prueba a ejecutarlo así:
# CIUDAD=Valencia ./variable_definida.sh
#
# Ejemplo:
#   $ ./050_variable_definida.sh
#   CIUDAD no está definida
#   $ CIUDAD=Valencia ./050_variable_definida.sh
#   CIUDAD vale Valencia
#
# Pista: Chuleta, apartado 5: -v (nombre sin $).

# Solución:

if [[ -v CIUDAD ]]; then
    echo "CIUDAD vale $CIUDAD"
else
    echo "CIUDAD no está definida"
fi
