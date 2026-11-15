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

