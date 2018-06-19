## Technischer Aufbau

![Aufbau](./images/consumer_api_architecture.png)

Wie im Diagramm zu erkennen, unterscheidet man zwischen zwei Anwendungsfällen:

### Anwendung mit _integrierter_ ProcessEngine

Hier befindet sich die ProcessEngine direkt in der Anwendung.
Die externen Services der implementierenden Anwendung greifen auf den
`ConsumerApiClientService` zu.
Dieser wiederum kommuniziert über den `ConsumerApiCore` mit der ProcessEngine.

### Anwendung mit _externer_ ProcessEngine

Auch hier benutzen die externen Anwendungen den `ConsumerApiClient`.

In diesem Anwendungsfall benutzt der `ConsumerApiClient` jedoch Http Routen
und Messagebuskanäle um mit einer externen ProcessEngine zu kommunizieren.

Die Anwendung, in welcher die externe ProcessEngine liegt, implementiert dazu
das `ConsumerApiHttp` Paket, welches einen Router und einen Controller für das
Http Handling bereit stellt.

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

### ConsumerApiClient

Der `ConsumerApiClient` ist die Primäre Schnittstelle für externe
Anwendungsservices um mit der ConsumerAPI zu kommunizieren.

Dieser Client kann sowohl mit einer in der Anwendung integrierten ProcessEngine
kommunizieren, als auch mit ProcessEngines, die in einer remote Anwendung
liegen.

Jede Anwendung, die mit einer ProcessEngine kommunizieren soll, egal um was für
eine ProcessEngine es sich handelt, muss diesen Client dafür benutzen.

Das gewährleistet die einfache Austauschbarkeit, die eines der wichtigsten
Features der ConsumerAPI darstellt.

Dadurch, dass die implementierende Anwendung nur den ConsumerApiClient
verwendet, wird sie von einem Austausch nichts mitbekommen.

### ConsumerApiCore

Das `ConsumerApiCore` Paket dient der direkten Kommunikation mit der
ProcessEngine.

In einer Anwendung mit integrierter ProcessEngine wird dieses Paket durch den
`ConsumerApiClient` direkt angesteuert.

Wenn eine externe ProcessEngine angesteuert werden soll, wird dieses Paket
in die Anwendung implementiert, in welcher sich die ProcessEngine befindet.

### ConsumerApiHttp

Wird eine externe ProcessEngine verwendet, dient das Paket `ConsumerApiHttp`
als Schnittstelle für den `ConsumerApiClient` um mit dem
`ConsumerApiCore` zu kommunizieren.

Das Paket muss sich stehts in der gleichen Anwendung wie `ConsumerApiCore` befinden.

### REST/Messagebus-Schnittstelle

Wird eine externe ProcessEngine verwendet, kommunizieren `ConsumerApiClient`
und `ConsumerApiCore` über eine REST- und eine Messagebus-Schnittstelle.

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
