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

Es gibt zwei Anwendungsszenarien für die Consumer API:
1. Eine Anwendung benutzt eine integrierte ProcessEngine
2. Eine Anwendung steuert eine ProcessEngine an, die in einer externen
Anwendung liegt (z.B. auf einem zentralen Server)

Je nach Anwendungsfall unterscheidet sich auch der Einrichtungsvorgang
für die ConsumerAPI.

### Einrichtung mit integrierter ProcessEngine:

#### Setup

Anwendungen, die eine integrierte ProcessEngine verwenden,
benötigen folgende Pakete:
- `@process-engine/consumer_api_core`
- `@process-engine/process-engine` - Version 2.2.0 oder höher

Ebenfalls muss sichergestellt sein, dass das IoC Module des
`@process-engine/consumer_api_core` Pakets am IoC Container registriert wird.
Das Modul kann über den Pfad `@process-engine/consumer_api_core/ioc_module`
angesteuert werden.

#### Konfiguration

Das `@process-engine/consumer_api_core` Paket benötigt eine Konfigurationsdatei, die innerhalb
des Konfigurationsordners unter dem Pfad
`consumer_api_core/consumer_api_iam_service.json` abgelegt werden muss.

In dieser Datei werden die Claims konfiguriert, mit denen die Benutzer Zugriff
auf die Lanes eines Prozesses erhalten sollen.

Die Claims werden dabei stehts einem konkreten Benutzer zugeordnet.
Ebenfalls ist zu beachten, dass die zugeordneten Claims dem Namen einer `Lane`
entsprechen müssen.

Beispiel Config:

```js
{
  "claimConfig": {
    "userA": [
      "Lane_A",
      "Lane_B"
    ],
    "userB": [
      "Lane_A",
      "Lane_C",
      "Lane_D"
    ]
  }
}

```

### Einrichtung mit externer ProcessEngine:

#### Setup

Die externe Anwendung, welche die ProcessEngine implementiert, muss folgende
Pakete installiert haben:
- `@process-engine/consumer_api_core`
- `@process-engine/consumer_api_http`
- `@process-engine/process-engine` - Version 2.2.0 oder höher

Die Anwendung, welche mit der externen Process Engine kommunizieren soll,
benötigt folgende Pakete:
- `@process-engine/consumer_api_client`
- `@process-engine/process-engine` - Version 2.2.0 oder höher

In beiden Anwendungen muss sichergestellt werden,
dass die jeweiligen IoC Module am IoC Container registriert werden.

#### Konfiguration

In der Anwendung, welche die ProcessEngine enthält, muss eine Konfiguration
für das `@process-engine/consumer_api_core` Paket eingerichtet werden.
Siehe weiter oben für Details.

Die Anwendung, welche mit der externen ProcessEngine kommunizieren soll,
benötigt folgende Konfiguration für `@process-engine/consumer_api_client`:

```js
{
  "url": "http://address-to-external-application/api/consumer/v1"
}

```

`url` bezeichnet dabei die HTTP Adresse, unter der die externe Anwendung
erreichbar ist.
Das Suffix `/api/consumer/v1` ist zwingend erforderlich.

Diese Config muss im Konfigurationsordner unter dem Pfad
`consumer_api_client/consumer_api_client_service.json` abgelegt sein.

## Aufgaben der ConsumerAPI

> TODO

Die Consumer API erfüllt die folgenden Aufgaben:

* [Auflisten startbarer Prozessmodelle](./consumer_api/list-startable-process-models.md)
  * [Alle Prozessmodelle abfragen](./consumer_api/list-startable-process-models.md#alle-prozessmodelle-abfragen)
  * [Einzelnes Prozessmodell abfragen](./consumer_api/list-startable-process-models.md#einzelnes-prozessmodell-abfragen)
* [Starten eines Prozessmodells](./consumer_api/start-process-instance.md)
  * [Starten und auf ein `System Event` warten](./consumer_api/start-process-instance.md#starten-und-auf-ein-system-event-warten)
  * [Starten und auf ein bestimmtes EndEvent warten](./consumer_api/start-process-instance.md#starten-und-auf-ein-bestimmtes-endevent-warten)
* [Auflisten wartender UserTasks](./consumer_api/list-waiting-usertasks.md)
* [Abschließen eines UserTasks](./consumer_api/finish-user-task.md)

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
