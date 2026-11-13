#!/bin/bash

# Ejercicio 2. backup_etc.sh — Copia de seguridad de la configuración
#
# Hace una copia comprimida del directorio /etc.
# - Acepta dos parámetros opcionales: el directorio de destino de las copias
#   (por defecto, /var/backups) y el número máximo de copias recomendado
#   (por defecto, 7).
# - Comprueba que el directorio de destino existe. Del número máximo de copias,
#   comprueba con una expresión regular que es un número y, después, con una
#   comparación numérica, que es mayor que 0.
# - Genera un fichero tar.gz con el nombre etc-AAAAMMDD-HHMMSS.tar.gz, con la
#   fecha y la hora actuales.
# - Después, cuenta cuántas copias hay en el directorio de destino. Solo cuentan
#   los ficheros cuyo nombre cumple el formato anterior, comprobado con una
#   expresión regular. Si hay más copias que el máximo recomendado, muestra un aviso.
# - Cada acción (copia creada, aviso, error) se registra en el sistema con logger,
#   con la etiqueta aso-backup, y se muestra también por pantalla. Para ello, crea
#   una función registrar que reciba el mensaje y haga las dos cosas.
#
# Ejemplo:
# $ sudo ./backup_etc.sh ~/copias 2
# 21:13:18 Copia creada: /home/alumno/copias/etc-20261014-211317.tar.gz
# 21:13:18 Aviso: hay 3 copias y el máximo recomendado es 2
# $ sudo ./backup_etc.sh ~/copias siete
# Error: siete no es un número
# $ sudo ./backup_etc.sh ~/copias 0
# Error: el número máximo de copias debe ser mayor que 0
#
# Se ejecuta con sudo, porque algunos ficheros de /etc solo los puede leer el
# administrador.
# Para ver los mensajes registrados: journalctl -t aso-backup

# Solución:

registrar() {
    logger -t aso-backup "$1"
    echo "$(date +%H:%M:%S) $1"
}

if [ $# -ge 1 ]; then
    destino=$1
else
    destino=/var/backups
fi

if [ $# -ge 2 ]; then
    maximo=$2
else
    maximo=7
fi

if [ ! -d "$destino" ]; then
    registrar "Error: el directorio $destino no existe"
    exit 1
fi

re_numero='^[0-9]+$'
if [[ ! $maximo =~ $re_numero ]]; then
    registrar "Error: $maximo no es un número"
    exit 1
fi

if [ "$maximo" -le 0 ]; then
    registrar "Error: el número máximo de copias debe ser mayor que 0"
    exit 1
fi

fichero="$destino/etc-$(date +%Y%m%d-%H%M%S).tar.gz"

if tar -czf "$fichero" -C / etc 2>/dev/null; then
    registrar "Copia creada: $fichero"
else
    registrar "Error: no se ha podido crear la copia"
    exit 1
fi

re_copia='^etc-[0-9]{8}-[0-9]{6}\.tar\.gz$'
copias=0

for f in "$destino"/*; do
    nombre=$(basename "$f")
    if [[ $nombre =~ $re_copia ]]; then
        copias=$(( copias + 1 ))
    fi
done

if [ "$copias" -gt "$maximo" ]; then
    registrar "Aviso: hay $copias copias y el máximo recomendado es $maximo"
fi