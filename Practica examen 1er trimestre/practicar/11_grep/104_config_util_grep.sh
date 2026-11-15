#!/bin/bash

# Ejercicio 104 · 104_config_util_grep.sh — Configuración sin comentarios (grep)
# Bloque 11: grep · Dificultad: ★★★☆☆
#
# Recibe un fichero de configuración y muestra solo las líneas útiles: sin
# comentarios (empiezan por #) y sin líneas vacías. Usa grep.
#
# Ejemplo:
#   $ ./104_config_util_grep.sh servidor.conf
#   PUERTO=8080
#   HOST=localhost
#   MAX_CONEXIONES=100
#   LOG=/var/log/servidor.log
#   MODO=produccion
#
# Pista: grep -v (las que NO cumplen), ^# y ^$.

# Solución:

