# Design-Ansicht

## Aufgaben und Motivation

Die Design-Ansicht ermöglicht dem Benutzer einen Prozess zu betrachten,
zu modellieren, zu konfigurieren, zu deployen, zu starten und zu exportieren.

## Aufbau und Strukturierung

Wenn die Design-Ansicht geöffnet wurde, wird in der Mitte des BPMN-Studios
(Modellierungsfläche) das Diagramm angezeigt.

![Design-Ansicht](design-view.png)

Die Design-Ansicht ist in vier Bereiche aufgeteilt:

1. Modellierungsfläche

   ![Modellierungsfläche](design-view-modeler.png)

   In der linken Werkzeugleiste findet man im oberen Teil die Standardwerkzeuge
   zum bearbeiten von BPMN-Diagrammen und im unteren Teil BPMN-Elemente.

   Oben rechts in der Modellierungsfläche gibt es eine Minimap, welche sich
   mit dem _Open_ Button öffnen lässt.

   ![Minimap geschlossen](design-view-minimap-closed.png)

   Die Minimap zeigt das Diagramm im Ganzen und erlaubt es dem Nutzer sie zur
   Navigation zu nutzen und zu zoomen.

   ![Minimap geöffnet](design-view-minimap-opened.png)

2. Property Panel

   ![Property Panel](design-view-propertypanel.png)

   Das Property Panel bietet die Möglichkeit ein angewähltes Element
   zu konfigurieren und diesem Eigenschaften hinzuzufügen.

   Zusätzlich bietet das Property Panel eine Werkzeugleiste an, in der sich
   Tools befinden, um die optische Darstellung des Diagramms anzupassen.

   Es ist möglich:

   - Ein oder mehrere Elemente zu färben.
   - Mehrere Elemente horizontal auszurichten.
   - Mehrere Elemente vertikal auszurichten.

3. Aktionsmenü

   ![Menü](design-view-menu.png)

   Befindet sich das Diagramm auf dem Dateisystem, kann es mit dem
   <img src="icons/dolly-flatbed-solid.svg" width="15" height="15" align="center">
    Button auf die ProcessEngine geladen/deployed werden.

   Anschließend wird man auf die Ansicht der ProcessEngine geleitet und der
   Deploy Button ausgegraut.

   Das Öffnen eines Diagramms macht den Start-Button verfügbar
   <img src="icons/play-solid.svg" width="12" height="12">
   (Bild rechts). Mit diesem kann ein Prozess auf der verbundenen
   ProcessEngine ausgeführt werden.

   Die anderen Buttons haben immer die selbe Funktionalität.

|                                              |                                                          |
|----------------------------------------------|----------------------------------------------------------|
| <img width="64" src="icons/back_icon.png">   | Navigiert eine Seite zurück                              |
| <img width="64" src="icons/save_icon.png">   | Speichert den Prozess.                                   |
| <img width="64" src="icons/export_icon.png"> | Exportiert das Diagramm (.bpmn, .svg, .jpeg, oder .png). |
| <img width="64" src="icons/print_icon.png">  | Öffnet einen Drucken Dialog.                             |

4. Statusleiste

   ![Statusleiste](design-view-xml-diff.png)

   Die beiden Buttons `Show XML` und `Show Diff` sind nur in der Statusleiste
   der Design-Ansicht sichtbar.

   Der `Show XML` Button wechselt zur [XML-Ansicht](../xml-view/xml-view.md)
   und zeigt das aktuelle XML des Diagramms.

   Der `Show Diff` Button wechselt zur [Diff-Ansicht](../diff-view/diff-view.md).
