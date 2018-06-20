# Beispiel für Standalone- Anwendung

Dieses Anwendungsbeispiel soll verdeutlichen, wie man die Consumer API in
einer Anwendung anwenden kann, welche eine ProcessEngine integriert hat.

## Aufbau

Es handelt sich dabei um eine einzelne in sich geschlossene Anwendung ("Standalone").

![Aufbau](../images/consumer_api_architecture_internal.png)

Die nachfolgende Anleitung basiert auf dem entsprechenden [Github Projekt](https://github.com/process-engine/consumer_api_meta/tree/feature/add_sample_projects/samples/01_internal_process_engine).

Nachfolgend wird nun die Funktion der einzelnen Komponenten erläutert.

### bpmn

Sammelordner für die BPMN Prozesse, die von der Anwendung verwendet werden.

### config

Enthält umgebungsspezifische Konfigurationen für die einzlenen Komponenten.
Der Großteil der Config entspricht der Standardkonfiguration der ProcessEngine.

### ioc_module

Enthält alle anwendungsspezifischen Registrierungen für den IoC Container.

```js
'use strict';

const fs = require('fs');
const path = require('path');

const ConsumerApiClientService = require('@process-engine/consumer_api_client').ConsumerApiClientService;

// This function will be called by the setup, when registering ioc modules at the container.
const registerInContainer = (container) => {

  // Creates a custom ioc registration for the ConsumerApiClientService.
  // It will be injected with an accessor for accessing an internal process engine application.
  container.register('ConsumerApiClientService', ConsumerApiClientService)
    .dependencies('ConsumerApiInternalAccessor');

  // Register the sample process at the ioc container.
  const processFilename = 'sample_process';
  const processFilePath = path.join(__dirname, 'bpmn', `${processFilename}.bpmn`);
  const processFile = fs.readFileSync(processFilePath, 'utf8');

  return container.registerObject(processFilename, processFile)
    .setTag('bpmn_process', 'internal')
    .setTag('module', 'process_engine_meta')
    .setTag('path', processFilePath);
};

module.exports.registerInContainer = registerInContainer;
```

Folgendes wird hier registriert:
- Die Konfiguration für den `ConsumerApiClientService` und dessen Dependencies
- Die im `bpmn` Ordner hinterlegten Prozesse.

### src

Enthält die eigentliche Anwendung.
Diese besteht aus 2 Komponenten:

#### setup

#### program
