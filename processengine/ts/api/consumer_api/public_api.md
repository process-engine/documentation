# Public API

Nachfolgend wird die öffentliche API der ConsumerAPI.ts erläutert.

Die Schnittstellen sind im Paket `@process-engine/consumer_api_contracts` definiert.

## IConsumerApiService

Das IConsumerApiService Interface stellt die Schnittstellen bereit, die sowohl
in `ConsumerApiCore`, als auch in `ConsumerApiClient` verwendet werden.

Dadurch ist gewährleistet, dass beide Komponenten sich auf die gleiche Art
verwenden und leicht austauschen lassen.

```TypeScript
export interface IConsumerApiService {
  // Get Process models
  getProcessModels(context: ConsumerContext): Promise<ProcessModelList>;

  getProcessModelByKey(context: ConsumerContext,
                       processModelKey: string
                      ): Promise<ProcessModel>;

  // Manage Process instances
  startProcessInstance(context: ConsumerContext,
                       processModelKey: string,
                       startEventKey: string,
                       payload: ProcessStartRequestPayload,
                       startCallbackType: StartCallbackType,
                       endEventKey?: string
                      ): Promise<ProcessStartResponsePayload>;

  getProcessResultForCorrelation(context: ConsumerContext,
                                 correlationId: string,
                                 processModelKey: string
                                ): Promise<ICorrelationResult>;

  // Manage UserTasks
  getUserTasksForProcessModel(context: ConsumerContext,
                              processModelKey: string
                             ): Promise<UserTaskList>;

  getUserTasksForCorrelation(context: ConsumerContext,
                             correlationId: string
                            ): Promise<UserTaskList>;

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

Der ConsumerContext enthält die Identity eines Benutzers.
Diese wird verwendet, um die Berechtigungen des Benutzers zu verifizieren,
wenn dieser Funktionen der ConsumerAPI.ts aufruft.

```TypeScript
export class ConsumerContext {
  public identity: string;
  public internationalization?: string;
  public localization?: string;
}
```

## Prozessmodelle

Die folgenden Schnittstellen beschreiben ein Prozessmodell,
bzw. eine Liste von Prozessmodellen.

### ProcessModelList

```TypeScript
export class ProcessModelList {
  public processModels: Array<ProcessModel> = [];
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
  public processInstanceId: string;
  public data: any; // TODO: Define event-payload
}
```

## Starten von Prozessinstanzen

Die folgenden Schnittstellen beschreiben die Parameter, welche für das Starten
von Prozessinstanzen verwendet werden.

### StartCallbackType

Gibt an wann die Schnittstelle antwortet.
Mögliche Werte sind:
* `CallbackOnProcessInstanceCreated` - Die Schnittstelle antwortet, wenn die
  Prozessinstanz **gestartet**  wurde
* `CallbackOnProcessInstanceFinished` - Die Schnittstelle antwortet, wenn die
  Prozessinstanz **beendet**  wurde
* `CallbackOnEndEventReached` - Die Schnittstelle antwortet, wenn die
  Prozessinstanz ein bestimmtes EndEvent erreicht hat

Diese wird von der Funktion `startProcessInstance` erwartet.
Wenn nicht angegeben, wird implizit `CallbackOnProcessInstanceCreated` benutzt.

```TypeScript
export enum StartCallbackType {
  CallbackOnProcessInstanceCreated = 1,
  CallbackOnProcessInstanceFinished = 2,
  CallbackOnEndEventReached = 3,
}
```

### ProcessStartRequestPayload

Dieser Parameter enthält sämtliche Werte, die für den
Prozessstart relevant sind:
- `inputValues`: Enthält sämtliche Werte, die dem Prozess als `initialToken`
  mitgegeben werden
- `correlationId`: Optional. Wenn mitgegeben, wird diese ID für die Correlation
  verwendet. Wenn nicht mitgegeben, erzeugt die ConsumerAPI ein eigene
  correlationId
- `callerId`: Optional. Wird nur in Zusammenhang mit Subprozessen verwendet.
  Wenn ein Subprozess gestartet werden soll, enthält dieses Feld die
  Instanz ID des aufrufenden Prozesses

```TypeScript
export class ProcessStartRequestPayload {
  public inputValues: any;
  public correlationId?: string;
  public callerId?: string;
}
```

### ProcessStartResponsePayload

Beschreibt die Antwort, die nach dem Starten einer Prozessinstanz bereitgestellt
wird.
Aktuell enthält diese Antwort nur die CorrelationId des gestarteten Prozesses.

```TypeScript
export class ProcessStartResponsePayload {
  public correlationId: string;
}
```

### ICorrelationResult

Wird durch die Funktion `getProcessResultForCorrelation` verwendet und enthält
das Ergebnis der angefragten Correlation.

```TypeScript
export interface ICorrelationResult {
  [field: string]: any;
}
```

## UserTasks

Die folgenden Schnittstellen beschreiben einen UserTask,
bzw. eine Liste von UserTasks.

### UserTaskList

```TypeScript
export class UserTaskList {
  public userTasks: Array<UserTask>;
}
```

### UserTask

```TypeScript
export class UserTask {
  public key: string;
  public id: string;
  public processInstanceId: string;
  public data: UserTaskConfig;
}
```

### UserTaskConfig

```TypeScript
export class UserTaskConfig {
  public formFields: Array<UserTaskFormField>;
}
```

### UserTaskResult

`UserTaskResult` beschreibt den Payload, den man einem UserTask bei dessen
Abschluss mitgeben kann (Siehe `finishUserTask` in `IConsumerApiService`).

```TypeScript
export class UserTaskResult {
  public formFields: {
    [fieldId: string]: any,
  };
}
```
