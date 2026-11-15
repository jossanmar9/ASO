#!/bin/bash

# Ejercicio 117 · 117_login_desde_nombre.sh — Login a partir del nombre
# Bloque 12: cut, tr, wc, sort · Dificultad: ★★★☆☆
#
# Recibe nombre y dos apellidos (3 parámetros). Genera el login: primera
# letra del nombre + primer apellido completo + primera letra del segundo,
# todo en minúsculas. Usa cut y tr.
#
# Ejemplo:
#   $ ./117_login_desde_nombre.sh Lucia Ferrer Mas
#   Login: lferrerm
#
# Pista: cut -c1 y tr 'A-Z' 'a-z'.

# Solución:

if [[ $# -ne 3 ]]; then
    echo "Uso: $0 nombre apellido1 apellido2"
    exit 1
fi
n=$(echo "$1" | cut -c1)
a2=$(echo "$3" | cut -c1)
login=$(echo "$n$2$a2" | tr 'A-Z' 'a-z')
echo "Login: $login"
