#!/bin/bash

# Ejercicio 146 · 146_prioridad.sh — Cambiar la prioridad
# Bloque 15: UT2 · Repaso de la sesión 7 · Dificultad: ★★★☆☆
#
# Pide un PID y un nuevo valor nice.
# - Valida el PID con validar_pid.
# - El valor debe ser un número entre -20 y 19.
# - Si NO eres root, solo entre 0 y 19.
# - Si todo está bien, aplica el cambio con renice y muestra
#   "Prioridad de PID (COMANDO) cambiada a VALOR".
#
# Ejemplo:
#   $ ./206_prioridad.sh
#   PID: 4310
#   Nuevo valor nice: -5
#   Error: el valor debe estar entre 0 y 19
#   $ ./206_prioridad.sh
#   PID: 4310
#   Nuevo valor nice: 10
#   Prioridad de 4310 (sleep) cambiada a 10
#
# Pista: Opción 4 de la sesión 7. [[ $EUID -eq 0 ]] para saber si eres root. Un número que puede ser negativo: ^-?[0-9]+$

# Solución:
