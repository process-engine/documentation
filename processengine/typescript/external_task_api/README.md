# ExternalTaskAPI TypeScript Implementierung

Dieser Abschnitt beschreibt die TypeScript Implementierung der [ExternalTaskAPI](../../../../api/external_task_api/README.md).

Die Implementierung baut auf den gleichen [Konzepten](../../konzepte/README.md) und [Architekturmustern](../../architektur/README.md)
wie die TypeScript Implementierung der ProcessEngine auf.

# Dokumentation

## Funktionsdokumentation
* [ExternalTasks abrufen und sperren](./tasks/fetch-and-lock.md)
* [Sperrzeiten verlängern](./tasks/extend-lock.md)
* [Abschließen von ExternalTasks](./tasks/finish-external-task.md)
* [Behandeln von BPMN Fehlern](./tasks/handle-bpmn-errors.md)
* [Behandeln von Systemfehlern](./tasks/handle-system-errors.md)

## Zusätzliche Dokumentation
* [Public API](public_api.md)

# Codebeispiel - Fetch and Lock

```TypeScript
import {IIdentity} from '@essential-projects/iam_contracts';

import {
  ExternalTask,
  IExternalTaskApi,
} from '@process-engine/external_task_api_contracts';

// Retrieve through dependency injection
const externalTaskAPIService: IExternalTaskAPI;

// The JWT token must be provided by the implementing application
const identity: IIdentity = {
  token: 'insertJwtTokenHere',
};
const workerId: string = 'sample_worker';
const topicName: string = 'sample_topic';
const maxNumberOfTasksToGet: number = 10;
const longPollingTimeoutInMs: number = 10000;
const lockDurationInMs: number = 300000;

const result = externalTaskAPIService
  .fetchAndLockExternalTasks<TPayloadType>(identity,
                                           workerId,
                                           topicName,
                                           maxNumberOfTasksToGet,
                                           longPollingTimeoutInMs,
                                           lockDurationInMs);
```

Für weitere Beispiele, siehe Funktionsdokumentation.

# Pakete

Die ExternalTaskAPI umfasst folgende Pakete
- `@process-engine/external_task_api_contracts` - Definiert die Schnittstellen
  für `@process-engine/external_task_api_core` und `@process-engine/external_task_api_client`
- `@process-engine/external_task_api_client` - Primäre Komponente zur Verwendung der
  ExternalTaskAPI.
- `@process-engine/external_task_api_core` - Kommuniziert direkt mit der ProcessEngine
- `@process-engine/external_task.repository.sequelize` - Steuert die
Persistierung von ExternalTasks
- `@process-engine/external_task_api_http` - Dient als Kommunikations-Endpunkt
  für `@process-engine/external_task_api_client`, wenn eine externe ProcessEngine
  benutzt wird

# Vorraussetzungen

Um die ExternalTaskAPI benutzen zu können sind folgende Mindestanforderungen gegeben:

- Das Paket `@process-engine/process_engine_core` in der Version 5.1.0
- Node Version 8.9.x

# Installation

Es gibt zwei Anwendungsszenarien für die ExternalTaskAPI:
1. Eine Anwendung benutzt eine integrierte ProcessEngine
2. Eine Anwendung steuert eine ProcessEngine an, die in einer externen
Anwendung liegt (z.B. auf einem zentralen Server)

Je nach Anwendungsfall sind unterschiedliche Installationsschritte auszuführen.

Für eine detaillierte Installationsanleitung, siehe:
- [Einrichtung mit integrierter ProcessEngine](setup/setup-internal-process-engine.md)
- [Einrichtung mit externer ProcessEngine](setup/setup-external-process-engine.md)

Die Konfiguration der ExternalTaskAPI Komponenten erfolgt nach dem
[Konfigurationskonzept](../../konzepte/configuration.md).
