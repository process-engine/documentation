# Summary

## ProcessEngine

<!-- IMPORTANT: The first document you reference NEEDS TO BE the top-level README -->
1. [Facts-to-Know](README.md)

   * [Für CEOs](README.md#for_ceos)
   * [Für CTOs](README.md#for_ctos)

---

## Intro Process-Engine.io

1. [Einführung](01_introduction/README.md)
1. [Motivation](01_introduction/motivation.md)

   <!-- If you want to use links in the page, use * for enumeration -->
   * [Warum?](01_introduction/motivation.md#warum)
   * [Mehrwert](01_introduction/motivation.md#mehrwert)
   * [Ziele](01_introduction/motivation.md#ziele)

1. [Zielgruppen](01_introduction/zielgruppen.md)

   * [Prozess-Ersteller](01_introduction/zielgruppen.md#prozessersteller)
   * [Prozess-Beteiligte](01_introduction/zielgruppen.md#prozessbeteiligte)
   * [Laufzeitumgebung](01_introduction/zielgruppen.md#laufzeitumgebung)

1. [Bestandteile process-engine.io](01_introduction/bestandteile.md)

   * [Vorgehensmodell](01_introduction/bestandteile.md#vorgehensmodell)

      * [Denken-Malen-Messen](01_introduction/bestandteile.md#denkenmalenmessen)
      * [Gesamtbild](01_introduction/bestandteile.md#gesamtbild)

   * [BPMN-Studio](01_introduction/bestandteile.md#bpmnstudio)
   * [API Domänen](01_introduction/bestandteile.md#apis)
   * [ProcessEngine](01_introduction/bestandteile.md#processengine)

---

## Getting-Started

1. [Installation](02_getting_started/README.md)
1. [Beispiele](02_getting_started/examples/README.md)

   1. [Hello BPMN World](02_getting_started/examples/hello-bpmn-world.md)
   1. [Konsumieren einer HTTP REST API](02_getting_started/examples/http-rest-api.md)
   <!-- BPMN-Studio does not support ServiceTasks using Emails right now. see:
        https://github.com/process-engine/bpmn-studio/issues/1083 -->
   <!-- 1. [Versenden von E-Mails](02_getting_started/examples/sending-emails.md) -->

---

## BPMN-Studio

<!-- 1. [Überblick](03_bpmn-studio/ueberblick.md) -->

<!--    1. [Think](03_bpmn-studio/01_denken/README.md) -->
<!--    1. [Design](03_bpmn-studio/02_malen/README.md) -->
<!--    1. [Inspect](03_bpmn-studio/03_messen/README.md) -->

1. [Komponenten](03_bpmn-studio/components/README.md)

   1. [Think](03_bpmn-studio/components/plan-view/plan-view.md)

      1. [Solution Explorer](03_bpmn-studio/components/solution-explorer/solution-explorer.md)

   1. [Design](03_bpmn-studio/components/design-view/design-view.md)

      1. [Basic Editing](04_guidelines/basic-editing/basic-editing.md)
      1. [Deployment eines Prozess-Modells](04_guidelines/deploy/deploy.md)
      1. [Start eines Prozess-Modells](04_guidelines/start/start.md)
      1. [Diff-Ansicht](03_bpmn-studio/components/diff-view/diff-view.md)
      1. [XML-Ansicht](03_bpmn-studio/components/xml-view/xml-view.md)
      1. [Waiting Room](03_bpmn-studio/components/waiting-room/waiting-room.md)

   1. [Inspect](03_bpmn-studio/components/dashboard/dashboard.md)

   1. [Settings](03_bpmn-studio/components/settings/settings.md)
   1. [Login](03_bpmn-studio/components/login/login.md)

---

<!-- ## Leitfäden -->

<!-- 1. [User Guide](04_guidelines/README.md) -->

<!--    1. [Think](04_guidelines/01_denken-malen-messen/01_denken/README.md) -->

<!--       1. [Organisation von Prozess Modellen](04_guidelines/01_denken-malen-messen/01_denken/README.md#Organisation) -->

<!--    1. [Design](04_guidelines/01_denken-malen-messen/02_malen/README.md) -->

<!--       1. [Basic Editing](04_guidelines/basic-editing/basic-editing.md) -->
<!--       1. [Deployment eines Prozess-Modells](04_guidelines/deploy/deploy.md) -->
<!--       1. [Start eines Prozess-Modells](04_guidelines/start/start.md) -->

<!--    1. [Inspect](04_guidelines/01_denken-malen-messen/03_messen/README.md) -->
<!--       <1!-- 1. Debuggen eines Prozesses --1> -->
<!--       1. Verwenden einer Heatmap -->
<!--       1. Auflisten aller UserTasks -->
<!--       1. Fortführen eines UserTasks -->

<!--    <1!-- 1. IAM --1> -->
<!--    1. [Allgemein](04_guidelines/allgemein.md) -->

<!--       1. [Auto Updater](03_bpmn-studio/auto-updater.md) -->

---

## API Domänen

1. [Motivation](05_api_domains/README.md)
1. [Management Domäne](05_api_domains/README.md)
1. [Consumer API Domäne](05_api_domains/README.md)
1. [Runtime Domäne](05_api_domains/README.md)

---

## APIs der Management Domäne

1. [Debugging API](06_apis_of_management_domain/debugging-api.md)
1. [Deployment API](06_apis_of_management_domain/deployment-api.md)
1. [KPI API](06_apis_of_management_domain/kpi-api.md)

---

## APIs der Consumer Domäne


1. [ExternalTaskAPI](api/external_task_api/README.md)

   * [Technischer Aufbau](api/external_task_api/technical-specifications.md)
   * [ExternalTasks abrufen und sperren](api/external_task_api/tasks/fetch-and-lock.md)
   * [Sperrzeit eines ExternalTasks verlängern](api/external_task_api/tasks/extend-lock.md)
   * [Handling von BPMN-Fehlern](api/external_task_api/tasks/handle-bpmn-errors.md)
   * [Handling von Systemfehlern](api/external_task_api/tasks/handle-system-errors.md)
   * [Abschließen eines ExternalTasks](api/external_task_api/tasks/finish-external-task.md)

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

1. [UserTask API](07_apis_of_consumer_domain/usertask-api.md)
1. [Event API](07_apis_of_consumer_domain/event-api.md)

---

## APIs der Runtime Domäne

1. [Logging API](08_apis_of_runtime_domain/logging-api.md)
1. [MessageBus API](08_apis_of_runtime_domain/messagebus-api.md)
1. [Metrics API](08_apis_of_runtime_domain/metrics-api.md)
1. [Persistence API](08_apis_of_runtime_domain/persistence-api.md)

---

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

   1. [ExternalTaskAPI](processengine/typescript/external_task_api/README.md)
       * [Setup](processengine/typescript/external_task_api/setup/README.md)
          * [Einrichtung mit integrierter ProcessEngine](processengine/typescript/external_task_api/setup/setup-internal-process-engine.md)
          * [Einrichtung mit externer ProcessEngine](processengine/typescript/external_task_api/setup/setup-external-process-engine.md)
          * [Konfigurieren des ExternalTaskApiClients](processengine/typescript/external_task_api/setup/setup-external-task-api-client.md)
       * [Hands-On](processengine/typescript/external_task_api/hands_on/README.md)
       * [Aufgaben](processengine/typescript/external_task_api/tasks/README.md)
          * [ExternalTasks abrufen und sperren](processengine/typescript/external_task_api/tasks/fetch-and-lock.md)
          * [Sperrzeit eines ExternalTasks verlängern](processengine/typescript/external_task_api/tasks/extend-lock.md)
          * [Handling von BPMN-Fehlern](processengine/typescript/external_task_api/tasks/handle-bpmn-errors.md)
          * [Handling von Systemfehlern](processengine/typescript/external_task_api/tasks/handle-system-errors.md)
          * [Abschließen eines ExternalTasks](processengine/typescript/external_task_api/tasks/finish-external-task.md)
       * [Public API](processengine/typescript/external_task_api/public_api.md)
          * [IExternalTaskAPI](processengine/typescript/external_task_api/public_api.md#iexternaltaskapi)
          * [IExternalTaskRepository](processengine/typescript/external_task_api/public_api.md#iexternaltaskrepository)
          * [IExternalTask](processengine/typescript/external_task_api/public_api.md#iexternaltask)
          * [ExternalTaskState](processengine/typescript/external_task_api/public_api.md#iexternaltaskstate)
          * [ExternalTaskSuccessMessage](processengine/typescript/external_task_api/public_api.md#iexternaltasksuccessmessage)
          * [ExternalTaskErrorMessage](processengine/typescript/external_task_api/public_api.md#iexternaltaskerrormessage)
          * [FetchAndLockRequestPayload](processengine/typescript/external_task_api/public_api.md#fetchandlockrequestpayload)
          * [ExtendLockRequestPayload](processengine/typescript/external_task_api/public_api.md#extendlockrequestpayload)
          * [FinishExternalTaskRequestPayload](processengine/typescript/external_task_api/public_api.md#finishexternaltaskrequestpayload)
          * [HandleBpmnErrorRequestPayload](processengine/typescript/external_task_api/public_api.md#handlebpmnerrorrequestpayload)
          * [HandleServiceErrorRequestPayload](processengine/typescript/external_task_api/public_api.md#handleserviceerrorrequestpayload)

   1. [Management API](processengine/typescript/management_api/README.md)

## Anlagen

1. [BPMN Basics](99_appendix/bpmn-basics/README.md)
1. [5Minds BPMN-Styleguide](99_appendix/styleguide.md)
1. [BPMN ProcessEngine](99_appendix/bpmn-process-engine/README.md)

    * [TerminateEndEvent](99_appendix/bpmn-process-engine/terminate-end-event.md)

1. [Glossar](GLOSSARY.md)
