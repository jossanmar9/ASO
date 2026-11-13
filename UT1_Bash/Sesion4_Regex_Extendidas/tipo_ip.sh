#!/bin/bash

# Ejercicio 5. tipo_ip.sh — Tipo de dirección IP
#
# Recibe una dirección IP como parámetro e indica de qué tipo es:
# - Loopback: empieza por 127.
# - Privada: empieza por 10., por 192.168. o por 172. seguido de un número
#   del 16 al 31.
# - Pública: cualquier otra.
# La comprobación de si es privada se hace con una sola expresión regular.
#
# Ejemplo:
# $ ./tipo_ip.sh 127.0.0.1
# 127.0.0.1 es una dirección loopback
# $ ./tipo_ip.sh 172.20.0.5
# 172.20.0.5 es una dirección privada
# $ ./tipo_ip.sh 172.32.0.1
# 172.32.0.1 es una dirección pública
# $ ./tipo_ip.sh 8.8.8.8
# 8.8.8.8 es una dirección pública
#
# Pregunta: el rango de 172.16 a 172.31 no se puede escribir con una sola clase.
# ¿Cómo lo has resuelto? Responde en un comentario al final del script.

# Solución:

if [ $# -eq 0 ]; then
    echo "Uso: $0 <dirección IP>"
    exit 1
fi

re_loopback='^127\.'
re_privada='^(10\.|192\.168\.|172\.(1[6-9]|2[0-9]|3[01])\.)'

if [[ $1 =~ $re_loopback ]]; then
    echo "$1 es una dirección loopback"
elif [[ $1 =~ $re_privada ]]; then
    echo "$1 es una dirección privada"
else
    echo "$1 es una dirección pública"
fi

# Pregunta: el rango 16-31 no se puede poner con una sola clase porque [16-31] no significa "del 16 al 31": dentro de [ ] cada carácter va solo.
# Lo he partido en tres trozos unidos con | (o):
#   1[6-9]  -> 16, 17, 18, 19
#   2[0-9]  -> 20 ... 29
#   3[01]   -> 30, 31
# Y lo he agrupado con ( ): 172\.(1[6-9]|2[0-9]|3[01])\.