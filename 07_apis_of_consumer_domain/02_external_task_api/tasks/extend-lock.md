# Sperrzeiten verlängern

## Ziel/UseCase

Ermöglicht es einem Worker die Reservierungsdauer ("lockoutDuration") für einen
ExternalTask zu verlängern.
Die Dauer ist in ms anzugeben und geht von der aktuellen Uhrzeit aus.

## Zugriffsberechtigungen

Ein Worker kann nur Reservierungen für ExternalTask verlängern, die er auch selbst
zuvor reserviert hat.
Ebenfalls darf der ExternalTask noch nicht abgeschlossen sein.

## Was passiert in der ProcessEngine

- Es wird der ExternalTask abgefragt, den der Worker weiter reservieren möchte
- Es wird geprüft ob der Worker den Task bearbeiten darf
  - Falls dies der Fall ist, wird die `lockoutDuration` des ExternalTasks
verlängert

## Parameter

### Erforderliche Parameter

- `workerId`: Die ID des anfragenden Workers.
- `externalTaskId`: Die ID des ExternalTask, für welche der Worker seine
Reservierung verlängern will
- `additionalDuration`: Die Zeit in ms, ausgehend vom aktuellen Zeitpunkt, um
welche der Worker die Reservierung des ExternalTasks verlängern will

### Optionale Parameter

Die Schnittstelle hat keine optionalen Parameter.

## Ergebnis/Rückgabewerte

War der Request erfolgreich, wird kein Ergebnis zurück gegeben.

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
POST /task/:external_task_id/extend_lock
```

Es wird ein Post Body in folgendem Format erwartet:

```JSON
{
  "workerId": "Worker1",
  "additionalDuration": 30000
}
```

## IExternalTaskApi Schnittstelle

Die `IExternalTaskApi` Schnittstelle implementiert diesen UseCase
über die Methode `extendLock`.

Die Methode erwartet die oben beschriebenen Parameter.
Zusätzlich wird noch die `Identity` des Workers erwartet.
