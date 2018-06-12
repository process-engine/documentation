# Ergebnis einer Prozesskorrelation abfragen

```TypeScript
import {
  ConsumerContext,
  IConsumerApiService,
  ICorrelationResult,
} from '@process-engine/consumer_api_contracts';

const consumerApiService: IConsumerApiService;

const context: ConsumerContext = {
  identity: 'insertJwtTokenHere',
}

// Required paramters
const processModelKey = 'test_consumer_api_process_start';
const correlationId = 'someCorrelationId';

// Get the correlation result
const result: ICorrelationResult = await consumerApiService.getProcessResultForCorrelation(consumerContext, correlationId, processModelKey);
```

## Ziel/UseCase

Diese Funktion erlaubt es nach der Ausführung einer einzelnen Prozessinstanz,
oder einer Prozesskorrelation das Ergebnis dieser abzufragen.

## Parameter

### Erforderliche Parameter

* `context` - Der [ConsumerContext](./public_api.md#consumercontext) des aufrufenden Benutzers
* `correlation_id` - Die ID der Korrelation, dessen Ergebnis abgefragt
  werden soll
* `process_model_key` - Der Key der das Prozessmodell identifiziert, dessen
  Ergebnis abgefragt werden soll.

### Optionale Parameter

Die Funktion hat keine optionalen Parameter.

## Rückgabewerte

Die Rückgabe der Methode entspricht dem Typen [ICorrelationResult](./public_api.md#icorrelationresult)
und enthält das Ergebnis der angefragten Korrelation.

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

## Fehler, die bei einer Fehlbenutzung erwartet werden müssen

Mögliche auftretende Fehler sind:
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer hat auf den angegebenen Prozess keinen Zugriff
- `404`:
  - Es konnte keine Korrelation mit dem angegebenen `correlation_id`
    gefunden werden
  - Es konnte in der gegebenen Korrelation kein Prozessmodell mit dem
    angegebenen `process_model_key` gefunden werden
- `500`:
  - Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf