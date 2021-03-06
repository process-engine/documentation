# Solution Explorer

Der Solution Explorer bietet die Funktionalität, Ordner (Solutions) oder Dateien
zu öffnen. Darüber hinaus ist er in allen Ansichten verfügbar. Somit kann von
jeder Ansicht aus zu der Design-Ansicht eines Prozesses navigiert werden.

Zusätzlich zeigt er alle Prozesse an, welche auf der aktuell verbundenen
ProcessEngine existieren.

Der Solution Explorer kann über die Navigationsleiste mittels des
<img src="icons/project-diagram-solid.svg" width="15" height="15" align="center">-Buttons
ein- und ausgeblendet werden.

## Was ist eine Solution?

Eine Solution stellt in unserer Philosophie einen Teil der Projektstruktur dar.

**Beispiel**

Innerhalb eines Projekts gibt es Solutions für die Rechnungserstellung
und Autorisierung von Benutzern. Diese Solutions orientieren sich an den
Domänen, die das Projekt berührt.

In einer Solution werden alle Diagramme, die zur Lösung eines Problems
notwendig sind, gebündelt und organisiert. Auf einem Dateisystem ist eine
Solution nichts anderes als ein Ordner der eine Menge von Diagrammen enthält.

## Aufgaben und Motivation

Der Solution Explorer soll es dem Anwender so einfach wie möglich machen,
zwischen den Diagrammen einer Solution oder zwischen Solutions zu wechseln.

Um das zu erreichen, zeigt der Solution Explorer die verschiedenen geöffneten
Solutions, sowie einzelne geöffnete Diagramme untereinander an. Solutions
werden mit einem Ordnersymbol gekennzeichnet.

Ihre zugehörigen Diagramme werden eingerückt darunter dargestellt. Ein
einfacher Klick öffnet ein Diagramm in der Design-Ansicht. Dies ermöglicht das
schnelle und einfache Springen zwischen Diagrammen und Solutions.

## Aufbau und Strukturierung

In seinem Startzustand, also beim erstmaligen Öffnen des BPMN-Studios, zeigt der
Solution Explorer alle verfügbaren Diagramme auf der aktuell angebundenen
ProcessEngine untereinander an.

![Solution Explorer beim ersten Öffnen](./first_opening.png)

Schon hier kann der Nutzer mit einem einzigen Klick in die Design-Ansicht des
angeklickten Diagramms gelangen und dieses editieren.

Mit einem Klick auf das Ordnersymbol im Reiter des Solution Explorers kann
die Anzeige für Solutions, die sich auf dem Dateisystem des Benutzers befinden
geöffnet werden. Beim ersten Öffnen des Reiters werden nur die Grundfunktionen
und ein Button zum Öffnen einer Solution angezeigt.

![Öffnen der Dateisystemansicht](./first_opening_file_system.png)

Ein Klick auf diesen Button öffnet den Datei-Öffnen-Dialog, der es dem Nutzer
erlaubt einen beliebigen Ordner in seinem Dateisystem zu suchen oder anzulegen
und zu öffnen.

![Öffnen einer Solution](./open_solution_dialog.png)

Mit einem Klick auf "Öffnen" bestätigt der Nutzer den ausgewählten Ordner.

Der Solution Explorer zeigt den ausgewählten Ordner nun als Solution an.
Auch von hier kann der User mit einem Klick auf den Namen eines Diagramms in die
entsprechende Design-Ansicht gelangen und das Diagramm bearbeiten.

![Geöffnete FileSystem Solution](./opened_file_system_solution.png)

**Hinweis:** Es werden nur .bpmn-Dateien angezeigt.

## Funktionen

![Solution Explorer in der Dateisystemansicht](./solution_explorer_file_system.png)

| Nr. | Bezeichnung                        | Beschreibung                                                                                           |
|:---:|:-----------------------------------|:-------------------------------------------------------------------------------------------------------|
| 1.  | Reiter "Dateisystemansicht"        | Öffnet die Dateisystemansicht des Solution Explorers.                                                  |
| 2.  | Reiter "ProcessEngineansicht"      | Öffnet die Ansicht zur Anzeige aller Diagramme auf der aktuell angebunden ProcessEngine.               |
| 3.  | Solution Explorer öffnen/schließen | Öffnet und schließt den Solution Explorer.                                                             |
| 4.  | Datei öffnen                       | Öffnet einen Datei-Öffnen-Dialog zum öffnen einer einzelnen .bpmn-Datei.                               |
| 5.  | Solution öffnen                    | Öffnet ein Ordner-Öffnen-Dialog zum öffnen eines Ordners auf dem Dateisystem des Nutzers als Solution. |
| 6.  | Refresh                            | Aktualisiert den Solution Explorer und alle in ihm enthaltenen Solutions.                              |
| 7.  | Open a Solution                    | Siehe 5.                                                                                               |

![Geöffnete FileSystem Solution im Solution Explorer](./filesystem_solution.png)

| Nr. | Bezeichnung            | Beschreibung                                           |
|:---:|:-----------------------|:-------------------------------------------------------|
| 1.  | Neues Diagramm anlegen | Erstellt ein neues Diagramm innerhalb dieser Solution. |
| 2.  | Solution schließen     | Schließt diese Solution im Solution Explorer.          |
| 3.  | Diagramme              | Öffnet die Design-Ansicht des ausgewählten Diagramms.  |

## Valide Diagrammnamen

Der Name des Diagrams muss den folgenden Regeln entsprechen.
Er darf nur

- alphanumerische Zeichen,
- deutsche Umlaute und
- die folgenden Trennzeichen:
  - Punkt,
  - Leerzeichen,
  - Bindestrich und
  - Unterstrich

enthalten; Sie werden vom BPMN-Studio eine Meldung erhalten, wenn der Name
gegen eine Regel verstößt.

**Beispiele**

1. `bücher_bestellprozess`
1. `Einstellung_neuer_Mitarbeiter`
1. `ausbildungsnachweise kontrollieren`
1. `BPMN-Studio.login`
1. `20180810-bestellung_bezahlen-checkout`
