# Dependency Injection

[Addict-IoC](../../../anhang/GLOSSARY.md#addict-ioc) wird als IoC-Container
verwendet.

Eine detaillierte Dokumentation kann auf dessen
[GitHub](https://github.com/5minds/addict-ioc) Seite gefunden werden.

Es wird die `constructorinjection` verwendet, um Abhängigkeiten in Instanzen zu
injizieren.

## Dependency Graph

![Dependency Graph](images/dependency-graph.png)

Wann immer eine Klasseninstanz benötigt wird, sorgt der 
[IoC-Container](../../../anhang/GLOSSARY.md#ioc) dafür,
dass deren Abhängigkeiten aufgelöst werden.

## IoC Modules

Der gesamte Stack ist in Module aufgeteilt.

Jedes Modul registriert seine Klassen selbst am
[IoC-Container](../../../anhang/GLOSSARY.md#ioc). Konventionell passiert das in
einer `ioc_module.js` im Stammordner des Moduls.

![IoC Modules](images/ioc-modules.png)

Die Dateien `ioc.services.js` und/oder `ioc.entity_types.js` enthalten nur eine
bestimmte Kategorie von Registrierungen.

Die `ioc_module.js` ist dafür verantwortlich, dass alles was das Modul
bereitstellt, am [IoC-Container](../../../anhang/GLOSSARY.md#ioc) registriert
wird.
