# Abfragen von BPMN-Ereignissen auf die der Prozess wartet

### Ziel/UseCase

Holt alle BPMN-Events, die darauf warten ausgelöst zu werden.

### Erforderliche und Optionale Parameter

Die Schnittstelle erfordert die folgenden Parameter:

* `context` - Der Kontext in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert).
* `process_model_key` - Der Key der das Prozessmodell identifiziert, zu dem
  die ausführbaren BPMN-Events angefragt werden.

Die Schnittstelle bietet die folgenden optionalen Parameter:

* `correlation_id` - Wenn angegeben werden nur ausführbare Ereignisse angefragt,
  die zu dem Vorgang gehören, der mit dieser ID identifiziert wird.

### Ergebnis/Rückgabewerte

Als Rückgabewert erhält man eine Liste mit BPMN-Events, die man auslösen kann:

```JSON
{
  "events": [
    {
      "process_instance_id": "19ff240a-239e-4ee6-ac29-665fb3b57078",
      "event_key": "MyEvent1",
      "event_id": "3312a9d1-cc22-422e-98d7-e1353c07c2eb",
      "event_data": {} // TODO: Define event-payload
    },
    {
      "process_instance_id": "19ff240a-239e-4ee6-ac29-665fb3b57078",
      "event_key": "MyEvent2",
      "event_id": "f2987421-8928-4cf3-9eea-70b50d3ef8be",
      "event_data": {} // TODO: Define event-payload
    },
    {
      "process_instance_id": "d8dc8881-dea2-4de6-9bdc-4f861908c5a5",
      "event_key": "MyEvent1",
      "event_id": "e9e682fe-fe68-4b9b-8049-f7b7dfd76625",
      "event_data": {} // TODO: Define event-payload
    }
  ]
}
```

### Was passiert in der Process Engine

> TODO: Das verhalten der Schnittstelle in der Process Engine beschreiben.

### Fehler, die bei der Fehlbenutzung erwartet werden müssen

Mögliche auftretende Fehler sind:
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer ist nicht berechtigt diesen Request auszuführen
- `404`:
  - Es konnte kein Prozessmodell mit dem gegebenen `process_model_key`
    gefunden werden
  - Es konnte keine Correlation mit der gegebenen `correlation_id`
    gefunden werden
- `500`: Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

### REST/Messagebus API

Die HTTP-Routen für die Schnittstelle sehen so aus:

```JavaScript
// Holen aller ausführbaren BPMN-Events zu einem Prozessmodell
GET /process_models/{process_model_key}/events

// Holen aller ausführbaren BPMN-Events zu einem Vorgang
GET /process_models/{process_model_key}/correlations/{correlation_id}/events
```

### ggf. weitere sinnvolle Infos (z.B. Regelwerk, berechtigungen usw.)

Man erhält nur Events, die man mit dem aktuell eingeloggten Benutzer auch
auslösen darf.
