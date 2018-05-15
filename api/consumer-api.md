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

const consumerApiService: IConsumerApiService; // Retrieve through IoC

const context: ConsumerContext = {
  identity: 'insertJwtTokenHere',
};

const processModelKey: string = 'process_model_key';
const startEventKey: string = 'StartEvent_1';
const payload: ProcessStartRequestPayload = {
  correlation_id: 'correlationIdToUseForProcessInstanceStart',
};

const startCallbackType: StartCallbackType = StartCallbackType.CallbackOnProcessInstanceCreated;

const result: ProcessStartResponsePayload = await consumerApiService.startProcess(context, processModelKey, startEventKey, payload, startCallbackType);
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

## Vorraussetzungen

Um die ConsumerAPI benutzen zu können sind folgende Mindestanforderungen gegeben:

- Eine ProcessEngine in der Version 2.2.0 oder höher
- Node Version 8.x

## Installation

Es gibt zwei Anwendungsszenarien für die Consumer API:
1. Eine Anwendung benutzt eine integrierte ProcessEngine
2. Eine Anwendung steuert eine ProcessEngine an, die in einer externen
Anwendung liegt (z.B. auf einem zentralen Server)

Je nach Anwendungsfall sind unterschiedliche Installationsschritte auszuführen.

Für eine detaillierte Installationsanleitung, siehe:
- [Einrichtung mit interner ProcessEngine](./consumer_api/setup_internal_process_engine.md)
- [Einrichtung mit externer ProcessEngine](./consumer_api/setup_external_process_engine.md)

## Vollständiges Codebeispiel

Im nachfolgenden Codebeispiel wird folgende Befehlskette durchlaufen:
- Wähle ein startbares Prozessmodell aus einer angefragten Liste
- Starte eine Instanz des ausgewählten Prozessmodells
- Frage alle UserTasks ab, auf welche die laufende Prozessinstanz wartet
- Schließe einen ausgewählten UserTask ab

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
  identity: 'insertJwtTokenHere',
}

const processModel: ProcessModel = await getStartableProcessModelFromList();
const correlationId: string = await startProcessInstanceAndReturnCorrelationId(processModel);
const waitingUserTask: UserTask = await getWaitingUserTaskForCorrelation(correlationId);
await finishGivenUserTaskWithResultSet(processModel, correlationId, waitingUserTask);

// Get list of process models you are allowed to access and pick the first one available
async function getStartableProcessModelFromList(): Promise<ProcessModel> {

  const processModelList: ProcessModelList = await consumerApiService.getProcessModels(context);

  return processModelList[0];
}

// Start the given process model, and provide a start event key and payload.
async function startProcessInstanceAndReturnCorrelationId(processModel: ProcessModel): Promise<string> {

  const startEventKey = 'StartEvent_1';
  const payload: ProcessStartRequestPayload = {
    // If not provided, a correlationId will be generated
    correlation_id: 'randomcorrelationid',
  };

  const startCallbackType: StartCallbackType = StartCallbackType.CallbackOnProcessInstanceCreated;

  const result: ProcessStartResponsePayload =
    await consumerApiService.startProcess(context, processModel.key, startEventKey, payload, startCallbackType);

  const correlationId: string = result.correlation_id;

  return correlationId;
}

// get the user tasks for the correlation and pick the first from the list
async function getWaitingUserTaskForCorrelation(correlationId: string): Promise<UserTask> {

  const userTaskList: UserTaskList =
    await consumerApiService.getUserTasksForCorrelation(context, correlationId);

  return userTaskList[0];
}

// finish the given user task, using a sample result set
async function finishGivenUserTaskWithResultSet(processModel: ProcessModel, correlationId, userTask: UserTask): Promise<void> {

  const userTaskResult: UserTaskResult = {
    success: true
  };

  await consumerApiService.finishUserTask(context, processModel.key, correlationId,
                                          userTask.id, userTaskResult);
}
```

## Public API

Eine Übersicht über die Public API der ConsumerAPI findet sich [hier](./consumer_api/public_api.md).

## Glossar

Eine Sammlung der wichtigsten ConsumerAPI Begriffe findet sich [hier](./consumer_api/glossary.md).
