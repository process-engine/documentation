# Starten einer Prozessinstanz

Siehe [Konzept zum Starten von Prozessinstanzen](../../../../api/consumer_api/tasks/start-process-instance.md).

```TypeScript
import {
  ConsumerContext,
  IConsumerApiService,
  ProcessStartResponsePayload,
  ProcessStartResponsePayload,
  StartCallbackType,
} from '@process-engine/consumer_api_contracts';

// Retrieve through dependency injection
const consumerApiService: IConsumerApiService;

// The JWT token must be provided by the implementing application
const context: ConsumerContext = {
  identity: 'insertJwtTokenHere',
};

// Required paramters
const processModelKey = 'test_consumer_api_process_start';
const startEventKey = 'StartEvent_1';

// Optional parameters
const payload: ProcessStartRequestPayload = {
  correlationId: 'randomcorrelationid',
  inputValues: {},
};
const startCallbackType: StartCallbackType =
  StartCallbackType.CallbackOnEndEventReached;

const endEventKey = 'EndEvent_1';

// Start the process instance
const result: ProcessStartResponsePayload =
  await consumerApiService.startProcessInstance(consumerContext,
                                                processModelKey,
                                                startEventKey,
                                                payload,
                                                startCallbackType,
                                                endEventKey);
```

## Parameter

### Erforderliche Parameter

* `context` - Der [ConsumerContext](./public_api.md#consumercontext) des aufrufenden Benutzers
* `processModelKey` - Der Key der das Prozessmodell identifiziert, welches
  gestartet werden soll
* `startEventKey` - Der Key des StartEvents, Das zum starten des Prozesses
  ausgelöst werden soll
* `endEventKey` - Der Key des EndEvents, bei dessen erreichen die
  Schnittstelle antwortet. Wird nur ausgewertet, wenn `startCallbackType`
  auf `CallbackOnEndEventReached` gesetzt wurde, ist dann aber Pflichtangabe

### Optionale Parameter

* `payload` - Enthält [Parameter für den Prozessstart](./public_api.md#processstartrequestpayload)
* `startCallbackType` - Gibt an, wann die Schnittstelle antwortet
  * `CallbackOnProcessInstanceCreated` - Die Schnittstelle antwortet, wenn die
    Prozessinstanz **gestartet**  wurde
  * `CallbackOnProcessInstanceFinished` - Die Schnittstelle antwortet, wenn die
    Prozessinstanz **beendet**  wurde
  * `CallbackOnEndEventReached` - Die Schnittstelle antwortet, wenn die
    Prozessinstanz durch ein bestimmtes EndEvent **beendet** wurde
  * Default ist `CallbackOnProcessInstanceCreated`
  * Siehe: [StartCallbackType](./public_api.md#startcallbacktype)

## Rückgabewerte

Die Rückgabe der Methode entspricht dem Typen [ProcessStartResponsePayload](./public_api.md#processstartresponsepayload)
und enthält die correlationId des gestarteten Vorgangs:

```JSON
{
  "correlationId": "d44c820a-9a78-44b4-af64-5968625cffad"
}
```

## Fehler, die bei einer Fehlbenutzung erwartet werden müssen

Mögliche auftretende Fehler sind:
- `400`:
    - Die bereitgestellten `inputValues` sind ungültig
    - Der bereitgestellte Wert für `startCallbackType` ist ungültig
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer hat auf den angegebenen Prozess keinen Zugriff
- `404`:
  - Es konnte kein Prozessmodell mit dem gegebenen `processModelKey`
    gefunden werden
  - Das Prozessmodell hat kein Startevent mit dem angegebenen `startEventKey`
  - Das Prozessmodell hat kein EndEvent mit dem gegebenen `endEventKey`
- `500`:
  - Der Prozess konnte wegen eines internen Fehlers nicht gestartet werden
  - Der Prozess brach vor erreichen des angegebenen `startCallbackType` Events wegen
    eines Fehlers vorzeitig ab
  - Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf
