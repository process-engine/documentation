# Starten von Diagrammen

Nach dem Deployen des Diagramms, können wir es auf der verbundenen
ProcessEngine starten.

Das Diagramm zu starten bedeutet, das alle Tasks- die im Diagramm definiert
sind- von der ProcessEngine bearbeitet werden.

UserTasks nehmen dabei eine Sonderrolle ein, da sie auf eine Rückmeldung eines
Nutzers warten. Die entsprechenden Oberflächen werden beim Ausführen von
BPMN-Studio automatisch angezeigt.

## Vor dem Start

Jetzt, da das Diagramm auf der ProcessEngine vorhanden ist, muss der Nutzer die
entsprechende Ansicht in BPMN-Studio öffnen.

Dazu öffnet der Nutzer den
[Solution Explorer](../../components/solution-explorer/solution-explorer.md)
in der ProcessEngine Ansicht um die bereits hochgeladenen Diagramme zu sehen.

Mit einem Klick auf den Namen des gerade hochgeladenen Diagramm öffnet sich
eine Design-Ansicht, die uns erlaubt das Diagramm mit einem Klick auf den
"Start-Button" auszuführen.

**Wichtig:**

Vor dem Starten eines Prozesses, muss das Diagramm mithilfe des
`Executable`-Feldes als ausführbar gekennzeichnet werden.

Die Konfiguration ist [hier](../basic-editing/basic-editing.md#process) beschrieben.

## Der Waiting Room

Nach dem Starten des Prozesses zeigt das BPMN-Studio automatisch den sogenannten
[Waiting Room](../../components/waiting-room/waiting-room.md)
an. In dieser Ansicht erfragt das BPMN-Studio regelmäßig ob neue UserTasks für
den gerade gestarteten Prozess zur Verfügung stehen.

Falls ein Prozess beendet wird, stellt es das BPMN-Studio fest und zeigt
die Inspect-Ansicht an.

Alternativ ist es jederzeit möglich, den Waiting Room zu verlassen und nicht
auf weitere UserTasks zu warten.

**Wichtig:**

Auch beim Verlassen des Waiting Rooms wird der Prozess weiter ausgeführt. Der
Nutzer wartet nur nicht mehr aktiv auf einen UserTask oder auf das beenden des
Prozesses.

Sollte der Nutzer sich entscheiden nicht weiter im Waiting Room auf die
weitere Ausführung oder auf das Ende des Prozesses zu warten, ist es jederzeit
möglich den UserTask aus der
[Inspect Ansicht](../../components/dashboard/dashboard.md)
heraus, wieder aufzunehmen.
