#!/bin/bash

# Ejercicio 160 · 160_gestor_hosts.sh — Gestor de hosts
# Bloque 16: Tipo examen UT1 + UT2 · Dificultad: ★★★★★
#
# Gestiona hosts.txt (líneas "IP nombre"). Menú que se repite, cada opción
# en su función:
# 1) Listar.
# 2) Añadir: pide IP (regex de IP) y nombre (minúsculas, cifras y guiones).
#    Si el nombre ya existe (palabra completa al final de la línea), error.
# 3) Buscar: pide un nombre y muestra su IP o "no encontrado".
# 4) Borrar: pide un nombre; si existe, bórralo con sed -i.bak.
# 5) Salir.
#
# Ejemplo:
#   Opción: 2
#   IP: 192.168.1.30
#   Nombre: portatil
#   Host añadido
#   Opción: 3
#   Nombre: portatil
#   portatil -> 192.168.1.30
#   Opción: 4
#   Nombre: impresora
#   impresora borrado
#
# Pista: grep -q " nombre$", grep | cut -d' ' -f1, sed -i.bak "/ nombre$/d", echo >> fichero.

# Solución:

HOSTS=hosts.txt
re_ip='^([0-9]{1,3}\.){3}[0-9]{1,3}$'
re_nombre='^[a-z0-9-]+$'

existe() {
    grep -q " $1$" "$HOSTS"
}

listar() {
    cat "$HOSTS"
}

anadir() {
    read -p "IP: " ip
    read -p "Nombre: " nombre
    if [[ ! $ip =~ $re_ip ]]; then
        echo "Error: $ip no es una IP"
        return 1
    fi
    if [[ ! $nombre =~ $re_nombre ]]; then
        echo "Error: nombre no válido"
        return 1
    fi
    if existe "$nombre"; then
        echo "Error: $nombre ya existe"
        return 1
    fi
    echo "$ip $nombre" >> "$HOSTS"
    echo "Host añadido"
}

buscar() {
    read -p "Nombre: " nombre
    if existe "$nombre"; then
        echo "$nombre -> $(grep " $nombre$" "$HOSTS" | cut -d' ' -f1)"
    else
        echo "$nombre no encontrado"
    fi
}

borrar() {
    read -p "Nombre: " nombre
    if ! existe "$nombre"; then
        echo "$nombre no encontrado"
        return 1
    fi
    sed -i.bak "/ $nombre$/d" "$HOSTS"
    echo "$nombre borrado"
}

opcion=0
while [[ $opcion != 5 ]]; do
    echo
    echo "1) Listar  2) Añadir  3) Buscar  4) Borrar  5) Salir"
    read -p "Opción: " opcion
    case $opcion in
        1) listar ;;
        2) anadir ;;
        3) buscar ;;
        4) borrar ;;
        5) echo "Adiós" ;;
        *) echo "Opción no válida" ;;
    esac
done
