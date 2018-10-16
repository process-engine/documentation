# Motivation und Hintergründe

## Think

## Design

## Inspect

## Zielpersonen

### Prozess-Ersteller

* entwirft die Prozesslandschaft
* designed und deployed die Prozessmodelle
* beobachtet die Ausführung

Die Prozess-Ersteller entwerfen die Prozesslandschaft.
Sie haben eine High-Level-Sicht auf die Prozesse.

Sie designen und deployen die Prozessmodelle.

Wenn die Prozesse dann in der ProcessEngine ablaufen, beobachten sie die
Ausführung.

### Prozess-Beteiligte

* Prozesse starten/beenden
* Benutzer Tasks bearbeiten
* Service Tasks bearbeiten

Genau zu diesem Zeitpunkt kommen auch die Prozess-Beteiligten ins Spiel.

Die kann z.B. die Fachanwendung sein, die den Prozess startet.

Oder ein Sachbearbeiter welcher Benutzer Aufgaben (genannt UserTasks im
BPMN-Standard) bearbeitet.

Vielleicht sogar ein Programm, welches externe Task bearbeitet oder Prozesse
mit Events benachrichtigt.

### Laufzeitumgebung

* Unterstützung für die Ausführung der ProcessEngine

Darunter fällt alles, was die ProcessEngine zur Ausführung benötigt.

Beispielsweise:

* Anbindung an die Datenbank oder
* Anschluss an einen MessageBus.
