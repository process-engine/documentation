# Hello BPMN-World
 
Um die Möglichkeiten der ProcessEngine zu demonstrieren, wird ein Beispiel Diagramm erstellt.

Ziel ist es ein BPMN-Diagramm mit einem
[Single User Task](../../anhang/Glossary.md)
zu erstellen.

Das Diagramm sieht folgendermaßen aus:

<img src="../images/hello-world.svg" width="100%" />

[Dieser User Task](../../anhang/Glossary.md) wird folgende Elemente enthalten:

1. die Nachricht `Hello World`
1. eine Schaltfläche zum Bestätigen

   Dieser dient dazu den [Task](../../anhang/Glossary.md) zu beenden.

## Erstellung eines neuen Diagramms

Der Knopf `Create Process Definition` dient zum Erstellen eines neuen Diagramms.

Es öffnet sich ein neuer Dialog;
dort können ein Name und ein Schlüssel für das Prozessmodell angegeben werden;
in diesem Fall kann bei beiden `Hello World` gewählt werden.

Die Schaltfläche `Details` dient zur Angezeige und Bearbeitung von Diagrammen;
Diese befindet sich in der Tabelle, in der jeweiligen Zeile des Prozessmodels, auf der rechten Spalte.
 
{% video controls="controls"%}../images/create-new-diagram.mp4{% endvideo %}

## Modellierung eines Diagramms

Der BPMN Editor zeigt uns eine Ansicht mit einer Lane und einem Startevent.

Durch das Auswählen eines Elements öffnet sich ein Kontextmenü;
dieses Menü erlaubt es neue Elemente hinzuzufügen;
diese werden direkt mit dem ausgewählten Element verbunden sind.

{% video controls="controls"%}../images/create-hello-world.mp4{% endvideo %}

## Integration eines Diagramms

Um dem User eine UI präsentieren zu können, kann die ProcessEngine konfiguriert 
werden eine HTML Ansicht zu rendern. Diese wird auf folgende Art und Weise definiert:

Im `Extensions` Reiter kann das durch Key-Value-Paare eingestellt werden;
der Reiter befindet sich auf der rechten Seite des Editors.

Es gibt zwei Felder:

1. `uiName`
1. `uiConfig`

Mit Hilfe von `uiName` wird die Art der UI Komponente festgelegt.

In diesem Fall benutzen wir einen Bestätigungdialog.

Mit Hilfe von `uiConfig` werden die Details der UI Komponente bestimmt.

In diesem Fall die Nachricht und die Knöpfe, die angezeigt werden sollen;
bitte folgendes in das Feld `uiConfig` eintragen:

```javascript
${ "message": "Hello World!", "layout": [ { "key": "confirm", "label": "OK" } ] };
```

{% video controls="controls"%}../images/integrate-hello-world.mp4{% endvideo %}

**Zusammenfassung**

Wir haben den User Task festgelegt, die Konfiguration der UI hinterlegt und die Komponenten korrekt verschaltet.

Zeit den Prozess auszuführen:

{% video controls="controls"%}../images/run-hello-world.mp4{% endvideo %}
