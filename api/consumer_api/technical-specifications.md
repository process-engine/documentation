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
das `ConsumerApiHttp` Paket, welches die passenden Http Endpunkte
bereitstellt.

## Komponenten

Nachfolgend werden nun die einzelnen Komponenten der ConsumerAPI
im Detail erklärt.

### ConsumerApiContracts

Dieses Paket definiert die gemeinsam genutzten Schnittstellen.
Neben einem `IConsumerApi` Interface, welches die gemeinsam genutzten
Funktionen definiert, sind hier auch die Messagebuspfade und REST-Routen
definiert, über welche die ConsumerAPI Pakete miteinander kommunizieren.

Sowohl `ConsumerApiClient` als auch `ConsumerApiCore` leiten
ihre Schnittstellen aus dem `IConsumerApi` Interface ab, wodurch
sichergestellt ist, dass sich beide Komponenten auf die exakt gleiche Art
verwenden lassen.

Dieser Aufbau gewährleistet auch eine einfache Austauschbarkeit, da es durch
diese Architektur mit nur wenig Aufwand möglich ist eine interne ProcessEngine
gegen eine ausgelagerte zu tauschen, oder umgekehrt.

### ConsumerApiClient

Der `ConsumerApiClient` ist für externe Anwendungen die primäre Komponente zur
Verwendung der ConsumerAPI.

Dieser Client kann sowohl mit einer in der Anwendung integrierten, als auch mit
externen ProcessEngines kommunizieren.

Um die einfache Austauschbarkeit der ProcessEngine zu gewährleisten, sollte
jedwede Kommunikation mit der ProcessEngine über die ConsumerAPI abgewickelt
werden.

### ConsumerApiCore

Das `ConsumerApiCore` Paket dient der direkten Kommunikation mit der
ProcessEngine.

In einer Anwendung mit integrierter ProcessEngine wird dieses Paket durch den
`ConsumerApiClient` direkt angesteuert.

Wenn eine externe ProcessEngine angesteuert werden soll, wird dieses Paket
in die Anwendung implementiert, in welcher sich diese befindet.

### ConsumerApiHttp

Wird eine externe ProcessEngine verwendet, dient das Paket `ConsumerApiHttp`
als Schnittstelle für den `ConsumerApiClient` um mit dem
`ConsumerApiCore` zu kommunizieren.

Das Paket muss sich stets in der gleichen Anwendung wie `ConsumerApiCore` befinden.

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
