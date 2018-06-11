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

1. [Consumer API](api/consumer_api/README.md)

  * [Einrichtung mit integrierter ProcessEngine](api/consumer_api/setup_internal_process_engine.md)
  * [Einrichtung mit externer ProcessEngine](api/consumer_api/setup_external_process_engine.md)
  * [Abfragen startbarer Prozessmodelle](api/consumer_api/list-startable-process-models.md)
    * [Alle Prozessmodelle abfragen](api/consumer_api/list-startable-process-models.md#alle-prozessmodelle-abfragen)
    * [Einzelnes Prozessmodell abfragen](api/consumer_api/list-startable-process-models.md#einzelnes-prozessmodell-abfragen)
  * [Starten von Prozessinstanzen](api/consumer_api/start-process-instance.md)
    * [Starten und auf ein System Event warten](api/consumer_api/start-process-instance.md#starten-und-auf-ein-system-event-warten)
    * [Starten und auf ein bestimmtes EndEvent warten](api/consumer_api/start-process-instance.md#starten-und-auf-ein-bestimmtes-endevent-warten)
  * [Auflisten wartender UserTasks](api/consumer_api/list-waiting-usertasks.md)
  * [Abschließen eines UserTasks](api/consumer_api/finish-user-task.md)
  * [Ergebnis einer Prozesskorrelation abfragen](api/consumer_api/get-correlation-result.md)
  * [Technischer Aufbau](api/consumer_api/consumer-api-structure.md)
  * [Public API](api/consumer_api/public_api.md)
    * [IConsumerApiService](api/consumer_api/public_api.md#iconsumerapiservice)
    * [ConsumerContext](api/consumer_api/public_api.md#consumercontext)
    * [ProcessModelList](api/consumer_api/public_api.md#processmodellist)
    * [ProcessModel](api/consumer_api/public_api.md#processmodel)
    * [Event](api/consumer_api/public_api.md#event)
    * [StartCallbackType](api/consumer_api/public_api.md#startcallbacktype)
    * [ProcessStartRequestPayload](api/consumer_api/public_api.md#processstartrequestpayload)
    * [ProcessStartResponsePayload](api/consumer_api/public_api.md#processstartresponsepayload)
    * [UserTasks](api/consumer_api/public_api.md#usertasks)
    * [UserTaskList](api/consumer_api/public_api.md#usertasklist)
    * [UserTask](api/consumer_api/public_api.md#usertask)
    * [UserTaskConfig](api/consumer_api/public_api.md#usertaskconfig)
    * [UserTaskResult](api/consumer_api/public_api.md#usertaskresult)
  * [Glossar](api/consumer_api/glossary.md)

1. [Management API](api/management-api.md)

## ProcessEngine

1. [TS](processengine/ts/README.md)

  1. [Setup](processengine/ts/setup/README.md)
    * [Konfiguration](processengine/ts/setup/konfiguration.md)

  1. [Konzepte](processengine/ts/konzepte/README.md)

    * [Konfiguration](processengine/ts/konzepte/configuration.md)
    * [ !!!deprecated!!! Datenspeicher](processengine/ts/konzepte/datastore.md)
    * [ !!!deprecated!!! Entitäten-Service](processengine/ts/konzepte/entity-services.md)
    * [ !!!deprecated!!! Identitäts- und Zugriffsverwaltung](processengine/ts/konzepte/identity-access-management.md)

  1. [Architektur](processengine/ts/architektur/README.md)

    * [Dependency Injection](processengine/ts/architektur/dependendy-injection.md)
    * [Discovery](processengine/ts/architektur/discovery.md)
    * [Struktur](processengine/ts/architektur/structure.md)
    * [Adapter](processengine/ts/architektur/adapters.md)
    * [Bridges](processengine/ts/architektur/bridges.md)
    * [Contracts](processengine/ts/architektur/contracts.md)
    * [Extensions](processengine/ts/architektur/extensions.md)

  1. [APIs](processengine/ts/api/README.md)

    * [ !!!deprecated!!! Messagebus](processengine/ts/api/messagebus.md)

## Anlagen

1. [Glossar](GLOSSARY.md)
