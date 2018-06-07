# Schnittstelle: ConsumerAPI

Die ConsumerAPI dient zur Ausführung von Prozessmodellen und steuert die daraus
resultierende Interaktion mit der ProcessEngine.

```TypeScript
import {
  ConsumerContext,
  IConsumerApiService,
  StartCallbackType
} from '@process-engine/consumer_api_contracts';

const consumerApiService: IConsumerApiService; // Retrieve through IoC

const context: ConsumerContext = {
  identity: 'insertJwtTokenHere',
};

await consumerApiService
  .startProcessInstance(context,
                        'processModelKey',
                        'startEventKey',
                        {},
                        StartCallbackType.CallbackOnProcessInstanceCreated);
```

# Pakete

Die ConsumerAPI umfasst folgende Pakete
- `@process-engine/consumer_api_contracts` - Definiert die Schnittstellen
für `consumer_api_core` und `consumer_api_client`
- `@process-engine/consumer_api_core` - Steuert die Interaktion mit einer
internen ProcessEngine
- `@process-engine/consumer_api_client` - Steuert die Kommunikation mit einer
externen ProcessEngine
- `@process-engine/consumer_api_http` - Dient als Kommunikations-Endpunkt
für `consumer_api_client`

# Vorraussetzungen

Um die ConsumerAPI benutzen zu können sind folgende Mindestanforderungen gegeben:

- Das Paket `@process-engine/process-engine` in der Version 5.1.0
- Node Version 8.9.x

# Installation

Es gibt zwei Anwendungsszenarien für die ConsumerAPI:
1. Eine Anwendung benutzt eine integrierte ProcessEngine
2. Eine Anwendung steuert eine ProcessEngine an, die in einer externen
Anwendung liegt (z.B. auf einem zentralen Server)

Je nach Anwendungsfall sind unterschiedliche Installationsschritte auszuführen.

Für eine detaillierte Installationsanleitung, siehe:
- [Einrichtung mit integrierter ProcessEngine](setup_internal_process_engine.md)
- [Einrichtung mit externer ProcessEngine](setup_external_process_engine.md)

# Features

Die ConsumerAPI umfasst derzeit folgende Features:

* Abfragen startbarer Prozessmodelle
* Starten von Prozessinstanzen
* Wartende UserTasks ermitteln
* UserTasks abschließen

# Dokumentation

## Allgemein
* [Glossar](glossary.md)
* [Technischer Aufbau](consumer-api-structure.md)
* [Public API](public_api.md)

## Funktionsdokumentation
* [Abfragen startbarer Prozessmodelle](list-startable-process-models.md)
  * [Alle Prozessmodelle abfragen](list-startable-process-models.md#alle-prozessmodelle-abfragen)
  * [Einzelnes Prozessmodell abfragen](list-startable-process-models.md#einzelnes-prozessmodell-abfragen)
* [Starten von Prozessinstanzen](start-process-instance.md)
  * [Starten und auf ein System Event warten](start-process-instance.md#starten-und-auf-ein-system-event-warten)
  * [Starten und auf ein bestimmtes EndEvent warten](start-process-instance.md#starten-und-auf-ein-bestimmtes-endevent-warten)
* [Auflisten wartender UserTasks](list-waiting-usertasks.md)
* [Abschließen eines UserTasks](finish-user-task.md)
* [Ergebnis einer Prozesskorrelation abfragen](get-correlation-result.md)

# Codebeispiel

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

const processModel: ProcessModel =
  await getStartableProcessModelFromList();

const correlationId: string =
  await startProcessInstanceAndReturnCorrelationId(processModel);

const waitingUserTask: UserTask =
  await getWaitingUserTaskForCorrelation(correlationId);

await finishGivenUserTaskWithResultSet(processModel,
                                       correlationId,
                                       waitingUserTask);

// Get list of process models you are allowed to access
// and pick the first one available
async function getStartableProcessModelFromList(): Promise<ProcessModel> {

  const processModelList: ProcessModelList =
    await consumerApiService.getProcessModels(context);

  return processModelList[0];
}

// Start the given process model, and provide a start event key and payload.
async function startProcessInstanceAndReturnCorrelationId(
    processModel: ProcessModel
  ): Promise<string> {

  const startEventKey = 'StartEvent_1';
  const payload: ProcessStartRequestPayload = {
    // If not provided, a correlationId will be generated
    correlation_id: 'randomcorrelationid',
  };

  const startCallbackType: StartCallbackType =
    StartCallbackType.CallbackOnProcessInstanceCreated;

  const result: ProcessStartResponsePayload =
    await consumerApiService.startProcessInstance(context,
                                                  processModel.key,
                                                  startEventKey,
                                                  payload,
                                                  startCallbackType);

  const correlationId: string = result.correlation_id;

  return correlationId;
}

// get the user tasks for the correlation and pick the first from the list
async function getWaitingUserTaskForCorrelation(
    correlationId: string
  ): Promise<UserTask> {

  const userTaskList: UserTaskList =
    await consumerApiService.getUserTasksForCorrelation(context,
                                                        correlationId);

  return userTaskList[0];
}

// finish the given user task, using a sample result set
async function finishGivenUserTaskWithResultSet(processModel: ProcessModel,
                                                correlationId,
                                                userTask: UserTask
                                               ): Promise<void> {

  const userTaskResult: UserTaskResult = {
    form_fields: {
      Form_XGSVBgio: true,
    },
  };

  await consumerApiService.finishUserTask(context,
                                          processModel.key,
                                          correlationId,
                                          userTask.id,
                                          userTaskResult);
}
```
