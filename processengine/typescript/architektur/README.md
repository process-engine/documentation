# Architektur

Die nachfolgenden Architekturmuster werden sowohl durch die ProcessEngine,
als auch durch die Consumer API implementiert.

## Dependency Injection

Eine wichtige Grundlage zum Verständnis der Architekturmuster, ist die [Dependency Injection](./dependency-injection.md).

Darauf aufbauend wird in mehreren Fällen ein [Discovery-Mechanismus](./discovery.md) verwendet.

Die erste Discovery, die der Anwendungsstack durchführt, findet alle [Extensions](./extensions.md).

## Pakete

Jedes Paket fällt in eine von vier Kategorien:

Paketname | Beschreibung
----------|-------------
 messagebus | das [isomorphe](../../../anhang/GLOSSARY.md#isomorphismus) Basismodul
 messagebus_contracts | die Schnittstellen, die das Basismodul darstellen
 messagebus_http | die [HTTP-Bridge](../../../anhang/GLOSSARY.md#bridge) für das Basismodul
 messagebus_adapter_faye | ein Adapter für das Basismodul

Eine ausführliche Beschreibung der einzelnen Paketarten, findet sich hier:
* [Contract](./contracts.md)
* [Bridge](./bridges.md)
* [Adapter](./adapters.md)
