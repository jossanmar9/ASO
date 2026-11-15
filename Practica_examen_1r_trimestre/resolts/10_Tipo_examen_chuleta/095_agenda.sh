#!/bin/bash

# Ejercicio 095 · 095_agenda.sh — Agenda de teléfonos
# Bloque 10: Tipo examen (solo chuleta) · Dificultad: ★★★★★
#
# Agenda guardada en agenda.txt (en la carpeta actual), una línea por
# contacto con el formato nombre:telefono. Menú que se repite:
# 1) Añadir: pide nombre (no vacío) y teléfono (exactamente 9 cifras) y lo
#    añade al final del fichero (echo "..." >> agenda.txt).
# 2) Listar: muestra todos los contactos ("nombre - telefono"), o avisa si
#    no hay ninguno.
# 3) Buscar: pide un nombre y muestra su teléfono, o "No encontrado".
# 4) Salir.
# Cada opción en su propia función.
#
# Ejemplo:
#   Opción: 1
#   Nombre: ana
#   Teléfono: 612345678
#   Contacto añadido
#   Opción: 3
#   Nombre a buscar: ana
#   ana - 612345678
#
# Pista: Chuleta, apartados 5, 6 (${#t}), 7, 8 (IFS=: read) y 9.

# Solución:

AGENDA=agenda.txt

anadir() {
    read -p "Nombre: " nombre
    read -p "Teléfono: " tel
    if [[ -z $nombre ]]; then
        echo "Error: el nombre no puede estar vacío"
        return 1
    fi
    if [[ ! $tel =~ ^[0-9]+$ || ${#tel} -ne 9 ]]; then
        echo "Error: el teléfono debe tener 9 cifras"
        return 1
    fi
    echo "$nombre:$tel" >> "$AGENDA"
    echo "Contacto añadido"
}

listar() {
    if [[ ! -s $AGENDA ]]; then
        echo "La agenda está vacía"
        return 1
    fi
    while IFS=: read -r nombre tel; do
        echo "$nombre - $tel"
    done < "$AGENDA"
}

buscar() {
    read -p "Nombre a buscar: " buscado
    encontrado=no
    if [[ -f $AGENDA ]]; then
        while IFS=: read -r nombre tel; do
            if [[ $nombre == $buscado ]]; then
                echo "$nombre - $tel"
                encontrado=si
            fi
        done < "$AGENDA"
    fi
    if [[ $encontrado == no ]]; then
        echo "No encontrado"
    fi
}

opcion=0
while [[ $opcion != 4 ]]; do
    echo
    echo "1) Añadir  2) Listar  3) Buscar  4) Salir"
    read -p "Opción: " opcion
    case $opcion in
        1) anadir ;;
        2) listar ;;
        3) buscar ;;
        4) echo "Adiós" ;;
        *) echo "Opción no válida" ;;
    esac
done
