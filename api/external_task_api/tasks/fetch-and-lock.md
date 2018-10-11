# ExternalTasks abrufen und reservieren

## Ziel/UseCase

Bezieht eine Liste aller ExternalTasks zu einem bestimmten Topic, die derzeit
zur Verarbeitung bereit stehen.
Die ermittelten Tasks werden für einen durch den Worker festgelegten Zeitraum
für diesen reserviert.
In dieser Zeit kann kein anderer Worker diese tasks bearbeiten.

## Zugriffsberechtigungen

Es werden nur diejenigen ExternalTasks zurück gegeben und reserviert, die
noch nicht abgeschlossen wurden und die nicht zum Zeitpunkt der Anfrage
durch einen anderen Worker reserviert wurden.

## Was passiert in der ProcessEngine

- Es werden alle verfügbaren ExternalTasks zu dem gegebenen Topic abgefragt
- ExternalTasks die derzeit durch andere Worker gesperrt sind werden gefiltert,
genauso wie jene, die bereits beendet wurden
- Die verbleibenen Tasks werden für den anfragenden Worker für einen bestimmten
Zeitraum reserviert
- Die angefragten Tasks werden an den Worker zurück gegeben

## Parameter

### Erforderliche Parameter

- `workerId`: Die ID des anfragenden Workers.
- `topicName`: Das Topic, in welchem nach ExternalTasks gesucht werden soll.
- `maxTasks`: Die maximale Anzahl an Tasks, die reserviert und zurückgegeben
werden soll.
- `longPollingTimeout`: Die Zeit in ms, die der Server warten soll, bevor er den
Request ausführt und eine Antwort sendet. Siehe [hier](https://docs.camunda.org/manual/latest/user-guide/process-engine/external-tasks/#long-polling-to-fetch-and-lock-external-tasks)
- `lockDuration`: Die Dauer in ms, für welche die ExternalTasks für den Worker
reserviert werden sollen.

### Optionale Parameter

Die Schnittstelle hat keine optionalen Parameter.

## Ergebnis/Rückgabewerte

Die ermittelten ExternalTasks werden als JSON-Array zurückgeben.
Jedes JSON Objekt in diesem Array beinhaltet dabei folgende Informationen:

* Die ID des externalTasks
* Zuordnungen zu Correlation, Prozessinstanz und FlowNodeInstanz, für welche der
ExternalTask erstellt wurde

Daraus ergibt sich z.B. folgende Response:

```JSON
[{
  "id": "ExternalTask1",
  "workerId": "Worker1",
  "topic": "some_samle_topic",
  "flowNodeInstanceId": "1234567",
  "correlationId": "23gb20tz51f",
  "processInstanceId": "2ncb13ßfg1b3g4g",
  "lockExpirationTime": "2018-10-11T13:57:42.496Z",
  "payload": {},
  "state": "pending",
  "createdAt": "2018-10-11T12:42:42.496Z",
}, {
  "id": "ExternalTask2",
  "workerId": "Worker1",
  "topic": "some_samle_topic",
  "flowNodeInstanceId": "374573495",
  "correlationId": "3b0vfg123f43b",
  "processInstanceId": "ß2cbß12fb1ß2hf",
  "lockExpirationTime": "2018-10-11T13:57:42.496Z",
  "payload": {},
  "state": "pending",
  "createdAt": "2018-10-11T12:59:11.496Z",
}]
```

## Fehler, die erwartet werden müssen

Mögliche auftretende Fehler sind:
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer ist nicht berechtigt diesen Request
auszuführen
- `500`: Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

## REST/Messagebus API

Die HTTP-Route für die Schnittstelle sieht so aus:

```REST
POST /fetch_and_lock
```

Es wird ein Post Body in folgendem Format erwartet:

```JSON
{
  "workerId": "Worker1",
  "topicName": "some_samle_topic",
  "maxTasks": 2,
  "longPollingTimeout": 500,
  "lockDuration": 30000
}
```

## IExternalTaskApiService Schnittstelle

Die `IExternalTaskApiService` Schnittstelle implementiert diesen UseCase
über die Methode `fetchAndLockExternalTasks`.

Die Methode erwartet die oben beschriebenen Parameter.
