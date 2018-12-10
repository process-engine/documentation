# Chatbot - Anleitung für Programmierer

Es liegt im Aufgabenbereich des Softwareentwicklers, die benötigten
Dienste für das Diagramm bereitzustellen.

Prozessmodellierer können ExternalTasks in die Diagramme einbauen um
auf Dienste der Softwareentwickler zuzugreifen. Doch damit dies
möglichst ist, müssen zunächst diese Dienste bereitgestellt werden.

In diesem Beispiel wird ein minimaler Task definiert und registriert.

Von Seiten der Prozessmodellierung kommen folgende Anforderungen:

- der Task soll unter dem Topic `Chatbot` verfügbar sein,
- als Payload erhält der Task die menschliche Nutzereingabe
- auf diese Eingabe reagiert der Chatbot,
- der Chatbot soll eine Antwort generieren und zurückgeben.

Das vorgestellte Programm steht
[hier](https://github.com/process-engine/example_processes/tree/develop/solutions/Chatbot)
startbereit zur Verfügung.

## Voraussetzung

Um das Projekt ausführen zu können, muss die
JavaScript-Lauftzeitumgebung `nodejs` installiert sein.

## Projekt aufsetzen

Zunächst muss ein Projekt erstellt werden mit dem Befehl: `npm init`.

Auf dem Projektpfad müssen die benötigten Programmbibliotheken
installiert werden:

```
npm i --save elizabot @essential-projects/http @process-engine/external_task_api_client @process-engine/external_task_api_contracts
```

Es muss eine JavaScript-Datei erstellt werden, etwa mit dem Namen `chatbot.js`.

## Programmcode

Im Folgenden wird der Programmcode vorgestellt.

### Import-Anweisungen

Zunächst werden die zuvor installierten Bibliotheken importiert.

```js
const Chatbot = require('elizabot');
const {HttpClient} = require('@essential-projects/http');
const {
  ExternalTaskApiClientService,
  ExternalTaskApiExternalAccessor,
  ExternalTaskWorker,
} = require('@process-engine/external_task_api_client');
const {
  ExternalTaskFinished,
} = require('@process-engine/external_task_api_contracts');
```

Die eigentliche Funktionalität des Chatbots programmieren wir nicht
selber und verwenden stattdessen
[elizabot](https://github.com/tkafka/node-elizabot).

Die anderen Bibliotheken dienen dem Registrieren des ExternalTasks.

### Erstellung des HttpClients

Der HttpClient wird benutzt um die technische Schicht der
Kommunikation zu gewährleisten.

```js
const httpClient = new HttpClient();
httpClient.config = {
  url: 'http://localhost:8000',
}
```

Wir erstellen eine Instanz des HttpClient und konfigurieren die
Adresse, unter welcher die ProcessEngine erreichbar ist. Wenn auf
demselben Rechner das BPMN-Studio gestartet wird, steht die
ProcessEngine unter `http://localhost:8000` zur Verfügung.

### ExternalAccessor / ExternalTaskAPIService / ExternalTaskWorker

```js
const externalAccessor = new ExternalTaskApiExternalAccessor(httpClient);
const externalTaskAPIService = new ExternalTaskApiClientService(externalAccessor);
const externalTaskWorker = new ExternalTaskWorker(externalTaskAPIService);
```

Wir erstellen einen externen Accessor, welcher den zuvor erstellten
HttpClient als Parameter injected bekommt. Dieser externe Accessor
wird von einem ExternalTaskApiClient benutzt um auf die ProcessEngine
zuzugreifen.

Zuletzt erstellen wir eine neue Instanz des ExternalTaskWorkers,
welcher die zuvor erstellte Instanz des ExternalTaskApiClients benutzt
um regelmäßig nach verfügbaren ExternalTasks zu schauen.

### Einstellungen

Um den Worker mit der ProcessEngine zu verbinden, benötigen wir einige
zusätzliche Einstellungen.

```js
const identity = {
  token: 'ZHVtbXlfdG9rZW4=',
};
const topicName = 'Chatbot';
const maxNumberOfTasksToGet = 10;
const longPollingTimeoutInMs = 10000;
```

### Implementierung des Tasks

Zuletzt muss der Task implementiert und beim Worker registriert werden.

```js
async function main() {

  const chatbot = new Chatbot();
  const chatbotResponse = async (externalTask) => {

    const humanRequest = externalTask.payload;

    const chatbotAnswer = chatbot.transform(humanRequest);
    return new ExternalTaskFinished(externalTask.id, chatbotAnswer);
  };

  externalTaskWorker.waitForAndHandle(
    identity,
    topicName,
    maxNumberOfTasksToGet,
    longPollingTimeoutInMs,
    chatbotResponse);
}

main();
```

Die Implementierung des Tasks liegt hierbei in der asynchronen Callback-Funktion:

```js
const chatbotResponse = async (externalTask) => {

  const humanRequest = externalTask.payload;

  const chatbotAnswer = chatbot.transform(humanRequest);
  return new ExternalTaskFinished(externalTask.id, chatbotAnswer);
};
```

Laut Prozessmodellierung steht in `externalTask.payload` die Eingabe
des Nutzers.

`chatbot.transform(humanRequest)` generiert die Antwort des Chatbots.

`return new ExternalTaskFinished(externalTask.id, chatbotAnswer);`
gibt den Wert zurück. Er steht in der Prozessmodellierung als
Payload des ExternalTasks zur Verfügung.

## Ausführung

Nun kann das Programm ausgeführt werden mit dem Befehl `node
chatbot.js`. Hierdurch wird lediglich der ExternalTask in dem
Diagramm ausführbar.

Der eigentliche Prozess wird anhand des Diagramms im BPMN-Studio
ausgeführt.
