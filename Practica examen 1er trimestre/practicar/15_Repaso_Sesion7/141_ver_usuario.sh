#!/bin/bash

# Ejercicio 141 · 141_ver_usuario.sh — Procesos de un usuario
# Bloque 15: UT2 · Repaso de la sesión 7 · Dificultad: ★☆☆☆☆
#
# Recibe un nombre de usuario como parámetro ($1).
# - Sin parámetro: muestra "Uso: ./201_ver_usuario.sh usuario" y sale con error.
# - Si el usuario no existe (compruébalo con id): "Error: el usuario X no existe".
# - Si existe: muestra sus procesos con ps (PID, %CPU y comando).
#
# Ejemplo:
#   $ ./201_ver_usuario.sh pepito
#   Error: el usuario pepito no existe
#   $ ./201_ver_usuario.sh jose
#       PID %CPU COMMAND
#      2154  0.0 bash
#      4310  0.0 sleep
#
# Pista: Opción 1 de la sesión 7. id usuario &>/dev/null para no ver la salida; ps -u usuario -o ...

# Solución:
