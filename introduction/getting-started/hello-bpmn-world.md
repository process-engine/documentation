# Hello BPMN-World
 
Um die Möglichkeiten der ProcessEngine zu demonstrieren, wird ein Beispiel Diagramm erstellt.

Ziel ist es ein BPMN-Diagramm mit einem
[Single User Task](../../anhang/Glossary.md)
zu erstellen.

Das Diagramm sieht folgendermaßen aus:

<img src="../images/hello-world.svg" width="100%" />

Dieser [User Task](../../anhang/Glossary.md) wird folgende Elemente enthalten:

1. die Nachricht `Hello World`
2. eine Schaltfläche zum Bestätigen

Diese dient dazu, den [Task](../../anhang/Glossary.md) zu beenden.

## Erstellung eines neuen Diagramms

Die Schaltfäche `Create Process Definition` dient zum Erstellen eines neuen
Diagramms. Alternativ kann auch der `Prozess erstellen`-Prozess ausgeführt
werden.

<img src="../images/create-process-buttons.png" width="100%" />

Es öffnet sich ein neuer Dialog;
dort können ein Name und ein Schlüssel für das Prozessmodell angegeben werden;
in diesem Fall kann bei beiden `Hello World` gewählt werden.

<img src="../images/initial-processdata-create-new-diagram.png" width="100%" />

Die Task List erscheint;
in der Liste befindet sich der Eintrag: `Prozess erstellen`;
nach Beendigung der Arbeiten im Backend, springt der UserTaskName auf `Prozess erstellt` um;
die `Continue` Schaltfläche kann betätigt werden;
die folgende Nachricht kann über die `OK` Schaltfläche geschlossen werden.

Der `Process Definition List`-Reiter zeigt die Liste der Prozessmodelle an;
die `Details`-Schaltfläche des gerade erstellten Prozesses öffnet den Prozesseditor.

<img src="../images/process-definition-list-create-new-diagram.png" width="100%" />

So sieht das Ganze dann aus:

{% video controls="controls"%}../images/create-new-diagram.mp4{% endvideo %}

## Modellierung eines Diagramms

Der BPMN Editor zeigt uns eine Ansicht mit einer Lane und einem Startevent.

Durch das Auswählen eines Elements öffnet sich ein Kontextmenü;
dieses Menü erlaubt es neue Elemente hinzuzufügen;
diese werden direkt mit dem ausgewählten Element verbunden.

An dem Startpunkt wird dann ein [User Task]() mit dem Namen `Hello Word` verbunden;
an diesem dann ein Endpunkt.

Das ganze sollte dann so aussehen:

<img src="../images/hello-world-diagram.png" width="100%" />

Und so wird es gemacht:

{% video controls="controls"%}../images/create-hello-world.mp4{% endvideo %}

## Integration eines Diagramms

Ein UserTask kann so eingestellt werden, dass dem Benutzer eine grafische
Oberfläche dargestellt wird. Die Konfiguration kann wie folgt geschehen:

Über den `Extensions`-Reiter wird mit Hilfe von Key-Value-Paare eingestellt, wie
die Oberfläche aussehen soll. Der Reiter befindet sich auf der rechten Seite des
Editors.

<img src="../images/integration-extension.png" width="100%" />

Es gibt zwei Felder:

1. `uiName`
1. `uiConfig`

Mit Hilfe von `uiName` wird die Art der UI Komponente festgelegt.

In diesem Fall benutzen wir einen Bestätigungsdialog. Als Wert für das Feld
`uiName` wählen wir dazu `Confirm`.

Mit Hilfe von `uiConfig` werden die Details der UI Komponente bestimmt.

In diesem Fall die Nachricht und die Bedienelemente, die angezeigt werden sollen;
bitte folgendes in das Feld `uiConfig` eintragen:

```javascript
${ "message": "Hello World!", "layout": [ { "key": "confirm", "label": "OK" } ] };
```

<img src="../images/integration-property.png" width="100%" />

{% video controls="controls"%}../images/integrate-hello-world.mp4{% endvideo %}

**Zusammenfassung**

Wir haben den User Task festgelegt, die Konfiguration der Oberfläche hinterlegt und die Komponenten korrekt verschaltet.

Zeit den Prozess auszuführen:

{% video controls="controls"%}../images/run-hello-world.mp4{% endvideo %}
