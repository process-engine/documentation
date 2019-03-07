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

   1. [Hello BPMN World](02_getting_started/examples/hello_world/README.md)
   1. [Konsumieren einer HTTP REST API](02_getting_started/examples/rest_api/README.md)
   1. [Versenden von E-Mails](02_getting_started/examples/send_email/README.md)
   1. [Erstellen eines Chatbots](02_getting_started/examples/chatbot/README.md)
      * [Prozessmodellierung](02_getting_started/examples/chatbot/chatbot_modeller.md)
      * [Programmierung eines ExternalTask](02_getting_started/examples/chatbot/chatbot_programmer.md)
   1. [Turmstapel-Problem](02_getting_started/examples/towers/README.md)
      * [Move Element](02_getting_started/examples/towers/move_element.md)
      * [Flip Tower](02_getting_started/examples/towers/flip_tower.md)
      * [Move Tower](02_getting_started/examples/towers/move_tower.md)

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


1. [ExternalTaskAPI](07_apis_of_consumer_domain/02_external_task_api/README.md)

   * [Technischer Aufbau](07_apis_of_consumer_domain/02_external_task_api/technical-specifications.md)
   * [ExternalTasks abrufen und sperren](07_apis_of_consumer_domain/02_external_task_api/tasks/fetch-and-lock.md)
   * [Sperrzeit eines ExternalTasks verlängern](07_apis_of_consumer_domain/02_external_task_api/tasks/extend-lock.md)
   * [Handling von BPMN-Fehlern](07_apis_of_consumer_domain/02_external_task_api/tasks/handle-bpmn-errors.md)
   * [Handling von Systemfehlern](07_apis_of_consumer_domain/02_external_task_api/tasks/handle-system-errors.md)
   * [Abschließen eines ExternalTasks](07_apis_of_consumer_domain/02_external_task_api/tasks/finish-external-task.md)

1. [ConsumerAPI](07_apis_of_consumer_domain/01_consumer_api/README.md)

   * [Getting started](07_apis_of_consumer_domain/01_consumer_api/tasks/getting-started.md)

      * [Einstieg](07_apis_of_consumer_domain/01_consumer_api/tasks/getting-started.md#einstieg)
      * [Routen](07_apis_of_consumer_domain/01_consumer_api/tasks/getting-started.md#routen)
      * [Alle Prozessmodelle abfragen](07_apis_of_consumer_domain/01_consumer_api/tasks/getting-started.md#alle-prozessmodelle-abfragen)
      * [Prozessmodell abfragen](07_apis_of_consumer_domain/01_consumer_api/tasks/getting-started.md#prozessmodell-abfragen)
      * [Events anzeigen](07_apis_of_consumer_domain/01_consumer_api/tasks/getting-started.md#events-anzeigen)
      * [UserTasks anzeigen](07_apis_of_consumer_domain/01_consumer_api/tasks/getting-started.md#usertasks-anzeigen)
      * [Prozesse starten](07_apis_of_consumer_domain/01_consumer_api/tasks/getting-started.md#prozesse-starten)
      * [Ergebnisse anzeigen](07_apis_of_consumer_domain/01_consumer_api/tasks/getting-started.md#ergebnisse-anzeigen)
      * [Events von Ergebnissen anzeigen](07_apis_of_consumer_domain/01_consumer_api/tasks/getting-started.md#events-von-ergebnissen-anzeigen)
      * [Events von Ergebnissen triggern](07_apis_of_consumer_domain/01_consumer_api/tasks/getting-started.md#events-von-ergebnissen-triggern)
      * [UserTasks fertigstellen](07_apis_of_consumer_domain/01_consumer_api/tasks/getting-started.md#usertasks-fertigstellen)

   * [Technischer Aufbau](07_apis_of_consumer_domain/01_consumer_api/technical-specifications.md)
   * [Auflisten startbarer Prozessmodelle](07_apis_of_consumer_domain/01_consumer_api/tasks/list-startable-process-models.md)

      * [Alle Prozessmodelle abfragen](07_apis_of_consumer_domain/01_consumer_api/tasks/list-startable-process-models.md#alle-prozessmodelle-abfragen)
      * [Einzelnes Prozessmodell abfragen](07_apis_of_consumer_domain/01_consumer_api/tasks/list-startable-process-models.md#einzelnes-prozessmodell-abfragen)

   * [Starten von Prozessinstanzen](07_apis_of_consumer_domain/01_consumer_api/tasks/start-process-instance.md)
   * [Abfragen von BPMN-Ereignissen auf die der Prozess wartet](07_apis_of_consumer_domain/01_consumer_api/tasks/list-triggerable-events.md)
   * [Auslösen von Ereignissen](07_apis_of_consumer_domain/01_consumer_api/tasks/trigger-event.md)
   * [Auflisten wartender UserTasks](07_apis_of_consumer_domain/01_consumer_api/tasks/list-waiting-usertasks.md)
   * [Abschließen eines UserTasks](07_apis_of_consumer_domain/01_consumer_api/tasks/finish-user-task.md)
   * [Ergebnis einer Prozesskorrelation abfragen](07_apis_of_consumer_domain/01_consumer_api/tasks/get-correlation-result.md)
   * [Erhalten von Prozessbenachrichtigungen](07_apis_of_consumer_domain/01_consumer_api/tasks/receive-process-notifiations.md)

      * [Arten von Prozessbenachrichtigungen](07_apis_of_consumer_domain/01_consumer_api/tasks/receive-process-notifiations.md#arten-von-prozessbenachrichtigungen)
      * [Erhalten von BPMN-Events](07_apis_of_consumer_domain/01_consumer_api/tasks/receive-process-notifiations.md#erhalten-von-bpmn-events)
      * [Erhalten von Infos zu Dtart und Ende von Aktivitäten](07_apis_of_consumer_domain/01_consumer_api/tasks/receive-process-notifiations.md#erhalten-von-infos-zu-start-und-ende-von-aktivitäten)
      * [Erhalten von SystemEvents](07_apis_of_consumer_domain/01_consumer_api/tasks/receive-process-notifiations.md#erhalten-von-system-events)
      * [Erhalten von BPMN-Signalen](07_apis_of_consumer_domain/01_consumer_api/tasks/receive-process-notifiations.md#erhalten-von-bpmn-signalen)

1. [UserTask API](07_apis_of_consumer_domain/usertask-api.md)
1. [Event API](07_apis_of_consumer_domain/event-api.md)

---

## APIs der Runtime Domäne

1. [Logging API](08_apis_of_runtime_domain/logging-api.md)
1. [MessageBus API](08_apis_of_runtime_domain/messagebus-api.md)
1. [Metrics API](08_apis_of_runtime_domain/metrics-api.md)
1. [Persistence API](08_apis_of_runtime_domain/persistence-api.md)

---

## Anlagen

1. [BPMN Basics](99_appendix/bpmn-basics/README.md)
1. [5Minds BPMN-Styleguide](99_appendix/styleguide.md)
1. [BPMN ProcessEngine](99_appendix/bpmn-process-engine/README.md)

    * [TerminateEndEvent](99_appendix/bpmn-process-engine/terminate-end-event.md)

1. [Glossar](GLOSSARY.md)
