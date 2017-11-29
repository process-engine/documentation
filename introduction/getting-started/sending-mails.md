## E-Mails versenden

Nun erweitern wir das Beispiel Nutzung einer REST API, sodass die geladenen Daten per E-Mail versendet werden.

Dazu updaten wir den Prozess so, dass dieser nach einer E-Mail-Adresse fragt, eine Bestätigung anfordert und dann eine E-Mail mit dem Wechselkurs an die entsprechende E-Mail versendet.

Um das zu erreichen, müssen erst ein paar Vorbereitungen getroffen werden.
Dazu wir der Pool und der Startpunkt zu `Emails versenden` umbenannt und die Lane vergrößert, da mehr Platz benötigt wird.

{% video controls="controls"%}../images/preparation-send-email.mp4{% endvideo %}

Als nächstes erstellt man einen `Get email address`-[Task](../../anhang/Glossary.md), in welchem der User per UI dazu aufgefordert wird eine Email anzugeben.

{% video controls="controls"%}../images/get_email_address-send-email.mp4{% endvideo %}

Dann muss die `Show Data`-[Task](../../anhang/Glossary.md) zu `Confirm Data`-[Task](../../anhang/Glossary.md) umbenannt werden und den Wert der `uiConfig`-Property zu den folgenden Wert abgeändert werden. Dabei ist auch wichtig, dass der `Fetch Data`-[Task](../../anhang/Glossary.md) die ID `fetch_data` bekommt.

```
${ "message": "1 EUR = " + JSON.parse(token.history.fetch_data.result).rates.USD + " USD - email: " + token.current.email, "layout": [ { "key": "confirm", "label": "OK"}, { "key": "cancel", "label": "cancel"}] };
```

{% video controls="controls"%}../images/confirm_data-send-email.mp4{% endvideo %}

Als nächstes muss noch eine Überprüfung, ob in der `Confirm Data`-[Task](../../anhang/Glossary.md) confirm oder cancel ausgewählt wurde, eingebaut werden. Diese soll dann dementsprechend den Prozess beenden oder in die noch zu erstellende `Send email`-[Task](../../anhang/Glossary.md) weiterleiten.
Schlussendlich wird dann der `Send email`-[Task](../../anhang/Glossary.md) erstellt. Dieser muss dann nur noch die folgenden Eigenschaften erhalten. Nach diesem [Task](../../anhang/Glossary.md) muss der Prozess nur noch beendet werden.

```
module  MailService
method	send
params	[null, token.history.get_email.email, "EUR to USD conversion rate", "1 EUR = " + JSON.parse(token.history.fetch_data.result).rates.USD + " USD"]
```

{% video controls="controls"%}../images/send_email-send-email.mp4{% endvideo %}

Dann kann das ganze getestet werden:

{% video controls="controls"%}../images/run-send-email.mp4{% endvideo %}
