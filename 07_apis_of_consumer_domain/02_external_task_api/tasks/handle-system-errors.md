# Behandeln von Systemfehlern

## Ziel/UseCase

Dieser UseCase dient dazu, es dem Worker zu ermöglichen Systemfehler, die
während der Ausführung von ExternalTasks aufgetreten sind, an die
ExternalTasksAPI zu übermitteln.

Die API wird diesen Task dann entsprechend mit dem angegebenen Fehler versehen
und als "fehlgeschlagen" markieren.
Ab diesem Zeitpunkt hat dann kein Worker mehr Zugriff auf diesen ExternalTask.

Ebenfalls wird die ProcessEngine über den EventAggregator darüber benachrichtigt,
dass der ExternalTask mit einem Fehler beendet wurde.
Dies erlaubt es der ProcessEngine den Fehler zu verarbeiten und die Ausführung
des jeweiligen Prozessmodells fortzusetzen, oder abzubrechen.

## Zugriffsberechtigungen

Worker können Systemfehler nur für die ExternalTasks reporten,
die sie auch berechtigt sind zu bearbeiten.

## Was passiert in der ProcessEngine

- Es wird der passende ExternalTask abgefragt
- Es wird geprüft, ob der anfragende Worker berechtigt ist den ExternalTask
zu bearbeiten
  - Ist dies der Fall, wird der ExternalTask mit dem mitgegebenen Fehler beendet
- Anschließend wird die ProcessEngine über die Beendigung des ExternalTasks
informiert

## Parameter

### Erforderliche Parameter

- `workerId`: Die ID des anfragenden Workers.
- `externalTaskId`: Die ID des fehlerhaften ExternalTasks.
- `errorMessage`: Die Nachricht zu dem aufgetretenen Fehler.


### Optionale Parameter

- `errorDetails`: Weitere Details zu dem aufgetretenen Fehler.

## Ergebnis/Rückgabewerte

War der Request erfolgreich, wird kein Ergebnis zurück gegeben.

## Fehler, die erwartet werden müssen

Mögliche auftretende Fehler sind:
- `401`: Der anfragende Worker hat keine gültige Authentifizierung
- `403`: Der anfragende Worker ist nicht berechtigt diesen Request auszuführen
- `404`: Es konnte kein ExternalTask mit der gegebenen `externalTaskId`
    gefunden werden
- `410`: Der angegbene ExternalTask wurde bereits abgeschlossen und ist nicht
mehr verfügbar
- `423`: Der angegbene ExternalTask wurde bereits durch einen anderen Worker
reserviert und ist für den anfragenden Worker gesperrt.
- `500`: Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

## REST/Messagebus API

Die HTTP-Route für die Schnittstelle sieht so aus:

```REST
POST /task/:external_task_id/handle_system_error
```

Es wird ein Post Body in folgendem Format erwartet:

```JSON
{
  "workerId": "Worker1",
  "errorMessage": "Something went wrong",
  "errorDetails": "Some details"
}
```

## IExternalTaskApi Schnittstelle

Die `IExternalTaskApi` Schnittstelle implementiert diesen UseCase
über die Methode `handleSystemError`.

Die Methode erwartet die oben beschriebenen Parameter.
Zusätzlich wird noch die `Identity` des Workers erwartet.
