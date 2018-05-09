# Schnittstelle: ConsumerAPI

Die ConsumerAPI dient zur Ausführung von Prozessmodellen und steuert die daraus
resultierende Interaktion mit der ProcessEngine.

## Glossar

Eine Sammlung der wichtigsten ConsumerAPI Begriffe findet sich [hier](./consumer_api/glossary.md).

## Vorraussetzungen

Um die Consumer API zu benutzen, muss eine Process Engine installiert sein.
Dabei kann es sich um eine lokal, direkt in der Anwendung integrierten
Process Engine handeln, oder um eine externe, die z.B. auf einem Server läuft.

Wichtig ist, dass diese das `@process-engine/process-engine` Paket in der
Version `2.2.0` oder höher benutzt.

Bei einer externen Process Engine muss ebenfalls sichergestellt sein, dass
diese das `ConsumerApiHttp` Paket mit eingebunden hat.

## Anwendung

Es gibt zwei Anwendungsmöglichkeiten für die Consumer API:

1. Mit *integrierter* Process Engine:
Benutzt eine Anwendung eine integrierte Process Engine,
kann diese über das `ConsumerApiCore` Paket direkt angesteuert werden.

2. Mit *externer* Process Engine:
Wenn eine externe Process Engine angesteuert werden soll (z.B. auf einem
zentralen Server), dann muss dazu das `ConsumerApiClient` bentutzt werden.
Das funktioniert natürlich nur dann, wenn die verwendete Version der
externen Process Engine ebenfalls die Consumer API implementiert.

In Funktionen und Anwendung sind die beiden Module identisch, da sie die
gleichen Interfaces benutzen.

Eine detaillierte Beschreibung des Aufbaus der Consumer API findet sich [hier](./consumer_api/consumer-api-structure.md).

## Aufgaben der ConsumerAPI

Die Consumer API erfüllt die folgenden Aufgaben:

* [Auflisten startbarer Prozessmodelle](./consumer_api/list-startable-process-models.md) **(Done)**
  * [Alle Prozessmodelle abfragen](./consumer_api/list-startable-process-models.md#alle-prozessmodelle-abfragen) **(Done)**
  * [Einzelnes Prozessmodell abfragen](./consumer_api/list-startable-process-models.md#einzelnes-prozessmodell-abfragen) **(Done)**
* [Starten eines Prozessmodells](./consumer_api/start-process-instance.md) **(Done)**
  * [Starten und auf ein `System Event` warten](./consumer_api/start-process-instance.md#starten-und-auf-ein-system-event-warten) **(Done)**
  * [Starten und auf ein bestimmtes EndEvent warten](./consumer_api/start-process-instance.md#starten-und-auf-ein-bestimmtes-endevent-warten) **(Done)**
* [Abfragen von BPMN-Ereignissen auf die der Prozess wartet](./consumer_api/list-executable-process-instance-events.md)
* [Auslösen von Ereignissen](./consumer_api/execute-process-instance-event.md)
* [Auflisten wartender UserTasks](./consumer_api/list-waiting-usertasks.md) **(Done)**
* [Abschließen eines UserTasks](./consumer_api/finish-user-task.md) **(Done)**
* [Erhalten von Prozessbenachrichtigungen](./consumer_api/receive-process-notifications.md)
  * [Arten von Prozessbenachrichtigungen](./consumer_api/receive-process-notifications.md#arten-von-prozessbenachrichtigungen)
  * [Erhalten von BPMN-Events](./consumer_api/receive-process-notifications.md#erhalten-von-bpmn-events)
  * [Erhalten von Infos zu start und ende von Aktivitäten](./consumer_api/receive-process-notifications.md#erhalten-von-infos-zu-start-und-ende-von-aktivitäten)
  * [Erhalten von System-Events](./consumer_api/receive-process-notifications.md#erhalten-von-system-events)
  * [Erhalten von BPMN-Signalen](./consumer_api/receive-process-notifications.md#erhalten-von-bpmn-signalen)
