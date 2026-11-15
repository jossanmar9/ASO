#!/bin/bash

# Ejercicio 070 · 070_usuario_dominio.sh — Usuario y dominio de un correo
# Bloque 7: Subcadenas · Dificultad: ★★★★☆
#
# Recibe un correo. Comprueba que tiene una @ (con un comodín). Muestra el
# usuario (antes de la @) y el dominio (después).
#
# Ejemplo:
#   $ ./070_usuario_dominio.sh lucia@alu.edu.gva.es
#   Usuario: lucia
#   Dominio: alu.edu.gva.es
#
# Pista: Chuleta, apartados 5 (comodines con [[ ]]) y 6 (# y %).

# Solución:

c=$1
if [[ $c != *@* ]]; then
    echo "Error: $c no es un correo"
    exit 1
fi
echo "Usuario: ${c%@*}"
echo "Dominio: ${c#*@}"
