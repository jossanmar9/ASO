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

