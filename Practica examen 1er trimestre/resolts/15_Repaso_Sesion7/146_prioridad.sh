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

validar_pid() {
    if [[ $1 =~ ^[0-9]+$ ]] && ps -p "$1" &>/dev/null; then
        return 0
    fi
    return 1
}

read -p "PID: " pid
if ! validar_pid "$pid"; then
    echo "Error: el PID $pid no es válido o no existe"
    exit 1
fi

read -p "Nuevo valor nice: " valor
if [[ ! $valor =~ ^-?[0-9]+$ ]]; then
    echo "Error: $valor no es un número"
    exit 1
fi

# root puede bajar hasta -20, un usuario normal solo desde 0
if [[ $EUID -eq 0 ]]; then
    minimo=-20
else
    minimo=0
fi

if [[ $valor -lt $minimo || $valor -gt 19 ]]; then
    echo "Error: el valor debe estar entre $minimo y 19"
    exit 1
fi

cmd=$(ps -p "$pid" -o comm=)
if renice -n "$valor" -p "$pid" &>/dev/null; then
    echo "Prioridad de $pid ($cmd) cambiada a $valor"
else
    echo "Error: no se ha podido cambiar la prioridad"
    exit 1
fi
