#!/bin/bash

# Ejercicio 144 · 144_validar.sh — La función validar_pid
# Bloque 15: UT2 · Repaso de la sesión 7 · Dificultad: ★★☆☆☆
#
# Crea la función validar_pid que reciba un PID como parámetro y devuelva
# 0 si es un número y el proceso existe, o 1 en caso contrario.
# En el programa principal pide un PID y muestra "PID válido" o "PID no válido".
#
# Ejemplo:
#   $ sleep 1000 &
#   [1] 4310
#   $ ./204_validar.sh
#   PID: 4310
#   PID válido
#   $ ./204_validar.sh
#   PID: abc
#   PID no válido
#
# Pista: Punto 7 de la sesión 7. return 0 / return 1 (¡no exit!). Al llamarla: if validar_pid "$pid"; then

# Solución:
