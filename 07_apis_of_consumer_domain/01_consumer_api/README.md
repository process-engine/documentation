# Schnittstelle: ConsumerAPI

Die ConsumerAPI dient zur Ausführung von Prozessmodellen und steuert die daraus
resultierende Interaktion mit der ProcessEngine.

Sie ermöglicht es einem Consumer mit einer ProcessEngine zu kommunizieren,
unabhängig davon, wo diese sich befindet.
Es kann sich um eine ProcessEngine handeln, die remote auf einem Server liegt,
oder um eine ProcessEngine, die direkt in die Anwendung integriert ist.

Dadurch wird eine lose Kopplung zwischen ProcessEngine und Consumer erreicht,
was eine leichte Austauschbarkeit garantiert.

Die fachliche Stabilität ist eine der wichtigsten Anforderungen
an die ConsumerAPI.

Das hier vorgestellte Konzept gilt für **sämtliche** technischen Implementierungen,
egal ob TypeScript, .NET, oder anderen Implementierungen, die in Zukunft einmal
folgen könnten.

## Aufgaben der ConsumerAPI

Über die ConsumerAPI müssen folgende Aufgaben erledigt werden können:

* [Auflisten startbarer Prozessmodelle](./tasks/list-startable-process-models.md)
  * [Alle Prozessmodelle abfragen](./tasks/list-startable-process-models.md#alle-prozessmodelle-abfragen)
  * [Einzelnes Prozessmodell abfragen](./tasks/list-startable-process-models.md#einzelnes-prozessmodell-abfragen)
* [Starten von Prozessinstanzen](./tasks/start-process-instance.md)
* [Abfragen von BPMN-Ereignissen auf die der Prozess wartet](./tasks/list-triggerable-events.md)
* [Auslösen von Ereignissen](./tasks/trigger-event.md)
* [Auflisten wartender UserTasks](./tasks/list-waiting-usertasks.md)
* [Abschließen eines UserTasks](./tasks/finish-user-task.md)
* [Ergebnis einer Prozesskorrelation abfragen](./tasks/get-correlation-result.md)
* [Erhalten von Prozessbenachrichtigungen](./tasks/receive-process-notifiations.md)
  * [Arten von Prozessbenachrichtigungen](./tasks/receive-process-notifiations.md#arten-von-prozessbenachrichtigungen)
  * [Erhalten von BpmnEvents](./tasks/receive-process-notifiations.md#erhalten-von-bpmn-events)
  * [Erhalten von Infos zu start und ende von Aktivitäten](./tasks/receive-process-notifiations.md#erhalten-von-infos-zu-start-und-ende-von-aktivitäten)
  * [Erhalten von SystemEvents](./tasks/receive-process-notifiations.md#erhalten-von-system-events)
  * [Erhalten von BPMN-Signalen](./tasks/receive-process-notifiations.md#erhalten-von-bpmn-signalen)

## Technischer Aufbau

Eine detaillierte Beschreibung des technischen Aufbaus findet sich [hier](./technical-specifications.md).
