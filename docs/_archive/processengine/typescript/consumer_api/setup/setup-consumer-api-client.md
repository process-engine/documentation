# Einrichten des Consumer API Clients

Das `@process-engine/consumer_api_client` Paket stellt neben
dem `ConsumerApiClientService` auch zwei Accessor Klassen bereit, mit welchen
der Client die Kommunikation mit einer ProcessEngine steuern kann:
- `ConsumerApiExternalAccessor`: Steuert die Kommunikation mit einer
  **externen** ProcessEngine
- `ConsumerApiInternalAccessor`: Steuert die Kommunikation mit einer
  **internen** ProcessEngine

Je nach Anwendungsszenario muss ein anderer Accessor verwendet werden.

Der `ConsumerApiClient` ist eine eigenständige und schlanke Komponente, die
auch ohne IoC mit wenig Aufwand zu konfigurieren ist.
Das ist besonders für Anwendungen interessant, die auf externe
ProcessEngines zugreifen und selbst kein IoC benutzen.

Wenn IoC verwendet wird, kann der Accessor leicht ausgetauscht werden, indem
einfach die Registrierung für den `ConsumerApiClient` entsprechend
überschrieben wird.

## Interne ProcessEngines

`ConsumerApiInternalAccessor` ist der Name der IoC Registrierung für den
Accessor, der die Kommunikation mit internen ProcessEngines steuert.

### Ohne IoC-Container

Die Instanziierung des `ConsumerApiClient` kann ohne Verwendung von IoC z.B.
wie folgt aussehen:

```js
const {
  ConsumerApiClientService,
  InternalAccessor,
} = require('@process-engine/consumer_api_client').ConsumerApiClientService;

const internalAccessor = new InternalAccessor();
const consumerApiClientService = new ConsumerApiClientService(internalAccessor);
```

### Mit IoC-Container

Es muss folgende IoC Registrierung für den `ConsumerApiClientService`
erstellt werden:

```js
const ConsumerApiClientService = require('@process-engine/consumer_api_client').ConsumerApiClientService;

function registerInContainer(container) {

  container.register('ConsumerApiClientService', ConsumerApiClientService)
    .dependencies('ConsumerApiInternalAccessor');
}
```

`ConsumerApiInternalAccessor` ist der Name der IoC Registrierung für den
Accessor, der die Kommunikation mit integrierten ProcessEngines steuert.

## Externe ProcessEngines

### Ohne IoC-Container

Die Instanziierung des `ConsumerApiClient` kann ohne Verwendung von IoC z.B.
wie folgt aussehen:

```js
const {
  ConsumerApiClientService,
  ExternalAccessor,
} = require('@process-engine/consumer_api_client').ConsumerApiClientService;

const HttpService = require('@essential-projects/services').HttpService;

const httpService = new HttpService();
httpService.config = {
  url: 'http://address-to-process-engine',
}

const externalAccessor = new ExternalAccessor(httpService);
const consumerApiClientService = new ConsumerApiClientService(externalAccessor);
```

### Mit IoC-Container

Es muss folgende IoC Registrierung für den `ConsumerApiClientService`
erstellt werden:

```js
const ConsumerApiClientService = require('@process-engine/consumer_api_client').ConsumerApiClientService;

function registerInContainer(container) {

  container.register('ConsumerApiClientService', ConsumerApiClientService)
    .dependencies('ConsumerApiExternalAccessor');
}
```

`ConsumerApiExternalAccessor` ist der Name der IoC Registrierung für den
Accessor, der die Kommunikation mit externen ProcessEngines steuert.

## Custom Accessors

Es ist auch möglich eigene Accessor Klassen zu verwenden.
Diese müssen das Interface `IConsumerApiAccessor` implementieren, damit
sichergestellt ist, dass der Accessor alle nötigen Funktionalitäten abdeckt.

### Ohne IoC-Container

Die Instanziierung des `ConsumerApiClient` kann ohne Verwendung von IoC z.B.
wie folgt aussehen:

```js
const ConsumerApiClientService = require('@process-engine/consumer_api_client').ConsumerApiClientService;

const MyFancyAccessor = require('path-to-custom-accessor');

const fancyAccessor = new MyFancyAccessor();
const consumerApiClientService = new ConsumerApiClientService(fancyAccessor);
```

### Mit IoC-Container

Bei Verwendung von IoC muss sichergestellt sein, dass der Custom Accessor am
Container registriert wird.

Anschließend muss die IoC Registrierung des `ConsumerApiClientService`
wie oben beschrieben erfolgen. Als dependency gibt man dann den Namen des
eigenen Accessors an.

Beispiel:

```js
const ConsumerApiClientService = require('@process-engine/consumer_api_client').ConsumerApiClientService;

const myFancyAccessor = require('path-to-custom-accessor');

function registerInContainer(container) {

  container.register('FancyCustomAccessor', myFancyAccessor);

  container.register('ConsumerApiClientService', ConsumerApiClientService)
    .dependencies('FancyCustomAccessor');
}
```
