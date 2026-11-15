#!/bin/bash

# Ejercicio 130 · 130_rellenar_plantilla.sh — Rellenar una plantilla
# Bloque 13: sed · Dificultad: ★★★★☆
#
# Recibe un nombre y un usuario. Muestra plantilla.txt con {NOMBRE},
# {USUARIO} y {FECHA} (fecha de hoy, date +%F) sustituidos. {NOMBRE_CENTRO}
# se cambia por "IES El Caminàs". Ojo: {NOMBRE} no debe estropear
# {NOMBRE_CENTRO}.
#
# Ejemplo:
#   $ ./130_rellenar_plantilla.sh Lucia lferrerm
#   Hola Lucia,
#   tu usuario en el centro es lferrerm.
#   Fecha de alta: 2026-11-15.
#   Un saludo, el equipo de IES El Caminàs.
#
# Pista: varios sed seguidos con |, comillas dobles. Cambia primero {NOMBRE_CENTRO}.

# Solución:

