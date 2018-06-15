# Ergebnis einer Prozessinstanz abfragen

Siehe [Konzept zum Abfragen von Ergebnissen einer Prozessinstanz](../../../../api/consumer_api/tasks/get-correlation-result.md).

```TypeScript
import {
  ConsumerContext,
  IConsumerApiService,
  ICorrelationResult,
} from '@process-engine/consumer_api_contracts';

// Retrieve through dependency injection
const consumerApiService: IConsumerApiService;

// The JWT token must be provided by the implementing application
const context: ConsumerContext = {
  identity: 'insertJwtTokenHere',
};

// Required paramters
const processModelKey = 'test_consumer_api_process_start';
const correlationId = 'someCorrelationId';

// Get the correlation result
const result: ICorrelationResult = await consumerApiService.getProcessResultForCorrelation(consumerContext, correlationId, processModelKey);
```

## Parameter

### Erforderliche Parameter

* `context` - Der [ConsumerContext](./public_api.md#consumercontext) des aufrufenden Benutzers
* `correlation_id` - Die ID der Correlation, dessen Ergebnis abgefragt
  werden soll
* `process_model_key` - Der Key, der die Prozessinstanz identifiziert, dessen
  Ergebnis abgefragt werden soll

### Optionale Parameter

Die Funktion hat keine optionalen Parameter.

## Rückgabewerte

Die Rückgabe der Methode entspricht dem Typen [ICorrelationResult](./public_api.md#icorrelationresult)
und enthält das Ergebnis der angefragten Prozessinstanz.

Es wird nur das konrekte Prozessergebnis zurückgegeben, das bei
Prozessende vorlag.

Welche Informationen in dem Ergebnis stehen, hängt auch davon ab, welches der
modellierten EndEvents erreicht wurde.

Beispiel:

```JSON
{
  "result": "some value"
}
```

## Fehler, die erwartet werden müssen

Mögliche auftretende Fehler sind:
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer hat auf den angegebenen Prozess keinen Zugriff
- `404`:
  - Es konnte keine Correlation mit dem angegebenen `correlation_id`
    gefunden werden
  - Es konnte in der gegebenen Correlation kein Prozessmodell mit dem
    angegebenen `process_model_key` gefunden werden
- `500`:
  - Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf
