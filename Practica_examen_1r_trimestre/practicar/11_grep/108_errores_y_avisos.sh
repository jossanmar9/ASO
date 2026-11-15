#!/bin/bash

# Ejercicio 108 · 108_errores_y_avisos.sh — Errores o avisos
# Bloque 11: grep · Dificultad: ★★★☆☆
#
# Recibe un fichero de log y muestra las líneas que tienen ERROR o WARNING
# con un solo grep.
#
# Ejemplo:
#   $ ./108_errores_y_avisos.sh sistema.log
#   2026-11-10 08:05:40 WARNING Uso de disco al 85%
#   2026-11-10 08:07:44 ERROR No se puede conectar con la base de datos
#   2026-11-10 09:15:22 ERROR Tiempo de espera agotado en /api/login
#   2026-11-10 11:02:17 WARNING Memoria al 90%
#   2026-11-10 11:45:51 ERROR Disco lleno en /var
#
# Pista: grep -E y el operador | (o).

# Solución:

