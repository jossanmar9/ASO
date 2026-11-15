#!/bin/bash

# Ejercicio 097 · 097_limpiar_temporales.sh — Limpiar temporales
# Bloque 10: Tipo examen (solo chuleta) · Dificultad: ★★★★★
#
# Recibe un directorio y, opcionalmente, --borrar como segundo parámetro.
# Busca los ficheros que acaban en .tmp, .bak o ~. Sin --borrar, solo los
# lista (simulación). Con --borrar, los elimina. Al final, cuántos había.
#
# Ejemplo:
#   $ ./097_limpiar_temporales.sh pruebas
#   Se borraría: pruebas/a.tmp
#   Se borraría: pruebas/b.bak
#   Total: 2 (simulación; usa --borrar para eliminarlos)
#   $ ./097_limpiar_temporales.sh pruebas --borrar
#   Borrado: pruebas/a.tmp
#   Borrado: pruebas/b.bak
#   Total: 2
#
# Pista: Chuleta, apartados 3, 5, 7 (case con comodines) y 8.

# Solución:

if [[ $# -lt 1 || $# -gt 2 ]]; then
    echo "Uso: $0 directorio [--borrar]"
    exit 1
fi
dir=$1
if [[ ! -d $dir ]]; then
    echo "Error: $dir no es un directorio"
    exit 1
fi
if [[ $# -eq 2 && $2 != "--borrar" ]]; then
    echo "Error: opción $2 desconocida"
    exit 1
fi

total=0
for f in "$dir"/*; do
    if [[ -f $f ]]; then
        case $f in
            *.tmp|*.bak|*~)
                if [[ $2 == "--borrar" ]]; then
                    rm "$f"
                    echo "Borrado: $f"
                else
                    echo "Se borraría: $f"
                fi
                ((total++))
                ;;
        esac
    fi
done

if [[ $2 == "--borrar" ]]; then
    echo "Total: $total"
else
    echo "Total: $total (simulación; usa --borrar para eliminarlos)"
fi
