# Auflisten wartender UserTasks

Siehe [Konzept zum Auflisten wartender UserTasks](../../../../api/consumer_api/tasks/list-waiting-usertasks.md).

```TypeScript
import {
  ConsumerContext,
  IConsumerApi,
  UserTaskList
} from '@process-engine/consumer_api_contracts';

// Retrieve through dependency injection
const consumerApiService: IConsumerApi;

// The JWT token must be provided by the implementing application
const context: ConsumerContext = {
  identity: 'insertJwtTokenHere',
};

// Required parameters
const processModelKey: string = 'consumer_api_lane_test';
const correlationId: string = 'someCorrelationId';

// Get the user tasks for the correlation
let userTaskList: UserTaskList =
  await consumerApiService.getUserTasksForCorrelation(context, correlationId);

// Get the user tasks for the process model
userTaskList =
  await consumerApiService.getUserTasksForProcessModel(context, processModelKey);

// Get the user tasks for the process model within the correlation
userTaskList =
  await consumerApiService.getUserTasksForProcessModelInCorrelation(context,
                                                                    processModelKey,
                                                                    correlationId);
```

## Parameter

### Erforderliche Parameter

* `context` - Der [ConsumerContext](./public_api.md#consumercontext) des aufrufenden Benutzers

### Optionale Parameter

* `processModelKey` - Wenn angegeben, werden nur `UserTasks` angefragt, die zu
  dem ProzessModell gehören, das durch diesen Key identifiziert wird.
* `correlationId` - Wenn angegeben, werden nur `UserTasks` angefragt, die zu
  dem Vorgang gehören, der mit dieser ID identifiziert wird.

Werden beide Parameter in Kombination verwendet, werden nur die UserTasks
aufgelistet, die zu der passenden Prozessinstanz in der passenden Correlation
gehören.

## Rückgabewerte

Die Rückgabe ist vom Typ [UserTasksList](./public_api.md#usertasklist) und beinhaltet
eine Liste aller gefundenen UserTasks, die darauf warten bearbeitet zu werden.

Diese wiederum werden durch den Typ [UserTask](./public_api.md#usertask) dargestellt.

Beispielausgabe:

```JSON
{
  "userTasks": [
    {
      "id": "004d6b6d-8467-4893-8b23-fe5f380389aa",
      "key": "SomeUserTask1",
      "processInstanceId": "19ff240a-239e-4ee6-ac29-665fb3b57078",
      "data": {
        "formFields": [
          {
            "id": "someFormFieldId",
            "type": "string",
            "label": "someFormFieldLabel",
            "defaultValue": "someTestDefaultValue"
          }
        ]
      }
    }
  ]
}
```

## Fehler, die erwartet werden müssen

Mögliche auftretende Fehler sind:
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer ist nicht berechtigt diesen Request auszuführen
- `404`:
  - Das Prozessmodell gehört zu keiner der Prozessinstanzen, die zu der
    Correlation gehören
  - Es konnte kein Prozessmodell mit dem gegebenen `processModelKey`
    gefunden werden
  - Es konnte keine Correlation mit der gegebenen `correlationId`
    gefunden werden
- `500`: Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf
