#!/bin/bash

# Ejercicio 1. config_limpia.sh — Configuración limpia
#
# Recibe un fichero de configuración y lo muestra sin comentarios ni líneas
# vacías, usando un solo sed.
# - Si no recibe ningún parámetro, muestra un mensaje de uso y termina.
# - Si el fichero no existe, muestra un error y termina.
#
# Ejemplo:
# $ ./config_limpia.sh login.defs
# MAIL_DIR        /var/mail
# FAILLOG_ENAB    yes
# ...
#
# Trabajar siempre en ~/lab-sed, sobre copias de los ficheros:
#   mkdir ~/lab-sed && cd ~/lab-sed && cp /etc/login.defs .

# Solución:

if [ $# -eq 0 ]; then
    echo "Uso: $0 <fichero>"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: el fichero $1 no existe"
    exit 1
fi

sed -n '/^[^#]/p' "$1"