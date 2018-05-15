# Auflisten wartender UserTasks

```TypeScript
import {ConsumerContext, IConsumerApiService, UserTaskList} from '@process-engine/consumer_api_contracts';

const consumerApiService: IConsumerApiService; // Get via IoC

// Required parameters
const processModelKey: string = 'consumer_api_lane_test';
const correlationId: string = 'someCorrelationId';
const context: ConsumerContext = {
  identity: 'insertJwtTokenHere',
};

// Get the user tasks for the correlation
let userTaskList: UserTaskList = await consumerApiService.getUserTasksForCorrelation(context, correlationId);

// Get the user tasks for the process model
userTaskList = await consumerApiService.getUserTasksForProcessModel(context, processModelKey);

// Get the user tasks for the process model within the correlation
userTaskList = await consumerApiService.getUserTasksForProcessModelInCorrelation(context, processModelKey, correlationId);
```

### Ziel/UseCase

Holt `UserTasks`, die darauf warten bearbeitet zu werden.

Man erhält nur `UserTaks`, die man mit dem aktuell eingeloggten Benutzer auch
bearbeiten darf.

### Parameter

#### Erforderliche Parameter

* `context` - Der [ConsumerContext](./public_api.md#consumercontext) des aufrufenden Benutzers

#### Optionale Parameter

* `process_model_key` - Wenn angegeben werden nur `UserTasks` angefragt, die zu
  dem ProzessModell gehören, das durch diesen Key identifiziert wird.
* `correlation_id` - Wenn angegeben werden nur `UserTasks` angefragt, die zu
  dem Vorgang gehören, der mit dieser ID identifiziert wird. Der Parameter
  erfordert, dass auch der `process_model_key` Parameter angegeben wird.


### Rückgabewerte

Die Rückgabe ist vom Typ [UserTasksList](./public_api.md#usertasklist) und beinhaltet
eine Liste aller gefundenen UserTasks, die darauf warten bearbeitet zu werden.

Diese wiederum werden durch den Typ [UserTask](./public_api.md#usertask) dargestellt.

Beispielausgabe:

```JSON
{
  "user_tasks": [
    {
      "process_instance_id": "19ff240a-239e-4ee6-ac29-665fb3b57078",
      "user_task_key": "SomeUserTask1",
      "user_task_id": "004d6b6d-8467-4893-8b23-fe5f380389aa",
      "user_task_data": {
        "form_fields": [
          {
            "id": "someFormFieldId",
            "type": "string",
            "label": "someFormFieldLabel",
            "default_value": "someTestDefaultValue"
          }
        ]
      }
    }
  ]
}
```

### Fehler, die bei einer Fehlbenutzung erwartet werden müssen

Mögliche auftretende Fehler sind:
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer ist nicht berechtigt diesen Request auszuführen
- `404`:
  - Das Prozessmodell gehört zu keiner der Prozessinstanzen, die zu der
    Correlation gehören
  - Es konnte kein Prozessmodell mit dem gegebenen `process_model_key`
    gefunden werden
  - Es konnte keine Correlation mit der gegebenen `correlation_id`
    gefunden werden
- `500`: Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf
