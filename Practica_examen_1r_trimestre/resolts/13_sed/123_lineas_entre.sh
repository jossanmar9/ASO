#!/bin/bash

# Ejercicio 123 · 123_lineas_entre.sh — Líneas entre dos números
# Bloque 13: sed · Dificultad: ★★★★☆
#
# Recibe un fichero y dos números (desde y hasta). Comprueba que son
# números y que desde <= hasta. Muestra esas líneas.
#
# Ejemplo:
#   $ ./123_lineas_entre.sh sistema.log 3 5
#   2026-11-10 08:07:44 ERROR No se puede conectar con la base de datos
#   2026-11-10 09:12:03 INFO Usuario jgarcia ha iniciado sesión
#   2026-11-10 09:15:22 ERROR Tiempo de espera agotado en /api/login
#   $ ./123_lineas_entre.sh sistema.log 5 3
#   Error: desde debe ser menor o igual que hasta
#
# Pista: sed -n 'X,Yp'.

# Solución:

if [[ $# -ne 3 || ! -f $1 ]]; then
    echo "Uso: $0 fichero desde hasta"
    exit 1
fi
if [[ ! $2 =~ ^[0-9]+$ || ! $3 =~ ^[0-9]+$ ]]; then
    echo "Error: desde y hasta deben ser números"
    exit 1
fi
if [[ $2 -gt $3 ]]; then
    echo "Error: desde debe ser menor o igual que hasta"
    exit 1
fi
sed -n "$2,$3p" "$1"
