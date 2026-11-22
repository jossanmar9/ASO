#!/bin/bash
# backup_rsync.sh — Copia espejo de una carpeta del servidor con rsync
# Uso: ./backup_rsync.sh carpeta_remota

SERVIDOR=servidor
DESTINO=~/backups
ESPEJO=$DESTINO/espejo
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

# 2. Crear la carpeta del espejo si no existe
mkdir -p "$ESPEJO"

# 3. Comprobar que el servidor responde
if ! comprobar_servidor; then
    echo "Error: el servidor no responde"
    registrar "$carpeta" "ERROR (el servidor no responde)"
    exit 1
fi

# 4. Sincronizar: solo copia lo que es nuevo o ha cambiado
if rsync -av "$SERVIDOR:$carpeta/" "$ESPEJO/"; then
    echo "Copia sincronizada en $ESPEJO"
    registrar "$carpeta" "OK"
else
    echo "Error: no se ha podido copiar $carpeta"
    registrar "$carpeta" "ERROR"
    exit 1
fi
