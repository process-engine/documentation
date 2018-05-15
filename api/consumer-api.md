# Schnittstelle: ConsumerAPI

Die ConsumerAPI dient zur Ausführung von Prozessmodellen und steuert die daraus
resultierende Interaktion mit der ProcessEngine.

```TypeScript
import {
  ConsumerContext,
  IConsumerApiService,
  ProcessStartRequestPayload,
  ProcessStartResponsePayload,
  StartCallbackType,
} from '@process-engine/consumer_api_contracts';

const consumerApiService: IConsumerApiService; // Get via IoC

const context: ConsumerContext = {
  identity: 'insertJwtTokenHere',
};

const processModelKey: string = 'process_model_key';
const startEventKey: string = 'StartEvent_1';
const payload: ProcessStartRequestPayload = {
  // Use a specific correlationId, instead of a generated one
  correlation_id: 'randomcorrelationid',
};

const startCallbackType: StartCallbackType = StartCallbackType.CallbackOnProcessInstanceCreated;

// Start the process model, using the given processModelKey, startEventKey and payload.
const result: ProcessStartResponsePayload = await consumerApiService.startProcess(consumerContext, processModelKey, startEventKey, payload, startCallbackType);
```

## Features

Die Consumer API umfasst folgende Features:

* [Auflisten startbarer Prozessmodelle](./consumer_api/list-startable-process-models.md)
  * [Alle Prozessmodelle abfragen](./consumer_api/list-startable-process-models.md#alle-prozessmodelle-abfragen)
  * [Einzelnes Prozessmodell abfragen](./consumer_api/list-startable-process-models.md#einzelnes-prozessmodell-abfragen)
* [Starten eines Prozessmodells](./consumer_api/start-process-instance.md)
  * [Starten und auf ein `System Event` warten](./consumer_api/start-process-instance.md#starten-und-auf-ein-system-event-warten)
  * [Starten und auf ein bestimmtes EndEvent warten](./consumer_api/start-process-instance.md#starten-und-auf-ein-bestimmtes-endevent-warten)
* [Auflisten wartender UserTasks](./consumer_api/list-waiting-usertasks.md)
* [Abschließen eines UserTasks](./consumer_api/finish-user-task.md)

## Pakete

Die ConsumerAPI umfasst folgende Pakete
- `@process-engine/consumer_api_contracts` - Definiert die Schnittstellen
für `consumer_api_core` und `consumer_api_client`
- `@process-engine/consumer_api_core` - Steuert die Interaktion mit einer
internen ProcessEngine
- `@process-engine/consumer_api_client` - Steuert die Kommunikation mit einer
externen ProcessEngine
- `@process-engine/consumer_api_http` - Dient als Kommunikations-Endpunkt
für `consumer_api_client`

Eine detaillierte Beschreibung des Aufbaus der Consumer API findet sich [hier](./consumer_api/consumer-api-structure.md).

## Vorraussetzungen und Installation

Um die ConsumerAPI benutzen zu können sind folgende Mindestanforderungen gegeben:

- Eine ProcessEngine in der Version 2.2.0 oder höher
- Node Version 8.x

Es gibt zwei Anwendungsszenarien für die Consumer API:
1. Eine Anwendung benutzt eine integrierte ProcessEngine
2. Eine Anwendung steuert eine ProcessEngine an, die in einer externen
Anwendung liegt (z.B. auf einem zentralen Server)

Je nach Anwendungsfall unterscheidet sich auch der Einrichtungsvorgang
für die ConsumerAPI.

Für eine detaillierte Installationsanleitung, siehe:
- [Einrichtung mit interner ProcessEngine](./consumer_api/setup_internal_process_engine.md)
- [Einrichtung mit externer ProcessEngine](./consumer_api/setup_external_process_engine.md)

## Vollständiges Codebeispiel

```TypeScript
import {
  ConsumerContext,
  IConsumerApiService,
  ProcessModel,
  ProcessModelList,
  ProcessStartRequestPayload,
  ProcessStartResponsePayload,
  StartCallbackType,
  UserTask,
  UserTaskList,
  UserTaskResult,
} from '@process-engine/consumer_api_contracts';

const consumerApiService: IConsumerApiService; // Get via IoC

const context: ConsumerContext = {
  identity: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZXNzaW9uSWQiOiJiOWU3MjFjYS0yYmFkLTQzNzUtOGQ3OC0xMmFlNmUyOGUyNjQiLCJpYXQiOjE1MjE1NDg2ODR9.PLa5U6m5lrko3tD_3XLse5OfH93qXyBZgm22PKPqxCc',
}

// Get list of process models you are allowed to access
const processModelList: ProcessModelList = await consumerApiService.getProcessModels(context);

// Pick the first available process model
const processModel: ProcessModel = processModelList[0];

// Start the process model, using the given start event and payload.
const startEventKey = 'StartEvent_1';
const payload: ProcessStartRequestPayload = {
  // Use a specific correlationId, instead of a generated one
  correlation_id: 'randomcorrelationid',
};

const startCallbackType: StartCallbackType = StartCallbackType.CallbackOnProcessInstanceCreated;

const result: ProcessStartResponsePayload = await consumerApiService.startProcess(consumerContext, processModel.key, startEventKey, payload, startCallbackType);

const correlationId: string = result.correlation_id;

// get the user tasks for the correlation
const userTaskList: UserTaskList = await consumerApiService.getUserTasksForCorrelation(context, correlationId);

// pick the first one
const userTask: UserTask = userTaskList[0];

// finish the user task, using the given result set
const userTaskResult: UserTaskResult = {
  success: true
};

consumerApiService.finishUserTask(context, processModel.key, correlationId, userTask.id, userTaskResult);
```

## Glossar

Eine Sammlung der wichtigsten ConsumerAPI Begriffe findet sich [hier](./consumer_api/glossary.md).
