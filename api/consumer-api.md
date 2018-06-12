# Schnittstelle: ConsumerAPI

Die ConsumerAPI dient zur Ausführung von Prozessmodellen und der daraus
resultierenden Interaktion mit der ProcessEngine.

Die fachliche Stabilität ist eines der wichtigsten Merkmale der ConsumerAPI.

> ## TODOs und allgemeine Fragen
>
> * Spezifikation des UserTask-Payloads
> * Werden bei der Rest-API die Validierungen geliefert?
> * Auflistung der IConsumerAPI-Methoden zu den REST-APIs

## Begriffsdefinitionen

Manche Begriffe haben im Kontext der ConsumerAPI eine besondere Bedeutung,
die sich aus dem Namen nicht unbedingt offensichtlich ableiten lässt.

Um Missverständnissen vorzubeugen, werden nachfolgend die wichtigsten Begriffe
kurz definiert.

### Definition von 'Consumer'

Ein Consumer ist eine Person oder ein Programm, das in die Ausführung
eines Prozesses involviert ist. Er ist ein Akteur in einem Prozess.

Beispiele sind:

* Eine Person, die ein Formular ausfüllen muss, welches vom Prozess benötigt
  wird.
* Ein Programm, das einen laufenden Prozess über eine Zustandsveränderung
  informiert.
* Eine Person oder ein Programm, das einen Prozess startet.

### Definition von 'Correlation'

Es kann vorkommen, dass das Ausführen eines Prozesses den Start anderer
Prozesse mit sich zieht, oder dass mehrere Prozesse nacheinander ablaufen
und so eine Prozesskette bilden.

Derartige Konstrukte, werden als `Vorgang`, oder `Correlation` bezeichnet.

_Hinweis_: Ein Vorgang muss nicht _zwingend_ aus mehreren Prozessen bestehen.
Man kann auch einen Vorgang mit einem einzelnen Prozess definieren.

### Definition von 'Event'

Das `Event` bezeichnet die allgemeine Basis für Ereignise, die bei der
Verarbeitung von Prozessmodellen innerhalb der ProcessEngine aufkommen können.

Bei den Events werden zwei Unterteilungen vorgenommen:

* `BpmnEvent` -Events, die durch den BPMN 2.0 Standard definiert sind.
* `SystemEvent` -Events, die durch die Verarbeitung eines Prozessmodells
  innerhalb der ProcessEngine vom System ausgelöst werden und nicht durch
  den BPMN Standard definiert sind.

#### Definition von 'System Event'

Ein `SystemEvent` bezeichnet ein Event, welches sich auf einen Prozess oder
Vorgang bezieht, aber **nicht** innerhalb des zugehörigen Prozesmodells
modelliert ist.

`System Events` sind zum Beispiel:

* Prozess gestartet
* Prozess beendet
* Prozess abgebrochen

#### Definition von 'BPMN Event'

Mit dem Begriff `BPMN Event` ist immer ein Event gemeint, welches in einem
Prozessmodell modelliert wurde.

Beispiele für `BPMN Events`:

* Email Versand erfolgreich
* Der Prozess sendet ein Signal
* Eine Nachricht wurde empfangen
* Ein Timer ist abgelaufen

## Technischer Aufbau

![Aufbau](./consumer_api/images/consumer_api_architecture.png)

Wie im Diagramm zu erkennen, unterscheidet man zwischen zwei Anwendungsfällen:

### Anwendung mit _integrierter_ Process Engine

In diesem Fall greifen externe Anwendungsservices auf den **ConsumerAPI-core**
zu, der dann wiederum mit den Services der Process Engine kommuniziert.

### Anwendung mit _externer_ Process Engine

Hier kommt zusätzlich ein **ConsumerClient** mit ins Spiel.
Dieser kommuniziert über HTTP-Routen und Messagebus-Kanäle mit der ConsumerAPI
der externen Process Engine.

Sowohl der **consumer-api_client** als auch der **consumer-api_core** leiten
ihre Schnittstellen aus dem `IConsumerAPI` Interface ab, wodurch sichergestellt
ist, dass sich beide Komponenten auf die exakt gleiche Art verwenden lassen.

Das gewährleistet auch eine sehr leichte Austauschbarkeit, da es mit nur wenig
Aufwand möglich ist z.B. eine Process Engine, die in einer Anwendung intern
verwendet wird, gegen eine externe Process Engine auszutauschen, die z.B.
auf einem zentralen Server liegt.

### consumer-api_core und consumer-api_http

Das consumer-api_core Paket dient der Kommunikation mit der Process Engine.

In einer Anwendung mit integrierter Process Engine wird die ConsumerAPI
als Service direkt verwendet.

Wird eine externe Process Engine verwendet, dient das consumer-api_http-Paket
als Schnittstelle für den consumer-api_client um mit dem
consumer-api_core zu kommunizieren.

### consumer-api_client-Paket

Der consumer-api_client dient der Kommunikation mit der ConsumerAPI
einer **externen** Process Engine.

Das Paket besteht aus folgenden Komponenten:

* Einem _Service_, den die implementierende Anwendung verwenden kann
* Einem _Repository_, welches über HTTP, bzw. Messagebus mit der ConsumerAPI
  der externen Process Engine kommuniziert

### REST/Messagebus-Schnittstelle

consumer-api_client und consumer-api_core kommunizieren über eine REST- und eine
Messagebus-Schnittstelle.

Diese Schittstellen dienen keinem anderen Zweck und sollten dementsprechend
auch niemals über eine andere Komponente als dem consumer-api_client verwendet
werden.

Durch die gemeinsame Verwendung des `IConsumerApi` Interfaces leiten sich
die Routen und Pfade der Schnittstellen direkt aus diesem ab.

#### HTTP-Routen

Alle Routen besitzen ein Präfix, das sich nach der aktuellen
API-Version richtet.
Bei einer API-Version 1 würde dies folgendermaßen aussehen:

```REST
/api/consumer/v1
```

> TODO: mm - muss noch ausformuliert werden

Eine Erklärung zur Routenbenennung kann [hier](./consumer_api/dealing_with_events.md#auslösen-eines-prozessinstanz-events) eingesehen werden.

Die Aufgaben der jeweiligen Routen wird im folgenden Abschnitt genauer erklärt.

## Aufgaben der ConsumerAPI

Über die ConsumerAPI müssen folgende Aufgaben erledigt werden können:

* [Auflisten startbarer Prozessmodelle](./consumer_api/aufgaben/auflisten-startbarer-prozessmodelle.md) **(Done)**
  * [Alle Prozessmodelle abfragen](./consumer_api/aufgaben/auflisten-startbarer-prozessmodelle.md#alle-prozessmodelle-abfragen) **(Done)**
  * [Einzelnes Prozessmodell abfragen](./consumer_api/aufgaben/auflisten-startbarer-prozessmodelle.md#einzelnes-prozessmodell-abfragen) **(Done)**
* [Starten eines Prozessmodells](./consumer_api/aufgaben/starten-eines-prozessmodells.md) **(Done)**
  * [Starten und auf ein `System Event` warten](./consumer_api/aufgaben/starten-eines-prozessmodells.md#starten-und-auf-ein-system-event-warten) **(Done)**
  * [Starten und auf ein bestimmtes EndEvent warten](./consumer_api/aufgaben/starten-eines-prozessmodells.md#starten-und-auf-ein-bestimmtes-endevent-warten) **(Done)**
* [Abfragen von BPMN-Ereignissen auf die der Prozess wartet](./consumer_api/aufgaben/abfragen-von-bpmn-ereignissen-auf-die-der-prozess-wartet.md)
* [Auslösen von Ereignissen](./consumer_api/aufgaben/auslösen-von-ereignissen.md)
* [Auflisten wartender UserTasks](./consumer_api/aufgaben/auflisten-wartender-usertasks.md) **(Done)**
* [Abschließen eines UserTasks](./consumer_api/aufgaben/abschließen-eines-usertasks.md) **(Done)**
* [Erhalten von Prozessbenachrichtigungen](./consumer_api/aufgaben/erhalten-von-prozessbenachrichtigungen.md)
  * [Arten von Prozessbenachrichtigungen](./consumer_api/aufgaben/erhalten-von-prozessbenachrichtigungen.md#arten-von-prozessbenachrichtigungen)
  * [Erhalten von BPMN-Events](./consumer_api/aufgaben/erhalten-von-prozessbenachrichtigungen.md#erhalten-von-bpmn-events)
  * [Erhalten von Infos zu start und ende von Aktivitäten](./consumer_api/aufgaben/erhalten-von-prozessbenachrichtigungen.md#erhalten-von-infos-zu-start-und-ende-von-aktivitäten)
  * [Erhalten von System-Events](./consumer_api/aufgaben/erhalten-von-prozessbenachrichtigungen.md#erhalten-von-system-events)
  * [Erhalten von BPMN-Signalen](./consumer_api/aufgaben/erhalten-von-prozessbenachrichtigungen.md#erhalten-von-bpmn-signalen)
