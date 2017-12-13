# Hello BPMN-World
 
Um die Möglichkeiten der ProcessEngine zu demonstrieren, wird ein Beispiel Diagramm erstellt.

Ziel ist es ein BPMN-Diagramm mit einem
[Single User Task](../../anhang/Glossary.md)
zu erstellen.

Das Diagramm sieht folgendermaßen aus:

<img src="../images/hello-world.svg" width="100%" />

[Dieser User Task](../../anhang/Glossary.md) wird folgende Elemente enthalten:

1. die Nachricht `Hello World`
2. eine Schaltfläche zum Bestätigen

Diese dient dazu, den [Task](../../anhang/Glossary.md) zu beenden.

## Erstellung eines neuen Diagramms

Die Schaltfäche `Create Process Definition` dient zum Erstellen eines neuen Diagramms. Alternativ kann auch der `Prozess erstellen` Prozess ausgeführt werden.

<img src="../images/create-process-buttons.png" width="100%" />

Es öffnet sich ein neuer Dialog;
dort können ein Name und ein Schlüssel für das Prozessmodell angegeben werden;
in diesem Fall kann bei beiden `Hello World` gewählt werden.

<img src="../images/initial-processdata-create-new-diagram.png" width="100%" />

Sobald die Task List erscheint und der UserTaskName des `Prozess erstellen` Prozess auf `Prozess erstellt` umspringt kann die `Continue` Schaltfläche betätigt werden und die folgende Nachricht mit der `OK` Schaltfläche geschlossen werden.

Nun kann über dem `Process Definition List` Reiter die Liste der Prozessmodelle angezeigt werden und über die `Details` Schaltfläche des gerade erstellten Prozesses der Prozesseditor geöffnet werden.

<img src="../images/process-definition-list-create-new-diagram.png" width="100%" />

So sollte das ganze dann aussehen:
{% video controls="controls"%}../images/create-new-diagram.mp4{% endvideo %}

## Modellierung eines Diagramms

Der BPMN Editor zeigt uns eine Ansicht mit einer Lane und einem Startevent.

Durch das Auswählen eines Elements öffnet sich ein Kontextmenü;
dieses Menü erlaubt es neue Elemente hinzuzufügen;
diese werden direkt mit dem ausgewählten Element verbunden.

{% video controls="controls"%}../images/create-hello-world.mp4{% endvideo %}

## Integration eines Diagramms

Um dem User eine UI präsentieren zu können, kann die ProcessEngine konfiguriert 
werden eine HTML Ansicht zu rendern. Diese wird auf folgende Art und Weise definiert:

Im `Extensions` Reiter kann das durch Key-Value-Paare eingestellt werden;
der Reiter befindet sich auf der rechten Seite des Editors.

<img src="../images/integration-extension.png" width="100%" />

Es gibt zwei Felder:

1. `uiName`
1. `uiConfig`

Mit Hilfe von `uiName` wird die Art der UI Komponente festgelegt.

In diesem Fall benutzen wir einen Bestätigungsdialog.

Mit Hilfe von `uiConfig` werden die Details der UI Komponente bestimmt.

In diesem Fall die Nachricht und die Bedienelemente, die angezeigt werden sollen;
bitte folgendes in das Feld `uiConfig` eintragen:

```javascript
${ "message": "Hello World!", "layout": [ { "key": "confirm", "label": "OK" } ] };
```

<img src="../images/integration-property.png" width="100%" />

{% video controls="controls"%}../images/integrate-hello-world.mp4{% endvideo %}

**Zusammenfassung**

Wir haben den User Task festgelegt, die Konfiguration der UI hinterlegt und die Komponenten korrekt verschaltet.

Zeit den Prozess auszuführen:

{% video controls="controls"%}../images/run-hello-world.mp4{% endvideo %}
