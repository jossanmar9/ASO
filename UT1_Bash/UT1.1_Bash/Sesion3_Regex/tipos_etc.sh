#!/bin/bash

# Ejercicio 2. tipos_etc.sh — Tipos de fichero en /etc
#
# Recorre los ficheros de /etc y cuenta cuántos hay de cada tipo
# según cómo termina su nombre:
# - Configuración: terminan en .conf
# - Copias de seguridad: terminan en .bak o en ~
# Al final, muestra la lista de ficheros .conf y los dos totales.
#
# Ejemplo:
# $ ./tipos_etc.sh
# Ficheros de configuración:
#   /etc/adduser.conf
#   /etc/ca-certificates.conf
#   ...
# ----
# Configuración: 34
# Copias de seguridad: 1
#
# Ayuda: for fichero in /etc/*; do ... done

# Solución:

re_conf='\.conf$'
re_bak='\.bak$'
re_tilde='~$'

conf=0
copias=0

echo "Ficheros de configuración:"

for fichero in /etc/*; do
    if [ -f "$fichero" ]; then
        if [[ $fichero =~ $re_conf ]]; then
            echo "  $fichero"
            conf=$(( conf + 1 ))
        elif [[ $fichero =~ $re_bak ]]; then
            copias=$(( copias + 1 ))
        elif [[ $fichero =~ $re_tilde ]]; then
            copias=$(( copias + 1 ))
        fi
    fi
done

echo "----"
echo "Configuración: $conf"
echo "Copias de seguridad: $copias"