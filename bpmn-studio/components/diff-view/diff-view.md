# Diff-Ansicht

## Aufgaben und Motivation

Mit Hilfe der Diff View ist es dem Benutzer möglich, Änderungen nach dem letzten
Speicherstand zu erkennen.

Die Unterschiede an den Diagrammen werden als Graph und als Liste dargestellt.

In der grafischen Ansicht kann der Anwender zwischen Vorher gegen Nachher
(Before vs. After) oder Nachher gegen Vorher (After vs. Before) wählen. Die
Schaltflächen dazu finden sich mittig in der unteren Statusleiste.

In der Listenansicht werden die Änderungen mit Typ und ggf. Elementnamens
aufgezeigt. Dabei wird nach Änderungsart sortiert. Die Listenansicht ist über
die Schaltfläche mit den 3 horizontalen Balken mittig in der unteren
Statusleiste aktiviert.

## Aufbau und Strukturierung

Wenn die Diff View über den "Show Diff"-Button in der unteren rechten Ecke
des BPMN-Studios geöffnet wurde, werden das Vorher und das Nachher Diagramm
angezeigt, mit einem Hinweis auf die beiden Buttons zur Auswahl des Diff Modus.


![Diff View Startansicht](./images/Diff View-start.png)

Klickt man auf einen der beiden o.g. Buttons wird, in dem noch leeren
Abschnitt der Diff View, das entsprechende Diagram mit den markierten Änderungen
angezeigt.
Welche Farbe was bedeutet kann unten links in der Ecke in der Legende abgelesen
werden.

![Vorher zu Nachher](./images/Diff View-vorher.png)

![Nachher zu Vorher](./images/Diff View-nachher.png)

Zwischen den beiden Modus-Auswahl-Buttons befindet sich der Button zum Ein-/
Ausblenden der Listenansicht.

![Listenansicht](./images/Diff View-change-list.png)

Die Listenansicht zeigt alle Änderungen an. Diese sind nach der Art
 der Änderung in folgender Reihenfolge sortiert:

1. Entfernt
1. Geändert
1. Hinzugefügt
1. Layout geändert

Um das Element genau zu identifizieren werden die Art und der Name des
Elements angegeben.

## Funktion

Die Diff View zeigt die Änderungen zwischen dem zuletzt gespeicherten und dem
aktuellen Diagramm an.

Die Vorher gegen Nachher Ansicht zeigt die Änderungen anhand der Basis des
alten Diagramms an, also alle Elemente die gelöscht oder geändert wurden.
Die Nachher gegen Vorher Ansicht zeigt die Änderungen anhand der Basis des
neuen Diagramms an, also mit allen Elementen die hinzugefügt oder geändert
wurden.
