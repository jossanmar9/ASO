# Pràctica per a l'examen del 1r trimestre — UT1 (Bash) i UT2 (Processos)

Col·lecció de **162 exercicis** per a preparar l'examen de les unitats 1 i 2, ordenats de més fàcil a més difícil dins de cada part.

## Què es pretén

- **Practicar sense ajuda**, en les condicions de l'examen: amb la chuleta oficial i, quan calga, el manual de cada ordre (`man grep`, `man ps`, `man renice`...).
- **Detectar els punts febles** abans de l'examen: bucles, expressions regulars, `sed`, la pràctica de processos...
- **Guanyar velocitat**: a l'examen hi ha uns 15 minuts per exercici.
- **Comprovar** després les solucions, per a aprendre altres maneres de fer-ho.

## Estructura

```
Practica_examen_1r_trimestre/
├── README.md
├── Cheatsheet_UT1_Bash.pdf      ← chuleta oficial de la UT1
├── practicar/                   ← enunciats, amb "# Solución:" buit
│   ├── 01_Script_y_variables/
│   ├── ...
│   ├── 15_Repaso_Sesion7/
│   └── 16_Tipo_examen_UT1_UT2/
└── resolts/                     ← les mateixes carpetes amb la solució
```

Cada exercici porta: l'enunciat, un exemple d'execució, una **pista** (quin apartat de la chuleta o quina opció buscar al `man`) i `# Solución:`. Els fitxers de dades (`.csv`, `.log`, `.conf`, `.txt`) estan dins de la carpeta del bloc que els usa.

## Com treballar-los

1. Obri l'exercici en `practicar/` i escriu la solució davall de `# Solución:`.
2. Prova'l amb l'exemple de l'enunciat i amb casos d'error (sense paràmetres, lletres en lloc de números, fitxers o PID que no existixen...).
3. Només quan funcione, o després d'un bon temps encallat, compara'l amb `resolts/`. Una solució diferent també pot ser correcta.
4. **Simulacre d'examen**: blocs 10 i 16 i l'exercici 150, 15 minuts per exercici.

### Per als exercicis de la UT2 (blocs 15 i 16)

- El **bloc 15** repassa només el que es va fer a la pràctica de la sessió 7 (`gestion_procesos.sh`): `id`, `ps`, `renice`, `kill`, `sleep`, `$EUID`, `date` i el registre en un fitxer. Primer cada opció per separat (141–148), després ajuntant-les (149) i, al final, un script semblant al de la pràctica però amb canvis (150).
- Per a tindre processos de prova: `sleep 1000 &` (amb `echo $!` veus el PID).
- Els PID dels exemples (4310...) són d'exemple: usa els teus.
- Sense ser root, el `nice` només es pot **pujar** (0 a 19). Per a provar valors negatius, executa el script amb `sudo`.

## Blocs

| Bloc | Tema | Exercicis | Dificultat | Material |
|---|---|---|---|---|
| 1 | Script i variables | 001–010 | ★☆☆☆☆ | Chuleta |
| 2 | Entrada i paràmetres | 011–020 | ★☆☆☆☆ | Chuleta |
| 3 | Matemàtiques | 021–030 | ★★☆☆☆ | Chuleta |
| 4 | Condicionals | 031–040 | ★★☆☆☆ | Chuleta |
| 5 | Fitxers i cadenes | 041–050 | ★★★☆☆ | Chuleta |
| 6 | case | 051–060 | ★★★☆☆ | Chuleta |
| 7 | Subcadenes | 061–070 | ★★★★☆ | Chuleta |
| 8 | Bucles | 071–080 | ★★★★☆ | Chuleta |
| 9 | Funcions | 081–090 | ★★★★★ | Chuleta |
| 10 | Tipus examen (només chuleta) | 091–100 | ★★★★★ | Chuleta |
| 11 | grep | 101–110 | ★★★☆☆ | Chuleta + `man` |
| 12 | cut, tr, wc, sort | 111–120 | ★★★☆☆ | Chuleta + `man` |
| 13 | sed | 121–130 | ★★★★☆ | Chuleta + `man` |
| 14 | Regex esteses amb =~ | 131–140 | ★★★★☆ | Chuleta + `man` |
| 15 | UT2 · Repàs de la sessió 7 | 141–150 | ★★★☆☆ | Pràctica sessió 7 |
| 16 | Tipus examen UT1 + UT2 | 151–162 | ★★★★★ | Chuleta + `man` |

- **Blocs 1–10**: es poden resoldre només amb la chuleta oficial.
- **Blocs 11–14**: també `grep`, `cut`, `tr`, `sort`, `sed` i expressions regulars esteses, que no estan a la chuleta.
- **Bloc 15**: UT2, només el que es va practicar a la sessió 7.
- **Bloc 16**: tipus examen; 151–160 són de la UT1 i 161–162 ajunten Bash amb el de la sessió 7.

## Índex

### 1. Script i variables

| Nº | Fitxer | Exercici |
|---|---|---|
| 001 | `001_hola.sh` | Hola mundo |
| 002 | `002_saludo_variable.sh` | Saludo con variable |
| 003 | `003_info_usuario.sh` | Información del usuario |
| 004 | `004_donde_estoy.sh` | ¿Dónde estoy? |
| 005 | `005_fecha_hoy.sh` | Fecha de hoy |
| 006 | `006_comillas.sh` | Comillas dobles y simples |
| 007 | `007_dos_variables.sh` | Dos variables en una frase |
| 008 | `008_mi_uid.sh` | UID y PID del padre |
| 009 | `009_copia_variable.sh` | Copiar una variable |
| 010 | `010_mi_shell.sh` | Shell y PATH |

### 2. Entrada i paràmetres

| Nº | Fitxer | Exercici |
|---|---|---|
| 011 | `011_pide_nombre.sh` | Pedir el nombre |
| 012 | `012_pide_dos.sh` | Pedir dos datos |
| 013 | `013_primer_param.sh` | Primer parámetro |
| 014 | `014_num_params.sh` | Contar parámetros |
| 015 | `015_todos_params.sh` | Todos los parámetros |
| 016 | `016_al_reves.sh` | Parámetros al revés |
| 017 | `017_uso_dos_params.sh` | Exigir dos parámetros |
| 018 | `018_codigo_salida.sh` | Código de salida |
| 019 | `019_param_o_pregunta.sh` | Parámetro o pregunta |
| 020 | `020_presenta.sh` | Nombre y apellido |

### 3. Matemàtiques

| Nº | Fitxer | Exercici |
|---|---|---|
| 021 | `021_suma.sh` | Sumar dos números |
| 022 | `022_calculadora_basica.sh` | Calculadora básica |
| 023 | `023_doble_triple.sh` | Doble y triple |
| 024 | `024_media_decimales.sh` | Media con decimales |
| 025 | `025_area_rectangulo.sh` | Área de un rectángulo |
| 026 | `026_minutos_segundos.sh` | Minutos a segundos |
| 027 | `027_contador.sh` | Incrementar un contador |
| 028 | `028_euros_dolares.sh` | Euros a dólares |
| 029 | `029_resto_entre_2.sh` | Resto entre 2 |
| 030 | `030_horas_minutos.sh` | Segundos a horas, minutos y segundos |

### 4. Condicionals

| Nº | Fitxer | Exercici |
|---|---|---|
| 031 | `031_mayor_edad.sh` | Mayor de edad |
| 032 | `032_par_impar.sh` | Par o impar |
| 033 | `033_mayor_de_dos.sh` | El mayor de dos |
| 034 | `034_nota.sh` | Calificación |
| 035 | `035_signo.sh` | Positivo, negativo o cero |
| 036 | `036_contrasena.sh` | Comprobar contraseña |
| 037 | `037_texto_vacio.sh` | ¿Has escrito algo? |
| 038 | `038_es_numero.sh` | ¿Es un número? |
| 039 | `039_soy_root.sh` | ¿Soy root? |
| 040 | `040_rango.sh` | Entre 1 y 100 |

### 5. Fitxers i cadenes

| Nº | Fitxer | Exercici |
|---|---|---|
| 041 | `041_existe.sh` | ¿Existe? |
| 042 | `042_tipo_entrada.sh` | Tipo de entrada |
| 043 | `043_permisos.sh` | Permisos de un fichero |
| 044 | `044_fichero_vacio.sh` | ¿Fichero vacío? |
| 045 | `045_crear_directorio.sh` | Crear directorio si no existe |
| 046 | `046_copia_segura.sh` | Copia segura |
| 047 | `047_dispositivo.sh` | Tipo de dispositivo |
| 048 | `048_hacer_ejecutable.sh` | Hacer ejecutable |
| 049 | `049_comparar_palabras.sh` | Comparar palabras |
| 050 | `050_variable_definida.sh` | ¿Está definida? |

### 6. case

| Nº | Fitxer | Exercici |
|---|---|---|
| 051 | `051_dia_semana.sh` | Día de la semana |
| 052 | `052_menu_simple.sh` | Menú simple |
| 053 | `053_si_no.sh` | Sí o no |
| 054 | `054_tipo_caracter.sh` | Tipo de carácter |
| 055 | `055_tipo_fichero_ext.sh` | Tipo según la extensión |
| 056 | `056_servicio.sh` | Simular un servicio |
| 057 | `057_calculadora_case.sh` | Calculadora con case |
| 058 | `058_estacion.sh` | Estación del año |
| 059 | `059_alta_baja.sh` | Alta o baja |
| 060 | `060_letra_nota.sh` | Nota con letra |

### 7. Subcadenes

| Nº | Fitxer | Exercici |
|---|---|---|
| 061 | `061_longitud.sh` | Longitud de una palabra |
| 062 | `062_iniciales.sh` | Iniciales |
| 063 | `063_ultimos_tres.sh` | Los tres últimos |
| 064 | `064_nombre_y_ruta.sh` | Nombre y directorio de una ruta |
| 065 | `065_nombre_extension.sh` | Nombre y extensión |
| 066 | `066_reemplazar_letra.sh` | Reemplazar letras |
| 067 | `067_sin_espacios.sh` | Nombre sin espacios |
| 068 | `068_ocultar_tarjeta.sh` | Ocultar una tarjeta |
| 069 | `069_cambiar_extension.sh` | Cambiar la extensión |
| 070 | `070_usuario_dominio.sh` | Usuario y dominio de un correo |

### 8. Bucles

| Nº | Fitxer | Exercici |
|---|---|---|
| 071 | `071_contar_diez.sh` | Contar hasta 10 |
| 072 | `072_tabla.sh` | Tabla de multiplicar |
| 073 | `073_lista_compra.sh` | Lista de la compra |
| 074 | `074_recorrer_params.sh` | Recorrer los parámetros |
| 075 | `075_suma_hasta.sh` | Sumar del 1 al N |
| 076 | `076_cuenta_atras.sh` | Cuenta atrás |
| 077 | `077_adivina.sh` | Adivina el número |
| 078 | `078_listar_scripts.sh` | Listar scripts |
| 079 | `079_menu_bucle.sh` | Menú que se repite |
| 080 | `080_leer_csv.sh` | Leer un CSV |

### 9. Funcions

| Nº | Fitxer | Exercici |
|---|---|---|
| 081 | `081_funcion_saludo.sh` | Primera función |
| 082 | `082_funcion_suma.sh` | Función que devuelve un dato |
| 083 | `083_funcion_es_par.sh` | Función sí/no |
| 084 | `084_existen_ficheros.sh` | ¿Existen estos ficheros? |
| 085 | `085_funcion_mayor.sh` | Función mayor |
| 086 | `086_funcion_error.sh` | Función de errores |
| 087 | `087_calculadora_lib.sh` | Librería de funciones |
| 088 | `088_factorial.sh` | Factorial |
| 089 | `089_pedir_numero.sh` | Pedir hasta que sea válido |
| 090 | `090_contar_ficheros.sh` | Contar ficheros de un directorio |

### 10. Tipus examen (només chuleta)

| Nº | Fitxer | Exercici |
|---|---|---|
| 091 | `091_inventario_directorio.sh` | Inventario de un directorio |
| 092 | `092_renombrar_extension.sh` | Renombrar extensiones |
| 093 | `093_crear_usuarios_csv.sh` | Altas desde un CSV |
| 094 | `094_estadisticas_notas.sh` | Estadísticas de notas |
| 095 | `095_agenda.sh` | Agenda de teléfonos |
| 096 | `096_copia_seguridad.sh` | Copia de seguridad con fecha |
| 097 | `097_limpiar_temporales.sh` | Limpiar temporales |
| 098 | `098_comprobar_password.sh` | Política de contraseñas |
| 099 | `099_calculadora_menu.sh` | Calculadora con menú y funciones |
| 100 | `100_gestor_tareas.sh` | Gestor de tareas |

### 11. grep

| Nº | Fitxer | Exercici |
|---|---|---|
| 101 | `101_buscar_palabra.sh` | Buscar una palabra |
| 102 | `102_contar_niveles.sh` | Contar líneas por nivel |
| 103 | `103_sin_mayusculas.sh` | Buscar sin distinguir mayúsculas |
| 104 | `104_config_util_grep.sh` | Configuración sin comentarios (grep) |
| 105 | `105_existe_usuario_grep.sh` | ¿Existe el usuario? (grep) |
| 106 | `106_numero_linea.sh` | ¿En qué línea está? |
| 107 | `107_usuarios_bash_grep.sh` | Usuarios con bash |
| 108 | `108_errores_y_avisos.sh` | Errores o avisos |
| 109 | `109_palabra_exacta.sh` | Palabra exacta |
| 110 | `110_buscar_en_directorio.sh` | Buscar en un directorio |

### 12. cut, tr, wc, sort

| Nº | Fitxer | Exercici |
|---|---|---|
| 111 | `111_nombres_usuarios.sh` | Nombres de usuario |
| 112 | `112_usuario_y_home.sh` | Usuario y directorio personal |
| 113 | `113_primeros_caracteres.sh` | Primeros caracteres con cut |
| 114 | `114_mayusculas.sh` | Pasar a mayúsculas |
| 115 | `115_estadisticas_fichero.sh` | Líneas, palabras y caracteres |
| 116 | `116_shells_usadas.sh` | Shells usadas |
| 117 | `117_login_desde_nombre.sh` | Login a partir del nombre |
| 118 | `118_columna_csv.sh` | Una columna de un CSV |
| 119 | `119_mejores_notas.sh` | Las 3 mejores notas |
| 120 | `120_ips_distintas.sh` | IPs distintas |

### 13. sed

| Nº | Fitxer | Exercici |
|---|---|---|
| 121 | `121_sustituir_palabra.sh` | Sustituir una palabra |
| 122 | `122_config_util_sed.sh` | Configuración sin comentarios (sed) |
| 123 | `123_lineas_entre.sh` | Líneas entre dos números |
| 124 | `124_cambiar_dominio_sed.sh` | Cambiar dominio de correos |
| 125 | `125_anonimizar_ips.sh` | Anonimizar IPs |
| 126 | `126_cambiar_valor.sh` | Cambiar un valor de configuración |
| 127 | `127_comentar_clave.sh` | Comentar una línea |
| 128 | `128_borrar_lineas.sh` | Borrar las líneas que contienen... |
| 129 | `129_espacios.sh` | Arreglar espacios |
| 130 | `130_rellenar_plantilla.sh` | Rellenar una plantilla |

### 14. Regex esteses amb =~

| Nº | Fitxer | Exercici |
|---|---|---|
| 131 | `131_validar_ip.sh` | Formato de IP |
| 132 | `132_validar_dni.sh` | DNI |
| 133 | `133_validar_telefono.sh` | Teléfono |
| 134 | `134_validar_correo.sh` | Correo electrónico |
| 135 | `135_validar_mac.sh` | Dirección MAC |
| 136 | `136_validar_matricula.sh` | Matrícula de coche |
| 137 | `137_validar_login.sh` | Nombre de usuario |
| 138 | `138_validar_hora.sh` | Hora HH:MM |
| 139 | `139_validar_fecha.sh` | Fecha AAAA-MM-DD |
| 140 | `140_tipo_ip.sh` | Tipo de IP |

### 15. UT2 · Repàs de la sessió 7

| Nº | Fitxer | Exercici |
|---|---|---|
| 141 | `141_ver_usuario.sh` | Procesos de un usuario |
| 142 | `142_buscar.sh` | Buscar un proceso por nombre |
| 143 | `143_top.sh` | Los N procesos que más CPU consumen |
| 144 | `144_validar.sh` | La función validar_pid |
| 145 | `145_nombre_pid.sh` | Nombre del comando de un PID |
| 146 | `146_prioridad.sh` | Cambiar la prioridad |
| 147 | `147_finalizar.sh` | Finalizar un proceso |
| 148 | `148_registro.sh` | La función registrar |
| 149 | `149_prioridad_y_finalizar.sh` | Prioridad y finalizar con registro |
| 150 | `150_vigilar_procesos.sh` | Vigilancia de procesos (tipo examen) |

### 16. Tipus examen UT1 + UT2

| Nº | Fitxer | Exercici |
|---|---|---|
| 151 | `151_informe_log.sh` | Informe de un log |
| 152 | `152_usuarios_reales.sh` | Usuarios reales |
| 153 | `153_resumen_passwd.sh` | Resumen de cuentas |
| 154 | `154_auditoria_ssh.sh` | Auditoría de SSH |
| 155 | `155_altas_desde_nombres.sh` | Altas desde una lista de nombres |
| 156 | `156_limpiar_csv.sh` | Limpiar un CSV |
| 157 | `157_rotar_copias.sh` | Rotación de copias |
| 158 | `158_renombrar_con_sed.sh` | Renombrar con sed |
| 159 | `159_config_menu.sh` | Menú de configuración |
| 160 | `160_gestor_hosts.sh` | Gestor de hosts |
| 161 | `161_procesos_por_usuario.sh` | Procesos de una lista de usuarios |
| 162 | `162_prioridad_por_nombre.sh` | Bajar la prioridad de todos los procesos con un nombre |
