#!/bin/bash

# Ejercicio 159 · 159_config_menu.sh — Menú de configuración
# Bloque 16: Tipo examen UT1 + UT2 · Dificultad: ★★★★★
#
# Menú que se repite sobre servidor.conf: 1) Ver la configuración activa
# (sin comentarios ni vacías). 2) Cambiar el puerto: pide un número, comprueba
# con regex que son cifras y que está entre 1 y 65535, y cámbialo con
# sed -i.bak. 3) Ver una clave: pide la clave y muestra su valor (cut -d=
# -f2) o "no existe". 4) Salir. Cada opción en su función.
#
# Ejemplo:
#   Opción: 2
#   Nuevo puerto: 70000
#   Error: el puerto debe estar entre 1 y 65535
#   Opción: 2
#   Nuevo puerto: 9090
#   Puerto cambiado a 9090
#   Opción: 3
#   Clave: PUERTO
#   PUERTO = 9090
#
# Pista: sed -n '/^[^#]/p', sed -i.bak, grep -q "^CLAVE=", cut -d= -f2, while + case, funciones.

# Solución:

CONF=servidor.conf

ver_config() {
    sed -n '/^[^#]/p' "$CONF"
}

cambiar_puerto() {
    read -p "Nuevo puerto: " p
    if [[ ! $p =~ ^[0-9]+$ ]]; then
        echo "Error: $p no es un número"
        return 1
    fi
    if [[ $p -lt 1 || $p -gt 65535 ]]; then
        echo "Error: el puerto debe estar entre 1 y 65535"
        return 1
    fi
    sed -i.bak "s/^PUERTO=.*/PUERTO=$p/" "$CONF"
    echo "Puerto cambiado a $p"
}

ver_clave() {
    read -p "Clave: " clave
    if grep -q "^$clave=" "$CONF"; then
        echo "$clave = $(grep "^$clave=" "$CONF" | cut -d= -f2)"
    else
        echo "La clave $clave no existe"
    fi
}

opcion=0
while [[ $opcion != 4 ]]; do
    echo
    echo "1) Ver configuración  2) Cambiar puerto  3) Ver clave  4) Salir"
    read -p "Opción: " opcion
    case $opcion in
        1) ver_config ;;
        2) cambiar_puerto ;;
        3) ver_clave ;;
        4) echo "Adiós" ;;
        *) echo "Opción no válida" ;;
    esac
done
