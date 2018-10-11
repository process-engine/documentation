# Schnittstelle: ExternalTaskAPI

Das hier vorgestellte Konzept basiert auf dem [External Task Pattern](https://docs.camunda.org/manual/latest/user-guide/process-engine/external-tasks/)
von Camunda.

## Grundlegendes

Ein externer Task (nachfolgend ExternalTask genannt) beschreibt eine
FlowNodeInstance - i.d.R. einen ServiceTask - dessen Verarbeitung außerhalb
der ProcessEngine stattfinden soll.

Es gibt keine festen Vorgaben darüber, welche Art von Tasks an einen externen
Worker ausgelagert werden können, oder wie dieser Worker den Task zu
verarbeiten hat.

Im Normalfall sollte es sich dabei aber um Aufgaben handeln, für welche die
ProcessEngine besondere Kenntnisse über BusinessLogic, oder technische
Implementierungen haben müsste, die über den Standard Anwendungsfall
(invoken einer Service methode) hinaus gehen.

Ein Beispiel dafür wäre das Absetzen von HTTP Calls.
Hier müsste der Handler der ProcessEngine wissen, wie man diese Calls ausführt
und wie eine entsprechende Response zu verarbeiten wäre.

Um derartige Szenarien zu vermeiden, wird diese Aufgabe in einen ExternalTask
ausgelagert und an einen externen Worker delegiert.

Die ExternalTaskAPI dient hierbei als Schnittstelle für diese Worker.
Hierüber haben Sie die Möglichkeit ExternalTasks für sich zu reservieren,
zu verarbeiten und abzuschließen.

**WICHTIG**:
Die API dient **nicht** der *Erstellung* von ExternalTasks!
Dies wird durch die ProcessEngine selbst während der Ausführung von
Prozessmodellen erledigt.
Die ExternalTaskAPI steuert lediglich die *Verarbeitung* dieser Tasks.

Dieses Konzept gilt als Leitfaden für **sämtliche** technischen Implementierungen.

## Aufgaben der ExternalTaskAPI

Über die ExternalTaskAPI müssen folgende Aufgaben erledigt werden können:

* [ExternalTasks abrufen und sperren](./tasks/fetch-and-lock.md)
* [Sperrzeiten verlängern](./tasks/extend-lock.md)
* [Abschließen von ExernalTasks](./tasks/finish-external-task.md)
* [Behandeln von BPMN Fehlern](./tasks/handle-bpmn-errors.md)
* [Behandeln von Systemfehlern](./tasks/handle-system-errors.md)

## Technischer Aufbau

Eine detaillierte Beschreibung des technischen Aufbaus findet sich [hier](./technical-specifications.md).
