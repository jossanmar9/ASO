#!/bin/bash

# Ejercicio 160 · 160_gestor_hosts.sh — Gestor de hosts
# Bloque 16: Tipo examen UT1 + UT2 · Dificultad: ★★★★★
#
# Gestiona hosts.txt (líneas "IP nombre"). Menú que se repite, cada opción
# en su función:
# 1) Listar.
# 2) Añadir: pide IP (regex de IP) y nombre (minúsculas, cifras y guiones).
#    Si el nombre ya existe (palabra completa al final de la línea), error.
# 3) Buscar: pide un nombre y muestra su IP o "no encontrado".
# 4) Borrar: pide un nombre; si existe, bórralo con sed -i.bak.
# 5) Salir.
#
# Ejemplo:
#   Opción: 2
#   IP: 192.168.1.30
#   Nombre: portatil
#   Host añadido
#   Opción: 3
#   Nombre: portatil
#   portatil -> 192.168.1.30
#   Opción: 4
#   Nombre: impresora
#   impresora borrado
#
# Pista: grep -q " nombre$", grep | cut -d' ' -f1, sed -i.bak "/ nombre$/d", echo >> fichero.

# Solución:

