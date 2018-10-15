# Summary

## Intro Process-Engine.io

1. [Motivation](think-design-inspect/README.md#)

   1. [Mehrwert](think-design-inspect/README.md#Mehrwert)

1. [Denken-Malen-Messen](think-design-inspect/README.md)
1. [Zielpersonen](think-design-inspect/README.md#Zielpersonen)
1. [Bestandteile Process-Engine.io](README.md#process-engine)

   1. [Vorgehensmodell](README.md#??)
   1. [APIs -> Rename to Dömänen](README.md#apis)
   1. [Process-Engine.ts](README.md#??)
   1. [Process-Engine.NET](README.md#??)
   1. [BPMN-Studio](README.md#bpmn-studio)

## Getting-Started

1. [Installation](getting-started/installation.md)
1. [Beispiele](getting-started/examples/README.md)

   * [Hello BPMN World](getting-started/examples/hello-bpmn-world.md)
   * [Konsumieren einer HTTP REST API](getting-started/examples/http-rest-api.md)
   * [Versenden von E-Mails](getting-started/examples/sending-emails.md)

## BPMN-Studio

1. [Überblick](bpmn-studio/ueberblick.md)

   1. Think
   1. Design
   1. Inspect

1. [Komponenten](bpmn-studio/components/README.md)

   1. Think
      1. [Solution Explorer](bpmn-studio/components/solution-explorer/solution-explorer.md)

   <!-- 1. [Think-Ansicht](bpmn-studio/components/plan-view/plan-view.md) -->

   1. [Design-Ansicht](bpmn-studio/components/design-view/design-view.md)

      1. [Diff-Ansicht](bpmn-studio/components/diff-view/diff-view.md)
      1. [XML-Ansicht](bpmn-studio/components/xml-view/xml-view.md)
      1. [Waiting Room](bpmn-studio/components/waiting-room/waiting-room.md)

   1. [Inspect-Ansicht](bpmn-studio/components/dashboard/dashboard.md)

   1. [Settings](bpmn-studio/components/settings/settings.md)
   1. [Login](bpmn-studio/components/login/login.md)

## Leitfäden

1. [User Guide](bpmn-studio/user-guide/README.md)

   1. [Think](bpmn-studio/user-guide/think/think.md)
   1. [Design](bpmn-studio/user-guide/design/design.md)

   1. [Basic Editing](bpmn-studio/user-guide/basic-editing/basic-editing.md)
   1. [Deployment of ProcessModels](bpmn-studio/user-guide/deploy/deploy.md)
   1. [Starting a Process](bpmn-studio/user-guide/start/start.md)

1. [Auto Updater](bpmn-studio/auto-updater.md)

## ProcessEngine Domänen

1. Management Domäne
1. Consumer Domäne
1. Runtime Domäne

## APIs in den Domänen

1. [ConsumerAPI](api/consumer_api/README.md)

   * [Getting started](api/consumer_api/tasks/getting-started.md)

      * [Einstieg](api/consumer_api/tasks/getting-started.md#einstieg)
      * [Routen](api/consumer_api/tasks/getting-started.md#routen)
      * [Alle Prozessmodelle abfragen](api/consumer_api/tasks/getting-started.md#alle-prozessmodelle-abfragen)
      * [Prozessmodell abfragen](api/consumer_api/tasks/getting-started.md#prozessmodell-abfragen)
      * [Events anzeigen](api/consumer_api/tasks/getting-started.md#events-anzeigen)
      * [UserTasks anzeigen](api/consumer_api/tasks/getting-started.md#usertasks-anzeigen)
      * [Prozesse starten](api/consumer_api/tasks/getting-started.md#prozesse-starten)
      * [Ergebnisse anzeigen](api/consumer_api/tasks/getting-started.md#ergebnisse-anzeigen)
      * [Events von Ergebnissen anzeigen](api/consumer_api/tasks/getting-started.md#events-von-ergebnissen-anzeigen)
      * [Events von Ergebnissen triggern](api/consumer_api/tasks/getting-started.md#events-von-ergebnissen-triggern)
      * [UserTasks fertigstellen](api/consumer_api/tasks/getting-started.md#usertasks-fertigstellen)

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
      * [Erhalten von Infos zu Dtart und Ende von Aktivitäten](api/consumer_api/tasks/receive-process-notifiations.md#erhalten-von-infos-zu-start-und-ende-von-aktivitäten)
      * [Erhalten von SystemEvents](api/consumer_api/tasks/receive-process-notifiations.md#erhalten-von-system-events)
      * [Erhalten von BPMN-Signalen](api/consumer_api/tasks/receive-process-notifiations.md#erhalten-von-bpmn-signalen)

1. [ExternalTaskAPI](api/external_task_api/README.md)

   * [Technischer Aufbau](api/external_task_api/technical-specifications.md)
   * [ExternalTasks abrufen und sperren](api/external_task_api/tasks/fetch-and-lock.md)
   * [Sperrzeit eines ExternalTasks verlängern](api/external_task_api/tasks/extend-lock.md)
   * [Handling von BPMN-Fehlern](api/external_task_api/tasks/handle-bpmn-errors.md)
   * [Handling von Systemfehlern](api/external_task_api/tasks/handle-system-errors.md)
   * [Abschließen eines ExternalTasks](api/external_task_api/tasks/finish-external-task.md)

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

<!-- TODO: Check why this is here! -->
   1. [Management API](processengine/typescript/management_api/README.md)

## Anlagen

1. [BPMN Basics](bpmn-standard/bpmn-basics/README.md)

<!-- Move this to 5Minds -->
1. [5Minds BPMN-Styleguide](bpmn-standard/styleguide.md)
1. [BPMN ProcessEngine](bpmn-standard/bpmn-process-engine/README.md)

    * [TerminateEndEvent](bpmn-standard/bpmn-process-engine/terminate-end-event.md)

1. [Glossar](GLOSSARY.md)
