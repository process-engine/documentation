# Starten von Diagrammen

Nach dem deployen des Diagramms können wir es nun auf der verbundenen
ProcessEngine starten. Das Diagramm zu starten bedeutet das alle Tasks von der
ProcessEngine bearbeitet werden. UserTasks nehmen dabei eine Sonderrolle ein,
da sie auf eine Rückmeldung eines Nutzers warten. Die entsprechenden Oberflächen
werden beim Ausführen von BPMN-Studio automatisch angezeigt.

## Vor dem Start

Jetzt da das Diagramm auf der ProcessEngine vorhanden ist muss der Nutzer zunächst
die entsprechende Ansicht in BPMN-Studio öffnen.

Dazu öffnet der Nutzer den [Solution Explorer](hier Link einfügen) in der
ProcessEngine Ansicht um die bereits hochgeladenen Diagramme zu sehen.

Mit einem Klick auf den Namen des gerade hochgeladenen Diagramm öffnet sich nun
eine Design-Ansicht, die uns erlaubt das Diagramm mit einem Klick auf den
"Start-Button" auszuführen.

Allerdings muss der Prozess vorher als ausführbar markiert werden.
Wie das funktioniert ist [hier](../basic-editing/basic-editing.md#process) beschrieben.

## Der Waiting Room

Nach dem Starten des Prozesses zeigt das BPMN-Studio automatisch den sogenannten
[Waiting Room](hier Link einfügen) an. In dieser Ansicht erfragt das BPMN-Studio
regelmäßig ob neue UserTasks für den gerade gestarteten Prozess zur verfügung stehen.

Falls ein Prozzes beendet wird, stellt es das BPMN-Studio fest und zeigt nun
das Dashboard an.

Alternativ ist es natürlich jederzeit möglich den Waiting Room zu verlassen
und so nicht auf weitere UserTasks zu warten.

**Wichtig:** Auch beim verlassen des Waiting Rooms wird der Prozess weiter
ausgeführt. Der Nutzer wartet nur nicht mehr aktiv auf einen UserTask oder auf
das beenden des Prozesses.

Sollte der Nutzer sich entscheiden nicht weiter im Waiting Room auf die
weitere Ausführung oder auf das Ende des Prozesses zu warten, ist es jederzeit
möglich den UserTask aus dem [Dashboard](hier Link einfügen) heraus, wieder
aufzunehmen.
