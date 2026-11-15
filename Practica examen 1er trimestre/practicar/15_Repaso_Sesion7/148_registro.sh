#!/bin/bash

# Ejercicio 148 · 148_registro.sh — La función registrar
# Bloque 15: UT2 · Repaso de la sesión 7 · Dificultad: ★★☆☆☆
#
# Crea una función registrar que reciba dos parámetros: la acción y el PID.
# Añade al fichero ~/prueba.log una línea con el formato:
#     fecha hora - acción - PID - comando
# Llámala dos veces con el PID de un sleep (acciones "renice 10" y "SIGTERM")
# y después muestra el fichero con cat.
#
# Ejemplo:
#   $ sleep 1000 &
#   [1] 4310
#   $ ./208_registro.sh 4310
#   2026-11-15 10:25:19 - renice 10 - 4310 - sleep
#   2026-11-15 10:25:19 - SIGTERM - 4310 - sleep
#
# Pista: Punto 8 de la sesión 7. date '+%F %T' da la fecha y la hora. >> añade sin borrar.

# Solución:
