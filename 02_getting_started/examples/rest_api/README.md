# Verwendung einer REST API

In diesem Beispiel werden Wechselkurse von einer REST API geladen und
dargestellt.

REST beschreibt ein Paradigma für die Kommunikation zwischen
verteilten Systemen. Mit HTTP-Requests an REST-APIs können wir auf
externe Dienste zugreifen.

Das REST-API-Beispiel zeigt, wie wir solche APIs in BPMN ansprechen
können und somit neue Anwendungsmöglichkeiten für die
Diagrammmodellierung gewinnen.

Da in der Darstellung auf das vorherige Ergebnis zugegriffen wird,
lernen wir zudem, wie beim Prozessablauf Informationen transportiert
werden.

Das fertige Diagramm kann
[hier](https://github.com/process-engine/example_processes/tree/develop/solutions/RestAPI)
heruntergeladen werden.

## Lernziele

- Erstellung und Konfiguration eines Service Tasks
- Zugriff auf Werte des Tokens

## Aufbau

Erstelle dazu ein neues Diagramm, analog zum Hello World Beispiel.

Erstelle dann:

* einen Service Task, um Daten zu laden und einen
* User Task, um die Daten anzuzeigen.

Das Ganze sollte so aussehen:

{% video controls="controls"%}./images/create-rest-api-consumer-diagram.mp4{% endvideo %}

Innerhalb des Property Panels lässt sich nun mittels Key-Value Paaren
der Service Task definieren.

In unserem Fall soll der `Fetch Data` Task einen `GET - request` auf der
angegebenen URL ausführen. Die Antwort wird anschließend als aktueller Token
Wert festgelegt.

Dazu müssen dem Element im Property Panel die folgenden Properties hinzugefügt
werden:

```
module    HttpService
method    get
params    ['http://free.currencyconverterapi.com/api/v5/convert?q=EUR_USD&compact=y']
```

Zum Vergleich, so sollte das aussehen:

<img src="./images/configure-fetch-data-service-task.png" width="100%" />

Zum Schluss muss der User Task (`Show Data`) konfiguriert werden, um
die korrekte Anzeige zu erreichen.

Dies geschieht wieder über das Property Panel.

User Tasks können sowohl Bestätigungsdialoge als auch Formulare anzeigen.
Da wir hier keine Eingabe vom Nutzer benötigen, erstellen wir einen
Bestätigungsdialog.

Dazu erstellen wir:

1. die Property `preferredControl` mit dem Wert `confirm`,
1. ein Formularfeld vom Typ `Truth value`,
1. ein Feld `Label` und tragen unsere Nachricht an den Nutzer ein:

   ```
   ${'1 € =' + token.current.result.EUR_USD.val + '$'}
   ```

   Die gesonderte Syntax `${...}` erlaubt den Zugriff auf Werten des Tokens.
   Mit dem `+`-Operator kann der Inhalt vom Token mit den Zeichenketten
   `'1 € = '` und `'$'` verbunden.

Das Ganze sieht so aus:

<img src="./images/configure-show-data-user-task.png" width="100%" />

Zusammengefasst sieht dergesamte Konfigurationsvorgang so aus:

{% video controls="controls"%}./images/complete-task-configuration.mp4{% endvideo %}

**Zusammenfassung**

In diesem Tutorial haben wir:

1. Einen Service Task zum Ausführen des HTTP GET Requests definiert.
1. Einen User Task angelegt, der uns den gewünschten Umrechnungskurs anschaulich darstellt

Es ist nun Zeit, den Prozess auszuführen:

{% video controls="controls"%}./images/run-final-process.mp4{% endvideo %}
