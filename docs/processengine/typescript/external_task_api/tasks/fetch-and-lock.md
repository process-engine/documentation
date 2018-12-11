# ExternalTasks abrufen und sperren

Siehe [Konzept zum Abfragen und Sperren von ExternalTasks](../../../../api/external_task_api/tasks/fetch-and-lock.md).

> WIP - Add Snippet

## Parameter

### Erforderliche Parameter

- `identity`: Die Identität des anfragenden Workers.
- `workerId`: Die ID des anfragenden Workers.
- `topicName`: Das Topic, in welchem nach ExternalTasks gesucht werden soll.
- `maxTasks`: Die maximale Anzahl an Tasks, die reserviert und zurückgegeben
werden soll.
- `longPollingTimeout`: Die Zeit in ms, die der Server warten soll,
bevor eine Antwort gesendet wird. Dieser Timeout wird nur dann berücksichtigt,
falls zum initialen Zeitpunkt der Anfrage keine ExternalTasks zur Verarbeitung
verfügbar sind.
Siehe [hier](https://docs.camunda.org/manual/latest/user-guide/process-engine/external-tasks/#long-polling-to-fetch-and-lock-external-tasks)
- `lockDuration`: Die Dauer in ms, für welche die ExternalTasks für den Worker
reserviert werden sollen.

### Optionale Parameter

Die Funktion hat keine optionalen Parameter.

## Rückgabewerte

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
  "topic": "some_sample_topic",
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
  "topic": "some_sample_topic",
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
- `401`: Der anfragende Worker hat keine gültige Authentifizierung
- `403`: Der anfragende Worker ist nicht berechtigt diesen Request
auszuführen
- `500`: Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf
