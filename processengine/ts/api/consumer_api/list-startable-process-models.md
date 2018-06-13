# Auflisten startbarer Prozessmodelle

Siehe [Konzept zum Auflisten startbarer Prozessmodelle](../../../../api/consumer_api/tasks/list-startable-process-models.md).

* [Alle Prozessmodelle abfragen](#alle-prozessmodelle-abfragen)
* [Einzelnes Prozessmodell abfragen](#einzelnes-prozessmodell-abfragen)

## Alle Prozessmodelle abfragen

```TypeScript
import {
  ConsumerContext,
  IConsumerApiService,
  ProcessModelList
} from '@process-engine/consumer_api_contracts';

// Retrieve through dependency injection
const consumerApiService: IConsumerApiService;

// The JWT token must be provided by the implementing application
const context: ConsumerContext = {
  identity: 'insertJwtTokenHere',
};

const processModelList: ProcessModelList =
  await consumerApiService.getProcessModels(context);
```

### Erforderliche Parameter

* `context` - Der [ConsumerContext](./public_api.md#consumercontext) des aufrufenden Benutzers

### Rückgabewerte

Die Rückgabe ist vom Typ [ProcessModelList](./public_api.md#processmodellist) und beinhaltet
eine Liste aller gefundenen Prozessmodelle.

Diese wiederum werden durch den Typ [ProcessModel](./public_api.md#processmodel) dargestellt.

Beispielausgabe:

```JSON
{
  "process_models": [
    {
      "key": "MyFancyProcess",
      "start_events": [
        {
          "key": "FancyProccessStart1",
          "data": {}
        },
        {
          "key": "FancyProccessStart2",
          "data": {}
        }
      ],
      "end_events": [
        {
          "key": "FancyProccessEnd1",
          "data": {}
        }
      ]
    }
  ]
}
```
### Fehler, die bei einer Fehlbenutzung erwartet werden müssen

Mögliche auftretende Fehler sind:
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer ist nicht berechtigt diesen Request
auszuführen
- `500`: Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

## Einzelnes Prozessmodell abfragen

```TypeScript
import {
  ConsumerContext,
  IConsumerApiService,
  ProcessModelList
} from '@process-engine/consumer_api_contracts';

// Retrieve through dependency injection
const consumerApiService: IConsumerApiService;

// The JWT token must be provided by the implementing application
const context: ConsumerContext = {
  identity: 'insertJwtTokenHere',
};

const processModelKey: string = 'test_consumer_api_process_start';

const processModelList: ProcessModelList =
  await consumerApiService.getProcessModelByKey(context, processModelKey);
```

### Erforderliche Parameter

* `context` - Der [ConsumerContext](./public_api.md#consumercontext) des aufrufenden Benutzers
* `process_model_key` - Der Key des Prozessmodells, welches der Benutzer
  abfragen möchte

### Rückgabewerte

Die Rückgabe der Methode entspricht dem Typen [ProcessModel](./public_api.md#processmodel).

Beispielausgabe:

```JSON
{
  "key": "MyFancyProcess",
  "start_events": [
    {
      "key": "FancyProccessStart1",
      "data": {}
    },
    {
      "key": "FancyProccessStart2",
      "data": {}
    }
  ],
  "end_events": [
    {
      "key": "FancyProccessEnd1",
      "data": {}
    }
  ]
}
```

### Fehler, die bei einer Fehlbenutzung erwartet werden müssen

Mögliche auftretende Fehler sind:
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer ist nicht berechtigt diesen Request auszuführen
- `404`: Es konnte kein Prozessmodell mit dem gegebenen `process_model_key`
gefunden werden
- `500`: Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf
