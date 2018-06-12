# Erhalten von Prozessbenachrichtigungen

* [Arten von Prozessbenachrichtigungen](#arten-von-prozessbenachrichtigungen)
* [Erhalten von BPMN-Events](#erhalten-von-bpmn-events)
* [Erhalten von Infos zu start und ende von Aktivitäten](#erhalten-von-infos-zu-start-und-ende-von-aktivitäten)
* [Erhalten von System-Events](#erhalten-von-system-events)
* [Erhalten von BPMN-Signalen](#erhalten-von-bpmn-signalen)

Der Consumer Client benutzt einen Messagebus, um zur Laufzeit
von der Process Engine über bestimmte `Events` benachrichtigt zu werden.

So ist es z.B. möglich darüber benachrichtigt zu werden, wenn ein bestimmter
Prozess gestartet oder beendet wurde, oder ein durch den aktuellen Benutzer
gestarteter Prozess durch einen Fehler vorzeitig abgebrochen wurde.

Ein `Event` enthält stets nur den aktuellen Status des Prozesses, _nicht_ den
gesamten Prozesstoken mit Prozesshistorie.

## Arten von Prozessbenachrichtigungen

Es wird zwischen vier grundlegenden Typen von `Events` unterschieden:

**BPMN Event**

Eine `BPMN Event` wird ausgelöst, wenn ein innerhalb eines Prozesses
modelliertes Ereignis ausgelöst wird, z.B. ein `StartEvent` oder ein `EndEvent`.

Einzige Ausnahme:
`SignalEvent`, diese werden gesondert bebandelt. Dazu später mehr.

**Activity**

Wird ausgelöst, wenn eine bestimmte BPMN Activity erreicht oder beendet wurde.

**SystemEvent**

Ein `SystemEvent` wird ausgelöst, wenn sich an dem Zustand eines Prozesses etwas
geändert hat; z.B. wenn er gestartet, beendet oder abgebrochen wurde.

Diese Events beinhalten keinerlei Details über die Umstände, die zu dieser
Statusänderung geführt haben, sondern nur die Information, **dass** diese
Statusänderung stattgefunden hat.

**Signal**

Ein `SignalEvent` stellt ebenfalls ein `BPMN Event` dar,
wird jedoch gesondert behandelt, da es sich hierbei um **globale** Events handelt,
welche zur Interprozesskommunikation dienen.

D.h., wenn z.B. Prozess A ein `SignalEvent` auslöst, kann das von
Prozess B verarbeitet werden, auch wenn die Prozesse sich u.U. garnicht kennen.
Folglich sind `SignalEvents` in ihrem Kontext stets prozessunabhängig
und können daher nicht wie andere `BPMN Events` behandelt werden.

Ein `SignalEvent` kann stehts von allen Benutzern emfpangen werden.

## Erhalten von BPMN-Events

### Ziel/UseCase

Informiert darüber, wenn ein BPMN-Event ausgelöst wurde

### Erforderliche und Optionale Parameter

Die Schnittstelle erfordert die folgenden Parameter:

* `context` - Der Kontext in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert).
* `process_model_key`- Der Key der das ProzessModell identifiziert, welches
  das BPMN-Event beinhaltet, über dessen Auslösung man informiert werden möchte.
* `event_key` -  Der Key des BPMN-Events, über dessen Auslösung man
  informiert werden möchte.
* `callback` - Eine Funktion die aufgerufen wird, wenn das entsprechende
  BPMN-Event ausgelöst wurde.

Die Schnittstelle bietet die folgenden optionalen Parameter:

* `correlation_id` - Wenn angegeben wird man nur über Eventauslösungen
  informiert, die zu dem Vorgang gehören, der mit dieser ID identifiziert wird.

### Ergebnis/Rückgabewerte

Die Callback erhält als einzigen Parameter ein Message-Objekt mit folgenden
Attributen:

* `process_model_key` - Der Key des Prozessmodells, aus dem das Event stammt.
* `event_key` - Der Name des ausgelösten Events.
* `correlation_id` - Die ID des Vorgangs, in welchem das Event ausgelöst wurde.
* `payload` - (Optional) Zum Event gehörige Daten.

### Was passiert in der Process Engine

> TODO: Das verhalten der Schnittstelle in der Process Engine beschreiben.

### Fehler, die bei der Fehlbenutzung erwartet werden müssen

> TODO: Bad-Paths der Schnittstelle beschreiben.

### REST/Messagebus API

Der Messagebus-Kanal für die Schnittstelle sieht so aus:

```
/process_model/{process_model_key}[/correlations/{correlation_id}]/events/{event_key}/process_notifications
```

### ggf. weitere sinnvolle Infos (z.B. Regelwerk, berechtigungen usw.)

Man erhält nur Informationen zu BPMN-Events, die der aktuell eingeloggte
Benutzer auch sehen darf.

## Erhalten von Infos zu start und ende von Aktivitäten

### Ziel/UseCase

Informiert darüber, wenn eine Aktivität gestartet oder beendet wurde

### Erforderliche und Optionale Parameter

Die Schnittstelle erfordert die folgenden Parameter:

* `context` - Der Kontext in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert).
* `process_model_key`- Der Key der das ProzessModell identifiziert, welches
  die Aktivität beinhaltet, über die man informiert werden möchte.
* `activity_key` -  Der Key der Aktivität, über die man informiert werden
  möchte
* `callback` - Eine Funktion die aufgerufen wird, wenn die entsprechende
  Aktivität gestartet oder beendet wurde

Die Schnittstelle bietet die folgenden optionalen Parameter:

* `correlation_id` - Wenn angegeben wird man nur über Aktivitäten informiert,
  die zu dem Vorgang gehören, der mit dieser ID identifiziert wird.

### Ergebnis/Rückgabewerte

Die Callback erhält als einzigen Parameter ein Message-Objekt mit folgenden
Attributen:

* `process_model_key` - Der Key des Prozessmodells, aus dem die Aktivität stammt.
* `event_key` - `'started'` oder `'finished'`, je nach dem ob die Aktivität
  gestartet oder beendet wurde.
* `correlation_id` - Die ID des Vorgangs, zu dem die Aktivität gehört.
* `payload` - (Optional) Zur Aktivität gehörige Daten.

### Was passiert in der Process Engine

> TODO: Das verhalten der Schnittstelle in der Process Engine beschreiben.

### Fehler, die bei der Fehlbenutzung erwartet werden müssen

> TODO: Bad-Paths der Schnittstelle beschreiben.

### REST/Messagebus API

Der Messagebus-Kanal für die Schnittstelle sieht so aus:

```
/process_model/{process_model_key}[/correlations/{correlation_id}]/activities/{activity_key}/process_notifications
```

### ggf. weitere sinnvolle Infos (z.B. Regelwerk, berechtigungen usw.)

Man erhält nur Informationen zu Aktivitäten, die der aktuell eingeloggte
Benutzer auch sehen darf.

## Erhalten von System-Events

### Ziel/UseCase

Informiert über Zustandsänderungen von Prozessen.

### Erforderliche und Optionale Parameter

Die Schnittstelle erfordert die folgenden Parameter:

* `context` - Der Kontext in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert).
* `process_model_key`- Der Key der das ProzessModell identifiziert, zu
  dessen Instanzen man über Zustandsveränderungen informiert werden möchte
* `callback` - Eine Funktion die aufgerufen wird, wenn sich der Zustand eines
  entsprechenden Prozesses geändert hat.

Die Schnittstelle bietet die folgenden optionalen Parameter:

* `correlation_id` - Wenn angegeben wird man nur über Zustandsänderungen
  informiert, die zu dem Vorgang gehören, der mit dieser ID identifiziert wird.

### Ergebnis/Rückgabewerte

Die Callback erhält als einzigen Parameter ein Message-Objekt mit folgenden
Attributen:

* `process_model_key` - Der Key des Prozessmodells, zu dem das System Event
  gehört.
* `event_key` - `'ProcessInstanceStarted'`, `'ProcessInstanceFinishedSuccessfully'`
  oder `'ProcessInstanceTerminated'` je nach dem ob der Prozess gestartet,
  erfolgreich beendet oder terminiert wurde.
* `correlation_id` - Die ID des Vorgangs, zu dem das Event gehört.
* `payload` - (Optional) Zur Zustandsänderung gehörige Daten.

### Was passiert in der Process Engine

> TODO: Das verhalten der Schnittstelle in der Process Engine beschreiben.

### Fehler, die bei der Fehlbenutzung erwartet werden müssen

> TODO: Bad-Paths der Schnittstelle beschreiben.

### REST/Messagebus API

Der Messagebus-Kanal für die Schnittstelle sieht so aus:

```
/process_model/{process_model_key}[/correlations/{correlation_id}]/system_events
```

### ggf. weitere sinnvolle Infos (z.B. Regelwerk, berechtigungen usw.)

Man erhält nur Informationen zu Prozessen, die der aktuell eingeloggte Benutzer
auch sehen darf.

## Erhalten von BPMN-Signalen

### Ziel/UseCase

Informiert über ausgelöste BPMN-Signale.

### Erforderliche und Optionale Parameter

Die Schnittstelle erfordert die folgenden Parameter:

* `context` - Der Kontext in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert).
* `signal_key`- Der Name des Signals, über dessen Auslösung man informiert
  werden möchte.
* `callback` - Eine Funktion die aufgerufen wird, wenn das entsprechende Signal
  ausgelöst wurde.

Die Schnittstelle bietet keine optionalen Parameter.

### Ergebnis/Rückgabewerte

Die Callback erhält als einzigen Parameter ein Message-Objekt mit folgenden
Attributen:

* `process_model_key` - Der Key des Prozessmodells, aus dem das Signal stammt.
* `event_key` - Der Name des ausgelösten Signals.
* `correlation_id` - Die ID des Vorgangs, in welchem das Signal ausgelöst wurde.
* `payload` - (Optional) Zum Signal gehörige Daten.

### Was passiert in der Process Engine

> TODO: Das verhalten der Schnittstelle in der Process Engine beschreiben.

### Fehler, die bei der Fehlbenutzung erwartet werden müssen

> TODO: Bad-Paths der Schnittstelle beschreiben.

### REST/Messagebus API

Der Messagebus-Kanal für die Schnittstelle sieht so aus:

```
/signals/{signal_key}/process_notifications
```

### ggf. weitere sinnvolle Infos (z.B. Regelwerk, berechtigungen usw.)

Man erhält nur Signale, die der aktuell eingeloggte Benutzer auch sehen darf.
