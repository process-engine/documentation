# Installation

Bevor die Prozessengine genutzt werden kann, muss diese zunächst installiert werden.

Zunächst muss das [Skeleton Repository](https://github.com/process-engine/skeleton) geklont werden. Dieses beinhaltet das minimal Setup, mit dem die Prozessengine ausführbar ist.
```
git clone git@github.com:process-engine/skeleton.git
```

Das Repository besteht aus:
* einem Docker Container mit der Datenbank der Prozessengine
* dem Server der Prozessengine

Das Skeleton Repository besitzt eine `README.md`, welche die notwendigen Schritte, um die Prozessengine zu starten, genau erklärt.

> Wichtig: Die Datenbank muss **vor** dem Server gestartet werden.

Wenn die Prozessengine erfolgreich gestartet ist, kann Charon gestartet werden.

# Charon

Zunächst muss das [Charon Repository](https://github.com/process-engine/charon) geklont werden. 
```
git clone git@github.com:process-engine/charon.git
```
Auch das Charon Repository besitzt eine `REAMDME.md`, welche das starten von Charon genau erklärt.
Sobald Charon erfolgreich gestartet ist, kann es über `http://localhost:9000/` aufgerufen werden.