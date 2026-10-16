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
