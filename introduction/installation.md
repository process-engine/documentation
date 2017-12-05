# Installation

Bevor die Prozessengine genutzt werden kann, muss diese erst installiert werden.

Dazu muss das [Skeleton Repository](https://github.com/process-engine/skeleton) geklont werden.
Dieses beinhaltet das minimal Setup, mit dem die Prozessengine ausführbar ist.

```
git clone git@github.com:process-engine/skeleton.git
```

Das Repository besteht aus:

* einem Docker Container mit der Datenbank der Prozessengine
* dem Server der Prozessengine

Als Erstes muss die Datenbank gestartet werden. 
Dazu navigiert man in den `database`-Ordner und führt 
die `postgres_docker.js` mit folgenden Befehl aus.

```
node postgres_docker.js start
``` 

Sobald diese gestartet ist geht man in den `process-engine-server`-Ordner.
Dort installiert man zunächst alle Dependencies und startet dann den Server.

```
npm install
npm start
```

Wenn der Server der Prozessengine erfolgreich gestartet ist, kann Charon gestartet werden.

# Charon

Zunächst muss das [Charon Repository](https://github.com/process-engine/charon) geklont werden. 

```
git clone git@github.com:process-engine/charon.git
```

In dem geklonten Projekt installiert man alle Dependencies;
sobald das abgeschlossen ist, kann man Charon starten.

Diese Befehle erledigen die Aufgaben:

```
npm install
npm start
```

Sobald Charon gestartet ist, kann es über `http://localhost:9000/` aufgerufen werden.

Das Ergebnis sollte so aussehen:

![Charon](images/charon.png)
