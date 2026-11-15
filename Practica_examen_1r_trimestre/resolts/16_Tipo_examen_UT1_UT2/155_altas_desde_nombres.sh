#!/bin/bash

# Ejercicio 155 · 155_altas_desde_nombres.sh — Altas desde una lista de nombres
# Bloque 16: Tipo examen UT1 + UT2 · Dificultad: ★★★★★
#
# Lee alumnos_nombres.txt (Nombre Apellido1 Apellido2). Para cada alumno
# genera el login (1.ª letra del nombre + apellido1 + 1.ª letra del
# apellido2, en minúsculas) y el correo login@alu.edu.gva.es. Si un login ya
# ha salido antes, añádele un 2 al final. Muestra "login -> correo".
#
# Ejemplo:
#   $ ./155_altas_desde_nombres.sh
#   lferrerm -> lferrerm@alu.edu.gva.es
#   hmartis -> hmartis@alu.edu.gva.es
#   nsolerp -> nsolerp@alu.edu.gva.es
#   jgarciar -> jgarciar@alu.edu.gva.es
#   lfernandezm -> lfernandezm@alu.edu.gva.es
#
# Pista: while read -r nombre ap1 ap2; cut -c1; tr; guarda los logins en un fichero temporal y comprueba con grep -qx.

# Solución:

f=alumnos_nombres.txt
usados=logins_usados.tmp
> "$usados"
while read -r nombre ap1 ap2; do
    login=$(echo "${nombre:0:1}$ap1${ap2:0:1}" | tr 'A-Z' 'a-z')
    if grep -qx "$login" "$usados"; then
        login="${login}2"
    fi
    echo "$login" >> "$usados"
    echo "$login -> $login@alu.edu.gva.es"
done < "$f"
rm "$usados"
