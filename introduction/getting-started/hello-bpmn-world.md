# Hello BPMN-World

Zunächst setzen wir den absoluten Klassiker `Hello World` auf.
Wir wollen ein BPMN-Diagramm mit einer Single User Task erstellen, welches folgendermaßen aussieht:

<img src="../images/hello-world.svg" width="100%" />

Dieser User Task wird die `Hello World` Nachricht und einen Bestätigungsknopf, um den Task zu beenden.

## Erstellung eines neuen Diagramms

Um ein neues Prozessmodell zu erstellen, öffne Charon und klicke auf den `Create Process Definition`-Knopf.
Nun muss dem Prozessmodell einen Namen und einen Schlüssel gegeben werden.
In diesem Fall kann bei beidem `Hello World` gewählt werden.
Danach kann das Diagramm über den `Details`-Knopf angezeigt und bearbeitet werden

{% video controls="controls"%}../images/creating-new-diagram.mp4{% endvideo %}

## Modellierung eines Diagramms

Nun kann man einen BPMN Editor mit einer Lane und einem Start Event sehen.
Durch das Auswählen eines Elements öffnet sich ein Kontextmenü, durch welches nun neue Elemente hinzugefügt werden können, die dann direkt mit dem ausgewählten Element verbunden sind.

{% video controls="controls"%}../images/hello-world.mp4{% endvideo %}

So weit, so gut. Nun muss der Prozess noch ausführbar gemacht werden.

## Integrierung eine Diagramms

Damit die Prozessengine weiß, wie sie eine UI rendern soll, muss es wissen, wie die UI aussehen soll.
Dies kann mit key/value pairs im `Extensions`-Reiter auf der rechten Seite des Editors eingestellt werden.
Mit Hilfe von `uiName` wird die Art der UI Komponente festgelegt.
In diesem Fall ist ein Bestätigung Dialog ratsam.
Mit Hilfe von `uiConfig` werden die Details der UI Komponente bestimmt.
In diesem Fall die Nachricht und die Knöpfe, die angezeigt werden sollen.

```javascript
${ "message": "Hello World!", "layout": [ { "key": "confirm", "label": "OK" } ] };
```

{% video controls="controls"%}../images/integrate-hello-world.mp4{% endvideo %}

Jetzt ist festgelegt, wie der User Task aussehen soll. Zeit den Prozess auszuführen.

{% video controls="controls"%}../images/execute-hello-world.mp4{% endvideo %}

## Nutzung einer REST API

In diesem Beispiel werden Wechselkurse von einer REST API geladen und dargestellt.

Erstelle dazu ein neues Diagramm, wie bei dem Hello World Beispiel.

Erstelle dann einen Service Task, um Daten zu laden und einen User Task, um die Daten anzuzeigen:

{% video controls="controls"%}../images/consuming-rest-api.mp4{% endvideo %}

Unter dem `Extensions`-Reiter können wir dem Service Task nun sagen, was er tun soll:
In diesem Fall eine HTTP REST API abzurufen.

Als Nächstes teilen wir dem Flow mit, wie das Ergebnis interpretiert und an den User Task weitergegeben werden soll.

Das Flow Mapping restrukturiert, wie die im vorherigen Task empfangenen Daten im Token aufbewahrt werden.

```javascript
JSON.parse(token.current.result).rates.USD 
```

In diesem Fall wollen wir nicht alle Wechselkurse anzeigen, sondern lediglich den USD Kurs. Nach dem Mapping kann das nächste BPMN Node nach dem Flow den USD Kurs durch `token.current` nutzen.

Zum Schluss müssen wir dem User Task nur noch sagen was er anzeigen soll. Dies geschieht wieder über den `Extensions`-Reiter.

Dazu setzen wir `Confirm` als `uiName`, um einen Bestätigungsdialog zu verwenden und konfigurieren diese mit `uiConfig` folgendermaßen:

```
${ "message": "1 EUR = " + token.current + " USD", "layout": [ { "key": "confirm", "label": "OK"}] };
```

{% video controls="controls"%}../images/integrate-rest-api.mp4{% endvideo %}

Dies sieht dann folgendermaßen aus:

{% video controls="controls"%}../images/run-rest-api.mp4{% endvideo %}
 
 
## E-Mails versenden

Nun erweitern wir das Beispiel Nutzung einer REST API, sodass die geladenen Daten per E-Mail versendet werden.

Dazu updaten wir den Prozess so, dass dieser nach einer E-Mail-Adresse fragt, eine Bestätigung anfordert und dann eine E-Mail mit dem Wechselkurs an die entsprechende E-Mail versendet.

Um das zu erreichen, müssen wir Folgendes tun:

* `0:00 - 0:09` Den Prozess zu `E-Mails versenden` umbenennen
* `0:10 - 0:17` Die Lane vergrößern, um mehr Platz zu schaffen
* `0:18 - 1:14` Füge eine Form hinzu, die nach der Email fragt
* `1:17 - 1:20` Gib der `Fetch Data` Task eine ID, damit man später auf ihre Daten zugreifen kann
* `1:22 - 1:27` Lösche den nicht mehr benötigten Mapper
* `1:27 - 1:54` Bennene die `Show Data` Task zu `Confirm Data` um
* `1:55 - 2:05` Füge ein Gateway hinzu, damit wir später bei einem `ok` eine E-Mail versenden und bei einem `cancel` abbrechen können
* `2:06 - 3:10` Füge einen `Send email` Service-Task hinzu
* `3:15 - 3:52` Stelle die Gateway-Flows so ein, dass `ok` eine E-Mail versendet und `cancel` den Prozess abbricht.

{% video controls="controls"%}../images/create-send-email.mp4{% endvideo %}

Hier noch einmal die im Video kopierten Werte:

```
// uiConfig for "Confirm Data"
${ "message": "1 EUR = " + JSON.parse(token.history.fetch_data.result).rates.USD + " USD - email: " + token.current.email, "layout": [ { "key": "confirm", "label": "OK"}, { "key": "cancel", "label": "cancel"}] };

// params for "send mail"
[null, token.history.get_email.email, "EUR to USD conversion rate", "1 EUR = " + JSON.parse(token.history.fetch_data.result).rates.USD + " USD"]
```

Nun nur noch ausprobieren:

{% video controls="controls"%}../images/run-send-email.mp4{% endvideo %}
