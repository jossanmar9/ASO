#!/bin/bash

# Ejercicio 161 · 161_procesos_por_usuario.sh — Procesos de una lista de usuarios
# Bloque 16: Tipo examen UT1 + UT2 · Dificultad: ★★★★☆
#
# Recibe como parámetro un fichero con un nombre de usuario por línea
# (prueba con usuarios_proc.txt y añádele tu usuario).
# - Sin parámetro: "Uso: ./161_procesos_por_usuario.sh fichero".
# - Si el fichero no existe: "Error: el fichero X no existe".
# Para cada línea del fichero:
# - Si está vacía, se la salta.
# - Si el usuario no existe (id): "X: no existe".
# - Si existe: "X: N procesos" (cuenta sus procesos).
# Al final: "Usuarios revisados: N" (solo los que no estaban vacíos).
#
# Ejemplo:
#   $ ./161_procesos_por_usuario.sh usuarios_proc.txt
#   root: 42 procesos
#   pepito: no existe
#   nobody: 0 procesos
#   daemon: 0 procesos
#   Usuarios revisados: 4
#
# Pista: Leer un fichero línea a línea con while (chuleta, bucles). id y ps -u de la sesión 7. Para que ps no saque cabecera: -o pid= ; y para contar líneas: wc -l.

# Solución:
