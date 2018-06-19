# Einrichten des Consumer API Clients

Das `@process-engine/consumer_api_client` Paket stellt neben
dem `ConsumerApiClientService` auch zwei Accessor Klassen bereit, mit welchen
der Client die Kommunikation mit einer ProcessEngine steuern kann:
- `ConsumerApiExternalAccessor`: Steuert die Kommunikation mit einer
  **externen** ProcessEngine. Dies ist der Default Accessor
- `ConsumerApiInternalAccessor`: Steuert die Kommunikation mit einer
  **internen** ProcessEngine

Je nach Anwendungsszenario muss ein anderer Accessor verwendet werden.

Die Verwendung von IoC erlaubt es auf leichte Weise den Accessor auszutauschen,
da dieser dem `ConsumerApiClientService` als Dependency injected wird.

## Externe ProcessEngines

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

Das `ioc_module` des `@process-engine/consumer_api_client` Pakets bringt eine
solche Registrierung bereits mit sich.

Wird eine externe ProcessEngine verwendet, ist dieser Schritt also nur
notwendig, wenn eigene Accessor Implementierungen verwendet werden sollen.

## Interne ProcessEngines

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
Accessor, der die Kommunikation mit internen ProcessEngines steuert.

## Custom Accessors

Es ist auch möglich eigene Accessor Klassen zu verwenden.
Diese müssen das Interface `IConsumerApiAccessor` implementieren, damit
sichergestellt ist, dass der Accessor alle nötigen Funktionalitäten abdeckt.

Ebenfalls muss dieser Accessor am IoC registriert werden.

Anschließend muss die IoC Registrierung des `ConsumerApiClientService`
wie oben beschrieben erfolgen. Statt `ConsumerApiInternalAccessor` gibt man
dann den Namen des eigenen Accessors an.

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
