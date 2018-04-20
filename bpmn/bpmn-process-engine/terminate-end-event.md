# Terminate End Event

## Definition

`TerminateEndEvents` sind eine besondere Art von `EndEvent`, die benutzt werden
um ein **irreguläres** Prozessende zu signalisieren.

## Anwendungsfall

Das `TerminateEndEvent` wird für die Modellierung von Fehlern verwendet, die so
gravierend sind, dass sie das sofortige Ende des **gesamten** Prozesses
zur Folge haben.

Der Ausführungsstatus anderer laufender Activities ist dabei irrelevant.
Ein `TerminateEndEvent` terminiert stehts **alle** laufenden Activities und
letztendlich den gesamten Prozess.

Beispiel:

 ![Sample](./images/terminate_end_event_sample.png)

In diesem Beispiel haben wir zwei parallel ausgeführte Prozesspfade.
Der obere Pfad benutzt ein `TerminateEndEvent` um im Fehlerfall ein
sofortiges Prozessende herbeizuführen.

Das bedeutet, sollte dieses Event ausgelöst werden, dann wird auch der zweite
parallel ausgeführte Prozesspfad komplett abgebrochen, ungeachtet dessen,
welche dort definierte Activity gerade ausgeführt wird und ob die bisherige
Ausführung dieses Pfades erfolgreich war.

## Verhalten in der Process Engine

Wird ein `TerminateEndEvent` erreicht, ermittelt die Process Engine sämtliche
Instanzen von laufenden Activities und erzwingt ihr sofortiges Ende.
Diese bekommen dann als den Status `terminate` zugewiesen.

Nachdem sämtliche Activities beendet wurden, wird auch der Prozess selbst in
den Status `terminate` versetzt und beendet.

Da es sich beim `TerminateEndEvent` um ein irreguläres Prozessende handelt,
wird die Process Engine beim Auftreten eines solchen Events einen Fehler
werfen.
