#!/bin/bash

# Ejercicio 084 · 084_existen_ficheros.sh — ¿Existen estos ficheros?
# Bloque 9: Funciones · Dificultad: ★★★★★
#
# Crea una función existe (como la de la chuleta). Recorre todos los
# parámetros y di para cada uno si existe como fichero o no.
#
# Ejemplo:
#   $ ./084_existen_ficheros.sh /etc/passwd /noexiste
#   /etc/passwd: sí
#   /noexiste: no
#
# Pista: Chuleta, apartados 8 y 9.

# Solución:

existe() {
    if [[ -f $1 ]]; then
        return 0
    else
        return 1
    fi
}

for f in "$@"; do
    if existe "$f"; then
        echo "$f: sí"
    else
        echo "$f: no"
    fi
done
