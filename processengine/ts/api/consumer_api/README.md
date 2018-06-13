# ConsumerAPI.ts

Dieser Abschnitt beschreibt die TypeScript Implementierung der [ConsumerAPI](../../../../api/consumer_api/README.md).

Die Implementierung baut auf den gleichen [Konzepten](../../konzepte/README.md) und [Architekturmustern](../../architektur/README.md)
wie die TypeScript Implementierung der ProcessEngine auf.

# Pakete

Die ConsumerAPI.ts umfasst folgende Pakete
- `@process-engine/consumer_api_contracts` - Definiert die Schnittstellen
für `@process-engine/consumer_api_core` und `@process-engine/consumer_api_client`
- `@process-engine/consumer_api_core` - Steuert die Interaktion mit einer
internen ProcessEngine
- `@process-engine/consumer_api_client` - Steuert die Kommunikation mit einer
externen ProcessEngine
- `@process-engine/consumer_api_http` - Dient als Kommunikations-Endpunkt
für `@process-engine/consumer_api_client`

# Vorraussetzungen

Um die ConsumerAPI.ts benutzen zu können sind folgende Mindestanforderungen gegeben:

- Das Paket `@process-engine/process-engine` in der Version 6.0.2
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

Die Konfiguration der ConsumerAPI.ts Komponenten erfolgt nach dem
[Konfigurationskonzept](../../konzepte/configuration.md).

# Features

Die ConsumerAPI.ts umfasst derzeit folgende Features:

* Abfragen startbarer Prozessmodelle
* Starten von Prozessinstanzen
* Wartende UserTasks ermitteln
* UserTasks abschließen
* Ergebnis einer Prozesskorrelation abfragen

# Dokumentation

## Funktionsdokumentation
* [Abfragen startbarer Prozessmodelle](list-startable-process-models.md)
  * [Alle Prozessmodelle abfragen](list-startable-process-models.md#alle-prozessmodelle-abfragen)
  * [Einzelnes Prozessmodell abfragen](list-startable-process-models.md#einzelnes-prozessmodell-abfragen)
* [Starten von Prozessinstanzen](start-process-instance.md)
* [Auflisten wartender UserTasks](list-waiting-usertasks.md)
* [Abschließen eines UserTasks](finish-user-task.md)
* [Ergebnis einer Prozesskorrelation abfragen](get-correlation-result.md)

## Zusätzliche Dokumentation
* [Public API](public_api.md)

# Codebeispiel - Starten eines Prozesses

```TypeScript
import {
  ConsumerContext,
  IConsumerApiService,
  StartCallbackType
} from '@process-engine/consumer_api_contracts';

// Retrieve through dependency injection
const consumerApiService: IConsumerApiService;

// The JWT token must be provided by the implementing application
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

Für weitere Beispiele, siehe Funktionsdokumentation.
