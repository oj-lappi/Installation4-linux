Script
======

Ett script tolkas av en tolk
----------------------------

Ett script är ett program definierad som text, som tolkas av ett tolkprogram 
(eng. interpreter) när du kör det - t.ex. av en shell. Tolkprogrammet 
förvandlar texten till instruktioner som läses av processorn ord för ord.

Ett kompilerat program kör direkt på processorn
-----------------------------------------------

Motsatsen av ett script är ett kompilerat program, som alltså redan har 
blivit omvandlat till maskininstruktioner. Kompilerade program skapas via en 
kompilator.

Vissa språk är avsedda för kompilering - t.ex. C, Rust, go - medans andra är 
avsedda för tolkning - t.ex. olika shells, python, ruby. Ni har redan använt
ett tolkprogram. Programmet som kör shellscript är nämligen samma program som 
användare skriver i!

Det finns språk med både tolker och kompilatorer, t.ex. python har också en
kompilator. Python brukar ändå ofta beaktas som ett scriptspråk.

När skriva script, när skriva kompilerat?
-----------------------------------------

Kompilerade program kör snabbare än script. Script kan vara snabbare att skriva.

Ifall du vill bygga ett program som:

 - kräver mycket resurser, t.ex. ett datorspel eller en databasapplikation
 - är komplicerat eller stort
 - tar in data som är strukturerat på ett komplicerat sätt

 lönar det sig att kompilera ditt program.

Om du vill:

 - snabbt skriva en prototyp 
 - manipulera text 
 - koppla ihop två existerande program 
 
brukar det gå enklare med ett script-språk.


Shell-scripts
=============

Program
-------

Shell-script skrivs på samma sätt som du skriver kommandon i terminalen:

 - För att köra ett kommando, skriv namnet av programmet eller kommandot.
 - Varje ny rad kör ett nytt kommando
 - Du kan också sätta semikolon ; mellan kommandon på samma rad

T.ex:


echo "hej där, i den nuvarande katalogen finns:"
ls


Variabler
---------

Du kan definiera variabler med hjälp av =

T.ex:

best_case=Linux
worst_case=Windows


Du kan använda variabler genom att lägga ett $, dollartecken före variabelnamn

T.ex:

echo "Om jag har tur så kör datorn $best_case :)"
echo "Om jag har otur så måste jag använda $worst_case :("

[Output]

Om jag har tur så kör datorn Linux :)                               
Om jag har otur så måste jag använda Windows :(


Argument
--------

Argument är de ord som skrivs på kommandoraden för att starta programmet. De 
sparas i speciella variabler:

$0 innehåller första ordet (programmets namn)
$1 innehåller andra ordet (första argumentet)
$2 innehåller tredje ordet (andra argumentet)
.
.
.
osv.

$@ innehåller alla argument

Kontrollstrukturer
------------------

If-satser
---------

If-satser i shell-script ser lite lustiga ut:

if [  <villkor> ]
then
	<kommando>
	<kommando>
fi

Villkoret innanför [] tolkas genom programmet test. test tar emot argument med
en viss struktur:

```
Uttrycket		Är sant om...
=========		=============

! UTTRYCK 		UTTRYCK är falskt
-n STRÄNG 		STRÄNG är längre än noll tecken 
-z STRÄNG 		Längden av STRÄNG är noll (variabeln är tom)
STRÄNG1 = STRÄNG2 	STRÄNG1 är lika med STRÄNG2
STRÄNG1 != STRÄNG2 	STRÄNG1 inte är lika med STRÄNG2
HELTAL1 -eq HELTAL2 	HELTAL1 är numeriskt lika med HELTAL2
HELTAL1 -gt HELTAL2 	HELTAL1 är numeriskt större än HELTAL2
HELTAL1 -lt HELTAL2 	HELTAL1 är numeriskt mindre än HELTAL2
-d FIL 			FIL existerar och är en katalog
-e FIL 			FIL existerar
-r FIL 			FIL existerar och får läsas
-s FIL 			FIL existerar och har en storlek större än noll (den är inte tom)
-w FIL 			FIL existerar och får skrivas till
-x FIL 			FIL existerar och får köras som ett program
```
Obs, det finns inga datatyper i shell-script, allting är text, men saker kan 
tolkas som tal.

Mera kan du läsa i manualen för test

Du kan skriva en if-else struktur:


if [ $distro = "Ubuntu" ]
then
	installeraUbuntu
elif [ $distro = "Debian" ]
then
	installeraDebian
else
	echo "installerar ingenting"
fi


&& och ||
=========

Det finns logiska operatorer:

 och  	 &&
 eller	 ||

De kan läggas mellan två villkor:

if [ <villkor1> ] && [ <villkor2>]
then
	<kommando>
	<kommando>
fi

Loopar
======

Det finns while-loopar och for-loopar. Jag går endast genom while-satsen. For
liknar pythons for-loopen

While-loopar
------------

En while-loop är som en if-sats fast en loop:

while [ <villkor> ]
do
	<kommando>
	<kommando>
done

Använd while-loopar för att läsa in data från stdin
---------------------------------------------------

while read line
do
	<kommando>
	<kommando>
done

Kommer att läsa in data från stdin i variabeln $line en rad åt gången.

Läs in data från en fil
-----------------------

while read line
do
	<kommando>
	<kommando>
done < fil

Kommer att läsa in data från filen "fil" i $line en rad åt gången.

Läs in data
===========

Alla kommandon i ett shell-script får samma stdin som scriptet fått.

Om ditt script heter hitta_korvar och innehåller kommandot:

	grep korv | less

Så kommer:

	echo "korv"|./hitta_korvar

ge vidare inputten "korv" till grep


Hur ska vi skriva ett shell-script?
===================================

Ett shell-script är alltså bara en text-fil som innehåller shell-kommandon. 
För att Linux ska fatta att filen är ett program och ska köras av ett 
tolkprogram måste vi göra två saker.

1. Vi måste skriva in vilket tolkprogram som ska köra scriptet
==============================================================

Lägg till #! på första raden
----------------------------

Om du vill köra ett program som ett script i Linux (eller Unix) ska du definiera
genom vilket program scriptet ska tolkas.

Detta gör du genom att börja filen med de två tecknen #! som kallas hashbang
eller shebang.

En första rad i ett script som ser ut så här:

#!/bin/sh

Säger till Linux att filen ska tolkas av programmet /bin/sh

Välj tolkprogram
----------------

Eftersom vi skriver ett shell-script är tolkprogrammet antagligen antingen
/bin/sh eller /bin/bash

/bin/sh finns på alla Unix-system, så om du vill att scriptet ska gå att köra
på alla Unix-datorer använd /bin/sh. Men om du bara använder scriptet på egen
dator kan du fritt använda /bin/bash.


2. Vi måste ändra filrättigheterna så att filen går att köra
============================================================

Det finns tre kategorier av användare:

De tre kategorierna är:

 - u = user, filens ägare
 - g = group, användare som tillhör gruppen som äger filen
 - o = others, alla andra användare

rättigheterna för alla tre grupper är:

 - r = read
 - w = write
 - x = execute

För att kunna köra programmet måste användaren som kallar på programmet ha
execute-rättigheter till programmet.

Lägg till execute-rättigheter till en fil
=========================================

Vi använder programmet chmod för att ändra rättigheterna för en fil.

För att ändra ägarens rättigheter till rwx (läs, skriv, kör), skriv:

	chmod u=rwx fil 

För att lägga till execute-rättigheter åt ägaren, skriv:

	chmod u+x fil

På samma sätt, om vi vill lägga till execute-rättigheter åt alla:

	chmod ugo+x fil

Om du vill ta bort execute-rättigheter från en fil:

	chmod ugo-x fil

Att köra ett shell-script
=========================

Du kör ett shell-script som vilket som helst annat program, genom att kalla dess
namn. Om shell-scriptet inte finns i en katalog i din PATH-variabel måste du 
skriva en stig till scriptet.

Om ditt script är i den nuvarande katalogen kan du alltså skriva:

./script.sh

för att köra ett script som heter script.sh.

(Obs, script BEHÖVER inte sluta med .sh, de kan fast sluta med .docx om du vill, 
men du känner lättare igen script om de slutar med .sh)


Tips till uppgifterna
=====================

Argument kom du alltså åt genom att använda variablerna $1, $2 osv.

Innehållet av variabler kan användas inne i kommandon  med $1 eller ${1}


Minns att du kan använda alla tidigare tricks du har lärt dig, t.ex. >, <, |

Du kan kombinera inläsning från filer med "<" med pipes "|"

t.ex. 
	
	program1 < fil | program2

	1. innehållet av fil blir stdin till program1
	2. stdout från program1 blir stdin för program2

Det går också att skicka inputten av en fil till stdin med <

exec 0<fil

skickar innehållet av filen "fil" till scriptets stdin. Du kan sedan använda 
stdin som vanligt.

Uppgifter!
==========

1. Skriv ett shell-script som säger "Hello world"

2. Skriv ett shell-script som heter hälsa.sh och tar emot ett argument och
   skriver ut "Hej <argument>"

   Om inget argument har getts, skriv ut "Hej namnlös"

3. Skriv ett program som söker efter ditt namn från stdin
   Tips: grep

4. Skriv om programmet från lektion 3 som räknade hur ofta ord förekommer i en 
   text så att programmet räknar ord från stdin

5. Skriv om programmet i uppgift fyra så att programmet räknar ord i en fil,
   första argumentet till programmet är filnamnet till filen som programmet
   räknar ord från

6. Kombinera 4 & 5, ifall det finns ett filnamn som argument, sök därifrån.
   Annars sök från stdin

7. Spara alla program i en katalog i din home-katalog
   Lägg till katalogen till din PATH

   t.ex. genom att lägga till en rad till din .bashrc-fil:

   export PATH=$PATH:<script-katalog>

   testa genom att köra programmen med bara deras namn


Exempelprogram
==============

Du kan kopiera programmen och försöka köra dem först

Exempel 1
----------

#!/bin/sh
#Limma ihop två filer med cat, men i fel ordning!
cat $2 $1

Exempel 2
---------

Med $() kan du fånga outputten av ett program och genast använda det

#!/bin/sh
echo "Jag heter $(whoami) och jag bor i $(pwd)"

Exempel 3
---------

Vi kan skriva om programmet nl om vi vill

#!/bin/sh
rad=1
while read line
do
	echo "$rad $line"
	rad=$((rad + 1))
done

Mer inveklade exempel
---------------------

Exempel 4
---------

sed är ett program som det går att göra lite vad som helst med, men det används
för det mesta till att byta ut text till annan text.

sed har ett eget språk, "s/ord/annat ord/g" byter ut alla "ord" till "annat ord"
g betyder att alla "ord" ska bytas ut, annars byts bara det första

#!/bin/sh
#Byt ut ett fult ord till ett mindre fult ord
sed -e "s/fuck/fork/g"

Exempel 5
---------

sed kan också tolka ett script med flaggan -f, därför kan vi också ange sed som 
tolk

#!/bin/sed -f
s/fuck/fork/g

Exempel 6
---------

Kan vara att du måste installera jq före du kan köra programmet.

curl hämtar en webbresurs med http, jq kan läsa json

Det här scriptet skriver ut Chuck Norris-skämt

#!/bin/sh
curl https://api.chucknorris.io/jokes/random 2>/dev/null| jq '.value'
