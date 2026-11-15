#!/bin/bash

# Ejercicio 122 · 122_config_util_sed.sh — Configuración sin comentarios (sed)
# Bloque 13: sed · Dificultad: ★★★★☆
#
# Recibe un fichero de configuración y lo muestra sin comentarios ni líneas
# vacías usando un solo sed.
#
# Ejemplo:
#   $ ./122_config_util_sed.sh servidor.conf
#   PUERTO=8080
#   HOST=localhost
#   MAX_CONEXIONES=100
#   LOG=/var/log/servidor.log
#   MODO=produccion
#
# Pista: sed -n '/patrón/p' con ^[^#].

# Solución:

