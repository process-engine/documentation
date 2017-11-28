# Hello BPMN-World

Wir beginnen mit einem einfachen “Hello-World”-Beispiel.
Dabei wollen wir ein BPMN-Diagramm mit einer Single User Task erstellen, welches folgendermaßen aussieht:

<img src="../images/hello-world.svg" width="100%" />

Dieser User Task wird die `Hello World` Nachricht und einen Bestätigungsbutton, der den Task beendet, anzeigen.

## Erstellung eines neuen Diagramms

Um ein neues Prozessmodell zu erstellen, öffne Charon und klicke auf den `Create Process Definition`-Button.
Nun öffnet sich eine neue Ansicht, in der man einenNamen und einen Schlüssel für das Prozessmodell eingegeben werden kann.
In diesem Fall kann bei beidem `Hello World` gewählt werden.
Danach kann das Diagramm über den `Details`-Button angezeigt und bearbeitet werden.
Den `Details`-Button findet man in der Tabelle in der jeweiligen Zeile des Prozessmodels in der rechten Spalte.

{% video controls="controls"%}../images/creating-new-diagram.mp4{% endvideo %}

## Modellierung eines Diagramms

Nun kann man einen BPMN Editor mit einer Lane und einem Start Event sehen.
Durch das Auswählen eines Elements öffnet sich ein Kontextmenü, durch welches nun neue Elemente hinzugefügt werden können, die dann direkt mit dem ausgewählten Element verbunden sind.

{% video controls="controls"%}../images/create-hello-world.mp4{% endvideo %}

So weit, so gut. Nun muss der Prozess noch ausführbar gemacht werden.

## Integrierung eines Diagramms

Damit die Prozessengine weiß, wie sie eine UI rendern soll, muss sie wissen, wie die UI aussehen soll.
Dies kann mit Hilfe der key/value-pairs im `Extensions`-Reiter auf der rechten Seite des Editors eingestellt werden.
Mit Hilfe von `uiName` wird die Art der UI Komponente festgelegt.
In diesem Fall nutzen wir einen Bestätigungdialog.
Mit Hilfe von `uiConfig` werden die Details der UI Komponente bestimmt.
In diesem Fall die Nachricht und die Knöpfe, die angezeigt werden sollen.

```javascript
${ "message": "Hello World!", "layout": [ { "key": "confirm", "label": "OK" } ] };
```

{% video controls="controls"%}../images/integrate-hello-world.mp4{% endvideo %}

Jetzt ist festgelegt, wie der User Task aussehen soll. Zeit den Prozess auszuführen.

{% video controls="controls"%}../images/run-hello-world.mp4{% endvideo %}


 
