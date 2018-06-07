# Emails versenden

Das Beispiel "Verwendung einer REST API" wird um den Versand von Emails
erweitert, um die geladenen Daten zu versenden.

Dazu muss der Prozess um die folgenden drei
[Tasks](../../GLOSSARY.md#task) erweitert werden:

1. Die Abfrage der Email-Adresse
1. Die Anforderung einer Bestätigung
1. Den Versand einer Email mit dem Wechselkurs

## Vorbereitungen

Vorweg müssen ein paar Vorbereitungen getroffen werden.

### Prozess-Rahmenbedingungen

{% video controls="controls"%}../images/getting-started/sending-emails/preparation-send-email.mp4{% endvideo %}

Den [Pool](../../GLOSSARY.md#pool) und das Startevent zu `Sending mails`
umbenennen; die [Lane](../../GLOSSARY.md#lane) vergrößern, da mehr Platz
benötigt wird.

Dazu klickt man doppelt auf den Poolname und gibt `Sending mails` ein.

<img src="../images/getting-started/sending-emails/rename_poolname.png" width="35%" />

Dasselbe wird auch bei dem Startevent gemacht.

Fertig sieht das Ganze so aus:

<img src="../images/getting-started/sending-emails/renamed_poolname_and_startevent.png" width="35%" />

### Aus "Show Data" wird "Confirm Data"

Dann muss der `Show Data`-[Task](../../GLOSSARY.md#task) zu `Confirm
Data` umbenannt werden. Der Wert der `uiConfig` Property muss zu folgendem Wert
abgeändert werden:

```
${ "message": "1 EUR = " + token.current.rates.USD + " USD - email: " + token.current.email, "layout": [ { "key": "confirm", "label": "OK"}, { "key": "cancel", "label": "cancel"}] };
```

{% video controls="controls"%}../images/getting-started/sending-emails/rename_show_data_to_confirm_data.mp4{% endvideo
%}

So sieht der Task `Confirm Data` dann am Ende aus:

<img src="../images/getting-started/sending-emails/rename_show_data_to_confirm_data.png" width="80%" />

## Neue Prozessschritte anlegen

Nun, da die Vorbereitungen erledigt sind, können die weiteren notwendigen
Prozessschritte modelliert werden.

### User Task erstellen und konfigurieren

Als nächstes erstellt man einen [User Task](../../GLOSSARY.md#user-task)
mit dem Namen `Get Email Address`. Dieser fordert den User per UI dazu auf eine
E-Mail anzugeben.

{% video controls="controls"%}../images/getting-started/sending-emails/create_task_get_email_address.mp4{%
endvideo %}

Zusammengefasst ergibt sich daraus ein `User Task` namens `Get Email Address`
mit folgender Konfiguration:

General:

<img src="../images/getting-started/sending-emails/create_task_get_email_address_general.png" width="80%" />

Forms:

<img src="../images/getting-started/sending-emails/create_task_get_email_address_forms.png" width="80%" />

Extension Properties:

<img src="../images/getting-started/sending-emails/create_task_get_email_address_extensions.png" width="80%" />

### Task Resultate in Mapper zusammenführen

Bevor wir mit dem eigentlichen Modellieren weitermachen können, stellt sich
uns noch ein kleines Problem in den Weg.

**Situation**
Ein `User Task` hat **niemals** Zugriff auf den Parameter `token.history`!
Das hat zur Folge, dass der User Task `Confirm Data` keinen direkten Zugriff
auf die Daten des Service Tasks `Fetch Data` haben kann!

**Lösung**:
Wie der `ServiceTask`, hat ein `UserTask` immer Zugriff auf den Parameter
`token.current`.

Mit dieser Information im Hinterkopf, können wir einen Mapper definieren,
der uns die Ergebnisse aus den beiden vorangegangenen Tasks zusammengefasst
bereitstellt.

Was nun zu tun ist:
An der Sequenz **nach** dem UserTask `Get Email Address` muss unter `Extensions`
ein Property `mapper` mit folgendem Wert angelegt werden:
```
{rates: token.history.ServiceTask_FetchData.result.rates, email: token.history.UserTask_GetEmailAddress}
```

{% video controls="controls"%}../images/getting-started/sending-emails/add_result_mapper_to_sequence_flow.mp4{% endvideo %}


### Bestätigungsüberprüfung

Als Nächstes wird eine Überprüfung angelegt.

Es ist zu prüfen, ob in dem `Confirm Data`-[Task](../../GLOSSARY.md#task)
Confirm oder Cancel ausgewählt wurde; wir benutzen ein `Gateway` dafür.

Diese Auswahl hat Einfluss auf den weiteren Prozessweg. Cancel beendet den
Prozess; Confirm löst den `Send email`-[Task](../../GLOSSARY.md#task)
aus.

Der letzte Prozessschritt ist der `Send
email`-[Task](../../GLOSSARY.md#task). Dieser muss die folgenden
Eigenschaften erhalten:

```
module  MailService
method  send
params  [null, token.history.UserTask_GetEmailAddress.email, "EUR to USD conversion rate", "1 EUR = " + token.history.ServiceTask_FetchData.result.rates.USD + " USD"]
```

Nach diesem [Task](../../GLOSSARY.md#task) muss der Prozess beendet
werden.

{% video controls="controls"%}../images/getting-started/sending-emails/confirm-and-send-email.mp4{% endvideo %}


> TODO: Bild- & Videomaterial aktualisieren, Textstellen anpassen, falls nötig


Hinzufügen eines Gateways:

<img src="../images/getting-started/sending-emails/add_gateway.png" width="35%" />

Hinzufügen von Flows und einem
[Service Task](../../GLOSSARY.md#service-task)(`Send email`):

<img src="../images/getting-started/sending-emails/add_flows_with_names.png" width="35%" />

Hinzufügen der entsprechenden Überprüfungen:

<img src="../images/getting-started/sending-emails/add_condition_ok.png" width="60%" />

<img src="../images/getting-started/sending-emails/add_condition_cancel.png" width="60%" />

Setzen der Properties für den
[Service Task](../../GLOSSARY.md#service-task):

<img src="../images/getting-started/sending-emails/add_service_task_and_its_properties.png" width="60%" />

Dann kann das ganze getestet werden:

{% video controls="controls"%}../images/getting-started/sending-emails/run-full-process.mp4{% endvideo %}

Das fertige Prozessmodell sieht wie folgt aus:

<img src="../images/getting-started/sending-emails/finished_process_diagram.png" width="100%" />
