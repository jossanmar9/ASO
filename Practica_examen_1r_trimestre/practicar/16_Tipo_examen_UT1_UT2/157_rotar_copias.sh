#!/bin/bash

# Ejercicio 157 · 157_rotar_copias.sh — Rotación de copias
# Bloque 16: Tipo examen UT1 + UT2 · Dificultad: ★★★★★
#
# Recibe un directorio de copias y un máximo N. Las copias se llaman
# etc-AAAAMMDD-HHMMSS.tar.gz. Cuenta solo los ficheros que cumplen ese formato
# (regex). Si hay más de N, muestra cuáles se borrarían (las más antiguas:
# como la fecha va en el nombre, basta con ordenar los nombres).
# Para probarlo, crea copias de ejemplo con touch.
#
# Ejemplo:
#   $ ./157_rotar_copias.sh __copias 2
#   Copias encontradas: 4
#   Se borrarían las 2 más antiguas:
#   etc-20261110-210000.tar.gz
#   etc-20261111-210000.tar.gz
#   $ ./157_rotar_copias.sh __copias 9
#   Copias encontradas: 4
#   No hay que borrar nada
#
# Pista: for + regex con {8} {6}; ls | grep -E | sort | head -n (sobran).

# Solución:

