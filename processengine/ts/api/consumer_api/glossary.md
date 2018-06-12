# Glossar

Nachfolgend sind die wichtigsten Begriffe definiert, die in der ConsumerAPI
Dokumentation benutzt werden:

## 'Consumer'

Ein Consumer ist eine Person oder ein Programm, das in die Ausführung
eines Prozesses involviert ist. Er ist ein Akteur in einem Prozess.

Beispiele sind:

* Eine Person, die ein Formular ausfüllen muss, welches vom Prozess benötigt
  wird.
* Ein Programm, das einen laufenden Prozess über eine Zustandsveränderung
  informiert.
* Eine Person oder ein Programm, das einen Prozess startet.

## 'Correlation'

Es kann vorkommen, dass das Ausführen eines Prozesses den Start anderer
Prozesse mit sich zieht, oder dass mehrere Prozesse nacheinander ablaufen
und so eine Prozesskette bilden.

Derartige Konstrukte werden als `Vorgang`, oder `Correlation` bezeichnet.

_Hinweis_: Ein Vorgang muss nicht _zwingend_ aus mehreren Prozessen bestehen.
Man kann auch einen Vorgang mit einem einzelnen Prozess definieren.

## 'Event'

Das `Event` bezeichnet die allgemeine Basis für Ereignisse, die bei der
Verarbeitung von Prozessmodellen innerhalb der ProcessEngine aufkommen können.

Es wird zwischen zwei Arten von `Events` unterschieden:

* `BpmnEvent` -Events, die durch den BPMN 2.0 Standard definiert sind.
* `SystemEvent` -Events, die durch die Verarbeitung eines Prozessmodells
  innerhalb der ProcessEngine vom System ausgelöst werden und nicht durch
  den BPMN Standard definiert sind.

Beide Arten von Events werden über den Messagebus veröffentlicht und sind für
den Benutzer abgreifbar.

### 'BPMN Event'

Mit dem Begriff `BPMN Event` ist immer ein Event gemeint, welches in einem
Prozessmodell modelliert wurde.

Beispiele für `BPMN Events`:

* Ein modelliertes EndEvent wurde erreicht
* Der Prozess sendet ein Signal
* Eine Nachricht wurde empfangen
* Ein Timer ist abgelaufen

### 'System Event'

Ein `SystemEvent` bezeichnet ein Event, welches sich auf die Ausführung eines
Prozesses oder Vorgangs bezieht, aber **nicht** innerhalb des zugehörigen
Prozesmodells modelliert ist.

`System Events` sind zum Beispiel:

* Prozess gestartet
* Prozess beendet
* Prozess abgebrochen
