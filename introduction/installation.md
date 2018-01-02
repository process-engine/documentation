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
Dazu navigiert man in den `database`-Ordner; dort führt
die `postgres_docker.js` mit folgenden Befehl aus:

```
node postgres_docker.js start
```

Alternativ kann man die Datenbank auch ohne Docker ausführen:

Dazu benötigt man PostgreSQL. Dies kann man von folgendem Link runterladen und
wie beschrieben installieren.

```
https://www.postgresql.org/download/
```

Nun wird eine Datenbank mit dem Namen `processengine` benötigt. Via Doppelklick
auf eine bestehende Datenbank öffnet man ein Terminal. In diesem führt man dann
den folgenden Befehl aus:

```
CREATE DATABASE processengine;
```

Dann muss ein User mit dem Namen `admin` und dem Passwort `admin` erstellt
werden:

```
CREATE USER admin PASSWORD 'admin';
```


Sobald diese gestartet ist geht man in den `process-engine-server`-Ordner.
Dort installiert man zunächst alle Dependencies; dann startet man den Server:

```
npm install
npm start
```

Dann kann Charon gestartet werden.

# Charon

Zunächst muss das [Charon Repository](https://github.com/process-engine/charon) geklont werden.

```
git clone git@github.com:process-engine/charon.git
```

In dem geklonten Projekt installiert man alle Dependencies;
danach kann Charon gestartet werden.

Diese Befehle erledigen die beiden Aufgaben:

```
npm install
npm start
```

Sobald Charon gestartet ist, kann es über `http://localhost:9000/` aufgerufen werden.

Das Ergebnis sieht so aus:

![Charon](images/charon.png)
