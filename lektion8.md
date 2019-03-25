# Containers (Docker)

Kolla på videon och svara på frågorna samtidigt. Om du inte förstår några koncept kan du googla dem.

[Video](https://www.youtube.com/watch?time_continue=3&v=V9IJj4MzZBc)


Frågor:

 - Hur skiljer sig en container från en virtuell maskin?
 - Hur förenklar containers utveckling?
 - Hur förenklar containers installering på servers?
 - Hur hjälper containers till när en tjänst växer, dvs. får fler användare?
 - Hur förbättrar containers säkerheten hos en server? 



Docker är alltså en container-teknologi.
Den används i utveckling, i installering, i orkestrering av många tjänster.

En container är ett litet system som använder operativsystemets kernel (vanligtvis en linux-kernel) men inte "ser" någon annan del av datorn.
Allting inne i containern är alltså begränsat till containern (contained).
Det går dock att koppla till volymer, alltså kataloger utifrån containern.

Docker images kan byggas med hjälp av en base image, en Dockerfile och ```docker build```-kommandot.

En image är basen för en container. En container är det som kör, lite som ett program, men innehållandes ett fungerande oerativsystem.

Dockerfiles börjar alltid med ett ```FROM```-direktiv, som bestämmer vilken tidigare image man använder som bas. OM man vill börja helt från början, heter det ```FROM scratch```.
Därefter kan man använda t.ex. COPY, RUN,  ENV-direktiv för att skapa nya images. T.ex. med RUN kan man installera nya program med apt, med COPY kan man överföra filer från ditt OS till imagen.

Andra direktiv, som LABEL, VOLUME, ENTRYPOINT, EXPOSE används för att bestämma hur containern beter sig.

Sist men inte minst, de inställningar du ger in via flaggor till docker styr containerns beteende också.

Mer information [här](https://docs.docker.com/engine/reference/builder/)

## Uppifter

0. Ladda ner Docker med apt, aktivera docker-daemonen med hjälp av systemd. Dvs. kör ```sudo systemctl enable docker``` eller ```sudo systemctl start docker```
	
		daemon 	= ett bakgrundsprogram
		systemd = systemdaemon, bakgrundsprogrammet som styr alla andra bakgrundsprogram.
		enable 	= daemonen startar när du startar datorn
		start 	= starta daemonen just nu

1. Ladda ner t.ex. en Ubuntu-image. Kör den i interaktivt läge (med -i flaggan)
2. Skriv ett eget hello-world script i valfritt språk. Använd en Dockerfile för att bygga en image som innehåller scriptet. Använd ett COPY direktiv.
3. Kör en container baserad på imagen från uppgift 2 interaktivt
4. Kör en container baserad på imagen så att scriptet kör när du startar containern. Använd CMD- eller ENTRYPOINT-direktivet.
5. Ladda ner nginx-imagen från dockerhub, skriv en html-fil och bygg en image som servar html-filen. Testa att servern fungerar.

	tips: nginx kör i containern. Nginx servar med default-inställningar allt som finns i katalogen /usr/share/nginx/html

6. Koppla en container som du utvecklar i fast i containern som kör servern. Skapa en volym i nginx-containern med ett VOLUME-direktiv och koppla ihop din utvecklingscontainer med en --volumes-from flagga. Ändra på html-filen medans servern kör.
