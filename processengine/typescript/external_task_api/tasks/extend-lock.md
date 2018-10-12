# Sperrzeiten verlängern

Siehe [Konzept zum verlängern von Sperrzeiten](../../../../api/external_task_api/tasks/extend-lock.md).

> WIP - Add Snippet

## Parameter

### Erforderliche Parameter

- `identity`: Die Identität des anfragenden Workers.
- `workerId`: Die ID des anfragenden Workers.
- `externalTaskId`: Die ID des ExternalTask, für welche der Worker seine
Reservierung verlängern will
- `additionalDuration`: Die Zeit in ms, ausgehend vom aktuellen Zeitpunkt, um
welche der Worker die Reservierung des ExternalTasks verlängern will

### Optionale Parameter

Die Funktion hat keine optionalen Parameter.

## Rückgabewerte

Im Erfolgsfall gibt diese Methode keinen Wert zurück.

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
