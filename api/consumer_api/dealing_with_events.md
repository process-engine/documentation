# ConsumerAPI

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

## Umgang mit Events

Wenn von Events gesprochen wird, gibt es dabei zwei Sichtweisen:

1. Events in einem Prozessmodell.

   Kernfrage: "Welche Events sind Modelliert?"

1. Events an einer Prozessinstanz

   Kernfrage: "Auf welche von mir auslösbaren Events wird zurzeit gewartet?"

Die ConsumerAPI befasst sich nur mit den Events an Prozessinstanzen. Die Events
in einem Prozessmodell gehören thematisch zur ManagementAPI.

Prozessinstanz-Events sind keine Ressource im herkömmllichen Sinn; eine Abbildung
über CRUD-Operationen ist schwierig: Wir wollen Events lediglich auslösen, aber
nicht erstellen, bearbeiten oder löschen;
darum wählen wir einen anderen Ansatz beim Design der Routen.

Die ConsumerAPI benötigt bezüglich Events hauptsächlich zwei Fähigkeiten:

1. Das Abfragen der Prozessinstanz-Events.

   Abhängig vom State der Prozessinstanz erhalte ich eine unterschiedlicher Antwort;
   ich erhalte Events, die darauf warten ausgelöst zu werden und vom aktuellen Benutzer
   auch ausgelöst werden können.

1. Das Auslösen eines solchen Events.

### Abfragen der Prozessinstanz-Events

> TODO: Die Schnittstelle zum erhalten von Prozessinstanz-Events beschreiben

### Auslösen eines Prozessinstanz-Events

#### Exkurs: REST Verben und Nomen

REST-APIs befassen sich in der Regel damit, von welcher Ressource der Zustand
wie verändert werden soll. In einfachen Fällen:

- Beschreibt die HTTP-Methode als Verb, was mit der Ressource passieren soll.
- Identifiziert die Route (bestehend aus Nomen) die zu bearbeitende Ressource.

Beispiel: `POST /user` beschreibt, dass ein neuer Benutzer angelegt werden soll.

#### Exkurs: Entitäten vs Ressourcen

Bei einfachen APIs bilden die Routen häufig eins zu eins die Entitäten nach,
die in der Anwendung existieren. REST-APIs befassen sich aber nur mit
Ressourcen, nicht mit Entitäten. Deshalb ist es wichtig, die Unterschiede zu
kennen.

Während es bei Entitäten häufig um konkrete (Datenbank-)Objekten geht, sind
Ressourcen sehr viel abstraker:

> The key abstraction of information in REST is a resource. Any information that
> can be named can be a resource: a document or image, a temporal service (e.g.
> "today's weather in Los Angeles"), a collection of other resources, a
> non-virtual object (e.g. a person), and so on. In other words, any concept
> that might be the target of an author's hypertext reference must fit within
> the definition of a resource. **A resource is a conceptual mapping to a set of
> entities, not the entity that corresponds to the mapping at any particular
> point in time.**

-- [Roy Fielding](http://www.ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm#sec_5_2_1_1)

#### Verben in Routen

HTTP-Methoden reichen als Verben nicht immer aus, um intuitiv zu beschreiben,
wie der Zustand der Ressource verändert werden soll. Wenn man z.B. ein Bild
rotieren möchte, ergibt ein `POST` auf das Bild keinen Sinn:

```
POST /image/{image_id} // Was passiert hier?
```

Wenn man in dem Beispiel die Konvention bricht, und ein Verb zu der
Route hinzufügt, gewinnt sie Präzison, ohne unverständlicher zu werden:

```
POST /image/{image_id}/rotate // Ah, das Bild wird rotiert!
```

#### Die Route zum auslösen von Prozessinstanz-Events

Beim Auslösen von Prozessinstanz-Events sind die HTTP-Methoden als Verben
ebenfalls nicht ausreichend: Wir können nicht mit HTTP-Methoden beschreiben, wie
der Zustand verändert werden soll; wir wollen eine Funktion auf dem Event
ausführen:

```
POST /process_instance/{process_instance_id}/event/{event_key}/trigger
```

Die eigentliche Ressource ist die Prozessinstanz; der Zustand soll verändert werden.
Als Nebeneffekt wird hier zusätzlich ein neuer Eintrag in der Historie der
Prozessinstanz angelegt. Das geht aus der Route nicht hervor, muss es aber auch
nicht. Wir haben hier die oben beschriebene Konvention bewusst gebrochen.

Anstatt in der Route die Zielressource anzugeben, ließt sie sich wie eine
Aufforderung.

**Bedenken:**

Bei REST-Routen erwartet man im Normalfall nur die HTTP-Methode als Verb und
anschließend nur Nomen, die die Ressource identifizieren. So aufgebaute
Routen sind technisch intuitiv und einfach verständlich für Anwender,
die geübt im Umgang mit REST-APIs sind.

Wir haben hier mit Nomen erst die Ressource identifiziert, und DANN ein weiteres
Verb dahinter gesetzt. Das bricht diesen Aufbau. Solange die Route, die am Ende
dabei definiert wird für den tatsächlichen Endanwender verständlicher wird, ist
das in Ordnung.

#### Alternativer Ansatz: EventTrigger als Ressource

Idee: Operationen, die den Zustand verändern, sind auf einer Ressource
`Event` nicht sinnvoll, auf einer Ressource `EventTrigger` schon.

Wir definieren uns eine neue Ressource, dessen Zustansveränderung impliziert
was wir eigentlich machen wollen. Dadurch muss die Konvention nicht gebrochen
werden, dass die Route nur aus Nomen besteht.

Einen EventTrigger - der ein Event auslöst - könnte wie folgt anlegen werden:

```
POST /process_instance/{process_instance_id}/event/{event_key}/event_trigger
```

Da der event_trigger wie eine herkömmliche Ressource behandelt wird, erhält
man ein eventTrigger-Objekt mit ID als Ergebnis. In diesem
Objekt könnten weitere Informationen enthalten sein, zum Beispiel:

- Wer hat das Event ausgelöst?
- Wann wurde es ausgelöst?
- War das auslösen erfolgreich?

Auch das holen einer eventTrigger-Collection ist in diesem Kontext
sinnvoll. Folgende Route könnte alle Auslöser zu einem Event zurück geben:

```
GET /process_instance/{process_instance_id}/event/{event_key}/event_trigger
```

Oder man holt sich die Details zu einem bestimmten Vorkommnis:

```
GET /process_instance/{process_instance_id}/event/{event_key}/event_trigger/{event_trigger_id}
```

**Bedenken:**

- Eine Historie speziell für Events ist für den Endanwender uninteressant.

   Interessanter ist eine Gesamthistorie zu einer Prozessinstanz.
   Deshalb ergeben die beiden GET-Routen hier zwar technisch
   Sinn, werden aber eventuell nicht benötigt.

- Es muss eine neue Ressource eingeführt werden.

   Ob das intuitiv für den Endanwender ist, ist fraglich.


#### Fazit

Das intuitive Verständnis des tatsächlichen Endanwenders hat beim definieren der
Route höchste Priorität. Deshalb muss man sich fragen: "ist diese Route
so Formuliert, dass der Entanwender direkt versteht wozu sie benutzt werden kann?"

Anders gesagt: Wenn man nicht weiß was die Routen machen - sie das erste mal
sieht - und fachlich beschreiben soll wozu sie dient, bei welcher der folgendenden
varianten ist man näher an dem was wirklich passiert?

```
POST /process_instance/{process_instance_id}/event/{event_key}/trigger

POST /process_instance/{process_instance_id}/event/{event_key}/event_trigger
```
