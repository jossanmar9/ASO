#!/bin/bash

# Ejercicio 2. validar_mac.sh — Validar una dirección MAC
#
# Recibe una dirección MAC como parámetro e indica si es válida. Una MAC válida
# tiene seis pares de dígitos hexadecimales (del 0 al 9 y de la a a la f, en
# mayúsculas o minúsculas) separados por : o por -.
# La comprobación se hace con una sola expresión regular.
#
# Ejemplo:
# $ ./validar_mac.sh 08:00:27:3a:1f:01
# 08:00:27:3a:1f:01 es una MAC válida
# $ ./validar_mac.sh 08-00-27-3A-1F-02
# 08-00-27-3A-1F-02 es una MAC válida
# $ ./validar_mac.sh 08:00:27:3a:1f:4
# 08:00:27:3a:1f:4 no es una MAC válida
# $ ./validar_mac.sh 08:00:27:3a:1f:0g
# 08:00:27:3a:1f:0g no es una MAC válida

# Solución:

if [ $# -eq 0 ]; then
    echo "Uso: $0 <dirección MAC>"
    exit 1
fi

re_mac='^([0-9a-fA-F]{2}[:-]){5}[0-9a-fA-F]{2}$'

if [[ $1 =~ $re_mac ]]; then
    echo "$1 es una MAC válida"
else
    echo "$1 no es una MAC válida"
fi