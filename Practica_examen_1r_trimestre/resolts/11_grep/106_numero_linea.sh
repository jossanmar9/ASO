#!/bin/bash

# Ejercicio 106 · 106_numero_linea.sh — ¿En qué línea está?
# Bloque 11: grep · Dificultad: ★★★☆☆
#
# Recibe un fichero y una palabra y muestra las líneas que la contienen con
# su número de línea delante. Si no aparece, avísalo.
#
# Ejemplo:
#   $ ./106_numero_linea.sh sistema.log ERROR
#   3:2026-11-10 08:07:44 ERROR No se puede conectar con la base de datos
#   5:2026-11-10 09:15:22 ERROR Tiempo de espera agotado en /api/login
#   8:2026-11-10 11:45:51 ERROR Disco lleno en /var
#   $ ./106_numero_linea.sh sistema.log CRITICAL
#   CRITICAL no aparece en sistema.log
#
# Pista: man grep: busca la opción que muestra el número de línea.

# Solución:

if [[ $# -ne 2 || ! -f $1 ]]; then
    echo "Uso: $0 fichero palabra"
    exit 1
fi
if ! grep -n "$2" "$1"; then
    echo "$2 no aparece en $1"
fi
