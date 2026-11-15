#!/bin/bash

# Ejercicio 162 · 162_prioridad_por_nombre.sh — Bajar la prioridad de todos los procesos con un nombre
# Bloque 16: Tipo examen UT1 + UT2 · Dificultad: ★★★★★
#
# Recibe dos parámetros: el nombre de un proceso y un valor nice.
# - Si no recibe 2 parámetros: "Uso: ./162_prioridad_por_nombre.sh nombre valor".
# - El valor debe ser un número entre 0 y 19; si no: "Error: el valor debe estar entre 0 y 19".
# - Si no hay ningún proceso con ese nombre: "No hay ningún proceso que coincida con X".
# Para cada proceso con ese nombre cambia la prioridad con renice y muestra
# "PID X: prioridad cambiada a V" (o "PID X: no se ha podido cambiar").
# Cada cambio se registra con una función registrar en ~/prioridades.log
# con el formato "fecha hora - renice V - PID - comando".
# Al final: "Procesos cambiados: N".
#
# Ejemplo:
#   $ sleep 1000 & sleep 1000 &
#   $ ./162_prioridad_por_nombre.sh sleep 10
#   PID 4310: prioridad cambiada a 10
#   PID 4311: prioridad cambiada a 10
#   Procesos cambiados: 2
#   $ cat ~/prioridades.log
#   2026-11-15 10:25:19 - renice 10 - 4310 - sleep
#   2026-11-15 10:25:19 - renice 10 - 4311 - sleep
#
# Pista: Validar con =~ (bloque 14). ps -C nombre de la sesión 7, con -o pid= para tener solo los PID, y recórrelos con for pid in $( ... ). renice y registrar como en la sesión 7.

# Solución:

LOG=~/prioridades.log

# recibe: acción y PID
registrar() {
    cmd=$(ps -p "$2" -o comm=)
    echo "$(date '+%F %T') - $1 - $2 - $cmd" >> $LOG
}

if [[ $# -ne 2 ]]; then
    echo "Uso: $0 nombre valor"
    exit 1
fi

nombre=$1
valor=$2

if [[ ! $valor =~ ^[0-9]+$ || $valor -gt 19 ]]; then
    echo "Error: el valor debe estar entre 0 y 19"
    exit 1
fi

if ! ps -C "$nombre" &>/dev/null; then
    echo "No hay ningún proceso que coincida con $nombre"
    exit 1
fi

cambiados=0
for pid in $(ps -C "$nombre" -o pid=); do
    if renice -n "$valor" -p "$pid" &>/dev/null; then
        echo "PID $pid: prioridad cambiada a $valor"
        registrar "renice $valor" "$pid"
        cambiados=$(( cambiados + 1 ))
    else
        echo "PID $pid: no se ha podido cambiar"
    fi
done

echo "Procesos cambiados: $cambiados"
