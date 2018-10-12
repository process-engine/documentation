# Einrichten des ExternalTaskAPI Clients

Das `@process-engine/exernal_task_Api_client` Paket stellt neben
dem `ExternalTaskApiClientService` auch zwei Accessor Klassen bereit, mit welchen
der Client die Kommunikation mit einer ProcessEngine steuern kann:
- `ExternalTaskApiExternalAccessor`: Steuert die Kommunikation mit einer
  **externen** ProcessEngine
- `ExternalTaskApiInternalAccessor`: Steuert die Kommunikation mit einer
  **internen** ProcessEngine

Je nach Anwendungsszenario muss ein anderer Accessor verwendet werden.

Der `ExternalTaskApiClient` ist eine eigenständige und schlanke Komponente, die
auch ohne IoC mit wenig Aufwand zu konfigurieren ist.
Das ist besonders für Anwendungen interessant, die auf externe
ProcessEngines zugreifen und selbst kein IoC benutzen.

Wenn IoC verwendet wird, kann der Accessor leicht ausgetauscht werden, indem
einfach die Registrierung für den `ExternalTaskApiClient` entsprechend
überschrieben wird.

## Interne ProcessEngines

`ExternalTaskApiInternalAccessor` ist der Name der IoC Registrierung für den
Accessor, der die Kommunikation mit internen ProcessEngines steuert.

### Ohne IoC-Container

Die Instanziierung des `ExternalTaskApiClient` kann ohne Verwendung von IoC z.B.
wie folgt aussehen:

```js
const {
  ExternalTaskApiClientService,
  InternalAccessor,
} = require('@process-engine/exernal_task_Api_client').ExternalTaskApiClientService;

const internalAccessor = new InternalAccessor();
const ExternalTaskApiClientService =
  new ExternalTaskApiClientService(internalAccessor);
```

### Mit IoC-Container

Es muss folgende IoC Registrierung für den `ExternalTaskApiClientService`
erstellt werden:

```js
const {ExternalTaskApiClientService} =
  require('@process-engine/exernal_task_Api_client');

function registerInContainer(container) {

  container
    .register('ExternalTaskApiClientService', ExternalTaskApiClientService)
    .dependencies('ExternalTaskApiInternalAccessor');
}
```

`ExternalTaskApiInternalAccessor` ist der Name der IoC Registrierung für den
Accessor, der die Kommunikation mit integrierten ProcessEngines steuert.

## Externe ProcessEngines

### Ohne IoC-Container

Die Instanziierung des `ExternalTaskApiClient` kann ohne Verwendung von IoC z.B.
wie folgt aussehen:

```js
const {
  ExternalTaskApiClientService,
  ExternalAccessor,
} = require('@process-engine/exernal_task_Api_client').ExternalTaskApiClientService;

const {HttpClient} = require('@essential-projects/http');

const httpClient = new HttpClient();
httpClient.config = {
  url: 'http://address-to-process-engine',
}

const externalAccessor = new ExternalAccessor(httpClient);
const ExternalTaskApiClientService =
  new ExternalTaskApiClientService(externalAccessor);
```

### Mit IoC-Container

Es muss folgende IoC Registrierung für den `ExternalTaskApiClientService`
erstellt werden:

```js
const {
  ExternalTaskApiClientService,
  ExternalAccessor,
} = require('@process-engine/exernal_task_Api_client').ExternalTaskApiClientService;

function registerInContainer(container) {

  container.register('ExternalTaskApiExternalAccessor', ExternalAccessor)
    .dependencies('HttpClient');

  container.register('ExternalTaskApiClientService', ExternalTaskApiClientService)
    .dependencies('ExternalTaskApiExternalAccessor');
}
```

`ExternalTaskApiExternalAccessor` ist der Name der IoC Registrierung für den
Accessor, der die Kommunikation mit externen ProcessEngines steuert.

## Custom Accessors

Es ist auch möglich eigene Accessor Klassen zu verwenden.
Diese müssen das Interface `IExternalTaskApiAccessor` implementieren, damit
sichergestellt ist, dass der Accessor alle nötigen Funktionalitäten abdeckt.

### Ohne IoC-Container

Die Instanziierung des `ExternalTaskApiClient` kann ohne Verwendung von IoC z.B.
wie folgt aussehen:

```js
const ExternalTaskApiClientService = require('@process-engine/exernal_task_Api_client').ExternalTaskApiClientService;

const MyFancyAccessor = require('path-to-custom-accessor');

const fancyAccessor = new MyFancyAccessor();
const ExternalTaskApiClientService = new ExternalTaskApiClientService(fancyAccessor);
```

### Mit IoC-Container

Bei Verwendung von IoC muss sichergestellt sein, dass der Custom Accessor am
Container registriert wird.

Anschließend muss die IoC Registrierung des `ExternalTaskApiClientService`
wie oben beschrieben erfolgen. Als dependency gibt man dann den Namen des
eigenen Accessors an.

Beispiel:

```js
const {ExternalTaskApiClientService} =
  require('@process-engine/exernal_task_Api_client');

const myFancyAccessor = require('path-to-custom-accessor');

function registerInContainer(container) {

  container.register('FancyCustomAccessor', myFancyAccessor);

  container.register('ExternalTaskApiClientService', ExternalTaskApiClientService)
    .dependencies('FancyCustomAccessor');
}
```
