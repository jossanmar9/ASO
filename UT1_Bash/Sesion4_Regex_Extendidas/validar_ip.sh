#!/bin/bash

# Ejercicio 1. validar_ip.sh — Formato de una dirección IP
#
# Recibe una dirección IPv4 como parámetro e indica si tiene el formato
# correcto: cuatro números de 1 a 3 cifras separados por puntos.
# - Si no recibe ningún parámetro, muestra un mensaje de uso y termina.
# - La comprobación se hace con una sola expresión regular.
#
# Ejemplo:
# $ ./validar_ip.sh 192.168.10.1
# 192.168.10.1 tiene formato de IP
# $ ./validar_ip.sh 192.168.1
# 192.168.1 no tiene formato de IP
# $ ./validar_ip.sh 1.2.3.4.5
# 1.2.3.4.5 no tiene formato de IP
# $ ./validar_ip.sh 192.168.1.a
# 192.168.1.a no tiene formato de IP
#
# Pregunta: ¿qué responde tu script con 999.999.999.999? ¿Es una IP válida?
# Responde en un comentario al final del script.

# Solución:

if [ $# -eq 0 ]; then
    echo "Uso: $0 <dirección IP>"
    exit 1
fi

re_ip='^([0-9]{1,3}\.){3}[0-9]{1,3}$'

if [[ $1 =~ $re_ip ]]; then
    echo "$1 tiene formato de IP"
else
    echo "$1 no tiene formato de IP"
fi

# Pregunta: con 999.999.999.999 el script responde "tiene formato de IP", porque son cuatro números de 1 a 3 cifras separados por puntos. Pero NO es una IP válida: cada número de una IPv4 tiene que estar entre 0 y 255.
# El script solo comprueba el FORMATO, no los valores.
