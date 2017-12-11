# E-Mails versenden

Das Beispiel "Nutzung einer REST API" wird um den Versand von Emails erweitert,
um die geladenen Daten zu versenden.

Dazu muss der Prozess nur mit folgenden drei Schritten abegändert werden:

1. Die Abfrage der Email-Adresse
1. Eine Bestätigung anfordern
1. Der Versand einer Email mit dem Wechselkurs

Um das zu erreichen, müssen ein paar Vorbereitungen getroffen werden.

Den Pool und das Startevent zu `Sending mails` umbenennen und
die Lane vergrößern, da mehr Platz benötigt wird.

Dazu klickt man doppelt auf den Poolname und gibt `Sending mails` ein.

<img src="../images/poolname.png" width="35%" />

Das selbe auch bei dem Startevent.
Fertig sieht es so aus:

<img src="../images/renamed_poolname_startevent.png" width="35%" />

{% video controls="controls"%}../images/preparation-send-email.mp4{% endvideo %}

Als nächstes erstellt man einen User[task](../../anhang/Glossary.md)
mit dem Namen `Get Email Address`,
der den User per UI dazu auffordert eine E-Mail anzugeben.

{% video controls="controls"%}../images/get_email_address-send-email.mp4{% endvideo %}

Dann muss der `Show Data` [Task](../../anhang/Glossary.md) zu `Confirm Data`
[Task](../../anhang/Glossary.md) umbenannt werden und der Wert der
`uiConfig` Property zu folgendem Wert abgeändert werden.

Dabei ist zu beachten, dass der `Fetch Data` [Task](../../anhang/Glossary.md)
die ID `fetch_data` bekommt.

Folgendes ist in das Feld `uiConfig` einzutragen:

```
${ "message": "1 EUR = " + JSON.parse(token.history.fetch_data.result).rates.USD + " USD - email: " + token.current.email, "layout": [ { "key": "confirm", "label": "OK"}, { "key": "cancel", "label": "cancel"}] };
```

{% video controls="controls"%}../images/confirm_data-send-email.mp4{% endvideo %}

Als nächstes wird eine Überprüfung angelegt;
es ist zu prüfen, ob in der `Confirm Data` [Task](../../anhang/Glossary.md)
Confirm oder Cancel ausgewählt wurde;

Diese Auswahl hat Einfluss auf den weiteren Prozessweg; Cancel beendet den
Prozess; Confirm löst den `Send email` [Task](../../anhang/Glossary.md) aus.

Der letzte Prozessschritt ist der `Send email`
[Task](../../anhang/Glossary.md). Dieser muss die folgenden Eigenschaften
erhalten:

```
module  MailService
method	send
params	[null, token.history.get_email.email, "EUR to USD conversion rate", "1 EUR = " + JSON.parse(token.history.fetch_data.result).rates.USD + " USD"]
```

Nach diesem [Task](../../anhang/Glossary.md) muss der Prozess beendet werden.


{% video controls="controls"%}../images/send_email-send-email.mp4{% endvideo %}

Dann kann das ganze getestet werden:

{% video controls="controls"%}../images/run-sending-mails.mp4{% endvideo %}
