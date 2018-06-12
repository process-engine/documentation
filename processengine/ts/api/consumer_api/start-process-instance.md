# Starten eines Prozessmodells

* [Starten und auf ein System Event warten](#starten-und-auf-ein-system-event-warten)
* [Starten und auf ein bestimmtes EndEvent warten](#starten-und-auf-ein-bestimmtes-endevent-warten)

## Starten und auf ein System Event warten

```TypeScript
import {
  ConsumerContext,
  IConsumerApiService,
  ProcessStartResponsePayload,
  ProcessStartResponsePayload,
  StartCallbackType,
} from '@process-engine/consumer_api_contracts';

const consumerApiService: IConsumerApiService; // Get via IoC

const context: ConsumerContext = {
  identity: 'insertJwtTokenHere',
}

// Required paramters
const processModelKey = 'test_consumer_api_process_start';
const startEventKey = 'StartEvent_1';

// Optional parameters
const payload: ProcessStartRequestPayload = {
  correlation_id: 'randomcorrelationid',
  input_values: {},
};
const startCallbackType: StartCallbackType = StartCallbackType.CallbackOnProcessInstanceCreated;

// Start the process instance
const result: ProcessStartResponsePayload = await consumerApiService.startProcessInstance(consumerContext, processModelKey, startEventKey, payload, startCallbackType);
```

### Ziel/UseCase

Startet eine Prozessinstanz durch das Auslösen eines Start-Events. Die Schnittstelle
antwortet, sobald ein gegebenes System-EndEvent erreicht wurde.

### Parameter

#### Erforderliche Parameter

* `context` - Der [ConsumerContext](./public_api.md#consumercontext) des aufrufenden Benutzers
* `process_model_key` - Der Key der das Prozessmodell identifiziert, welches
  gestartet werden soll.
* `start_event_key` - Der Key des StartEvents, Das zum starten des Prozesses
  ausgelöst werden soll.

#### Optionale Parameter

* `correlation_id` - Eine ID, anhand derer der gestartete Vorgang identifiziert
  werden kann. Wenn nicht angegeben, wird die Process Engine eine correlation_id
  generieren.

* `input_values` - Eingabewerte, mit denen der Prozess gestartet wird.

* `startCallbackType` - Gibt an, wann die Schnittstelle antwortet.
  * `CallbackOnProcessInstanceCreated` - Die Schnittstelle antwortet, wenn die
    Prozessinstanz **gestartet**  wurde.
  * `CallbackOnEndEventReached` - Die Schnittstelle antwortet, wenn die
    Prozessinstanz durch ein EndEvent **beendet** wurde.
  * Siehe: [StartCallbackType](./public_api.md#startcallbacktype)

  Wenn nicht angegeben, wird implizit `CallbackOnProcessInstanceCreated` verwendet.

### Rückgabewerte

Die Rückgabe der Methode entspricht dem Typen [ProcessStartResponsePayload](./public_api.md#processstartresponsepayload)
und enthält die correlation_id des gestarteten Vorgangs:

```JSON
{
  "correlation_id": "d44c820a-9a78-44b4-af64-5968625cffad"
}
```

### Fehler, die bei einer Fehlbenutzung erwartet werden müssen

Mögliche auftretende Fehler sind:
- `400`:
    - Die bereitgestellten `input_values` sind ungültig
    - Der bereitgestellte Wert für `return_on` ist ungültig
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer hat auf den angegebenen Prozess keinen Zugriff
- `404`:
  - Es konnte kein Prozessmodell mit dem gegebenen `process_model_key`
    gefunden werden
  - Das Prozessmodell hat kein Startevent mit dem angegebenen `start_event_key`
- `500`:
  - Der Prozess konnte wegen eines internen Fehlers nicht gestartet werden
  - Der Prozess brach vor erreichen des angegebenen `return_on` Events wegen
    eines Fehlers vorzeitig ab
  - Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

## Starten und auf ein bestimmtes EndEvent warten

```TypeScript
import {
  ConsumerContext,
  IConsumerApiService,
  ProcessStartResponsePayload,
  ProcessStartResponsePayload,
} from '@process-engine/consumer_api_contracts';

const consumerApiService: IConsumerApiService; // Get via IoC

const context: ConsumerContext = {
  identity: 'insertJwtTokenHere',
}

// Required parameters
const processModelKey = 'test_consumer_api_process_start';
const startEventKey = 'StartEvent_1';
const endEventKey = 'EndEvent_Success';

// optional parameters
const payload = {};

// Start the process instance
const result = await consumerApiService.startProcessInstanceAndAwaitEndEvent(consumerContext, processModelKey, startEventKey, endEventKey, payload);
```

### Ziel/UseCase

Startet einen Prozess durch das Auslösen eines Start-Events. Die Schnittstelle
antwortet, sobald ein gegebenes BPMN-EndEvent erreicht wurde.

### Parameter

#### Erforderliche Parameter

* `context` - Der [ConsumerContext](./public_api.md#consumercontext) des aufrufenden Benutzers
* `process_model_key` - Der Key der das Prozessmodell identifiziert, welches
  gestartet werden soll.
* `start_event_key` - Der Key des StartEvents, Das zum starten des Prozesses
  ausgelöst werden soll.
* `end_event_key` - Der Key des EndEvents, bei dessen erreichen die
  Schnittstelle antwortet

#### Optionale Parameter

* `correlation_id` - Eine ID, anhand derer der gestartete Vorgang identifiziert
  werden kann. Wenn nicht angegeben, wird die Process Engine eine correlation_id
  generieren.

* `input_values` - Eingabewerte, mit denen der Prozess gestartet wird.

### Rückgabewerte

Die Rückgabe der Methode entspricht dem Typen [ProcessStartResponsePayload](./public_api.md#processstartresponsepayload)
und enthält die correlation_id des gestarteten Vorgangs:

```JSON
{
  "correlation_id": "d44c820a-9a78-44b4-af64-5968625cffad"
}
```

### Fehler, die bei einer Fehlbenutzung erwartet werden müssen

Mögliche auftretende Fehler sind:
- `400`: Der bereitgestellte request body ist ungültig
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer hat auf den angegebenen Prozess keinen Zugriff
- `404`:
  - Es konnte kein Prozessmodell mit dem angegebenen `process_model_key`
    gefunden werden
  - Das Prozessmodell hat kein StartEvent mit dem gegebenen `start_event_key`
  - Das Prozessmodell hat kein EndEvent mit dem gegebenen `end_event_key`
- `500`:
  - Der Prozess konnte wegen eines internen Fehlers nicht gestartet werden
  - Der Prozess brach vor erreichen des angegebenen `return_on` Events wegen
    eines Fehlers vorzeitig ab
  - Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

### Besonderheiten bei Prozessabbruch

Wenn der Prozess aufgrund eines Fehlers beendet wird, ohne dass das angegebene
EndEvent erreicht wird, wird die Fehlernachricht keine Details dazu beinhalten,
da der Verwender unter Umständen nicht berechtigt ist, diese Details einzusehen.
