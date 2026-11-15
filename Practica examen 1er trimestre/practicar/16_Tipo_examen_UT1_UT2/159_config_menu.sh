#!/bin/bash

# Ejercicio 159 · 159_config_menu.sh — Menú de configuración
# Bloque 16: Tipo examen UT1 + UT2 · Dificultad: ★★★★★
#
# Menú que se repite sobre servidor.conf: 1) Ver la configuración activa
# (sin comentarios ni vacías). 2) Cambiar el puerto: pide un número, comprueba
# con regex que son cifras y que está entre 1 y 65535, y cámbialo con
# sed -i.bak. 3) Ver una clave: pide la clave y muestra su valor (cut -d=
# -f2) o "no existe". 4) Salir. Cada opción en su función.
#
# Ejemplo:
#   Opción: 2
#   Nuevo puerto: 70000
#   Error: el puerto debe estar entre 1 y 65535
#   Opción: 2
#   Nuevo puerto: 9090
#   Puerto cambiado a 9090
#   Opción: 3
#   Clave: PUERTO
#   PUERTO = 9090
#
# Pista: sed -n '/^[^#]/p', sed -i.bak, grep -q "^CLAVE=", cut -d= -f2, while + case, funciones.

# Solución:

