#!/bin/bash

# Ejercicio 142 · 142_buscar.sh — Buscar un proceso por nombre
# Bloque 15: UT2 · Repaso de la sesión 7 · Dificultad: ★★☆☆☆
#
# Pide el nombre de un proceso con read -p.
# - Si el nombre está vacío: "Error: no has escrito ningún nombre".
# - Si no hay ningún proceso con ese nombre: "No hay ningún proceso que coincida con X".
# - Si hay: muestra PID, usuario, %CPU y comando.
#
# Ejemplo:
#   $ ./202_buscar.sh
#   Nombre del proceso: firefox
#   No hay ningún proceso que coincida con firefox
#   $ ./202_buscar.sh
#   Nombre del proceso: sleep
#       PID USER     %CPU CMD
#      4310 jose      0.0 sleep 1000
#
# Pista: Opción 2 de la sesión 7. ps -C nombre devuelve error (if !) si no encuentra nada.

# Solución:

read -p "Nombre del proceso: " nombre

if [[ -z $nombre ]]; then
    echo "Error: no has escrito ningún nombre"
    exit 1
fi

if ! ps -C "$nombre" &>/dev/null; then
    echo "No hay ningún proceso que coincida con $nombre"
    exit 1
fi

ps -C "$nombre" -o pid,user,%cpu,cmd
