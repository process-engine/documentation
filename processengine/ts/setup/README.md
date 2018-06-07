# Setup

Um die Process Engine in einer einfachen Standardkonfiguration zu installieren, steht ein [Skeleton-Projekt](https://github.com/process-engine/skeleton) zur Verfügung, das mehrere vorkonfigurierte Setups enthält.

## Zum Testen

Die Process Engine kann am besten zusammen mit dem BPMN-Studio getestet werden.

Mit dem BPMN-Studio lassen sich bequem BPMN-Diagramme erstellen oder bearbeiten und vorhandene BPMN-Diagramme als Prozesse starten.

Sämtliche Funktionen des Process Engine Server, die sich über das BPMN-Studio bedienen lassen, können auch manuell über die HTTP-Schnittstelle genutzt werden.

Es gibt zwei Möglichkeiten das BPMN-Studio mit integrierter Process Engine zu beziehen:
* als [Standalone Software](https://github.com/process-engine/bpmn-studio/releases)
* in einem [Docker Container](https://github.com/process-engine/skeleton/tree/develop/full-docker-image).

## Für Entwickler {#entwickler}

Das [Startprojekt für Entwickler](https://github.com/process-engine/skeleton/tree/develop/process-engine-server) bietet die Möglichkeit einen vorkonfigurierten Process Engine Server zu installieren.

Dieses Projekt kann gleichzeitig als Ausgangsbasis genutzt werden, um ein Projekt auf Basis der Process Engine zu entwickeln.
