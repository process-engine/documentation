# Abfragen von BPMN-Ereignissen auf die der Prozess wartet

## Ziel/UseCase

Holt alle BPMN-Events zu einer Prozessinstanz, die darauf warten ausgelöst
zu werden.

## Parameter

### Erforderliche Parameter

* `context` - Der Kontext in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert)
* `correlationId` - Die ID der Correlation, zu welcher alle verfügbaren Events
  ermittelt werden sollen

### Optionale Parameter

* `processModelKey` - Wenn angegeben, werden nur die Events ermittelt, die zu
  einer Prozessinstanz innerhalb der Correlation gehören, dessen Key dem
  gegebenen Wert entspricht

## Ergebnis/Rückgabewerte

Als Rückgabewert erhält man eine Liste von BPMN-Events,
die man in einer Prozessinstanz auslösen kann:

```JSON
{
  "events": [
    {
      "processInstanceId": "19ff240a-239e-4ee6-ac29-665fb3b57078",
      "eventKey": "MyEvent1",
      "eventId": "3312a9d1-cc22-422e-98d7-e1353c07c2eb",
      "eventData": {} // TODO: Define event-payload
    },
    {
      "processInstanceId": "19ff240a-239e-4ee6-ac29-665fb3b57078",
      "eventKey": "MyEvent2",
      "eventId": "f2987421-8928-4cf3-9eea-70b50d3ef8be",
      "eventData": {} // TODO: Define event-payload
    },
    {
      "processInstanceId": "19ff240a-239e-4ee6-ac29-665fb3b57078",
      "eventKey": "MyEvent1",
      "eventId": "e9e682fe-fe68-4b9b-8049-f7b7dfd76625",
      "eventData": {} // TODO: Define event-payload
    }
  ]
}
```

## Was passiert in der Process Engine

- Es werden alle wartenden Events geladen, die innerhalb der gegebenen
  Correlation gehören
- Wenn angegeben, werden nur die Events zurückgegeben, die zu einer
  Prozessinstanz mit passendem processModelKey gehören
- Es wird geprüft, welche Events der anfragende Benutzer auslösen kann

## Fehler, die bei der Fehlbenutzung erwartet werden müssen

Mögliche auftretende Fehler sind:
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer ist nicht berechtigt diesen Request auszuführen
- `404`:
  - Es konnte kein Prozessmodell mit dem gegebenen `processModelKey`
    gefunden werden
  - Es konnte keine Correlation mit der gegebenen `correlationId`
    gefunden werden
- `500`: Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

## REST/Messagebus API

Die HTTP-Routen für die Schnittstelle sehen so aus:

```JavaScript
// Holen aller ausführbaren BPMN-Events zu einem Vorgang
GET /correlations/:correlationId/events

// Holen aller ausführbaren BPMN-Events zu einer Prozessinstanz
// innerhalb eines Vorgangs
GET /process_models/:process_model_key/correlations/:correlationId/events
```

### IConsumerApiService Schnittstelle

> TODO: Schnittstelle definieren

## ggf. weitere sinnvolle Infos (z.B. Regelwerk, berechtigungen usw.)

Man erhält nur Events, die man mit dem anfragenden Benutzer auch auslösen darf.
