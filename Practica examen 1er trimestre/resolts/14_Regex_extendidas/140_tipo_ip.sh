#!/bin/bash

# Ejercicio 140 · 140_tipo_ip.sh — Tipo de IP
# Bloque 14: Regex extendidas con =~ · Dificultad: ★★★★☆
#
# Recibe una IP. Si no tiene formato de IP, error. Si empieza por 127., es
# loopback. Si empieza por 10., 192.168. o 172.16 a 172.31, es privada (una
# sola regex). Si no, pública.
#
# Ejemplo:
#   $ ./140_tipo_ip.sh 127.0.0.1
#   127.0.0.1 es loopback
#   $ ./140_tipo_ip.sh 172.20.0.5
#   172.20.0.5 es privada
#
# Pista: ( | ) y el rango 1[6-9]|2[0-9]|3[01].

# Solución:

if [[ $# -ne 1 ]]; then
    echo "Uso: $0 IP"
    exit 1
fi
re_ip='^([0-9]{1,3}\.){3}[0-9]{1,3}$'
re_loop='^127\.'
re_priv='^(10\.|192\.168\.|172\.(1[6-9]|2[0-9]|3[01])\.)'
if [[ ! $1 =~ $re_ip ]]; then
    echo "Error: $1 no tiene formato de IP"
    exit 1
fi
if [[ $1 =~ $re_loop ]]; then
    echo "$1 es loopback"
elif [[ $1 =~ $re_priv ]]; then
    echo "$1 es privada"
else
    echo "$1 es pública"
fi
