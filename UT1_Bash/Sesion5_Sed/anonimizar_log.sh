#!/bin/bash

# Ejercicio 3. anonimizar_log.sh — Anonimizar un registro
#
# Fichero accesos.log:
#   Oct 12 08:01:12 srv sshd[1201]: Failed password for root from 185.220.101.4 port 51234 ssh2
#   Oct 12 08:02:40 srv sshd[1210]: Accepted publickey for jgarcia from 192.168.10.15 port 50122 ssh2
#   Oct 12 08:07:44 srv sshd[1322]: Failed password for invalid user admin from 45.95.147.9 port 40022 ssh2
#
# Recibe un fichero de registro y genera una copia con el mismo nombre
# terminado en .anonimo, en la que todas las direcciones IP se han sustituido
# por X.X.X.X. El fichero original no se modifica.
#
# Ejemplo:
# $ ./anonimizar_log.sh accesos.log
# Fichero anonimizado: accesos.log.anonimo
# $ cat accesos.log.anonimo
# Oct 12 08:01:12 srv sshd[1201]: Failed password for root from X.X.X.X port 51234 ssh2
# ...

# Solución:

if [ $# -eq 0 ]; then
    echo "Uso: $0 <fichero>"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: el fichero $1 no existe"
    exit 1
fi

sed -E 's/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/X.X.X.X/g' "$1" > "$1.anonimo"
echo "Fichero anonimizado: $1.anonimo"