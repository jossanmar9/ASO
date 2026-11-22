#!/bin/bash
# backup_scp.sh — Copia de seguridad de una carpeta del servidor con scp
# Uso: ./backup_scp.sh carpeta_remota

SERVIDOR=servidor
DESTINO=~/backups
LOG=$DESTINO/backup.log

# Escribe una línea en el log: fecha - carpeta - resultado
registrar() {
    echo "$(date '+%F %T') - $1 - $2" >> "$LOG"
}

# Devuelve 0 si el servidor responde sin pedir contraseña
comprobar_servidor() {
    ssh -o BatchMode=yes "$SERVIDOR" true &>/dev/null
}

# 1. Comprobar el parámetro
if [ $# -ne 1 ]; then
    echo "Uso: $0 carpeta_remota"
    exit 1
fi
carpeta=$1

# 2. Crear la carpeta de copias si no existe
mkdir -p "$DESTINO"

# 3. Comprobar que el servidor responde
if ! comprobar_servidor; then
    echo "Error: el servidor no responde"
    registrar "$carpeta" "ERROR (el servidor no responde)"
    exit 1
fi

# 4. Hacer la copia en una carpeta con la fecha (datos_2026-11-17_09-30)
copia="$DESTINO/${carpeta##*/}_$(date +%F_%H-%M)"
if scp -r "$SERVIDOR:$carpeta" "$copia"; then
    echo "Copia guardada en $copia"
    registrar "$carpeta" "OK"
else
    echo "Error: no se ha podido copiar $carpeta"
    registrar "$carpeta" "ERROR"
    exit 1
fi