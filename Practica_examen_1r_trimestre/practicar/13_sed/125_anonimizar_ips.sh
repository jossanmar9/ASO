#!/bin/bash

# Ejercicio 125 · 125_anonimizar_ips.sh — Anonimizar IPs
# Bloque 13: sed · Dificultad: ★★★★☆
#
# Recibe un fichero de log y crea una copia terminada en .anonimo con las
# IPs cambiadas por X.X.X.X. El original no se toca.
#
# Ejemplo:
#   $ ./125_anonimizar_ips.sh accesos.log
#   Creado accesos.log.anonimo
#   Líneas con IP anonimizada: 8
#
# Pista: sed -E con la regex de IP, g, y > fichero.anonimo.

# Solución:

