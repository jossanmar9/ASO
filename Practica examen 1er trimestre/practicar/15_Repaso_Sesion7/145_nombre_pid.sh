#!/bin/bash

# Ejercicio 145 · 145_nombre_pid.sh — Nombre del comando de un PID
# Bloque 15: UT2 · Repaso de la sesión 7 · Dificultad: ★★☆☆☆
#
# Reutiliza validar_pid. Pide un PID y:
# - Si no es válido: "Error: el PID X no es válido o no existe".
# - Si es válido: "El proceso X es COMANDO".
#
# Ejemplo:
#   $ ./205_nombre_pid.sh
#   PID: 4310
#   El proceso 4310 es sleep
#   $ ./205_nombre_pid.sh
#   PID: 99999
#   Error: el PID 99999 no es válido o no existe
#
# Pista: Ayuda de la práctica: ps -p "$pid" -o comm= (el = quita la cabecera). Guárdalo en una variable con $( ).

# Solución:
