# Auflisten wartender UserTasks

### Ziel/UseCase

Holt `UserTasks`, die darauf warten bearbeitet zu werden.

### Erforderliche und Optionale Parameter

Die Schnittstelle erfordert die folgenden Parameter:

* `context` - Der Kontext in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert).

Die Schnittstelle bietet die folgenden optionalen Parameter:

* `process_model_key` - Wenn angegeben werden nur `UserTasks` angefragt, die zu
  dem ProzessModell gehören, das durch diesen Key identifiziert wird.
* `correlation_id` - Wenn angegeben werden nur `UserTasks` angefragt, die zu
  dem Vorgang gehören, der mit dieser ID identifiziert wird. Der Parameter
  erfordert, dass auch der `process_model_key` Parameter angegeben wird.


### Ergebnis/Rückgabewerte

Als Rückgabewert erhält man eine Liste mit `UserTasks`, die darauf warten
bearbeitet zu werden:

```JSON
{
  "user_tasks": [
    {
      "process_instance_id": "19ff240a-239e-4ee6-ac29-665fb3b57078",
      "user_task_key": "SomeUserTask1",
      "user_task_id": "004d6b6d-8467-4893-8b23-fe5f380389aa",
      "user_task_data": {
        "form_fields": [
          {
            "id": "someFormFieldId",
            "type": "string",
            "label": "someFormFieldLabel",
            "default_value": "someTestDefaultValue"
          }
        ]
      }
    },
    {
      "process_instance_id": "d8dc8881-dea2-4de6-9bdc-4f861908c5a5",
      "user_task_key": "SomeUserTask1",
      "user_task_id": "bad7bbbe-c984-4f38-8313-fb6efd0dc8f5",
      "user_task_data": {
        "form_fields": [
          {
            "id": "someFormFieldId2",
            "type": "string",
            "label": "someFormFieldLabel",
            "default_value": "someTestDefaultValue"
          }
        ]
      }
    },
    {
      "process_instance_id": "d8dc8881-dea2-4de6-9bdc-4f861908c5a5",
      "user_task_key": "SomeUserTask1",
      "user_task_id": "3269d275-58fd-42da-a8cd-926b5fd18cc8",
      "user_task_data": {
        "form_fields": [
          {
            "id": "someFormFieldId3",
            "type": "string",
            "label": "someFormFieldLabel",
            "default_value": "someTestDefaultValue"
          }
        ]
      }
    },
    {
      "process_instance_id": "d8dc8881-dea2-4de6-9bdc-4f861908c5a5",
      "user_task_key": "SomeUserTask2",
      "user_task_id": "0f833425-0318-43ff-8f78-44226949f16a",
      "user_task_data": {
        "form_fields": [
          {
            "id": "someFormFieldId4",
            "type": "string",
            "label": "someFormFieldLabel",
            "default_value": "someTestDefaultValue"
          }
        ]
      }
    }
  ]
}
```

### Was passiert in der Process Engine

- Wenn ein `process_model_key` angegeben wurde, werden alle UserTasks angefragt,
  die zu dem Prozessmodell gehören
- Wenn eine `correlation_id` angegeben wurde, werden alle UserTasks angefragt,
  die zu einer der Prozessinstanzen gehören, die zu der Correlation gehören
- Wenn ein `process_model_key` UND eine `correlation_id` angegeben wurde, wird
  geprüft ob das Prozessmodell zu einer Prozessinstanz gehört, die zu der
  Correlation gehört. Anschließend werden alle UserTasks angefragt, die zu einer
  der Prozessinstanzen gehören, die zu der Correlation gehören. Davon werden
  alle übernommen, die zu dem Prozessmodell gehören

### Fehler, die bei der Fehlbenutzung erwartet werden müssen

Mögliche auftretende Fehler sind:
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer ist nicht berechtigt diesen Request auszuführen
- `404`:
  - Das Prozessmodell gehört zu keiner der Prozessinstanzen, die zu der
    Correlation gehören
  - Es konnte kein Prozessmodell mit dem gegebenen `process_model_key`
    gefunden werden
  - Es konnte keine Correlation mit der gegebenen `correlation_id`
    gefunden werden
- `500`: Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

### REST/Messagebus API

Die HTTP-Routen für die Schnittstelle sehen so aus:

```JavaScript
// Holen aller wartenden UserTasks
GET /user_tasks

// Holen aller wartenden UserTasks zu einem ProzessModell
GET /process_models/{process_model_key}/user_tasks

// Holen aller wartenden UserTasks zu einem Vorgang
GET /process_models/{process_model_key}/correlations/{correlation_id}/user_tasks
```

### ggf. weitere sinnvolle Infos (z.B. Regelwerk, berechtigungen usw.)

Man erhält nur `UserTaks`, die man mit dem aktuell eingeloggten Benutzer auch
bearbeiten darf.
