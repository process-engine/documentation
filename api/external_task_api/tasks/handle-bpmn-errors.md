# Behandeln von BPMN Fehlern

## Ziel/UseCase

Dieser UseCase dient dazu, es dem Worker zu ermöglichen
[Business Errors](https://docs.camunda.org/manual/latest/user-guide/process-engine/external-tasks/#reporting-bpmn-error)
an die ExternalTasks API zu übermitteln.

Die API wird diesen Task dann entsprechend mit dem angegebenen Fehler versehen
und als "fehlgeschlagen" markieren.
Ab diesem Zeitpunkt hat dann kein Worker mehr Zugriff auf diesen ExternalTask.

Ebenfalls wird die ProcessEngine über den EventAggregator darüber benachrichtigt,
dass der ExternalTask mit einem Fehler beendet wurde.
Dies erlaubt es der ProcessEngine den Fehler zu verarbeiten und die Ausführung
des jeweiligen Prozessmodells fortzusetzen, oder abzubrechen.

## Zugriffsberechtigungen

Worker können BPMN Fehler nur für die ExternalTasks reporten,
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
- `errorCode`: Der Code des aufgetretenen BPMN Fehlers.


### Optionale Parameter

Die Funktion hat keine optionalen Parameter.

## Ergebnis/Rückgabewerte

Bei Erfolg ist das Ergebnis leer.

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
POST /task/:external_task_id/handle_bpmn_error
```

Es wird ein Post Body in folgendem Format erwartet:

```JSON
{
  "workerId": "Worker1",
  "errorCode": "123abc"
}
```

## IExternalTaskApiService Schnittstelle

Die `IExternalTaskApiService` Schnittstelle implementiert diesen UseCase
über die Methode `handleBpmnError`.

Die Methode erwartet die oben beschriebenen Parameter.
Zusätzlich wird noch die `Identity` des Workers erwartet.
