#!/bin/bash

# Ejercicio 147 · 147_finalizar.sh — Finalizar un proceso
# Bloque 15: UT2 · Repaso de la sesión 7 · Dificultad: ★★★☆☆
#
# Pide un PID, lo valida y pregunta "¿Finalizar PID (COMANDO)? (s/n): ".
# - Si la respuesta no es s: "Operación cancelada".
# - Si es s: envía SIGTERM, espera 3 segundos y, si el proceso sigue vivo,
#   envía SIGKILL. Al final indica con qué señal ha terminado.
#
# Ejemplo:
#   $ ./207_finalizar.sh
#   PID: 4310
#   ¿Finalizar 4310 (sleep)? (s/n): s
#   Proceso 4310 finalizado con SIGTERM
#
# Pista: Opción 5 de la sesión 7. kill -SIGTERM, sleep 3, y para saber si sigue vivo: ps -p (o tu validar_pid).

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

cmd=$(ps -p "$pid" -o comm=)
read -p "¿Finalizar $pid ($cmd)? (s/n): " respuesta
if [[ $respuesta != s ]]; then
    echo "Operación cancelada"
    exit 0
fi

kill -SIGTERM "$pid"
sleep 3

if validar_pid "$pid"; then
    kill -SIGKILL "$pid"
    echo "Proceso $pid finalizado con SIGKILL"
else
    echo "Proceso $pid finalizado con SIGTERM"
fi
