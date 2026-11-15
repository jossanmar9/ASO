#!/bin/bash

# Ejercicio 105 · 105_existe_usuario_grep.sh — ¿Existe el usuario? (grep)
# Bloque 11: grep · Dificultad: ★★★☆☆
#
# Recibe un nombre de usuario y comprueba si aparece en passwd.txt como
# usuario (al principio de la línea y seguido de :), sin mostrar nada de grep.
#
# Ejemplo:
#   $ ./105_existe_usuario_grep.sh jose
#   El usuario jose existe
#   $ ./105_existe_usuario_grep.sh pepe
#   El usuario pepe no existe
#
# Pista: grep -q y el patrón "^nombre:".

# Solución:

if [[ $# -ne 1 ]]; then
    echo "Uso: $0 usuario"
    exit 1
fi
if grep -q "^$1:" passwd.txt; then
    echo "El usuario $1 existe"
else
    echo "El usuario $1 no existe"
fi
# Sin ^ y sin :, buscar "bin" también encontraría "sbin" o "/bin/bash".
