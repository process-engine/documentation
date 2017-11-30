# Dependency Injection

Es wird addict-ioc als IoC Container genutzt.

Eine detaillierte Dokumentation kann auf dessen
[GitHub](https://github.com/5minds/addict-ioc) Seite gefunden werden.

Es wird die Konstruktorinjektion verwendet, um Abhängigkeiten in Instanzen zu injizieren.

## Dependency Graph

![Dependency Graph](images/dependency-graph.png)

Wann immer eine Klasseninstanz benötigt wird, wird der IoC-Container dafür
sorgen, dass er seine Abhängigkeiten instanziiert.

Wenn man nicht an die Umkehrung des Kontrollmusters gewohnt ist, wird dies
möglicherweise als Overhead gesehen, aber es ist das genaue Gegenteil.

Nur an Orten, an denen man mit sehr dynamischen Abhängigkeiten zu tun hat,
werden alle Klassen instanziiert.

Das führt zu sauberem, einfach zu pflegenden Code und ermöglicht es, zusätzliche
Funktionen, basierend auf dem Dependency Graph, zu verwenden.

## IoC Modules

Der gesamte Stack ist in Module aufgeteilt.

Um eine klare Trennung der Module zu erreichen wird jede Modulregistrierung
innerhalb eines eigenen Moduls auf den IoC-Container oragnisiert.

Konventionell wird dieses Modul im Stammordner als `ioc_module.js` gefunden.

![IoC Modules](images/ioc-modules.png)

Wenn das Modul (`ioc_module.js`) am IoC-Container registriert ist, wird
erwartet, dass es alles registriert, was das Modul bereitstellt.

In Fällen, in denen bestimmte Modulklasse mit eigenen Klasse überschrieben
werden müssen, kann genau bestimmt werden welche Registrierung des Modules
geladen wird.

Die Dateien `ioc.services.js` und/oder `ioc.entity_types.js` enthalten nur eine
bestimmte Kategorie von Registrierungen.

Die `ioc_module.js` ist dafür verantwortlich, alle IoC-Teile zu laden.
