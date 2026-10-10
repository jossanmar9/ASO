#!/bin/bash

# Actividad 3. tipos_fichero.sh
# Repasa: Funciones + Bucles + Utilidades (find)
#
# Escribe una función contar_por_extension que reciba una carpeta
# y una extensión (por ejemplo, log o txt), y devuelva (con echo)
# cuántos ficheros de esa extensión contiene.
#
# Con un bucle, aplica la función a:
# ~/prueba_bash/datos
#
# para las extensiones:
# - log
# - txt
# - csv
#
# y muestra el resultado de cada una.
#
# Pista:
# find "$carpeta" -maxdepth 1 -type f -name "*.$ext" | wc -l
#
# Lista de verificación:
# - log → 2
# - txt → 2
# - csv → 1

# Solución:

contar_por_extension() {
    carpeta=$1
    ext=$2
    find "$carpeta" -maxdepth 1 -type f -name "*.$ext" | wc -l
}

for ext in log txt csv; do
    total=$(contar_por_extension ~/prueba_bash/datos "$ext")
    echo "$ext → $total"
done