# Auflisten wartender UserTasks

### Ziel/UseCase

Holt `UserTasks`, die darauf warten bearbeitet zu werden.

### Berechtigungen

Man erhält nur `UserTaks`, die man mit dem aktuell eingeloggten Benutzer auch
bearbeiten darf.

### Erforderliche und Optionale Parameter

Die Schnittstelle erfordert die folgenden Parameter:

* `context` - Der Kontext in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert).

Die Schnittstelle bietet die folgenden optionalen Parameter:

* `process_model_key` - Wenn angegeben werden nur `UserTasks` angefragt, die zu
  dem ProzessModell gehören, das durch diesen Key identifiziert wird.
* `correlation_id` - Wenn angegeben werden nur `UserTasks` angefragt, die zu
  dem Vorgang gehören, der mit dieser ID identifiziert wird. Der Parameter
  erfordert, dass auch der `process_model_key` Parameter angegeben wird.


### Ergebnis/Rückgabewerte

Als Rückgabewert erhält man eine Liste mit `UserTasks`, die darauf warten
bearbeitet zu werden:

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

### Was passiert in der Process Engine

- Wenn ein `process_model_key` angegeben wurde, werden alle UserTasks angefragt,
  die zu dem Prozessmodell gehören
- Wenn eine `correlation_id` angegeben wurde, werden alle UserTasks angefragt,
  die zu einer der Prozessinstanzen gehören, die zu der Correlation gehören
- Wenn ein `process_model_key` UND eine `correlation_id` angegeben wurde, wird
  geprüft ob das Prozessmodell zu einer Prozessinstanz gehört, die zu der
  Correlation gehört. Anschließend werden alle UserTasks angefragt, die zu einer
  der Prozessinstanzen gehören, die zu der Correlation gehören. Davon werden
  alle übernommen, die zu dem Prozessmodell gehören

### Fehler, die bei der Fehlbenutzung erwartet werden müssen

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

### Codebeispiel

```TypeScript
import {ConsumerContext, IConsumerApiService, UserTaskList} from '@process-engine/consumer_api_contracts';

const consumerApiService: IConsumerApiService; // Get via IoC

// start a process
const processModelKey: string = 'consumer_api_lane_test';
const context: ConsumerContext = {
  identity: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZXNzaW9uSWQiOiJiOWU3MjFjYS0yYmFkLTQzNzUtOGQ3OC0xMmFlNmUyOGUyNjQiLCJpYXQiOjE1MjE1NDg2ODR9.PLa5U6m5lrko3tD_3XLse5OfH93qXyBZgm22PKPqxCc',
};

const {correlation_id: correlationId} = await consumerApiService.startProcess(context, processModelKey, 'StartEvent_0yfvdj3');

// Wait for the process to reach a user task
// ...

// get the user tasks for the correlation
let userTaskList: UserTaskList = await consumerApiService.getUserTasksForCorrelation(context, correlationId);

// get the user tasks for the process model
userTaskList = await consumerApiService.getUserTasksForProcessModel(context, processModelKey);

// get the user tasks for the process model within the correlation
userTaskList = await consumerApiService.getUserTasksForProcessModelInCorrelation(context, processModelKey, correlationId);
```

### TypeScript API

```TypeScript
export class ConsumerContext {
  public identity: string;
  public Internationalization?: string;
  public localization?: string;
}

export class UserTaskConfig {
  public form_fields: Array<UserTaskFormField>;
}

export class UserTask {
  public key: string;
  public id: string;
  public process_instance_id: string;
  public data: UserTaskConfig;
}

export class UserTaskList {
  public user_tasks: Array<UserTask>;
}

export interface IConsumerApiService {
  getUserTasksForProcessModel(context: ConsumerContext, processModelKey: string): Promise<UserTaskList>;
  getUserTasksForCorrelation(context: ConsumerContext, correlationId: string): Promise<UserTaskList>;
  getUserTasksForProcessModelInCorrelation(context: ConsumerContext, processModelKey: string, correlationId: string): Promise<UserTaskList>;
}
```
