# Summary

## Getting Started

1. [Anforderungen](getting-started/conditions.md)
1. [Installation](getting-started/installation.md)
1. [Beispiele](getting-started/examples/README.md)

  * [Hello BPMN World](getting-started/examples/hello-bpmn-world.md)
  * [http-rest-api](getting-started/examples/http-rest-api.md)
  * [sending-emails](getting-started/examples/sending-emails.md)
  * [skateboard](getting-started/examples/skateboard.md)

## BPMN - Standard

1. [Styleguide](bpmn-standard/styleguide.md)
1. [BPMN Basics](bpmn-standard/bpmn-basics/README.md)

  * [BPMN ProcessEngine](bpmn-standard/bpmn-process-engine/terminate-end-event.md)
  * [typisierte-tasks](bpmn-standard/bpmn-basics/typisierte-tasks.md)

## BPMN-Studio

1. [Beschreibung der Dialoge](bpmn-studio/beschreibung-dialoge.md)
1. [Auto Updater](bpmn-studio/auto-updater.md)
1. [Hands-On](bpmn-studio/hands-on/README.md)

  * [Prozess erstellen](bpmn-studio/hands-on/prozess-erstellen.md)
  * [Process parametrisieren](bpmn-studio/hands-on/prozess-parametrisieren.md)

## API

1. [Consumer API](processengine/ts/api/consumer_api/README.md)

  * [Einrichtung mit integrierter ProcessEngine](processengine/ts/api/consumer_api/setup_internal_process_engine.md)
  * [Einrichtung mit externer ProcessEngine](processengine/ts/api/consumer_api/setup_external_process_engine.md)
  * [Abfragen startbarer Prozessmodelle](processengine/ts/api/consumer_api/list-startable-process-models.md)
    * [Alle Prozessmodelle abfragen](processengine/ts/api/consumer_api/list-startable-process-models.md#alle-prozessmodelle-abfragen)
    * [Einzelnes Prozessmodell abfragen](processengine/ts/api/consumer_api/list-startable-process-models.md#einzelnes-prozessmodell-abfragen)
  * [Starten von Prozessinstanzen](processengine/ts/api/consumer_api/start-process-instance.md)
    * [Starten und auf ein System Event warten](processengine/ts/api/consumer_api/start-process-instance.md#starten-und-auf-ein-system-event-warten)
    * [Starten und auf ein bestimmtes EndEvent warten](processengine/ts/api/consumer_api/start-process-instance.md#starten-und-auf-ein-bestimmtes-endevent-warten)
  * [Auflisten wartender UserTasks](processengine/ts/api/consumer_api/list-waiting-usertasks.md)
  * [Abschließen eines UserTasks](processengine/ts/api/consumer_api/finish-user-task.md)
  * [Ergebnis einer Prozesskorrelation abfragen](processengine/ts/api/consumer_api/get-correlation-result.md)
  * [Technischer Aufbau](processengine/ts/api/consumer_api/consumer-api-structure.md)
  * [Public API](processengine/ts/api/consumer_api/public_api.md)
    * [IConsumerApiService](processengine/ts/api/consumer_api/public_api.md#iconsumerapiservice)
    * [ConsumerContext](processengine/ts/api/consumer_api/public_api.md#consumercontext)
    * [ProcessModelList](processengine/ts/api/consumer_api/public_api.md#processmodellist)
    * [ProcessModel](processengine/ts/api/consumer_api/public_api.md#processmodel)
    * [Event](processengine/ts/api/consumer_api/public_api.md#event)
    * [StartCallbackType](processengine/ts/api/consumer_api/public_api.md#startcallbacktype)
    * [ProcessStartRequestPayload](processengine/ts/api/consumer_api/public_api.md#processstartrequestpayload)
    * [ProcessStartResponsePayload](processengine/ts/api/consumer_api/public_api.md#processstartresponsepayload)
    * [UserTasks](processengine/ts/api/consumer_api/public_api.md#usertasks)
    * [UserTaskList](processengine/ts/api/consumer_api/public_api.md#usertasklist)
    * [UserTask](processengine/ts/api/consumer_api/public_api.md#usertask)
    * [UserTaskConfig](processengine/ts/api/consumer_api/public_api.md#usertaskconfig)
    * [UserTaskResult](processengine/ts/api/consumer_api/public_api.md#usertaskresult)
  * [Glossar](processengine/ts/api/consumer_api/glossary.md)

1. [Management API](api/management-api.md)

## ProcessEngine

1. [TS](processengine/ts/README.md)

  1. [Setup](processengine/ts/setup/README.md)
    * [Konfiguration](processengine/ts/setup/konfiguration.md)

  1. [Konzepte](processengine/ts/konzepte/README.md)

    * [Konfiguration](processengine/ts/konzepte/configuration.md)

  1. [Architektur](processengine/ts/architektur/README.md)

    * [Dependency Injection](processengine/ts/architektur/dependendy-injection.md)
    * [Discovery](processengine/ts/architektur/discovery.md)
    * [Struktur](processengine/ts/architektur/structure.md)
    * [Adapter](processengine/ts/architektur/adapters.md)
    * [Bridges](processengine/ts/architektur/bridges.md)
    * [Contracts](processengine/ts/architektur/contracts.md)
    * [Extensions](processengine/ts/architektur/extensions.md)

  1. [APIs](processengine/ts/api/README.md)

    * Consumer API (TODO)

## Anlagen

1. [Glossar](GLOSSARY.md)
