#!/bin/bash

# Ejercicio 134 · 134_validar_correo.sh — Correo electrónico
# Bloque 14: Regex extendidas con =~ · Dificultad: ★★★★☆
#
# Recibe un correo: usuario (minúsculas, cifras, punto, guion o guion
# bajo, al menos 1), @, dominio (minúsculas, cifras, punto o guion), un punto
# y una terminación de 2 a 4 letras minúsculas.
#
# Ejemplo:
#   $ ./134_validar_correo.sh lucia.ferrer@alu.edu.gva.es
#   lucia.ferrer@alu.edu.gva.es es válido
#   $ ./134_validar_correo.sh lucia@gva
#   lucia@gva NO es válido
#
# Pista: +, {n,m}, \. y el - al final de [ ].

# Solución:

if [[ $# -ne 1 ]]; then
    echo "Uso: $0 dato"
    exit 1
fi
re='^[a-z0-9._-]+@[a-z0-9.-]+\.[a-z]{2,4}$'
if [[ $1 =~ $re ]]; then
    echo "$1 es válido"
else
    echo "$1 NO es válido"
fi
