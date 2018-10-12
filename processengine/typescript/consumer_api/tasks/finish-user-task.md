# Abschließen eines UserTasks

Siehe [Konzept zum Beenden wartender UserTasks](../../../../api/consumer_api/tasks/finish-user-task.md).

```TypeScript
import {ConsumerContext, IConsumerApi, UserTaskResult} from '@process-engine/consumer_api_contracts';

// Retrieve through dependency injection
const consumerApiService: IConsumerApi;

// The JWT token must be provided by the implementing application
const context: ConsumerContext = {
  identity: 'insertJwtTokenHere',
};

// Required parameters
const processModelKey: string = 'consumer_api_usertask_test';
const correlationId: string = 'someCorrelationId';
const userTaskId: string = 'Task_1vdwmn1';
const userTaskResult: UserTaskResult = {
  formFields: {
    first_name: 'fox',
    last_name: 'mulder',
    accepted_terms: true,
  },
};

// finish the user task
consumerApiService.finishUserTask(context, processModelKey, correlationId, userTaskId, userTaskResult);
```

## Parameter

### Erforderliche Parameter

* `context` - Der [ConsumerContext](./public_api.md#consumercontext) des aufrufenden Benutzers
* `processModelKey` - Der Key der das Prozessmodell identifiziert, welches
  den abzuschließenden UserTask beinhaltet.
* `correlationId` - Die ID die den Vorgang identifiziert, zu dem der wartende
  UserTask gehört.
* `userTaskId` - Die ID des UserTasks der abgeschlossen werden soll.
* `userTaskResult` -  Das Ergebnis des UserTasks, siehe [UserTaskResult](./public_api.md#usertaskresult)

### Optionale Parameter

Die Funktion hat keine optionalen Parameter.

## Rückgabewerte

Im Erfolgsfall gibt diese Methode keinen Wert zurück.

## Fehler, die erwartet werden müssen

Mögliche auftretende Fehler sind:
- `400`: Der bereitgestellte `result` Payload ist ungültig
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer ist nicht berechtigt diesen Request auszuführen
- `404`:
  - Es konnte kein Prozessmodell mit dem gegebenen `processModelKey`
    gefunden werden
  - Es konnte keine Correlation mit der gegebenen `correlationId`
    gefunden werden
  - Es konnte kein UserTask mit der gegebenen `userTaskId`
    gefunden werden
- `500`: Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf
