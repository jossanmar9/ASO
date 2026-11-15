#!/bin/bash

# Ejercicio 154 · 154_auditoria_ssh.sh — Auditoría de SSH
# Bloque 16: Tipo examen UT1 + UT2 · Dificultad: ★★★★★
#
# De accesos.log: cuántos intentos fallidos (Failed) y aceptados
# (Accepted) hay; los fallidos por IP de más a menos; y las IPs con 2 o más
# fallos marcadas como sospechosas.
#
# Ejemplo:
#   $ ./154_auditoria_ssh.sh
#   Fallidos: 6
#   Aceptados: 2
#   Fallidos por IP:
#         3 185.220.101.4
#         2 45.95.147.9
#         1 192.168.10.15
#   Sospechosas:
#     185.220.101.4 (3 fallos)
#     45.95.147.9 (2 fallos)
#
# Pista: grep -c, grep Failed | grep -oE regex IP | sort | uniq -c | sort -nr, y un while read para las sospechosas.

# Solución:

f=accesos.log
if [[ ! -f $f ]]; then
    echo "Error: no está $f"
    exit 1
fi
re_ip='[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
echo "Fallidos: $(grep -c "Failed" "$f")"
echo "Aceptados: $(grep -c "Accepted" "$f")"
echo "Fallidos por IP:"
grep "Failed" "$f" | grep -oE "$re_ip" | sort | uniq -c | sort -nr
echo "Sospechosas:"
grep "Failed" "$f" | grep -oE "$re_ip" | sort | uniq -c | while read -r veces ip; do
    if [[ $veces -ge 2 ]]; then
        echo "  $ip ($veces fallos)"
    fi
done
