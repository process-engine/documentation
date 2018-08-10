# Hello BPMN-World

Um die Möglichkeiten der ProcessEngine zu demonstrieren, wird ein Beispiel
Diagramm erstellt.

Ziel ist es ein BPMN-Diagramm mit einem
[Single User Task](../../GLOSSARY.md#user-task) zu erstellen.

Das Diagramm sieht folgendermaßen aus:

<img src="../images/getting-started/hello-world/hello-world-diagram.svg" width="100%" />

Dieser [User Task](../../GLOSSARY.md#user-task) wird die folgenden zwei
Elemente enthalten:

1. die Nachricht `Hello World`
2. eine Schaltfläche zum Bestätigen

Letzteres dient dazu, den [Task](../../GLOSSARY.md#task) zu beenden.

## Erstellung eines neuen Diagramms

Zunächst wird ein neues Diagramm benötigt. Dieses kann über den Solution
Explorer erstellt werden. Dafür muss man eine Solution öffnen, dazu klickt
man im Solution Explorer auf den "Open a Solution"-Button.

<img src="../images/getting-started/hello-world/open-a-solution-button.png" width="100%" />

Es öffnet sich ein Fenster zur Auswahl eines Ordner, der geöffnet werden soll.
Sobald man ein Ordner geöffnet hat kann man ein Diagramm erstellen. Dazu klickt man auf den
"Datei hinzufügen"-Button.

<img src="../images/getting-started/hello-world/create-new-diagram-button.png" width="100%" />

Es erscheint ein Textfeld, in dem der Name für die Datei eingegeben wird.
In diesem Fall wird `Hello World` gewählt.

<img src="../images/getting-started/hello-world/create-new-diagram-input.png" width="100%" />

Die Design-Ansicht öffnet sich mit dem gerade erstellten Diagramm.

So sieht das Ganze dann aus:

{% video controls="controls"%}../images/getting-started/hello-world/create-new-diagram.mp4{% endvideo %}

## Modellierung eines Diagramms

Die Design-Ansicht zeigt uns ein Diagramm mit einer
[Lane](../../GLOSSARY.md#lane), einem Startevent und einem Endevent.

Durch das Auswählen eines Elements öffnet sich ein Kontextmenü; dieses Menü
erlaubt es neue Elemente hinzuzufügen; diese werden direkt mit dem ausgewählten
Element verbunden.

Der Sequenzfluss vom Startevent zum Endevent wird zunächst entfernt.
An dem Startpunkt wird dann ein [UserTask](../../GLOSSARY.md#user-task)
mit dem Namen `Hello Word` verbunden; an diesem dann das Endevent.

Das Ganze sollte dann so aussehen:

<img src="../images/getting-started/hello-world/hello-world-diagram.png" width="100%" />

Und so wird es gemacht:

{% video controls="controls"%}../images/getting-started/hello-world/create-hello-world.mp4{% endvideo %}

## Integration eines Diagramms

Ein [UserTask](../../GLOSSARY.md#user-task) kann so eingestellt werden,
dass dem Benutzer eine grafische Oberfläche dargestellt wird. In diesem Fall
wird eine Confirm Ansicht gewählt.
Um das zu erreichen muss der UserTask folgendermaßen eingestellt werden:

  1. In dem Property Panel rechts unter dem Punkt Properties lässt sich die anzuzeigende
  Oberfläche mittels Key-Value Paaren definieren:

    Hier fügen wir eine Property namens `preferredControl` mit dem Wert `confirm` hinzu.

  <img src="../images/getting-started/hello-world/extensions-selection.png" width="100%" />

  1. Ein FormField mit dem Typ Boolean wird benötigt.
  Das Label stellt die Nachricht, die confirmed werden soll, dar.

  **Wichtig:** Wenn der UserTask eine Confirm Ansicht anzeigen soll, muss 
  immer das **ERSTE** FormField vom Typ `boolean` sein.
  Die Id spielt dabei keine Rolle.

  <img src="../images/getting-started/hello-world/confirm-form-field.png" width="50%" />


**Zusammenfassung**

Was wir getan haben:
- einen [User Task](../../GLOSSARY.md#user-task) namens `Hello World` erstellt.
- den Task mit einer Konfiguration für die Oberfläche versehen.
- die verschiedenen Ausführungsschritte miteinander verdrahtet.

Hier ist der komplette Ablauf mit Ausführung des Prozesses zu sehen:

{% video controls="controls"%}../images/getting-started/hello-world/hello-world_full_example.mp4{% endvideo %}
