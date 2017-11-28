## Nutzung einer REST API

In diesem Beispiel werden Wechselkurse von einer REST API geladen und dargestellt.

Erstelle dazu ein neues Diagramm, wie bei dem Hello World Beispiel.

Erstelle dann einen Service Task, um Daten zu laden und einen User Task, um die Daten anzuzeigen:

{% video controls="controls"%}../images/consuming-rest-api.mp4{% endvideo %}

Unter dem `Extensions`-Reiter können wir dem Service Task nun sagen, was er tun soll:
In diesem Fall eine HTTP REST API abzurufen.

Als Nächstes teilen wir dem Sequenzfluss mit, wie das Ergebnis interpretiert und an den User Task weitergegeben werden soll.

Daie Sequenzflusszuordnung definiert, wie die im vorherigen Task empfangenen Daten im Token aufbewahrt werden.

```javascript
JSON.parse(token.current.result).rates.USD 
```

In diesem Fall wollen wir nicht alle Wechselkurse anzeigen, sondern lediglich den USD Kurs. Nach dem Mapping kann das nächste BPMN Node nach dem Sequenzfluss den USD Kurs durch `token.current` nutzen.

Zum Schluss müssen wir dem User Task nur noch sagen was er anzeigen soll. Dies geschieht wieder über den `Extensions`-Reiter.

Dazu setzen wir `Confirm` als `uiName`, um einen Bestätigungsdialog zu verwenden und konfigurieren diese mit `uiConfig` folgendermaßen:

```
${ "message": "1 EUR = " + token.current + " USD", "layout": [ { "key": "confirm", "label": "OK"}] };
```

{% video controls="controls"%}../images/integrate-rest-api.mp4{% endvideo %}

Das sieht dann folgendermaßen aus:

{% video controls="controls"%}../images/run-rest-api.mp4{% endvideo %}
 