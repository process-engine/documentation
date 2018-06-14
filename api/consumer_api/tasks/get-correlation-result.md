# Ergebnis einer Prozessinstanz abfragen

## Ziel/UseCase

Diese Funktion erlaubt es nach der Ausführung einer einzelnen Prozessinstanz,
das Ergebnis dieser abzufragen.

Dazu werden der Key des Prozessmodells und die ID der Correlation benötigt.

## Parameter

### Erforderliche Parameter

* `context` - Der Kontext in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert)
* `correlationId` - Die ID der Correlation, dessen Ergebnis abgefragt
  werden soll
* `processModelKey` - Der Key, der doe Prozessinstanz identifiziert, dessen
  Ergebnis abgefragt werden soll

### Optionale Parameter

Die Funktion hat keine optionalen Parameter.

## Rückgabewerte

Die Rückgabe der Methode enthält das Ergebnis der angefragten Prozessinstanz.

Wie das Ergebnis aussieht, hängt von der Gestaltung des Prozessmodells ab.
Allgemein kann man jedoch sagen, es wird nur das konkrete Prozessergebnis
zurückgegeben.
Die Token-History ist grundsätzlich **nicht** enthalten.

Beispiel:

```JSON
{
  "result": "some value"
}
```

## Was passiert in der Process Engine

- Es wird die Prozessinstanz gesucht, die zu den gegebenen Parametern passt
- Wenn der Benutzer das Ergebnis sehen darf, wird das Ergebnis zurückgegeben

## Fehler, die bei einer Fehlbenutzung erwartet werden müssen

Mögliche auftretende Fehler sind:
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer darf das Ergebnis nicht sehen
- `404`:
  - Es konnte keine Correlation mit dem angegebenen `correlationId`
    gefunden werden
  - Es konnte in der gegebenen Correlation kein Prozessmodell mit dem
    angegebenen `processModelKey` gefunden werden
- `500`:
  - Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

## REST/Messagebus API

Die HTTP-Route für die Schnittstelle sieht so aus:

```JavaScript
GET /correlations/:correlationId}/process_models/:process_model_key/result
```

## IConsumerApiService Schnittstelle

Die `IConsumerApiService` Schnittstelle implementiert diesen UseCase über die
Methode `getProcessResultForCorrelation`.

Diese Methode erwartet die oben beschriebenen Parameter
in folgender Reihenfolge:
- `context`
- `processModelKey`
- `correlationId`

## Zugriffsberechtigungen

Benutzer können stehts nur Ergebnisse von Prozessinstanzen einsehen, die sie
auch berechtigt sind zu sehen.

Ob sie das Prozessergebnis sehen können, richtet sich danach mit welchem
EndEvent der Prozess beendet wurde.

Liegt das EndEvent auf einer Lane, die der Benutzer berechtigt ist zu sehen,
darf er auch das Prozessergebnis einsehen.

Andernfalls wird ein 403 Fehler zurückgegben.
