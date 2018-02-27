# Emails versenden

Das Beispiel "Verwendung einer REST API" wird um den Versand von Emails
erweitert, um die geladenen Daten zu versenden.

Dazu muss der Prozess um die folgenden drei
[Tasks](../../anhang/GLOSSARY.md#task) erweitert werden:

1. Die Abfrage der Email-Adresse
1. Die Anforderung einer Bestätigung
1. Den Versand einer Email mit dem Wechselkurs

#### 1.1  Vorbereitungen

Vorweg müssen ein paar Vorbereitungen getroffen werden.

{% video controls="controls"%}../images/getting-started/sending-emails/preparation-send-email.mp4{% endvideo %}

Den [Pool](../../anhang/GLOSSARY.md#pool) und das Startevent zu `Sending mails`
umbenennen; die [Lane](../../anhang/GLOSSARY.md#lane) vergrößern, da mehr Platz
benötigt wird.

Dazu klickt man doppelt auf den Poolname und gibt `Sending mails` ein.

<img src="../images/getting-started/sending-emails/poolname.png" width="35%" />

Dasselbe wird auch bei dem Startevent gemacht.

Fertig sieht es so aus:

<img src="../images/getting-started/sending-emails/renamed_poolname_startevent.png" width="35%" />

#### 1.2 User Task erstellen und konfigurieren

Als nächstes erstellt man einen [User Task](../../anhang/GLOSSARY.md#user-task)
mit dem Namen `Get Email Address`. Dieser fordert den User per UI dazu auf eine
E-Mail anzugeben.

{% video controls="controls"%}../images/getting-started/sending-emails/get_email_address-send-email.mp4{%
endvideo %}

Auswählen der User Task:

<img src="../images/getting-started/sending-emails/email_task_creation.png" width="60%" />

Hinzufügen einer ID:

<img src="../images/getting-started/sending-emails/email_task_general.png" width="35%" />

Hinzufügen eines Formfields:

<img src="../images/getting-started/sending-emails/email_task_forms.png" width="35%" />

Hinzufügen einer Property:

<img src="../images/getting-started/sending-emails/email_task_extensions.png" width="35%" />

#### 1.3 Abändern vorhandener Tasks

Dann muss der `Show Data`-[Task](../../anhang/GLOSSARY.md#task) zu `Confirm
Data` umbenannt werden. Der Wert der `uiConfig` Property muss zu folgendem Wert
abgeändert werden:

```
${ "message": "1 EUR = " + JSON.parse(token.history.fetch_data.result).rates.USD + " USD - email: " + token.current.email, "layout": [ { "key": "confirm", "label": "OK"}, { "key": "cancel", "label": "cancel"}] };
```

Dabei ist zu beachten, dass der `Fetch
Data`-[Task](../../anhang/GLOSSARY.md#task) die ID `fetch_data` bekommt.

{% video controls="controls"%}../images/getting-started/sending-emails/confirm_data-send-email.mp4{% endvideo
%}

Umbenennen des `Show Data`-Task:

<img src="../images/getting-started/sending-emails/rename_to_confirm_task.png" width="60%" />

Anpassen der `uiConfig`:

<img src="../images/getting-started/sending-emails/change_config_confirm_task.png" width="35%" />

Setzen einer ID beim `Fetch Data`-Task:

<img src="../images/getting-started/sending-emails/set_id_fetch_data_task.png" width="35%" />

#### 2.1 Bestätigungsüberprüfung

Als Nächstes wird eine Überprüfung angelegt.

Es ist zu prüfen, ob in dem `Confirm Data`-[Task](../../anhang/GLOSSARY.md#task)
Confirm oder Cancel ausgewählt wurde; wir benutzen ein `Gateway` dafür.

Diese Auswahl hat Einfluss auf den weiteren Prozessweg. Cancel beendet den
Prozess; Confirm löst den `Send email`-[Task](../../anhang/GLOSSARY.md#task)
aus.

Der letzte Prozessschritt ist der `Send
email`-[Task](../../anhang/GLOSSARY.md#task). Dieser muss die folgenden
Eigenschaften erhalten:

```
module  MailService
method  send
params  [null, token.history.get_email.email, "EUR to USD conversion rate", "1 EUR = " + JSON.parse(token.history.fetch_data.result).rates.USD + " USD"]
```

Nach diesem [Task](../../anhang/GLOSSARY.md#task) muss der Prozess beendet
werden.

{% video controls="controls"%}../images/getting-started/sending-emails/send-email.mp4{% endvideo %}

Hinzufügen eines Gateways:

<img src="../images/getting-started/sending-emails/add_gateway.png" width="35%" />

Hinzufügen von Flows und einem
[Service Task](../../anhang/GLOSSARY.md#service-task)(`Send email`):

<img src="../images/getting-started/sending-emails/add_flows_with_names.png" width="35%" />

Hinzufügen der entsprechenden Überprüfungen:

<img src="../images/getting-started/sending-emails/add_condition_ok.png" width="60%" />

<img src="../images/getting-started/sending-emails/add_condition_cancel.png" width="60%" />

Setzen der Properties für den
[Service Task](../../anhang/GLOSSARY.md#service-task):

<img src="../images/getting-started/sending-emails/add_service_task_and_its_properties.png" width="60%" />

Dann kann das ganze getestet werden:

{% video controls="controls"%}../images/getting-started/sending-emails/run-sending-mails.mp4{% endvideo %}

Das fertige Prozessmodell sieht wie folgt aus:

<img src="../images/getting-started/sending-emails/finished_process_diagram.png" width="100%" />
