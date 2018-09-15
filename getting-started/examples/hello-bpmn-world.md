# Hello BPMN-World

Um den Umgang der ProcessEngine und des BPMN-Studios zu demonstrieren,
wird die schrittweise Anleitung für ein einfaches Beispieldiagramm
gezeigt. Das fertige Diagramm kann
[hier](https://github.com/process-engine/example_processes/tree/develop/solutions/HelloWorld)
heruntergeladen werden.


Ziel ist es, ein BPMN-Diagramm mit einem
[Single User Task](../../GLOSSARY.md#user-task)
zu erstellen.

Das Diagramm sieht folgendermaßen aus:

<img src="../images/getting-started/hello-world/hello-world-diagram.svg" width="100%" />

Dieser [User Task](../../GLOSSARY.md#user-task) wird die folgenden Elemente
enthalten:

1. die Nachricht `Hello World`
2. eine Schaltfläche zum Bestätigen

Letzteres dient dazu, den [Task](../../GLOSSARY.md#task) zu beenden.

## Erstellung eines neuen Diagramms

Zunächst wird ein neues Diagramm benötigt.
Der Solution Explorer ermöglicht uns ein neues Diagramm innerhalb einer Solution
zu erstellen.

Dazu klickt man zunächst im Solution Explorer auf den "Open a Solution"-Button.

<img src="../images/getting-started/hello-world/open-a-solution-button.png" width="100%" />

Es öffnet sich ein Fenster zur Auswahl eines Ordners.
Bestätigt man den ausgewählten Ordner mit einem Klick auf "Öffnen" erscheint der
Ordner als Solution im Solution Explorer. Jetzt kann man mit dem "Datei
hinzufügen"-Button ein neues Diagramm erstellen.

<img src="../images/getting-started/hello-world/create-new-diagram-button.png" width="100%" />

Es erscheint ein Textfeld, in dem der Name für die Datei eingegeben wird.
In diesem Fall wird `Hello World` gewählt.

<img src="../images/getting-started/hello-world/create-new-diagram-input.png" width="100%" />

Nach dem Erstellen öffnet sich die Design-Ansicht automatisch mit dem gerade
erstellten Diagramm.

So sieht das Ganze  aus:

{% video controls="controls"%}../images/getting-started/hello-world/create-new-diagram.mp4{% endvideo %}

## Modellierung eines Diagramms

Die Design-Ansicht zeigt uns ein Diagramm mit einer
[Lane](../../GLOSSARY.md#lane), einem Startevent und einem Endevent.

Durch das Auswählen eines Elements öffnet sich ein Kontextmenü; dieses Menü
erlaubt es neue Elemente hinzuzufügen; diese werden direkt mit dem ausgewählten
Element verbunden.

Der Sequenzfluss vom Startevent zum Endevent wird zunächst entfernt.
An dem Startpunkt wird ein [UserTask](../../GLOSSARY.md#user-task)
mit dem Namen `Hello Word` verbunden; an diesem das Endevent.

Das Ganze sollte so aussehen:

<img src="../images/getting-started/hello-world/hello-world-diagram.png" width="100%" />

Im folgenden Video, fassen wir die Schritte zusammen:

{% video controls="controls"%}../images/getting-started/hello-world/create-hello-world.mp4{% endvideo %}

## Umsetzung eines User Task

Ein [UserTask](../../GLOSSARY.md#user-task) kann so konfiguriert werden, dass
dem Benutzer eine grafische Oberfläche präsentiert wird, in der er aufgefordert
wird ein Formular auszufüllen oder das Angezeigte zu bestätigen.

In diesem Beispiel wird eine Confirm Ansicht erstellt. Um das zu erreichen,
muss der UserTask folgendermaßen konfiguriert werden:

1. In dem Property Panel rechts unter dem Punkt Properties lässt sich die
   anzuzeigende Oberfläche mittels Key-Value Paaren definieren:

   Hier fügen wir eine Property namens `preferredControl` mit dem Wert `confirm` hinzu.

   <img src="../images/getting-started/hello-world/extensions-selection.png" width="100%" />

1. Ein FormField mit dem Typ Boolean wird benötigt.

   Das Label stellt die Nachricht, die nur bestätigt werden soll, dar.

   **Wichtig:** Wenn der UserTask eine Confirm Ansicht anzeigen soll, muss
   immer das **ERSTE** FormField vom Typ `boolean` sein.
   Die Id spielt dabei keine Rolle.

   <img src="../images/getting-started/hello-world/confirm-form-field.png" width="50%" />

**Zusammenfassung**

Was wir getan haben?

Wir haben:

- Einen [User Task](../../GLOSSARY.md#user-task) namens `Hello World` erstellt.
- Den Task mit einer Konfiguration für die Oberfläche versehen.
- Die verschiedenen Ausführungsschritte miteinander verdrahtet.

Hier ist noch einmal der komplette Ablauf mit Ausführung des Prozesses zu sehen:

{% video controls="controls"%}../images/getting-started/hello-world/hello-world_full_example.mp4{% endvideo %}
