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

![Aufbau](./images/consumer_api_architecture.png)

Wie im Diagramm zu erkennen, unterscheidet man zwischen zwei Anwendungsfällen:

### Anwendung mit _integrierter_ ProcessEngine

In diesem Fall greifen externe Anwendungsservices auf den **ConsumerApiCore**
zu, der dann wiederum mit den Services der ProcessEngine kommuniziert.

### Anwendung mit _externer_ ProcessEngine

Hier kommt zusätzlich ein `ConsumerClient` mit ins Spiel.
Dieser kommuniziert über HTTP-Routen und Messagebus-Kanälen mit der ConsumerAPI
der externen ProcessEngine.

## Komponenten

Nachfolgend werden nun die einzelnen Komponenten der ConsumerAPI
im Detail erklärt.

### ConsumerApiContracts

Dieses Paket definiert die gemeinsam genutzten Schnittstellen.
Neben einem `IConsumerApiService` Interface, welches die gemeinsam genutzten
Funktionen definiert, sind hier auch die Messagebuspfade und REST-Routen
definiert, über welche die ConsumerAPI Pakete miteinander kommunizieren.

Sowohl `ConsumerApiClient` als auch `ConsumerApiCore` leiten
ihre Schnittstellen aus dem `IConsumerApiService` Interface ab, wodurch
sichergestellt ist, dass sich beide Komponenten auf die exakt gleiche Art
verwenden lassen.

Dieser Aufbau gewährleistet auch die geforderte Austauschbarkeit, da es durch
diese Architektur mit nur wenig Aufwand möglich ist eine interne ProcessEngine
gegen eine ausgelagerte zu tauschen, oder umgekehrt.
Dadurch, dass implementierende Anwendung die ConsumerAPI verwendet, wird sie
von dem Austausch nichts mitbekommen.

### ConsumerApiCore

Das `ConsumerApiCore` Paket dient der direkten Kommunikation mit der
ProcessEngine.

In einer Anwendung mit integrierter ProcessEngine wird dieses Paket direkt
verwendet.

Wenn eine externe ProcessEngine angesteuert werden soll, wird dieses Paket
in die Anwendung implementiert, in welcher sich die ProcessEngine befindet.

### ConsumerApiClient

Der `ConsumerApiClient` dient der Kommunikation mit der ConsumerAPI
einer **externen** ProcessEngine.

### ConsumerApiHttp

Wird eine externe ProcessEngine verwendet, dient das Paket `ConsumerApiHttp`
als Schnittstelle für den `ConsumerApiClient` um mit dem
`ConsumerApiCore` zu kommunizieren.

Das Paket muss sich stehts in der gleichen Anwendung wie `ConsumerApiCore` befinden.

### REST/Messagebus-Schnittstelle

`ConsumerApiClient` und `ConsumerApiCore` kommunizieren über eine REST- und eine
Messagebus-Schnittstelle.

Die REST-Schnittstelle wird durch `ConsumerApiHttp` bereitgestellt,
der Messagebus wird durch die ProcessEngine selbst verwaltet.

Diese Schittstellen dienen keinem anderen Zweck und sollten niemals über
eine andere Komponente als dem `ConsumerApiClient` verwendet werden.

#### HTTP-Routen

Alle Routen besitzen ein Präfix, das sich nach der aktuellen
API-Version richtet.
Bei einer API-Version 1 würde dies folgendermaßen aussehen:

```REST
/api/consumer/v1
```

So ergibt sich z.B. folgende URL für das Abfragen wartender UserTasks in einer Correlation:

```REST
GET /api/consumer/v1/correlations/:correlation_id/user_tasks
```

Eine Erklärung zur Routenbenennung kann [hier](./dealing_with_events.md#auslösen-eines-prozessinstanz-events) eingesehen werden.
