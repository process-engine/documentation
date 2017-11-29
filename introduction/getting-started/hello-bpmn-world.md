# Hello BPMN-World

Wir beginnen mit einem “Hello-World” Beispiel.

Ziel ist es ein BPMN-Diagramm mit einem [Single User Task](../../anhang/Glossary.md) erstellen.
Das Diagramm sieht folgendermaßen aus:

<img src="../images/hello-world.svg" width="100%" />

[Dieser User Task](../../anhang/Glossary.md) wird folgende Elemente enthalten:

1. die Nachricht `Hello World`
1. einen Bestätigungsbutton

   Dieser dient dazu den [Task](../../anhang/Glossary.md) zu beenden.

## Erstellung eines neuen Diagramms

Der Knopf `Create Process Definition` dient zum Erstellen eines neuen Diagramms.

Es öffnet sich ein neuer Dialog;
dort geben wir den Namen und einen Schlüssel für das Prozessmodell ein;
in diesem Fall kann bei beiden `Hello World` gewählt werden.

Die Schaltfläche `Details` dient zur Angezeige und Bearbeitung von Diagrammen;
Er befindet sich in der Tabelle, in der jeweiligen Zeile des Prozessmodels, in der rechten Spalte.
 
{% video controls="controls"%}../images/create-new-diagram.mp4{% endvideo %}

## Modellierung eines Diagramms

Der BPMN Editor zeigt uns eine Ansicht mit einer Lane und einem Startevent.

Durch das Auswählen eines Elements öffnet sich ein Kontextmenü;
Dieses Menü erlaubt es neue Elemente hinzuzufügen;
diese werden direkt mit dem ausgewählten Element verbunden sind.

{% video controls="controls"%}../images/create-hello-world.mp4{% endvideo %}

## Integrieration eines Diagramms

Damit die ProzessEngine weiß, wie sie eine UI rendern soll, muss sie wissen, wie die UI aussehen soll.

Im `Extensions`-Reiter kann das durch Key-Value-Paare eingestellt werden;
Der Reiter befindet sich auf der rechten Seite des Editors.

Es gibt zwei Felder:

1. `uiName`
1. `uiConfig`

Mit Hilfe von `uiName` wird die Art der UI Komponente festgelegt.

In diesem Fall benutzen wir einen Bestätigungdialog.

Mit Hilfe von `uiConfig` werden die Details der UI Komponente bestimmt.

In diesem Fall die Nachricht und die Knöpfe, die angezeigt werden sollen;
Bitte folgendes in das Feld `uiConfig` eintragen:

```javascript
${ "message": "Hello World!", "layout": [ { "key": "confirm", "label": "OK" } ] };
```

{% video controls="controls"%}../images/integrate-hello-world.mp4{% endvideo %}

**Zusammenfassung**

Wir haben den User Task festgelegt, die Konfiguration der UI hinterlegt und die Komponenten korrekt verschaltet.
Zeit den Prozess auszuführen:

{% video controls="controls"%}../images/run-hello-world.mp4{% endvideo %}
