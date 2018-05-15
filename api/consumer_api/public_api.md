# Public API

Nachfolgend wird die öffentliche API der ConsumerAPI erläutert.

Die Schnittstellen sind im Paket `@process-engine/consumer_api_contracts` definiert.

## IConsumerApiService

Das IConsumerApiService Interface stellt die Schnittstellen bereit, die sowohl
in `ConsumerApiCore`, also auch in `ConsumerApiClient` verwendet werden.

Dadurch ist gewährleistet, dass beide Komponenten sich auf die gleiche Art
verwenden und leicht austauschen lassen.

```TypeScript
export interface IConsumerApiService {
  // Get Process models
  getProcessModels(context: ConsumerContext): Promise<ProcessModelList>;
  getProcessModelByKey(context: ConsumerContext, processModelKey: string): Promise<ProcessModel>;
  // Start Process instances
  startProcessInstance(context: ConsumerContext,
                       processModelKey: string,
                       startEventKey: string,
                       payload: ProcessStartRequestPayload,
                       startCallbackType: StartCallbackType
                      ): Promise<ProcessStartResponsePayload>;
  startProcessInstanceAndAwaitEndEvent(context: ConsumerContext,
                                       processModelKey: string,
                                       startEventKey: string,
                                       endEventKey: string,
                                       payload: ProcessStartRequestPayload
                                      ): Promise<ProcessStartResponsePayload>;
  // Manage UserTasks
  getUserTasksForProcessModel(context: ConsumerContext, processModelKey: string): Promise<UserTaskList>;
  getUserTasksForCorrelation(context: ConsumerContext, correlationId: string): Promise<UserTaskList>;
  getUserTasksForProcessModelInCorrelation(context: ConsumerContext,
                                           processModelKey: string,
                                           correlationId: string
                                          ): Promise<UserTaskList>;
  finishUserTask(context: ConsumerContext,
                 processModelKey: string,
                 correlationId: string,
                 userTaskId: string,
                 userTaskResult: UserTaskResult
                ): Promise<void>;
}
```

## ConsumerContext

Der ConsumerContext enthält die Identity des aktuellen Benutzers.
Diese wird verwendet, um die Berechtigungen eines Benutzers zu verifizieren,
wenn der Benutzer Funktionen der ConsumerAPI aufruft.

```TypeScript
export class ConsumerContext {
  public identity: string;
  public Internationalization?: string;
  public localization?: string;
}
```

## Prozessmodelle

Die folgenden Schnittstellen beschreiben ein Prozessmodell,
bzw. eine Liste von Prozessmodellen.

### ProcessModelList

```TypeScript
export class ProcessModelList {
  public process_models: Array<ProcessModel> = [];
}
```

### ProcessModel

```TypeScript
export class ProcessModel {
  public key: string;
  public startEvents: Array<Event> = [];
}
```

### Event

```TypeScript
export class Event {
  public key: string;
  public id: string;
  public process_instance_id: string;
  public data: any; // TODO: Define event-payload
}
```

## Starten von Prozessinstanzen

Die folgenden Schnittstellen beschreiben die Parameter, welche für das Starten
von Prozessinstanzen verwendet werden.
Diese werden von den folgenden Methoden der ConsumerAPI services erwartet:
- `startProcessInstance`
- `startProcessInstanceAndAwaitEndEvent`

### StartCallbackType

Gibt an, wann die Schnittstelle antwortet. Mögliche Werte sind:
* `CallbackOnProcessInstanceCreated` - Die Schnittstelle antwortet, wenn die
  Prozessinstanz **gestartet**  wurde.
* `CallbackOnEndEventReached` - Die Schnittstelle antwortet, wenn die
  Prozessinstanz durch ein EndEvent **beendet** wurde.

```TypeScript
export enum StartCallbackType {
  CallbackOnProcessInstanceCreated = 1,
  CallbackOnEndEventReached = 3,
}
```

### ProcessStartRequestPayload

```TypeScript
export class ProcessStartRequestPayload {
  public correlation_id: string;
  public input_values: any;
}
```

### ProcessStartResponsePayload

```TypeScript
export class ProcessStartResponsePayload {
  public correlation_id: string;
}
```

## UserTasks

Die folgenden Schnittstellen beschreiben einen UserTask,
bzw. eine Liste von UserTasks.

### UserTaskList

```TypeScript
export class UserTaskList {
  public user_tasks: Array<UserTask>;
}
```

### UserTask

```TypeScript
export class UserTask {
  public key: string;
  public id: string;
  public process_instance_id: string;
  public data: UserTaskConfig;
}
```

### UserTaskConfig

```TypeScript
export class UserTaskConfig {
  public form_fields: Array<UserTaskFormField>;
}
```

### UserTaskResult

`UserTaskResult` beschreibt den Payload, den man einem UserTask bei dessen
Abschluss mitgeben kann (Siehe `finishUserTask` in `IConsumerApiService`).

```TypeScript
export class UserTaskResult {
  public form_fields: {
    [fieldId: string]: any,
  };
}
```
