#!/bin/bash

# Ejercicio 100 · 100_gestor_tareas.sh — Gestor de tareas
# Bloque 10: Tipo examen (solo chuleta) · Dificultad: ★★★★★
#
# Lista de tareas en tareas.txt (carpeta actual), una por línea. Menú que se
# repite, cada opción en su función:
# 1) Añadir: pide la tarea (no vacía) y la añade al final del fichero.
# 2) Listar: muestra las tareas numeradas, o "No hay tareas".
# 3) Contar: muestra cuántas tareas hay.
# 4) Borrar todas: pide confirmación (s/n) y vacía el fichero.
# 5) Salir.
#
# Ejemplo:
#   Opción: 1
#   Tarea: estudiar bash
#   Tarea añadida
#   Opción: 2
#   1. estudiar bash
#   Opción: 4
#   ¿Borrar todas las tareas? (s/n): s
#   Tareas borradas
#
# Pista: Chuleta, apartados 4 (cont++), 5 (-s, -z), 7, 8 (while read ... <) y 9.

# Solución:

TAREAS=tareas.txt

anadir() {
    read -p "Tarea: " tarea
    if [[ -z $tarea ]]; then
        echo "Error: la tarea no puede estar vacía"
        return 1
    fi
    echo "$tarea" >> "$TAREAS"
    echo "Tarea añadida"
}

listar() {
    if [[ ! -s $TAREAS ]]; then
        echo "No hay tareas"
        return 1
    fi
    n=1
    while read -r tarea; do
        echo "$n. $tarea"
        ((n++))
    done < "$TAREAS"
}

contar() {
    total=0
    if [[ -f $TAREAS ]]; then
        while read -r tarea; do
            ((total++))
        done < "$TAREAS"
    fi
    echo "Hay $total tareas"
}

borrar() {
    read -p "¿Borrar todas las tareas? (s/n): " resp
    if [[ $resp == s ]]; then
        > "$TAREAS"
        echo "Tareas borradas"
    else
        echo "Operación cancelada"
    fi
}

opcion=0
while [[ $opcion != 5 ]]; do
    echo
    echo "1) Añadir  2) Listar  3) Contar  4) Borrar todas  5) Salir"
    read -p "Opción: " opcion
    case $opcion in
        1) anadir ;;
        2) listar ;;
        3) contar ;;
        4) borrar ;;
        5) echo "Adiós" ;;
        *) echo "Opción no válida" ;;
    esac
done
