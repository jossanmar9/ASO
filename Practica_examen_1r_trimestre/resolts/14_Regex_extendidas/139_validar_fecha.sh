#!/bin/bash

# Ejercicio 139 · 139_validar_fecha.sh — Fecha AAAA-MM-DD
# Bloque 14: Regex extendidas con =~ · Dificultad: ★★★★☆
#
# Recibe una fecha. Primero comprueba el formato con una regex (4 cifras,
# guion, 2 cifras, guion, 2 cifras). Después comprueba que el mes está entre 1
# y 12 y el día entre 1 y 31, sacándolos con cut.
#
# Ejemplo:
#   $ ./139_validar_fecha.sh 2026-11-15
#   2026-11-15 es una fecha válida
#   $ ./139_validar_fecha.sh 2026-13-01
#   Error: el mes debe estar entre 1 y 12
#
# Pista: Regex con {n} y cut -d- -f2. Ojo: "08" con [[ -lt ]] puede dar error (octal): quita el 0 con $((10#$mes)).

# Solución:

if [[ $# -ne 1 ]]; then
    echo "Uso: $0 AAAA-MM-DD"
    exit 1
fi
re='^[0-9]{4}-[0-9]{2}-[0-9]{2}$'
if [[ ! $1 =~ $re ]]; then
    echo "Error: formato incorrecto"
    exit 1
fi
mes=$(echo "$1" | cut -d- -f2)
dia=$(echo "$1" | cut -d- -f3)
mes=$((10#$mes))
dia=$((10#$dia))
if [[ $mes -lt 1 || $mes -gt 12 ]]; then
    echo "Error: el mes debe estar entre 1 y 12"
    exit 1
fi
if [[ $dia -lt 1 || $dia -gt 31 ]]; then
    echo "Error: el día debe estar entre 1 y 31"
    exit 1
fi
echo "$1 es una fecha válida"
