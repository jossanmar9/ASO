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

