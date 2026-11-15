#!/bin/bash

# Ejercicio 151 · 151_informe_log.sh — Informe de un log
# Bloque 16: Tipo examen UT1 + UT2 · Dificultad: ★★★★★
#
# Recibe un fichero de log (formato de sistema.log). Muestra: total de
# líneas, cuántas por nivel (INFO, WARNING, ERROR), el primer y el último
# ERROR y la lista de horas (solo HH:MM:SS) en las que hubo errores.
#
# Ejemplo:
#   $ ./151_informe_log.sh sistema.log
#   Líneas: 10
#   INFO: 4
#   WARNING: 2
#   ERROR: 3
#   Primer error: 2026-11-10 08:07:44 ERROR No se puede conectar con la base de datos
#   Último error: 2026-11-10 11:45:51 ERROR Disco lleno en /var
#   Horas con error:
#   08:07:44
#   ...
#
# Pista: wc -l, grep -c, grep | head -n 1, grep | tail -n 1, grep | cut -d' ' -f2.

# Solución:

if [[ ! -f $1 ]]; then
    echo "Uso: $0 fichero_log"
    exit 1
fi
echo "Líneas: $(wc -l < "$1")"
for nivel in INFO WARNING ERROR; do
    echo "$nivel: $(grep -c "$nivel" "$1")"
done
echo "Primer error: $(grep "ERROR" "$1" | head -n 1)"
echo "Último error: $(grep "ERROR" "$1" | tail -n 1)"
echo "Horas con error:"
grep "ERROR" "$1" | cut -d' ' -f2
