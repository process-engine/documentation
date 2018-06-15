# Auflisten wartender UserTasks

## Ziel/UseCase

Holt `UserTasks`, die darauf warten bearbeitet zu werden.

## Zugriffsberechtigungen

Man erhält nur `UserTaks`, die der anfragende Benutzer auch bearbeiten darf.

## Was passiert in der Process Engine

- Wenn ein `processModelKey` angegeben wurde, werden alle UserTasks angefragt,
  die zu dem Prozessmodell gehören
- Wenn eine `correlationId` angegeben wurde, werden alle UserTasks angefragt,
  die zu einer der Prozessinstanzen gehören, die zu der Correlation gehören
- Wenn ein `processModelKey` **und** eine `correlationId` angegeben wurden, werden
  alle UserTasks ermittelt, die sich innerhalb der gegebenen Correlation befinden
  und zu einer Prozessinstanz mit passendem `ProcessModelKey` gehören

## Parameter

### Erforderliche Parameter

* `context` - Der Kontext in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert).

### Optionale Parameter

* `processModelKey` - Wenn angegeben, werden nur `UserTasks` angefragt, die zu
  dem ProzessModell gehören, das durch diesen Key identifiziert wird.
* `correlationId` - Wenn angegeben, werden nur `UserTasks` angefragt, die zu
  dem Vorgang gehören, der mit dieser ID identifiziert wird.

Werden beide Parameter in Kombination verwendet, werden nur die UserTasks
aufgelistet, die zu der passenden Prozessinstanz in der passenden Correlation
gehören.

## Ergebnis/Rückgabewerte

Als Rückgabewert erhält man eine Liste mit `UserTasks`, die darauf warten
bearbeitet zu werden:

```JSON
{
  "userTasks": [
    {
      "id": "004d6b6d-8467-4893-8b23-fe5f380389aa",
      "key": "SomeUserTask1",
      "processInstanceId": "19ff240a-239e-4ee6-ac29-665fb3b57078",
      "data": {
        "formFields": [
          {
            "id": "someFormFieldId",
            "type": "string",
            "label": "someFormFieldLabel",
            "defaultValue": "someTestDefaultValue"
          }
        ]
      }
    }
  ]
}
```

## Fehler, die bei der Fehlbenutzung erwartet werden müssen

Mögliche auftretende Fehler sind:
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer ist nicht berechtigt diesen Request auszuführen
- `404`:
  - Das Prozessmodell gehört zu keiner der Prozessinstanzen, die zu der
    Correlation gehören
  - Es konnte kein Prozessmodell mit dem gegebenen `processModelKey`
    gefunden werden
  - Es konnte keine Correlation mit der gegebenen `correlationId`
    gefunden werden
- `500`: Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

## REST/Messagebus API

Die HTTP-Routen für die Schnittstelle sehen so aus:

```JavaScript
// Holen aller wartenden UserTasks zu einer Correlation
GET /correlations/:correlation_id/user_tasks

// Holen aller wartenden UserTasks zu einem ProzessModell
GET /process_models/:process_model_key/user_tasks

// Holen aller wartenden UserTasks zu einem Vorgang
GET /process_models/:process_model_key/correlations/:correlation_id/user_tasks
```

## IConsumerApiService Schnittstelle

Die `IConsumerApiService` Schnittstelle implementiert diese UseCases über
3 Methoden:

- `getUserTasksForCorrelation`: Holt alle UserTasks in einer Correlation
  - Benötigt den Parameter `correlationId`
- `getUserTasksForProcessModel`: Holt alle UserTasks eines Prozessmodells
  - Benötigt den Parameter `processModelKey`
- `getUserTasksForProcessModelInCorrelation`: Holt alle UserTasks eines
  Prozessmodells in einer Correlation
  - Benötigt die Parameter `correlationId` und `processModelKey`
