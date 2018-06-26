# Summary

## Getting Started

1. [Einleitung](README.md)

  * [BPMN-Studio](README.md#bpmn-studio)
  * [ProcessEngine](README.md#process-engine)
  * [APIs](README.md#apis)

1. [Installation](getting-started/installation.md)
1. [Beispiele](getting-started/examples/README.md)

  * [Hello BPMN World](getting-started/examples/hello-bpmn-world.md)
  * [Konsumieren einer HTTP REST API](getting-started/examples/http-rest-api.md)
  * [Versenden von E-Mails](getting-started/examples/sending-emails.md)

## BPMN - Standard

1. [BPMN Basics](bpmn-standard/bpmn-basics/README.md)
1. [Styleguide](bpmn-standard/styleguide.md)
1. [BPMN ProcessEngine](bpmn-standard/bpmn-process-engine/README.md)

  * [TerminateEndEvent](bpmn-standard/bpmn-process-engine/terminate-end-event.md)

## BPMN-Studio

1. [Beschreibung der Ansichten](bpmn-studio/beschreibung-ansichten.md)
1. [Auto Updater](bpmn-studio/auto-updater.md)
1. [Hands-On](bpmn-studio/hands-on/README.md)

  * [Prozess erstellen](bpmn-studio/hands-on/prozess-erstellen.md)
  * [Process parametrisieren](bpmn-studio/hands-on/prozess-parametrisieren.md)

## ProcessEngine API

1. [ConsumerAPI](api/consumer_api/README.md)
  * [Technischer Aufbau](api/consumer_api/technical-specifications.md)
  * [Auflisten startbarer Prozessmodelle](api/consumer_api/tasks/list-startable-process-models.md)
      * [Alle Prozessmodelle abfragen](api/consumer_api/tasks/list-startable-process-models.md#alle-prozessmodelle-abfragen)
      * [Einzelnes Prozessmodell abfragen](api/consumer_api/tasks/list-startable-process-models.md#einzelnes-prozessmodell-abfragen)
  * [Starten von Prozessinstanzen](api/consumer_api/tasks/start-process-instance.md)
  * [Abfragen von BPMN-Ereignissen auf die der Prozess wartet](api/consumer_api/tasks/list-triggerable-events.md)
  * [Auslösen von Ereignissen](api/consumer_api/tasks/trigger-event.md)
  * [Auflisten wartender UserTasks](api/consumer_api/tasks/list-waiting-usertasks.md)
  * [Abschließen eines UserTasks](api/consumer_api/tasks/finish-user-task.md)
  * [Ergebnis einer Prozesskorrelation abfragen](api/consumer_api/tasks/get-correlation-result.md)
  * [Erhalten von Prozessbenachrichtigungen](api/consumer_api/tasks/receive-process-notifiations.md)
      * [Arten von Prozessbenachrichtigungen](api/consumer_api/tasks/receive-process-notifiations.md#arten-von-prozessbenachrichtigungen)
      * [Erhalten von BPMN-Events](api/consumer_api/tasks/receive-process-notifiations.md#erhalten-von-bpmn-events)
      * [Erhalten von Infos zu start und ende von Aktivitäten](api/consumer_api/tasks/receive-process-notifiations.md#erhalten-von-infos-zu-start-und-ende-von-aktivitäten)
      * [Erhalten von SystemEvents](api/consumer_api/tasks/receive-process-notifiations.md#erhalten-von-system-events)
      * [Erhalten von BPMN-Signalen](api/consumer_api/tasks/receive-process-notifiations.md#erhalten-von-bpmn-signalen)
1. [ManagementAPI](api/management-api.md)

## ProcessEngine

1. [TypeScript](processengine/typescript/README.md)

  1. [Setup](processengine/typescript/setup/README.md)
    * [Konfiguration](processengine/typescript/setup/konfiguration.md)

  1. [Konzepte](processengine/typescript/konzepte/README.md)
    * [Konfiguration](processengine/typescript/konzepte/configuration.md)

  1. [Architektur](processengine/typescript/architektur/README.md)
    * [Dependency Injection](processengine/typescript/architektur/dependendy-injection.md)
    * [Discovery](processengine/typescript/architektur/discovery.md)
    * [Struktur](processengine/typescript/architektur/structure.md)
    * [Adapter](processengine/typescript/architektur/adapters.md)
    * [Bridges](processengine/typescript/architektur/bridges.md)
    * [Contracts](processengine/typescript/architektur/contracts.md)
    * [Extensions](processengine/typescript/architektur/extensions.md)

  1. [ConsumerAPI](processengine/typescript/consumer_api/README.md)
      * [Setup](processengine/typescript/consumer_api/setup/README.md)
          * [Einrichtung mit integrierter ProcessEngine](processengine/typescript/consumer_api/setup/setup-internal-process-engine.md)
          * [Einrichtung mit externer ProcessEngine](processengine/typescript/consumer_api/setup/setup-external-process-engine.md)
          * [Konfigurieren des ConsumerApiClients](processengine/typescript/consumer_api/setup/setup-consumer-api-client.md)
      * [Hands-On](processengine/typescript/consumer_api/hands_on/README.md)
      * [Aufgaben](processengine/typescript/consumer_api/tasks/README.md)
          * [Abfragen startbarer Prozessmodelle](processengine/typescript/consumer_api/tasks/list-startable-process-models.md)
              * [Alle Prozessmodelle abfragen](processengine/typescript/consumer_api/tasks/list-startable-process-models.md#alle-prozessmodelle-abfragen)
              * [Einzelnes Prozessmodell abfragen](processengine/typescript/consumer_api/tasks/list-startable-process-models.md#einzelnes-prozessmodell-abfragen)
          * [Starten von Prozessinstanzen](processengine/typescript/consumer_api/tasks/start-process-instance.md)
          * [Auflisten wartender UserTasks](processengine/typescript/consumer_api/tasks/list-waiting-usertasks.md)
          * [Abschließen eines UserTasks](processengine/typescript/consumer_api/tasks/finish-user-task.md)
          * [Ergebnis einer Prozesskorrelation abfragen](processengine/typescript/consumer_api/tasks/get-correlation-result.md)
      * [Public API](processengine/typescript/consumer_api/public_api.md)
          * [IConsumerApiService](processengine/typescript/consumer_api/public_api.md#iconsumerapiservice)
          * [ConsumerContext](processengine/typescript/consumer_api/public_api.md#consumercontext)
          * [ProcessModelList](processengine/typescript/consumer_api/public_api.md#processmodellist)
          * [ProcessModel](processengine/typescript/consumer_api/public_api.md#processmodel)
          * [Event](processengine/typescript/consumer_api/public_api.md#event)
          * [StartCallbackType](processengine/typescript/consumer_api/public_api.md#startcallbacktype)
          * [ProcessStartRequestPayload](processengine/typescript/consumer_api/public_api.md#processstartrequestpayload)
          * [ProcessStartResponsePayload](processengine/typescript/consumer_api/public_api.md#processstartresponsepayload)
          * [UserTasks](processengine/typescript/consumer_api/public_api.md#usertasks)
          * [UserTaskList](processengine/typescript/consumer_api/public_api.md#usertasklist)
          * [UserTask](processengine/typescript/consumer_api/public_api.md#usertask)
          * [UserTaskConfig](processengine/typescript/consumer_api/public_api.md#usertaskconfig)
          * [UserTaskResult](processengine/typescript/consumer_api/public_api.md#usertaskresult)
  1. [Management API](processengine/typescript/management_api/README.md)

## Anlagen

1. [Glossar](GLOSSARY.md)
