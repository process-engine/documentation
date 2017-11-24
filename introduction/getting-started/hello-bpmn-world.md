# Hello BPMN-World

Zunächst setzen wir den absoluten Klassiker `Hello World` auf.
Wir wollen ein BPMN-Diagramm mit einer Single User Task erstellen, welches folgendermaßen aussieht:

> Hier Bild einfügen

Dieser User Task wird die `Hello World` Nachricht und einen Bestätigungsknopf, um den Task zu beenden.

## Erstellung eines neuen Diagramms

Um ein neues Prozessmodell zu erstellen, öffne Charon und klicke auf den `Create Process Definition`-Knopf.
Nun muss dem Prozessmodell einen Namen und einen Schlüssel gegeben werden.
In diesem Fall kann bei beidem `Hello World` gewählt werden.
Danach kann das Diagramm über den `Details`-Knopf angezeigt und bearbeitet werden

> Hier Video einfügen

## Modellierung eines Diagramms

Nun kann man einen BPMN Editor mit einer Lane und einem Start Event sehen.
Durch das Auswählen eines Elements öffnet sich ein Kontextmenü, durch welches nun neue Elemente hinzugefügt werden können, die dann direkt mit dem ausgewählten Element verbunden sind.

> Hier Video einfügen

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

> Hier Video einfügen

Jetzt ist festgelegt, wie der User Task aussehen soll. Zeit den Prozess auszuführen.

> Hier Video einfügen

## Nutzung einer REST API

In diesem Beispiel werden Wechselkurse von einer REST API geladen und dargestellt.

Erstelle dazu ein neues Diagramm, wie bei dem [Hello World](LINK EINFÜGEN) Beispiel.

Erstelle dann einen Service Task, um Daten zu laden und einen User Task, um die Daten anzuzeigen:

> Hier Video einfügen


Unter dem `Extensions`-Reiter können wir dem Service Task nun sagen, was er tun soll:
In diesem Fall eine HTTP REST API abzurufen.

Als Nächstes teilen wir dem Flow mit, wie das Ergebnis interpretiert und an den User Task weitergegeben werden soll.

Das Flow Mapping restrukturiert, wie die im vorherigen Task empfangenen Daten im Token aufbewahrt werden.

```javascript
JSON.parse(token.current.result).rates.USD 
```

In diesem Fall wollen wir nicht alle Wechselkurse anzeigen, sondern lediglich den USD Kurs. Nach dem Mapping, kann das nöchste BPMN node nach dem Flow den USD Kurs durch `token.current` nutzen.

Zum Schluss mpssen wir dem User Task nur noch sagen was er anzeigen soll. Dies geschieht wieedr über den `Extensions`-Reiter.

Dazu setzen wir `Confirm`als `uiName`, um einen Bestätigungsdialog zu verwenden und konfigurieren diese mit `uiConfig` folgendermaßen:

```
${ "message": "1 EUR = " + token.current + " USD", "layout": [ { "key": "confirm", "label": "OK"}] };
```

> Hier Video einfügen

Dies sind dann folgendermaßen aus:

> Hier Video einfügen
 
 
## E-Mails versenden

Nun erweitern wir das Beispiel [Nutzung einer REST API](LINK EINFÜGEN), sodass die geladenen Daten per E-Mail versendet werden.

Dazu updaten wir den Prozess so, dass dieser nach einer E-Mail-Adresse fragt, eine Bestätigung anfordert und dann eine E-Mail mit dem Wechselkurs an die entsprechende E-Mail versendet.

Um das zu erreichen müssen wir folgendes tun:

* `ZEIT` Den Prozess zu `E-Mails versenden` umbenennen
* `ZEIT` Die Lane vergrößern, um mehr Platz zu schaffen
* `ZEIT` Füge eine Form hinzu, die nach der Email fragt
* `ZEIT` Gib der `Fetch Data` Task eine ID, damit man später auf ihre Daten zugreifen kann
* `ZEIT` Lösche den nicht mehr benötigten Mapper
* `ZEIT` Bennene die `Show Data` Task zu `Confirm Data` um
* `ZEIT` Füge ein Gateway hinzu, damit wir später bei einem `ok` eine E-Mail versenden und bei einem `cancel` abbrechen können
* `ZEIT` Füge einen `Send email` Service-Task hinzu
* `ZEIT` Stelle die Gateway-Flows so ein, dass `ok` eine E-Mail versendet und `cancel` den Prozess abbricht.

>  Hier ein Video einfügen und die Zeiten anpassen


Hier noch einmal die im Video kopierten Werte:

```
// uiConfig for "Confirm Data"
${ "message": "1 EUR = " + JSON.parse(token.history.fetch_data.result).rates.USD + " USD - email: " + token.current.email, "layout": [ { "key": "confirm", "label": "OK"}, { "key": "cancel", "label": "cancel"}] };

// params for "send mail"
[null, token.history.get_email.email, "EUR to USD conversion rate", "1 EUR = " + JSON.parse(token.history.fetch_data.result).rates.USD + " USD"]
```

Nun nur noch ausprobieren:

> Hier Video einfügen