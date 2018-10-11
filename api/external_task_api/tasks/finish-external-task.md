# Abschließen eines UserTasks

## Ziel/UseCase

Wenn ein Worker einen ExternalTask fertig bearbeitet hat, kann er über diese
Methode dies der ExternalTaskAPI mitteilen.
Die ExternalTaskAPI wird den Task entsprechend aktualisieren und als "beendet"
markieren.
Ab diesem Zeitpunkt hat dann kein Worker mehr Zugriff auf diesen ExternalTask.

Ebenfalls wird die ProcessEngine über den EventAggregator darüber benachrichtigt,
dass der ExternalTask beendet wurde.
Dies erlaubt der ProcessEngine die Ausführung ihres Prozessmodells fortzusetzen.

## Zugriffsberechtigungen

Worker können nur die UserTasks abschließen, die sie auch berechtigt
sind zu sehen.

## Was passiert in der ProcessEngine

- Es wird der passende ExternalTask abgefragt
- Es wird geprüft, ob der anfragende Worker berechtigt ist den ExternalTask
zu beenden
- Ist dies der Fall, wird der ExternalTask mit dem mitgegebenen Ergebnis beendet
- Anschließend wird die ProcessEngine über die Beendigung des ExternalTasks
informiert

## Parameter

### Erforderliche Parameter

- `workerId`: Die ID des anfragenden Workers.
- `externalTaskId`: Die ID des abzuschließenden ExternalTasks.
- `result`: Das Ergebnis, mit welchem der Worker den ExternalTask
beenden will.


### Optionale Parameter

Die Funktion hat keine optionalen Parameter.

## Ergebnis/Rückgabewerte

Bei Erfolg ist das Ergebnis leer.

## Fehler, die erwartet werden müssen

Mögliche auftretende Fehler sind:
- `401`: Der anfragende Worker hat keine gültige Authentifizierung
- `403`: Der anfragende Worker ist nicht berechtigt diesen Request auszuführen
- `404`: Es konnte kein ExternalTask mit der gegebenen `externalTaskId`
    gefunden werden
- `410`: Der angegbene ExternalTask wurde bereits abgeschlossen und ist nicht
mehr verfügbar
- `423`: Der angegbene ExternalTask wurde bereits durch einen anderen Worker
reserviert und ist für den anfragenden Worker gesperrt.
- `500`: Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

## REST/Messagebus API

Die HTTP-Route für die Schnittstelle sieht so aus:

```REST
POST /task/:external_task_id/finish
```

Es wird ein Post Body in folgendem Format erwartet:

```JSON
{
  "workerId": "Worker1",
  "result": "some result"
}
```

Alternativ kann `result` auch ein JSON Objekt sein:

```JSON
{
  "workerId": "Worker1",
  "result": {
    "field_1": "some result"
  }
}
```

## IExternalTaskApiService Schnittstelle

Die `IExternalTaskApiService` Schnittstelle implementiert diesen UseCase
über die Methode `finishExternalTask`.

Die Methode erwartet die oben beschriebenen Parameter.
Zusätzlich wird noch die `Identity` des Workers erwartet.
