# Emails versenden

Das Beispiel "Verwendung einer REST API" wird um den Versand von Emails erweitert,
um die geladenen Daten zu versenden.

Dazu muss der Prozess nur mit folgenden drei Schritten abgeändert werden:

1. Die Abfrage der Email-Adresse
1. Eine Bestätigung anfordern
1. Der Versand einer Email mit dem Wechselkurs

Um das zu erreichen, müssen ein paar Vorbereitungen getroffen werden.

{% video controls="controls"%}../images/preparation-send-email.mp4{% endvideo %}

Den Pool und das Startevent zu `Sending mails` umbenennen und
die Lane vergrößern, da mehr Platz benötigt wird.

#### 1.1  Vorbereitungen
Dazu klickt man doppelt auf den Poolname und gibt `Sending mails` ein.

<img src="../images/poolname.png" width="35%" />

Dasselbe wird auch bei dem Startevent gemacht.

Fertig sieht es so aus:

<img src="../images/renamed_poolname_startevent.png" width="35%" />

Als nächstes erstellt man einen [User Task](../../anhang/Glossary.md)
mit dem Namen `Get Email Address`,
der den User per UI dazu auffordert eine E-Mail anzugeben.

{% video controls="controls"%}../images/get_email_address-send-email.mp4{% endvideo %}

#### 1.2 Usertask erstellen und konfigurieren

<img src="../images/email_task_creation.png" width="60%" />

Hinzufügen einer ID:

<img src="../images/email_task_general.png" width="35%" />

Hinzufügen eines Formfields:

<img src="../images/email_task_forms.png" width="35%" />

Hinzufügen einer Property:

<img src="../images/email_task_extesions.png" width="35%" />

#### 1.3 Abändern vorhandener Tasks
Dann muss der `Show Data`-[Task](../../anhang/Glossary.md) zu `Confirm Data`
umbenannt werden und der Wert der
`uiConfig` Property zu folgendem Wert abgeändert werden:

```
${ "message": "1 EUR = " + JSON.parse(token.history.fetch_data.result).rates.USD + " USD - email: " + token.current.email, "layout": [ { "key": "confirm", "label": "OK"}, { "key": "cancel", "label": "cancel"}] };
```

Dabei ist zu beachten, dass der `Fetch Data`-[Task](../../anhang/Glossary.md)
die ID `fetch_data` bekommt.

{% video controls="controls"%}../images/confirm_data-send-email.mp4{% endvideo %}

Umbenennen des `Show Data`-Task:

<img src="../images/rename_to_confirm_task.png" width="60%" />

Anpassen der `uiConfig`:

<img src="../images/change_config_confirm_task.png" width="35%" />

Setzen einer ID beim `Fetch Data`-Task:

<img src="../images/set_id_fetch_data_task.png" width="35%" />

#### 2.1 Bestätigungsüberprüfung
Als nächstes wird eine Überprüfung angelegt.
Es ist zu prüfen, ob in dem `Confirm Data`-[Task](../../anhang/Glossary.md)
Confirm oder Cancel ausgewählt wurde; wir benutzen ein `Gateway` dafür.

Diese Auswahl hat Einfluss auf den weiteren Prozessweg. Cancel beendet den
Prozess und Confirm löst den `Send email`-[Task](../../anhang/Glossary.md) aus.

Der letzte Prozessschritt ist der `Send email`-[Task](../../anhang/Glossary.md).
Dieser muss die folgenden Eigenschaften
erhalten:

```
module  MailService
method	send
params	[null, token.history.get_email.email, "EUR to USD conversion rate", "1 EUR = " + JSON.parse(token.history.fetch_data.result).rates.USD + " USD"]
```

Nach diesem [Task](../../anhang/Glossary.md) muss der Prozess beendet werden.

{% video controls="controls"%}../images/send_email-send-email.mp4{% endvideo %}

Hinzufügen eines Gateways:

<img src="../images/add_gateway.png" width="35%" />

Hinzufügen von Flows und einem Service Task(`Send email`):

<img src="../images/add_flows_with_names.png" width="35%" />

Hinzufügen der entsprechenden Überprüfungen:

<img src="../images/add_condition_ok.png" width="60%" />

<img src="../images/add_condition_cancel.png" width="60%" />

Setzen der Properties für den Service Task:

<img src="../images/add_service_task_and_its_propertys.png" width="60%" />

Dann kann das ganze getestet werden:

{% video controls="controls"%}../images/run-sending-mails.mp4{% endvideo %}

Das fertige Prozessmodell sieht wie folgt aus:

<img src="../images/finished_process_diagram.png" width="100%" />
