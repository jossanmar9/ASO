# 🐚 Chuleta de Bash — UT1

> Explicat des de zero. Cada apartat té: **què és**, **un exemple** i **què ix per pantalla**.

---

## 1. Què és un script?

Un script és un **fitxer de text amb ordres** que s'executen una darrere de l'altra, com si les escrigueres tu a la terminal.

```bash
#!/bin/bash
echo "Hola món"
```
- La **primera línia** (`#!/bin/bash`) sempre és igual. Diu "executa açò amb Bash".
- `echo` **mostra un text** per pantalla.
- Les línies que comencen per `#` són **comentaris**: notes per a tu, Bash les ignora.

**Com executar-lo:**
```bash
chmod +x hola.sh     # 1. donar-li permís (només la primera vegada)
./hola.sh            # 2. executar-lo
```
Ix: `Hola món`

---

## 2. ⚠️ Els errors més típics

| ❌ Així NO | ✅ Així SÍ | Per què |
|---|---|---|
| `nom = Jose` | `nom=Jose` | Per a guardar, **sense espais** al `=` |
| `echo nom` | `echo $nom` | Per a llegir una variable, **amb `$`** |
| `[-z $1]` | `[ -z $1 ]` | Dins dels `[ ]` **sempre espais** |
| `if [ ... ]` i ja | `if [ ... ]; then` | Després de la condició va **`then`** |

---

## 3. Variables (caixes per a guardar coses)

Una variable és una **caixa amb nom** on guardes un valor.

```bash
nom="Jose"              # GUARDAR: sense $ i sense espais
echo "Hola $nom"        # LLEGIR: amb $
```
Ix: `Hola Jose`

**Guardar el resultat d'una ordre** → `$( ordre )`
```bash
avui=$(date)
echo "Hui és $avui"
```

**Guardar el resultat d'un compte** → `$(( compte ))`
```bash
suma=$(( 3 + 4 ))
echo $suma
```
Ix: `7`

---

## 4. Arguments (dades que passes en executar)

Pots passar-li dades al script en executar-lo. Bash les guarda en `$1`, `$2`...

```bash
./saluda.sh Jose Maria
#           $1   $2
```
```bash
#!/bin/bash
echo "Hola $1 i $2"
```
Ix: `Hola Jose i Maria`

| Variable | Què conté |
|---|---|
| `$1`, `$2`... | el 1r, 2n... argument |
| `$#` | **quants** arguments m'han passat |
| `$0` | el nom del script |
| `$?` | si l'última ordre ha anat bé (`0`) o malament (un altre número) |

---

## 5. Preguntar a l'usuari

```bash
read -p "Com et dius? " nom
echo "Hola $nom"
```
El script **s'espera** a que escrigues alguna cosa i la guarda en `nom`.

> Si l'enunciat diu "**com a argument**", usa `$1`, **no** `read`.

---

## 6. Comptes

```bash
echo $(( 10 + 3 ))   # 13  suma
echo $(( 10 - 3 ))   # 7   resta
echo $(( 10 * 3 ))   # 30  multiplicació
echo $(( 10 / 3 ))   # 3   divisió (SENSE decimals!)
echo $(( 10 % 3 ))   # 1   el que sobra de la divisió
```

**Sumar 1 a una variable** (per a comptar):
```bash
i=$(( i + 1 ))
```

**Percentatges:** multiplica **primer**, divideix **després**.
```bash
echo $(( 35 * 100 / 100 ))   # 35 ✅
echo $(( 35 / 100 * 100 ))   # 0  ❌ (35/100 dona 0 sense decimals)
```

**Si necessites decimals**, usa `bc`:
```bash
echo "scale=2; 10 / 3" | bc
```
Ix: `3.33` (`scale=2` = 2 decimals)

---

## 7. Prendre decisions: `if`

"**Si** passa açò, **fes** això. **Si no**, fes això altre."

```bash
if [ $edat -ge 18 ]; then
    echo "Major d'edat"
else
    echo "Menor d'edat"
fi
```
- `if` = si
- `then` = aleshores
- `else` = si no
- `fi` = final (és `if` al revés)

**Amb més de dues opcions** → `elif` ("si no, però si..."):
```bash
if [ $nota -ge 9 ]; then
    echo "Excel·lent"
elif [ $nota -ge 5 ]; then
    echo "Aprovat"
else
    echo "Suspés"
fi
```
Va mirant **de dalt a baix** i fa **només la primera** que es complix.

### Comparar números

| Escriu | Vol dir | Truc per a recordar-ho |
|---|---|---|
| `-eq` | igual a | **eq**ual |
| `-ne` | diferent de | **n**ot **e**qual |
| `-gt` | major que | **g**reater **t**han |
| `-ge` | major o igual que | **g**reater or **e**qual |
| `-lt` | menor que | **l**ess **t**han |
| `-le` | menor o igual que | **l**ess or **e**qual |

### Comparar text

| Escriu | Vol dir |
|---|---|
| `[ "$a" = "$b" ]` | són iguals |
| `[ "$a" != "$b" ]` | són diferents |
| `[ -z "$a" ]` | està **buit** |
| `[ -n "$a" ]` | **no** està buit |

### Preguntar per fitxers i carpetes

| Escriu | Pregunta |
|---|---|
| `[ -e "$x" ]` | existix? |
| `[ -f "$x" ]` | és un **fitxer**? |
| `[ -d "$x" ]` | és una **carpeta**? |

### Dues condicions alhora

```bash
if [[ $n -ge 1 && $n -le 10 ]]; then echo "Entre 1 i 10"; fi
```
- `&&` = **i** (s'han de complir les dues)
- `||` = **o** (n'hi ha prou amb una)
- `!` = **no** (al revés)

> `[[ ]]` (doble) és una versió millorada de `[ ]` que permet usar `&&` i `||` dins.

### Comprovar si una ordre funciona

L'`if` també pot mirar si una ordre ha anat bé:
```bash
if id jose &>/dev/null; then
    echo "L'usuari jose existix"
fi
```
`&>/dev/null` = "no em mostres res, només vull saber si ha funcionat".

---

## 8. Molts casos: `case`

Quan una variable pot tindre **molts valors** diferents. Més net que molts `elif`.

```bash
case $opcio in
    1) echo "Has triat u" ;;
    2) echo "Has triat dos" ;;
    *) echo "Opció no vàlida" ;;
esac
```
- `*)` = **qualsevol altra cosa**
- Cada opció acaba en `;;`
- `esac` = final (és `case` al revés)

---

## 9. Repetir coses: bucles

### `for`: per a cada element d'una llista
```bash
for fruita in poma pera plàtan; do
    echo "M'agrada la $fruita"
done
```
Ix:
```
M'agrada la poma
M'agrada la pera
M'agrada la plàtan
```
A cada volta, `fruita` agafa el **següent** valor.

### `for` amb fitxers ⭐
`*` vol dir "**tot el que hi ha** en la carpeta":
```bash
for fitxer in ~/Documents/*; do
    echo "$fitxer"
done
```
Mostra cada fitxer de la carpeta, un per línia.

### `for` per a comptar
```bash
for (( i=1; i<=5; i++ )); do
    echo "Volta $i"
done
```
Ix: `Volta 1`, `Volta 2`... fins a `Volta 5`.

### `while`: mentre es complisca
```bash
i=1
while [ $i -le 3 ]; do
    echo $i
    i=$(( i + 1 ))
done
```
Ix: `1 2 3`
> ⚠️ Si oblides el `i=$(( i + 1 ))`, no para mai (bucle infinit). Per a parar-lo: **Ctrl + C**.

### `until`: fins que es complisca
És el contrari de `while`: repetix **fins que** la condició siga certa.
```bash
until [ "$resposta" = "si" ]; do
    read -p "Vols eixir? " resposta
done
```

### Eixir o saltar
| Escriu | Què fa |
|---|---|
| `break` | **ix** del bucle ja |
| `continue` | **salta** a la volta següent |

**Exemple:** preguntar fins que la resposta siga bona
```bash
while true; do                     # repetix per sempre...
    read -p "Número entre 1 i 10: " n
    if [[ $n -ge 1 && $n -le 10 ]]; then
        break                      # ...fins que és correcte
    fi
    echo "No vàlid, torna a provar"
done
```

---

## 10. Funcions (ordres fetes per tu)

Una funció és un **trosset de codi amb nom** que pots usar tantes vegades com vulgues.

```bash
saludar() {              # 1. la CREES
    echo "Hola $1"
}

saludar Jose             # 2. la USES
saludar Maria
```
Ix:
```
Hola Jose
Hola Maria
```
- Primer **es crea**, després **s'usa**.
- Per a usar-la, **sense parèntesis**: `saludar Jose`.
- Dins de la funció, `$1`, `$2`... són **el que li passes a la funció**.

**Guardar el que torna una funció:**
```bash
doble() {
    echo $(( $1 * 2 ))
}

resultat=$(doble 5)
echo $resultat
```
Ix: `10`

**Funció + bucle** (molt habitual):
```bash
for nom in Jose Maria Pep; do
    saludar $nom
done
```

---

## 11. Llistes (arrays)

Una variable que guarda **diversos valors**.

```bash
colors=(roig verd blau)
echo ${colors[0]}       # roig  (es comença a comptar per 0!)
echo ${colors[1]}       # verd
echo ${colors[@]}       # roig verd blau  (tots)
echo ${#colors[@]}      # 3  (quants n'hi ha)
```

---

## 12. Ordres útils

| Ordre | Què fa | Exemple → Resultat |
|---|---|---|
| `echo` | mostra un text | `echo hola` → `hola` |
| `basename` | lleva la ruta, deixa el nom | `basename /home/jose/a.txt` → `a.txt` |
| `grep` | busca línies que tenen una paraula | `grep ERROR fitxer.log` |
| `grep -c` | **compta** quantes línies la tenen | `grep -c ERROR fitxer.log` → `2` |
| `wc -l` | compta línies | `wc -l fitxer.txt` → `10` |
| `sort` | ordena | `sort noms.txt` |
| `find` | busca fitxers | `find ~ -name "*.txt"` |
| `id` | diu si un usuari existix | `id root` |
| `cut` | talla un tros de cada línia | `cut -d: -f1 /etc/passwd` → noms d'usuaris |
| `date` | data i hora | `date` |

### La tuberia `|`
Passa el resultat d'una ordre a la següent:
```bash
ls | wc -l
```
= "llista els fitxers **i després** compta quantes línies ix" → quants fitxers hi ha.

---

## 13. Quan no funciona

- Executa'l així per a veure **pas a pas** què fa:
```bash
  bash -x script.sh
```
- Posa un `echo` per a veure què val una variable:
```bash
  echo "La variable val: $nom"
```
- Llig l'error: normalment et diu **la línia** on està el problema.
- Revisa la taula d'**errors típics** (apartat 2).
