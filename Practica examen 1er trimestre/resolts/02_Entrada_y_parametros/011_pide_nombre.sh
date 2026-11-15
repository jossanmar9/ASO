#!/bin/bash

# Ejercicio 011 · 011_pide_nombre.sh — Pedir el nombre
# Bloque 2: Entrada y parámetros · Dificultad: ★☆☆☆☆
#
# Pide el nombre al usuario con read y salúdalo.
#
# Ejemplo:
#   $ ./011_pide_nombre.sh
#   ¿Cómo te llamas? Jose
#   Encantado, Jose
#
# Pista: Chuleta, apartado 2: read -p.

# Solución:

read -p "¿Cómo te llamas? " nombre
echo "Encantado, $nombre"
