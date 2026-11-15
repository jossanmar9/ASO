#!/bin/bash

# Ejercicio 099 · 099_calculadora_menu.sh — Calculadora con menú y funciones
# Bloque 10: Tipo examen (solo chuleta) · Dificultad: ★★★★★
#
# Menú que se repite: 1) Sumar 2) Restar 3) Multiplicar 4) Dividir 5) Salir.
# En las opciones 1-4 pide dos números con una función pedir_numero que
# repita la pregunta hasta que sea un número (solo cifras). La división se
# hace con 2 decimales y no permite dividir entre 0.
#
# Ejemplo:
#   Opción: 4
#   Número: 7
#   Número: 2
#   Resultado: 3.50
#   Opción: 4
#   Número: 7
#   Número: 0
#   Error: no se puede dividir entre 0
#
# Pista: Chuleta, apartados 4 (bc), 5, 7, 8 y 9.

# Solución:

pedir_numero() {
    read -p "Número: " n
    while [[ ! $n =~ ^[0-9]+$ ]]; do
        read -p "No es un número. Número: " n
    done
    echo "$n"
}

dividir() {
    if [[ $2 -eq 0 ]]; then
        echo "Error: no se puede dividir entre 0"
        return 1
    fi
    echo "Resultado: $(echo "scale=2; $1 / $2" | bc)"
}

opcion=0
while [[ $opcion != 5 ]]; do
    echo
    echo "1) Sumar  2) Restar  3) Multiplicar  4) Dividir  5) Salir"
    read -p "Opción: " opcion
    case $opcion in
        1|2|3|4)
            a=$(pedir_numero)
            b=$(pedir_numero)
            case $opcion in
                1) echo "Resultado: $(( a + b ))" ;;
                2) echo "Resultado: $(( a - b ))" ;;
                3) echo "Resultado: $(( a * b ))" ;;
                4) dividir "$a" "$b" ;;
            esac
            ;;
        5) echo "Adiós" ;;
        *) echo "Opción no válida" ;;
    esac
done
# Ojo: dentro de pedir_numero los read -p muestran la pregunta por pantalla
# aunque la función se llame con $( ), porque read escribe la pregunta en
# la salida de errores, no en la salida normal.
