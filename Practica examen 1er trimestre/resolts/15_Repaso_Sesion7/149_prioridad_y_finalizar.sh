#!/bin/bash

# Ejercicio 149 · 149_prioridad_y_finalizar.sh — Prioridad y finalizar con registro
# Bloque 15: UT2 · Repaso de la sesión 7 · Dificultad: ★★★★☆
#
# Junta los ejercicios 146 y 147 en un menú que se repite hasta salir:
#     1) Cambiar la prioridad de un proceso
#     2) Finalizar un proceso
#     3) Salir
# Cada opción va en su función (cambiar_prioridad y finalizar_proceso) y las dos
# usan validar_pid. Cada cambio de prioridad y cada proceso finalizado se registra
# con la función registrar en ~/gestion_procesos.log.
# Dentro de las funciones, usa return en lugar de exit.
#
# Ejemplo:
#   Opción: 1
#   PID: 4310
#   Nuevo valor nice: 10
#   Prioridad de 4310 (sleep) cambiada a 10
#   Opción: 2
#   PID: 4310
#   ¿Finalizar 4310 (sleep)? (s/n): s
#   Proceso 4310 finalizado con SIGTERM
#   Opción: 3
#   $ cat ~/gestion_procesos.log
#   2026-11-15 10:25:19 - renice 10 - 4310 - sleep
#   2026-11-15 10:25:22 - SIGTERM - 4310 - sleep
#
# Pista: ¡Cuidado! registra ANTES de matar el proceso (después ps -p ya no encuentra el comando), o guarda el comando en una variable y pásaselo.

# Solución:

LOG=~/gestion_procesos.log

validar_pid() {
    if [[ $1 =~ ^[0-9]+$ ]] && ps -p "$1" &>/dev/null; then
        return 0
    fi
    return 1
}

# recibe: acción, PID y comando
registrar() {
    echo "$(date '+%F %T') - $1 - $2 - $3" >> $LOG
}

cambiar_prioridad() {
    read -p "PID: " pid
    if ! validar_pid "$pid"; then
        echo "Error: el PID $pid no es válido o no existe"
        return 1
    fi
    read -p "Nuevo valor nice: " valor
    if [[ ! $valor =~ ^-?[0-9]+$ ]]; then
        echo "Error: $valor no es un número"
        return 1
    fi
    if [[ $EUID -eq 0 ]]; then
        minimo=-20
    else
        minimo=0
    fi
    if [[ $valor -lt $minimo || $valor -gt 19 ]]; then
        echo "Error: el valor debe estar entre $minimo y 19"
        return 1
    fi
    cmd=$(ps -p "$pid" -o comm=)
    if renice -n "$valor" -p "$pid" &>/dev/null; then
        echo "Prioridad de $pid ($cmd) cambiada a $valor"
        registrar "renice $valor" "$pid" "$cmd"
    else
        echo "Error: no se ha podido cambiar la prioridad"
        return 1
    fi
}

finalizar_proceso() {
    read -p "PID: " pid
    if ! validar_pid "$pid"; then
        echo "Error: el PID $pid no es válido o no existe"
        return 1
    fi
    cmd=$(ps -p "$pid" -o comm=)
    read -p "¿Finalizar $pid ($cmd)? (s/n): " respuesta
    if [[ $respuesta != s ]]; then
        echo "Operación cancelada"
        return 0
    fi
    kill -SIGTERM "$pid"
    sleep 3
    if validar_pid "$pid"; then
        kill -SIGKILL "$pid"
        echo "Proceso $pid finalizado con SIGKILL"
        registrar "SIGKILL" "$pid" "$cmd"
    else
        echo "Proceso $pid finalizado con SIGTERM"
        registrar "SIGTERM" "$pid" "$cmd"
    fi
}

opcion=0
while [[ $opcion != 3 ]]; do
    echo "1) Cambiar la prioridad de un proceso"
    echo "2) Finalizar un proceso"
    echo "3) Salir"
    read -p "Opción: " opcion
    case $opcion in
        1) cambiar_prioridad ;;
        2) finalizar_proceso ;;
        3) echo "Adiós" ;;
        *) echo "Opción no válida" ;;
    esac
done
