# Einleitung

## Was ist ProcessEngine.io?

Das Ziel von ProcessEngine.io ist die Gestaltung von Software-Projekten mit BPMN voranzubringen.

Wir glauben daran, dass die Prozessmodellierung die Kommunikation in der Softwareentwicklung entscheidend verbessern kann.

ProcessEngine.io ist keine einzelne Software. Es ist ein Dach, unter dem wir Werkzeuge bereitstellen, die:
* bei der Modellierung von Geschäftsprozessen bestmöglich unterstützen
* Geschäftsprozesse ausführen können
* die Ausführung von Prozessen messen und bei der Optimierung der Prozesse helfen

## Was gibt es?

### BPMN-Studio {#bpmn-studio}

<img src="./images/bpmn-studio-icon.png" width="256" height="256" />

Das BPMN-Studio ist die integrierte Entwicklungsumgebung für Geschäftsprozesse.

Mit dieser Software lassen sich:

* Geschäftsprozesse modellieren
* Prozesse für die Ausführung deployen
* Prozesse analysieren und optimieren

#### Weiterführende Links

* [Installationsanleitung](./getting-started/installation.md)
* [Beschreibung der Ansichten](./bpmn-studio/beschreibung-ansichten.md)
* [Hands-On Verwendungsbeispiele](./bpmn-studio/hands-on/README.md)

### ProcessEngine {#process-engine}

<img src="./images/process-engine-icon.png" width="256" height="256" />

Unter einer ProcessEngine ist eine Software zu verstehen, die Geschäftsprozesse ausführen kann.

Es gibt mehrere Implementierungen der ProcessEngine, die sich für unterschiedliche Einsatzszenarien eignen.

Alle Implementierungen der ProcessEngine unterstützen zentrale APIs (siehe [ProcessEngine APIs](#apis)). Dadurch kann die Implementierung der ProcessEngine ausgetauscht werden - ohne, dass sich die Bedienung der ProcessEngine ändert.

#### Weiterführende Links

* [TypeScript-Implementierung](./getting-started/installation.md)
* .NET-Implementierung

### ProcessEngine APIs {#apis}

Die Kommunikation mit der ProcessEngine erfolgt über zentrale APIs, die in allen Implementierungen zur Verfügung stehen.

Alle Implementierungen der ProcessEngine unterstützen diese APIs. Dadurch kann die Implementierung der ProcessEngine ausgetauscht werden - ohne, dass sich die Bedienung der ProcessEngine ändert.

#### Weiterführende Links

* [ConsumerAPI](./api/consumer_api/README.md)
* [TypeScript-Implementierung der ConsumerAPI](./processengine/typescript/api/consumer_api/README.md)
* [ManagementAPI](./api/management-api.md)