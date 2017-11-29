## E-Mails versenden

Nun erweitern wir das Beispiel Nutzung einer REST API, sodass die geladenen Daten per E-Mail versendet werden.

Dazu updaten wir den Prozess so, dass dieser nach einer E-Mail-Adresse fragt, eine Bestätigung anfordert und dann eine E-Mail mit dem Wechselkurs an die entsprechende E-Mail versendet.

Um das zu erreichen, müssen erst ein paar Vorbereitungen getroffen.
Dazu wir der Pool und der Startpunkt zu `Emails versenden` umbenannt und die Lane vergrößert, da mehr Platz benötigt wird.

> Video






          * `0:00 - 0:09` Den Prozess zu `E-Mails versenden` umbenennen                                                     x
          * `0:10 - 0:17` Die Lane vergrößern, um mehr Platz zu schaffen                                                    x
          * `0:18 - 1:14` Füge eine Form hinzu, die nach der Email fragt
          * `1:17 - 1:20` Gib der `Fetch Data` Task eine ID, damit man später auf ihre Daten zugreifen kann
          * `1:22 - 1:27` Lösche den nicht mehr benötigten Mapper
          * `1:27 - 1:54` Bennene die `Show Data` Task zu `Confirm Data` um                                                 x
          * `1:55 - 2:05` Füge ein Gateway hinzu, damit wir später bei einem `ok` eine E-Mail versenden und bei einem      x `cancel` abbrechen können
          * `2:06 - 3:10` Füge einen `Send email` Service-Task hinzu                                                        x
          * `3:15 - 3:52` Stelle die Gateway-Sequenzflüsse so ein, dass `ok` eine E-Mail versendet und `cancel` den Prozess abbricht.

         
{% video controls="controls"%}../images/create-send-email.mp4{% endvideo %}


Hier noch einmal die im Video kopierten Werte:

```
// uiConfig for "Confirm Data"
${ "message": "1 EUR = " + JSON.parse(token.history.fetch_data.result).rates.USD + " USD - email: " + token.current.email, "layout": [ { "key": "confirm", "label": "OK"}, { "key": "cancel", "label": "cancel"}] };

// params for "send mail"
[null, token.history.get_email_address.email, "EUR to USD conversion rate", "1 EUR = " + JSON.parse(token.history.fetch_data.result).rates.USD + " USD"]
```

Nun nur noch ausprobieren:

{% video controls="controls"%}../images/run-send-email.mp4{% endvideo %}
