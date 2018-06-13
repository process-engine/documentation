# Abschließen eines UserTasks

## Ziel/UseCase

Wenn ein UserTask fertig bearbeitet wurde, wird der Process Engine über diese
Schnittstelle das Ergebnis des UserTasks mitgeteilt. Das hat zur Folge, dass
der dazugehörige Prozesspfad weiter ausgeführt wird.

## Erforderliche Parameter

* `context` - Der Kontext in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert)
* `processModelKey` - Der Key der das Prozessmodell identifiziert, welches
  den abzuschließenden UserTask beinhaltet.
* `correlationId` - Die ID der Correlation, zu welcher der UserTask gehört
* `userTaskId` - Die ID des UserTasks der abgeschlossen werden soll
* `result` -  Das Ergebnis des UserTasks

## Ergebnis/Rückgabewerte

Bei Erfolg ist das Ergebnis leer.

## Was passiert in der Process Engine

- Es der passende UserTasks abgefragt, der zu dem gegebenen
  ProzessModell in der gegebenen Correlation gehört
- Es wird ein EventListener am EventAggregator registriert, um darauf reagieren
  zu können, wenn der UserTask erfolgreich abgeschlossen wurde
- Es wird ein Event am EventAggregator gepublished, um der ProcessEngine mit
  zu teilen, dass der UserTask bearbeitet wurde

## Fehler, die bei der Fehlbenutzung erwartet werden müssen

Mögliche auftretende Fehler sind:
- `400`: Der bereitgestellte `result` Payload ist ungültig
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer ist nicht berechtigt diesen Request auszuführen
- `404`:
  - Es konnte kein Prozessmodell mit dem gegebenen `process_model_key`
    gefunden werden
  - Es konnte keine Correlation mit der gegebenen `correlation_id`
    gefunden werden
  - Es konnte kein UserTask mit der gegebenen `user_task_id`
    gefunden werden
- `500`: Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

## REST/Messagebus API

Die HTTP-Route für die Schnittstelle sieht so aus:

```JavaScript
POST /process_models/{process_model_key}/correlations/{correlation_id}/user_tasks/{user_task_id}/finish

// body
{
  "formFields": {
    "Form_XGSVBgio": true
  }
}
```

## IConsumerApiService Schnittstelle

Die `IConsumerApiService` Schnittstelle implementiert diesen UseCase über die
Methode `finishUserTask`.

Diese Methode erwartet die oben beschriebenen Parameter
in folgender Reihenfolge:
- `context`
- `processModelKey`
- `correlationId`
- `userTaskId`
- `result`

## Regelwerk

Benutzer können nur die UserTasks abschließen, die sie auch berechtigt
sind zu sehen.
