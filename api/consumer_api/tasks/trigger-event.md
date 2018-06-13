# Auslösen von Ereignissen

### Ziel/UseCase

Löst ein BPMN-Event aus, dass zurzeit darauf wartet ausgelöst zu werden.

### Erforderliche und Optionale Parameter

Die Schnittstelle erfordert die folgenden Parameter:

* `context` - Der Kontext in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert).
* `process_model_key` - Der Key der das Prozessmodell identifiziert, welches
  das auszulösende Event beinhaltet.
* `correlation_id` - Die ID die den Vorgang identifiziert, zu dem das wartende
  Event gehört.
* `event_id` - Die ID des Events das ausgelöst werden soll.

Die Schnittstelle bietet die folgenden optionalen Parameter:

* `payload` - Ein Payload mit dem das Event ausgelöst werden soll
  > TODO: Define the event trigger payload object

### Ergebnis/Rückgabewerte

> TODO: Die Rückgabewerte dieser Schnittstelle beschreiben.

### Was passiert in der Process Engine

> TODO: Das verhalten der Schnittstelle in der Process Engine beschreiben.

### Fehler, die bei der Fehlbenutzung erwartet werden müssen

Mögliche auftretende Fehler sind:
- `400`: Der bereitgestellte Payload ist ungültig
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer ist nicht berechtigt diesen Request auszuführen
- `404`:
  - Es konnte kein Prozessmodell mit dem gegebenen `process_model_key`
    gefunden werden
  - Es konnte keine Correlation mit der gegebenen `correlation_id`
    gefunden werden
  - Es konnte kein Event mit der gegebenen `Event`4
    gefunden werden
- `500`: Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

### REST/Messagebus API

Die HTTP-Route für die Schnittstelle sieht so aus:

```JavaScript
POST /process_models/{process_model_key}/correlations/{correlation_id}/events/{event_id}/trigger

// body
// TODO: define request body/the event trigger payload
```

### ggf. weitere sinnvolle Infos (z.B. Regelwerk, berechtigungen usw.)

Siehe auch [Umgang mit Events](./dealing_with_events.md).

> TODO: Zusätzliche Infos zu der Schnittstelle aufschreiben.
