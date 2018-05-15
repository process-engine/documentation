# Starten eines Prozessmodells

* [Starten und auf ein `System Event` warten](#starten-und-auf-ein-system-event-warten)
* [Starten und auf ein bestimmtes EndEvent warten](#starten-und-auf-ein-bestimmtes-endevent-warten)

## Starten und auf ein `System Event` warten

### Ziel/UseCase

Startet einen Prozess durch das Auslösen eines Start-Events. Die Schnittstelle
antwortet, je nach Verwendung der Parameter, entweder sofort nach dem
erfolgreichen Start des Prozesses, oder nachdem er beendet wurde.

### Erforderliche und Optionale Parameter

Die Schnittstelle erfordert die folgenden Parameter:

* `context` - Der Kontext in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert).
* `process_model_key` - Der Key der das Prozessmodell identifiziert, welches
  gestartet werden soll.
* `start_event_key` - Der Key des StartEvents, Das zum starten des Prozesses
  ausgelöst werden soll.

Die Schnittstelle bietet die folgenden optionalen Parameter:

* `correlation_id` - Eine ID, anhand derer der gestartete Vorgang identifiziert
  werden kann. Wenn nicht angegeben, wird die Process Engine eine correlation_id
  generieren.

* `input_values` - Eingabewerte, mit denen der Prozess gestartet wird.

* `startCallbackType` - Gibt an, wann die Schnittstelle antwortet. Mögliche Werte sind:
  * `CallbackOnProcessInstanceCreated` - Die Schnittstelle antwortet, wenn die
    Prozessinstanz **gestartet**  wurde.
  * `CallbackOnEndEventReached` - Die Schnittstelle antwortet, wenn die
    Prozessinstanz durch ein EndEvent **beendet** wurde.

  Wenn nicht angegeben, wird implizit `CallbackOnProcessInstanceCreated` verwendet.

### Ergebnis/Rückgabewerte

Der Response body enthält die correlation_id des gestarteten Vorgangs:

```JSON
{
  "correlation_id": "d44c820a-9a78-44b4-af64-5968625cffad"
}
```

### Was passiert in der Process Engine

- Es werden alle StartEvents zu dem Prozessmodell angefragt, die in Lanes
  liegen, auf die der Verwender Zugriff hat.
- Es wird anhand des Prozessmodells eine neue Prozessinstanz erstellt.
- Wenn keine correlation_id vorgegeben ist, wird eine generiert.
- Die Prozessinstanz wird unter Verwendung des definierte StartEvents gestartet.
- Je nach Wert von `startCallbackType` wird entweder direkt nach dem
  erfolgreichen Start geantwortet, oder sobald der Prozess beendet wurde.

### Fehler, die bei der Fehlbenutzung erwartet werden müssen

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

### Codebeispiel

```TypeScript
import {
  ConsumerContext,
  IConsumerApiService,
  ProcessStartResponsePayload,
  ProcessStartResponsePayload,
  StartCallbackType,
} from '@process-engine/consumer_api_contracts';

const consumerApiService: IConsumerApiService; // Get via IoC

const processModelKey = 'test_consumer_api_process_start';
const context: ConsumerContext = {
  identity: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZXNzaW9uSWQiOiJiOWU3MjFjYS0yYmFkLTQzNzUtOGQ3OC0xMmFlNmUyOGUyNjQiLCJpYXQiOjE1MjE1NDg2ODR9.PLa5U6m5lrko3tD_3XLse5OfH93qXyBZgm22PKPqxCc',
}
const startEventKey = 'StartEvent_1';
const payload: ProcessStartRequestPayload = {
  correlation_id: 'randomcorrelationid',
};

const startCallbackType: StartCallbackType = StartCallbackType.CallbackOnProcessInstanceCreated;

const result: ProcessStartResponsePayload = await consumerApiService.startProcess(consumerContext, processModelKey, startEventKey, payload, startCallbackType);
```

## Starten und auf ein bestimmtes EndEvent warten

### Ziel/UseCase

Startet einen Prozess durch das Auslösen eines Start-Events. Die Schnittstelle
antwortet, sobald ein gegebenes BPMN-EndEvent erreicht wurde

### Erforderliche und Optionale Parameter

Die Schnittstelle erfordert die folgenden Parameter:

* `context` - Der Kontext in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert).
* `process_model_key` - Der Key der das Prozessmodell identifiziert, welches
  gestartet werden soll.
* `start_event_key` - Der Key des StartEvents, Das zum starten des Prozesses
  ausgelöst werden soll.
* `end_event_key` - Der Key des EndEvents, bei dessen erreichen die
  Schnittstelle antwortet

Die Schnittstelle bietet die folgenden optionalen Parameter:

* `correlation_id` - Eine ID, anhand derer der gestartete Vorgang identifiziert
  werden kann. Wenn nicht angegeben, wird die Process Engine eine correlation_id
  generieren.

* `input_values` - Eingabewerte, mit denen der Prozess gestartet wird.

### Ergebnis/Rückgabewerte

Als Rückgabewert erhält man die correlation_id zu dem Vorgang den man gestartet
hat:

```JSON
{
  "correlation_id": "d44c820a-9a78-44b4-af64-5968625cffad"
}
```

### Was passiert in der Process Engine

- Es werden alle StartEvents und EndEvents zu dem Prozessmodell angefragt, die
  in Lanes liegen, auf die der Verwender Zugriff hat.
- Es wird anhand des Prozessmodells eine neue Prozessinstanz erstellt.
- Wenn keine correlation_id vorgegeben ist, wird eine generiert.
- Die Prozessinstanz wird unter Verwendung des definierte StartEvents gestartet.
- Sobald das vorgegebene EndEvent erreicht ist, wird geantwortet.

### Fehler, die bei der Fehlbenutzung erwartet werden müssen

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

### Codebeispiel

```TypeScript
import {
  ConsumerContext,
  IConsumerApiService,
  ProcessStartResponsePayload,
  ProcessStartResponsePayload,
} from '@process-engine/consumer_api_contracts';

const consumerApiService: IConsumerApiService; // Get via IoC

const context: ConsumerContext = {
  identity: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZXNzaW9uSWQiOiJiOWU3MjFjYS0yYmFkLTQzNzUtOGQ3OC0xMmFlNmUyOGUyNjQiLCJpYXQiOjE1MjE1NDg2ODR9.PLa5U6m5lrko3tD_3XLse5OfH93qXyBZgm22PKPqxCc',
}

const processModelKey = 'test_consumer_api_process_start';
const startEventKey = 'StartEvent_1';
const endEventKey = 'EndEvent_Success';
const payload = {};

const result = await consumerApiService.startProcessAndAwaitEndEvent(consumerContext, processModelKey, startEventKey, endEventKey, payload);
```

### Besonderheiten bei Prozessabbruch

Wenn der Prozess aufgrund eines Fehlers beendet wird, ohne dass das angegebene
EndEvent erreicht wird, wird die Fehlernachricht keine Details dazu beinhalten,
da der Verwender unter Umständen nicht berechtigt ist, diese Details einzusehen.
