#!/bin/bash

# Ejercicio 126 · 126_cambiar_valor.sh — Cambiar un valor de configuración
# Bloque 13: sed · Dificultad: ★★★★☆
#
# Recibe una clave y un valor. Si la clave no existe en servidor.conf
# (línea que empieza por CLAVE=), error. Si existe, cámbiala con sed -i.bak
# y muestra el antes y el después.
#
# Ejemplo:
#   $ ./126_cambiar_valor.sh PUERTO 9090
#   Antes:   PUERTO=8080
#   Después: PUERTO=9090
#   $ ./126_cambiar_valor.sh NOEXISTE 1
#   Error: la clave NOEXISTE no existe
#
# Pista: grep -q "^CLAVE=", grep "^CLAVE=", sed -i.bak "s/^CLAVE=.*/CLAVE=valor/".

# Solución:

