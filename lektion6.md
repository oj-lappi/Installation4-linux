Git
===

Git är ett versionhanteringssystem som används överallt i världen för utveckling av program.

Ett versionshanteringssystem finns till för att:

 - spara backups
 - ha ett sätt att "gå bakåt" till en äldre version
 - arbeta tillsammans med andra
 - ha kontroll över sina servrar

Git sparar en version av ditt projekt på din dator och en version  på någon annan dator.

Den andra datorn kan vara:

 - en server du äger
 - en annan medarbetares dator
 - en versionhanteringstjänst såsom github eler bitbucket (obs, git != github)

För att överföra projektet från en dator till en annan kan man 

 - "pusha" för att ladda upp en lokal version till en annan dator
 - "pulla" för att ladda ner en fjärrversion lokalt

	
P.g.a de här går det t.ex. att pusha till alla sina servrar för att publicera en ny version av ditt system.


Hur fungerar det
----------------

Starta ett projekt i en ny katalog genom att skriva:

 - git init

Historik
--------

Git sparar historiken av ditt projekt. 

Om ditt projekt har tre filer - A, B & C - kan historiken t.ex. se ut så här:

[Källa:https://git-scm.com/book/en/v1/Getting-Started-Git-Basics](git-history.png)

Tre ställen filer bor i
-----------------------

När du arbetar med git finns det tre ställen som filerna i ditt projekt bor i:

 - Working directory
 - Staging area
 - Din lokala repository

Working directory är bara ditt operativsystems katalog som innehåller projektet.

Staging area är vart du lägger till filer från Working directory för att lägga till till repositoryn.

Repositoryn är det som kommer att sparas i historiken och skickas vidare till andra.

Operationer
-----------

git status
----------

Information om vilken status projektet har.

Överföring
----------

För att föra över filer genom Working directory -> Staging area -> Lokal repository -> annan dator finns det tre operationer.

 - git add	
 - git commit 
 - git push

git add <fil>
-------------

Lägger till <fil> till staging area. Fil kan också vara . eller * för att lägga till _alla_ filer som ändrats

git commit
----------

Kopierar filer från staging arean till lokala repon

git push <remote>
-----------------

Flyttar filer till en annan dator en "remote"

Vanligtvis pushar man till en "master" repository. Om en sådan finns i inställningarna för projektet behöver du bara skriva

```
git push
```

git pull <remote>
-----------------

pull är samma som push men från andra hållet, du hämtar projektet från en annan repo.


Hoppa i historiken
------------------

För att kolla någon annan version av projektet skriver vi:

```
git checkout <version>
```

Uppgifter:

 1. Kolla med git status hur många versioner av den här repon det finns 
 2. Skapa en egen repository för dina uppgifter som du gjort och ladda upp den på github eller bitbucker. Du måste skapa ett konto på någondera av dessa.
 3. Gå tillbaka till första versionen av den här repositoryn med git checkout


\vspace*{\fill}

Källor:

Getting Started - Git Basics, https://git-scm.com/book/en/v1/Getting-Started-Git-Basics (Hämtad 12.2.2019)
