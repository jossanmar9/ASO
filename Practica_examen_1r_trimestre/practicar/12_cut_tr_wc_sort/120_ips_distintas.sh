#!/bin/bash

# Ejercicio 120 · 120_ips_distintas.sh — IPs distintas
# Bloque 12: cut, tr, wc, sort · Dificultad: ★★★☆☆
#
# De accesos.log, saca todas las direcciones IP, muestra las distintas
# (sin repetir) y cuántas son.
#
# Ejemplo:
#   $ ./120_ips_distintas.sh
#   185.220.101.4
#   192.168.10.15
#   192.168.10.20
#   45.95.147.9
#   ----
#   IPs distintas: 4
#
# Pista: man grep: -o (solo lo que coincide) con -E y la regex de una IP; sort -u.

# Solución:

