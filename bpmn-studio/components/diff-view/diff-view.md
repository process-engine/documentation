# Diff-Ansicht

## Aufgaben und Motivation

Die Diff-View ermöglicht dem Anwender den Unterschied zwischen zwei Diagrammen
so einfach wie möglich zu erkennen.

Dazu stellt die Diff-View die Unterschiede der Diagramme sowohl grafisch als
auch tabellarisch da.
Die grafische Ansicht kann zwischen Vorher gegen Nachher und Nachher gegen Vorher
gewechselt werden, sodass sicher gestellt ist, dass die Änderungen immer
übersichtlich dargestellt werden können und Änderungen schnellstmöglich erkannt
werden können.
Die Listenansicht zeigt alle Änderungen zwischen
den beiden Diagrammen an. Diese sind dabei nach der Art der Änderung sortiert
und werden zusammen mit dem Typ und (falls vorhanden) dem Namen des betroffenen
Elements angegeben.

## Aufbau und Strukturierung

Wenn die Diff-View über den "Show Diff"-Button in der unteren rechten Ecke
des BPMN-Studios geöffnet wurde, werden das Vorher und das Nachher Diagramm
angezeigt, mit einem Hinweis auf die beiden Buttons zur Auswahl des Diff Modus.


![Diff View Start Ansicht](./images/diff-view-start.png)

Klickt man auf einen der beiden o.g. Buttons wird, in dem noch leeren
Abschnitt der DiffView, das entsprechende Diagram mit den markierten Änderungen
angezeigt.
Welche Farbe was bedeutet kann unten links in der Ecke in der Legende abgelesen
werden.

![Vorher zu Nachher](./images/diff-view-vorher.png)

![Nachher zu Vorher](./images/diff-view-nachher.png)

Zwischen den beiden Modus-Auswahl-Buttons befindet sich der Button zum Ein-/
Ausblenden der Listenansicht.

![Listenansicht](./images/diff-view-change-list.png)

Die Listenansicht zeigt alle Änderungen an. Diese sind nach der Art
der Änderung sortiert in der folgenden Reihenfolge:

1. Entfernt
1. Geändert
1. Hinzugefügt
1. Layout geändert

Um das Element genau zu identifizieren werden die Art und der Name des
Elements angegeben.

## Funktion

Die Diff-View zeigt die Änderungen zwischen dem zuletzt gespeicherten und dem
aktuellen Diagramm an.

Die Vorher gegen Nachher Ansicht zeigt die Änderungen anhand der Basis des
alten Diagramms an, also alle Elementen die gelöscht oder geändert wurden.
Die Nachher gegen Vorher Ansicht zeigt die Änderungen anhand der Basis des
neuen Diagramms an, also mit allen Elementen die hinzugefügt oder geändert
wurden.
