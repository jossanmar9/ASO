#!/bin/bash

# Ejercicio C1. resumen_logs.sh
#
# Imagina que eres administrador/a de sistemas y te piden un primer
# script de monitorización rápida.
#
# Escribe un script resumen_logs.sh que reciba como argumento el nombre
# de una carpeta y, para cada fichero .log que encuentre dentro, muestre
# su nombre junto con:
#
# - Cuántas líneas contienen la palabra WARNING.
# - Cuántas líneas contienen la palabra ERROR.
#
# Lista de verificación:
# - ./resumen_logs.sh ~/prueba_bash/datos
#
# Resultado esperado:
# - app1.log → 0 WARNING, 2 ERROR
# - app2.log → 1 WARNING, 3 ERROR
#
# Ampliación opcional:
# Ejecuta resumen_logs.sh pasándole ~/prueba_bash.
#
# Comprueba:
# - ¿Encuentra sistema.log?
# - ¿Encuentra los .log de datos/?
# - ¿Encuentra los .log de proyecto/entrada/?
#
# Explica en un comentario al final del script si el script mira solo
# dentro de la carpeta indicada o también dentro de sus subcarpetas,
# y si te parece el comportamiento correcto para un script de
# monitorización real.

# Solución:

for fichero in "$1"/*.log; do
    nombre=$(basename "$fichero")
    errores=$(grep -c ERROR "$fichero")
    warnings=$(grep -c WARNING "$fichero")
    echo "$nombre → $warnings WARNING, $errores ERROR"
done

#El script solamente busca los logs de la carpeta indicada, no los de las subcarpetas, no sería muy correcto ya que tendríamos que ejecutar el script una vez por carpeta.