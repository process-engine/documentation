# Installation

Bevor die Prozessengine genutzt werden kann, muss diese erst installiert werden.

Dazu muss das [Skeleton Repository](https://github.com/process-engine/skeleton) geklont werden. Dieses beinhaltet das minimal Setup, mit dem die Prozessengine ausführbar ist.
```
git clone git@github.com:process-engine/skeleton.git
```

Das Repository besteht aus:
* einem Docker Container mit der Datenbank der Prozessengine
* dem Server der Prozessengine

Als erstes muss die Datenbank gestartet werden. Dazu geht man in den `database`-Ordner und führt die `postgres_docker.js` mit folgenden Befehl aus.

```
node postgres_docker.js start
``` 

Sobald dieser gestartet ist geht man in den `process-engine-server`-Ordner. Dort installiert man zunächst alle Dependencies und startet dann den Server.

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
In dem geklonten Ordner installiert man dann noch alle Dependencies und sobald dies fertig ist, kann man Charon einfach starten.

```
npm install
npm start
```

Sobald Charon erfolgreich gestartet ist, kann es über `http://localhost:9000/` aufgerufen werden.

![Charon](images/charon.png)
