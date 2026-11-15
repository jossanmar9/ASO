#!/bin/bash

# Ejercicio 150 · 150_vigilar_procesos.sh — Vigilancia de procesos (tipo examen)
# Bloque 15: UT2 · Repaso de la sesión 7 · Dificultad: ★★★★★
#
# Script parecido a la práctica de la sesión 7, pero no igual. Menú que se
# repite hasta salir:
#     ===== VIGILANCIA DE PROCESOS =====
#     1) Ver los procesos de un usuario ordenados por CPU
#     2) Ver el nombre de un proceso a partir de su PID
#     3) Bajar la prioridad de un proceso
#     4) Finalizar un proceso
#     5) Ver el registro
#     6) Salir
#     Opción:
# - Cada opción en su función; case dentro de un while.
# - Opción 1: comprueba que el usuario existe (id) y muestra sus procesos
#   ordenados por CPU (ps con --sort).
# - Opciones 2, 3 y 4 usan validar_pid.
# - Opción 3: el valor nice debe estar entre 0 y 19, aunque seas root.
# - Opciones 3 y 4 registran lo que hacen en ~/vigilancia.log con el formato
#   "fecha hora - acción - PID - comando".
# - Opción 5: si el fichero no existe (-f): "Todavía no hay registro".
# - Opción incorrecta: "Opción no válida".
#
# Ejemplo:
#   Opción: 5
#   Todavía no hay registro
#   Opción: 1
#   Usuario: jose
#       PID %CPU COMMAND
#      2154  0.3 bash
#      4310  0.0 sleep
#   Opción: 3
#   PID: 4310
#   Nuevo valor nice: 15
#   Prioridad de 4310 (sleep) cambiada a 15
#   Opción: 5
#   2026-11-15 10:30:02 - renice 15 - 4310 - sleep
#
# Pista: Es la sesión 7 con cambios. Reaprovecha tus funciones de 149 y adapta lo que cambia.

# Solución:

LOG=~/vigilancia.log

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

procesos_usuario() {
    read -p "Usuario: " usuario
    if ! id "$usuario" &>/dev/null; then
        echo "Error: el usuario $usuario no existe"
        return 1
    fi
    ps -u "$usuario" -o pid,%cpu,comm --sort=-%cpu
}

nombre_pid() {
    read -p "PID: " pid
    if ! validar_pid "$pid"; then
        echo "Error: el PID $pid no es válido o no existe"
        return 1
    fi
    echo "El proceso $pid es $(ps -p "$pid" -o comm=)"
}

bajar_prioridad() {
    read -p "PID: " pid
    if ! validar_pid "$pid"; then
        echo "Error: el PID $pid no es válido o no existe"
        return 1
    fi
    read -p "Nuevo valor nice: " valor
    if [[ ! $valor =~ ^[0-9]+$ || $valor -gt 19 ]]; then
        echo "Error: el valor debe estar entre 0 y 19"
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

ver_registro() {
    if [[ ! -f $LOG ]]; then
        echo "Todavía no hay registro"
        return 0
    fi
    cat $LOG
}

opcion=0
while [[ $opcion != 6 ]]; do
    echo
    echo "===== VIGILANCIA DE PROCESOS ====="
    echo "1) Ver los procesos de un usuario ordenados por CPU"
    echo "2) Ver el nombre de un proceso a partir de su PID"
    echo "3) Bajar la prioridad de un proceso"
    echo "4) Finalizar un proceso"
    echo "5) Ver el registro"
    echo "6) Salir"
    read -p "Opción: " opcion
    case $opcion in
        1) procesos_usuario ;;
        2) nombre_pid ;;
        3) bajar_prioridad ;;
        4) finalizar_proceso ;;
        5) ver_registro ;;
        6) echo "Adiós" ;;
        *) echo "Opción no válida" ;;
    esac
done
