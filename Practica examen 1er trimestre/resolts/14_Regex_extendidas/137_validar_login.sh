#!/bin/bash

# Ejercicio 137 · 137_validar_login.sh — Nombre de usuario
# Bloque 14: Regex extendidas con =~ · Dificultad: ★★★★☆
#
# Recibe un login: empieza por minúscula, después minúsculas, cifras o _,
# y en total entre 3 y 16 caracteres.
#
# Ejemplo:
#   $ ./137_validar_login.sh jose_2026
#   jose_2026 es válido
#   $ ./137_validar_login.sh 2jose
#   2jose NO es válido
#
# Pista: {2,15}: el primer carácter ya cuenta 1.

# Solución:

if [[ $# -ne 1 ]]; then
    echo "Uso: $0 dato"
    exit 1
fi
re='^[a-z][a-z0-9_]{2,15}$'
if [[ $1 =~ $re ]]; then
    echo "$1 es válido"
else
    echo "$1 NO es válido"
fi
