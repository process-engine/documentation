# Settings

## Aufgaben und Motivation

Die Settings dienen dazu die Konfiguration vom BPMN-Studio zu bearbeiten.

## Aufbau und Strukturierung

Die Einstellungen können immer über die Schaltfläche `Settings` unten rechts
in der Statusleiste geöffnet werden.

![Settings Aufruf](settings-open.png)

Die Ansicht besteht aus verschiedenen Kategorien, unter welchen einzelne
Konfigurationspunkte zu finden sind:

![Setting](settings.png)

**Einstellungen für die ProcessEngine:**

Hier kann der Endpunkt der ProcessEngine konfiguriert werden, die BPMN-Studio
verwenden soll. Bei dem Endpunkt handelt es sich um eine HTTP URL.

![Einstellungen für die ProcessEngine](settings-processengine.png)

Falls BPMN-Studio als Electron Anwendung ausgeführt wird, ist diese Einstellung
automatisch auf die interne ProcessEngine gesetzt. Falls die interne
ProcessEngine nicht verwendet wird, zeigt BPMN-Studio einen Hinweis an:

![Interne ProcessEngine wird vorgeschlagen](settings-processengine-use-internal.png)

**Einstellungen für OpenId Connect:**

In dieser Sektion kann die Autorität gesetzt werden. Diese wird für die Login
Funktionalität verwendet. Die Autorität muss eine HTTP URL enthalten.

![Einstellungen für OpenId Connect](settings-open-id.png)

## Funktion

In den Eingabefeldern können die Werte nach belieben verändert werden.

Übernommen werden die Einstellungen über den `Save` Button können die neuen
Einstellungen übernommen werden. Diese überschreiben die alte Konfiguration.

Um die Einstellungen ohne die Änderungen zu übernehmen, kann der `Cancel`
Button genutzt werden.
