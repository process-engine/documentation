# Towers

Einer der wichtigsten Faktoren von BPMN ist die Modularität. Indem wir
komplexe Vorgänge auf mehrere Diagramme verteilen, erreichen wir mehr
Ordnung, Übersicht und Austauschbarkeit.

Das hier vorgestellte Beispiel demonstriert das Zusammensetzen
mehrerer Diagramme zur Lösung eines Problems.

## Lernziele

- Umgang mit CallActivities
- Verwendung von ScriptTasks

## Szenario

In unserem Szenario wollen wir einen Stapelturm von Elementen
verschieben. Die Reihenfolge der Elemente soll gleich bleiben. Die
Ausgangssituation sieht so aus:

```
A
B
C
-  -  -
0  1  2
```

Wir wollen den Turm von der Position `0` zu Position `2` verschieben:

```
      A
      B
      C
-  -  -
0  1  2
```

Es ist jedoch nur möglich, das oberste Element des Turms zu
bewegen. So können wir etwa `A` von `0` auf `1` verschieben:

```

B
C  A
-  -  -
0  1  2
```

Nach kurzer Betrachtung kommt man zur folgenden Lösung:

```
A       |         |         |    C    |         |         |       A
B       | B       |    B    |    B    |    B    |       B |       B
C       | C  A    | C  A    |    A    |    A  C |    A  C |       C
-  -  - | -  -  - | -  -  - | -  -  - | -  -  - | -  -  - | -  -  -
0  1  2 | 0  1  2 | 0  1  2 | 0  1  2 | 0  1  2 | 0  1  2 | 0  1  2
        ⤻         ⤻         ⤻         ⤻         ⤻         ⤻
```

Die naive BPMN-Implementierung würde einfach eine Reihe von Tasks
beinhalten, wobei jeder Task ein einzelnes Element bewegt. Dies ist
äußerst unübersichtlich und verhindert die Wiederverwendbarkeit des
Prozesses. Was wäre, wenn folgend die Aufgabe entsteht, dass der Turm
zur Position `1` verschoben werden soll?  Und wie sähe das Diagramm
aus, wenn der Turm nicht nur drei Elemente hoch wäre, sondern
hunderte?


## Datenrepräsentation

Im Mangel einer Lagerhalle mit Stapeltürmen voller Buchstaben brauchen
wir eine Datenrepräsentation der Türme. Wir stellen den Zustand der
Türme mit JavaScript-Arrays dar. Ein Array mit der Länge 3
repräsentiert die drei Positionen. Jede Position beinhaltet ein weiteres
Array mit den Elementen des Turms.

Der folgende Zustand:

```
   B
C  A
-  -  -
0  1  2
```

wird mit `[["C"], ["B", "A"], []]` dargestellt.

## Lösungsidee

Zur modularen Lösung erstellen wir drei Prozesse:

1. **Move Element** erlaubt das Bewegen des obersten Elements eines
   Turms auf die oberste Stelle einer anderen Position.
1. **Flip Tower** dreht den Turm auf den Kopf und bewegt ihn
   dabei. Dieser Vorgang ist sehr einfach umzusetzen, da wir immer nur das
   oberste Element verschieben müssen.
1. **Move Tower** erstellt die Ausgangslage und verschiebt den Turm
   von Position `0` zu `2`. Dies erreichen wir, indem wir zweifach
   **Flip Tower** aufrufen.

Die Modellierung der Diagramme wird getrennt erklärt:

- [Move Element](./move_element.md)
- [Flip Tower](./flip_tower.md)
- [Move Tower](./move_tower.md)


# Ausführung

Hier sehen wir die Prozesse in Ausführung:

{% video controls="controls"%}./images/execution.mp4{% endvideo %}
