#!/bin/bash

# Ejercicio 3. gestion_usuarios.sh — Gestión de usuarios
#
# Prepara el alta o la baja de un usuario del alumnado. El script no crea ni
# elimina usuarios: muestra la orden que habría que ejecutar.
# - Recibe como primer parámetro la acción: alta o baja.
# - Alta:
#   - Pide por teclado el nombre y los dos apellidos (sin tildes).
#   - Comprueba con expresiones regulares que el nombre es una sola palabra
#     formada por letras y que los apellidos son dos palabras separadas por un
#     espacio. Si no es así, muestra un error y termina.
#   - Genera el identificador con el formato aluXXYYZ: alu, las dos primeras
#     letras del nombre, las dos primeras del primer apellido y la primera del
#     segundo apellido, todo en minúsculas.
#   - Si el usuario ya existe, muestra un error. Si no, muestra la orden useradd.
# - Baja:
#   - Recibe el identificador como segundo parámetro.
#   - Comprueba con una expresión regular que tiene el formato aluXXYYZ y que el
#     usuario existe.
#   - Muestra la orden userdel para eliminarlo.
# - Controla los errores: falta la acción, la acción no es válida o falta el
#   identificador.
# - Organiza el script en funciones: al menos una para generar el identificador
#   y otra para mostrar los errores.
#
# Ejemplo:
# $ ./gestion_usuarios.sh alta
# Nombre: Lucia
# Apellidos: Ferrer Mas
# Identificador generado: alulufem
# Para crearlo: sudo useradd -m -s /bin/bash -c "Lucia Ferrer Mas" alulufem
# $ ./gestion_usuarios.sh alta
# Nombre: Lucia
# Apellidos: Ferrer
# Error: escribe los dos apellidos separados por un espacio
# Uso: ./gestion_usuarios.sh alta | baja identificador
# $ ./gestion_usuarios.sh baja root
# Error: root no tiene el formato aluXXYYZ
# Uso: ./gestion_usuarios.sh alta | baja identificador
# $ ./gestion_usuarios.sh borrar
# Error: la acción borrar no es válida
# Uso: ./gestion_usuarios.sh alta | baja identificador
#
# Ayuda: para pasar un texto a minúsculas, tr 'A-Z' 'a-z'. Para quedarse con sus
# primeros caracteres, cut -c1-2. Para quedarse con la primera palabra de un
# texto, cut -d' ' -f1.

# Solución:

error() {
    echo "Error: $1"
    echo "Uso: $0 alta | baja identificador"
    exit 1
}

generar_id() {
    nombre=$1
    apellidos=$2
    n=$(echo "$nombre" | cut -c1-2)
    a1=$(echo "$apellidos" | cut -d' ' -f1 | cut -c1-2)
    a2=$(echo "$apellidos" | cut -d' ' -f2 | cut -c1)
    echo "alu$n$a1$a2" | tr 'A-Z' 'a-z'
}

existe() {
    grep -q "^$1:" /etc/passwd
}

alta() {
    read -p "Nombre: " nombre
    read -p "Apellidos: " apellidos

    re_nombre='^[A-Za-z]+$'
    re_apellidos='^[A-Za-z]+ [A-Za-z]+$'

    if [[ ! $nombre =~ $re_nombre ]]; then
        error "el nombre debe ser una sola palabra formada por letras"
    fi
    if [[ ! $apellidos =~ $re_apellidos ]]; then
        error "escribe los dos apellidos separados por un espacio"
    fi

    id=$(generar_id "$nombre" "$apellidos")
    echo "Identificador generado: $id"

    if existe "$id"; then
        error "el usuario $id ya existe"
    fi
    echo "Para crearlo: sudo useradd -m -s /bin/bash -c \"$nombre $apellidos\" $id"
}

baja() {
    id=$1
    re_id='^alu[a-z]{5}$'

    if [[ ! $id =~ $re_id ]]; then
        error "$id no tiene el formato aluXXYYZ"
    fi
    if ! existe "$id"; then
        error "el usuario $id no existe"
    fi
    echo "Para eliminarlo: sudo userdel -r $id"
}

if [ $# -eq 0 ]; then
    error "falta la acción"
fi

case $1 in
    alta)
        alta
        ;;
    baja)
        if [ $# -lt 2 ]; then
            error "falta el identificador"
        fi
        baja "$2"
        ;;
    *)
        error "la acción $1 no es válida"
        ;;
esac