# UT1 - Bash

Exercicis i pràctiques de Bash i Shell Scripting.

## Estructura

| Carpeta | Contingut |
|---|---|
| [`Ejercicios_Basicos/`](Ejercicios_Basicos/) | 24 exercicis bàsics: ordres, condicionals i bucles |
| [`Sesion1_Bucles_y_parametros/`](Sesion1_Bucles_y_parametros/) | Variables, paràmetres posicionals, condicionals i bucles |
| [`Sesion2_Funciones/`](Sesion2_Funciones/) | Funcions |
| [`Sesion3_Regex/`](Sesion3_Regex/) | Expressions regulars bàsiques amb `=~` |
| [`Sesion4_Regex_Extendidas/`](Sesion4_Regex_Extendidas/) | Expressions regulars esteses |
| [`Sesion5_Sed/`](Sesion5_Sed/) | Scripts amb `sed` |
| [`Sesion6_Repaso/`](Sesion6_Repaso/) | Repàs per a l'examen |

Chuleta de consulta de la unitat: [`cheatsheet_UT1.md`](cheatsheet_UT1.md)

Exercicis de pràctica per a l'examen: [`../Practica_examen_1r_trimestre/`](../Practica_examen_1r_trimestre/)

## Ejercicios_Basicos

### Bàsics

- Exercici 1 - Hola Mundo
- Exercici 2 - Llistat del directori /etc
- Exercici 3 - Llistat de /etc amb recompte de línies i paraules
- Exercici 4 - Demanar i mostrar dos números
- Exercici 5 - Mitjana aritmètica de dos números
- Exercici 6 - Afegir paraules a lista.txt
- Exercici 7 - Comprimir un directori en tar.gz amb data

### Estructures condicionals

- Exercici 8 - Major de dos números
- Exercici 9 - Menú d'operacions matemàtiques
- Exercici 10 - Parell o imparell
- Exercici 11 - Copiar un fitxer amb validacions
- Exercici 12 - Bon dia / bona vesprada / bona nit segons l'hora
- Exercici 13 - AGENDA
- Exercici 14 - Gestió d'usuaris

### Bucles

- Exercici 15 - Taula de multiplicar
- Exercici 16 - Suma de l'1 al 1000 amb for, while i until
- Exercici 17 - Suma acumulada fins a introduir 0
- Exercici 18 - Patró amb for (I)
- Exercici 19 - Patró amb for (II)
- Exercici 20 - Comprovar si un número és primer
- Exercici 21 - Joc d'endevinar un número
- Exercici 22 - Llistar entrades d'un directori
- Exercici 23 - Tipus d'entrada en /dev
- Exercici 24 - Estadístiques de fitxers i subdirectoris

## Sesion1_Bucles_y_parametros

- `iniciar_servicio.sh` - Rebre el nom d'un servei com a paràmetre
- `nivel_disco.sh` - Calcular el percentatge d'ús d'un disc i classificar-lo (OK / AVISO / CRÍTICO)
- `clasificar_entradas.sh` - Recórrer una carpeta i dir si cada entrada és fitxer o directori
- `resumen_logs.sh` - Comptar línies amb WARNING i ERROR de cada fitxer .log

## Sesion2_Funciones

- `bytes_a_gb.sh` - Convertir bytes a GB amb `bc`
- `clasificar_http.sh` - Classificar codis d'estat HTTP
- `tipos_fichero.sh` - Comptar fitxers per extensió amb una funció i un bucle
- `pedir_puerto_valido.sh` - Demanar un port fins que siga vàlid
- `existe_usuario.sh` - Comprovar si un usuari existix en el sistema

## Sesion3_Regex

- `puerto.sh` - Comprovar si un paràmetre és un port vàlid (1-65535)
- `tipos_etc.sh` - Comptar fitxers de configuració i còpies de seguretat en /etc
- `usuarios_bash.sh` - Llistar els usuaris de /etc/passwd amb shell bash
- `pedir_login.sh` - Demanar un nom d'usuari vàlid i comprovar si existix
- `config_activa.sh` - Mostrar només les línies útils d'un fitxer de configuració

## Sesion4_Regex_Extendidas

- `validar_ip.sh` - Comprovar si un paràmetre té format d'adreça IPv4
- `validar_mac.sh` - Validar una adreça MAC
- `correo_centro.sh` - Comprovar si un correu és del professorat o de l'alumnat
- `comprobar_password.sh` - Comprovar si una contrasenya complix la política del centre
- `tipo_ip.sh` - Classificar una IP com a loopback, privada o pública

## Sesion5_Sed

- `config_limpia.sh` - Mostrar un fitxer de configuració sense comentaris ni línies buides
- `cambiar_dominio.sh` - Canviar el domini de gmail/hotmail per alu.edu.gva.es
- `anonimizar_log.sh` - Substituir les adreces IP d'un registre per X.X.X.X
- `caducidad.sh` - Canviar el valor de PASS_MAX_DAYS en una còpia de login.defs

## Sesion6_Repaso

- `inventario_cuentas.sh` - Llistar els comptes de /etc/passwd que usen una shell determinada
- `backup_etc.sh` - Fer una còpia comprimida de /etc i registrar-ho amb logger
- `gestion_usuarios.sh` - Preparar l'alta o la baixa d'un usuari de l'alumnat

## Pràctica per a l'examen

Per a preparar l'examen, li he demanat a la IA que em genere una col·lecció d'exercicis de pràctica, ordenats de fàcil a difícil. Estan en la carpeta [`Practica_examen_1r_trimestre/`](../Practica_examen_1r_trimestre/), a l'arrel del repositori, dividits en `practicar/` (només l'enunciat) i `resolts/` (amb la solució).

Els de la UT1 són els blocs 1 a 14 (exercicis 001–140) i els 151–160 del bloc 16 (tipus examen):

- **Blocs 1–10**: es poden resoldre només amb la chuleta oficial de l'examen.
- **Blocs 11–14**: `grep`, `cut`, `tr`, `wc`, `sort`, `sed` i expressions regulars esteses.
- **Bloc 16**: exercicis tipus examen que ajunten tota la unitat.

## Valoració personal

Feia dos anys que havia cursat el mòdul d'Implantació de Sistemes Operatius i, per tant, encara recordava alguns dels conceptes bàsics de Bash, però havia oblidat part de la sintaxi i algunes de les ordres.

Aquesta unitat m'ha servit per refrescar aquests coneixements i tornar a practicar la creació de scripts. Els primers exercicis m'han resultat més familiars, però a mesura que la unitat avançava (condicionals, bucles, funcions, expressions regulars i sed) m'ha costat més, perquè encara no estic acostumat a treballar amb Bash i he necessitat consultar i repassar molts conceptes.

Durant la unitat he utilitzat una eina d'intel·ligència artificial com a suport i tutor: per a demanar explicacions, entendre el funcionament de les ordres, obtindre pistes quan m'he quedat encallat i, en les sessions més complicades, també exemples resolts que he estudiat per entendre com funcionen.

Amb els apunts, la web de l'assignatura i el suport de la IA els exercicis són prou més fàcils que a l'examen. Per això, els conceptes que més em costen, els continuaré practicant amb els exercicis de la carpeta [`Practica_examen_1r_trimestre/`](../Practica_examen_1r_trimestre/) per a poder resoldre'ls pel meu compte.