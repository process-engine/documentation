# Auflisten startbarer Prozessmodelle

* [Alle Prozessmodelle abfragen](#alle-prozessmodelle-abfragen)
* [Einzelnes Prozessmodell abfragen](#einzelnes-prozessmodell-abfragen)

## Alle Prozessmodelle abfragen

### Ziel/UseCase

Bezieht eine Liste aller Prozessmodelle, welche über mindestens ein
StartEvent verfügen welches der aktuell eingeloggte Benutzer sehen darf.

Ziel ist es, dem Benutzer zu ermöglichen, Prozesse zu starten. Dafür muss er
wissen, welche Prozesse er starten kann

### Berechtigungen

Benutzer können nur die Prozessmodelle abfragen, die sie mit ihren
Berechtigungen auch sehen dürfen.

### Erforderliche und Optionale Parameter

Die Schnittstelle erfordert die folgenden Parameter:

* `context` - Der Kontext in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert).

### Ergebnis/Rückgabewerte

Die ermittelten Prozessmodelle werden als JSON-Array zurückgeben.
Jedes JSON Objekt in diesem Array beinhaltet dabei folgende Informationen:

* Den Key des Prozessmodells
* Eine Auflistung der Keys aller im Prozessmodell enthaltenen StartEvents

Daraus ergibt sich folgende Response:

```JSON
{
  "process_models": [
    {
      "key": "MyFancyProcess",
      "start_events": [
        {
          "key": "FancyProccessStart1",
          "id": "someStartEventId",
          "data": {}
        },
        {
          "key": "FancyProccessStart2",
          "id": "someOtherStartEventId",
          "data": {}
        }
      ]
    }
  ]
}
```

### Was passiert in der Process Engine

- Es werden alle Prozessmodelle angefragt.
- Davon werden alle übernommen, die Lanes haben auf die der Verwender zugriff
  hat. Lanes ohne StartEvents werden dabei behandlet, als hätte der Verwender
  keinen Zugriff auf die Lane.
- Jedem verbleibenden Prozessmodell werden die so bestimmten zugehörigen
  StartEvents zugeteilt.
- Die Prozessmodelle werden als Ergebnis zurückgegeben.

### Fehler, die bei der Fehlbenutzung erwartet werden müssen

Mögliche auftretende Fehler sind:
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer ist nicht berechtigt diesen Request
auszuführen
- `500`: Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

### Codebeispiel

```TypeScript
import {ConsumerContext, IConsumerApiService, ProcessModelList} from '@process-engine/consumer_api_contracts';

const consumerApiService: IConsumerApiService; // Get via IoC

const context: ConsumerContext = {
  identity: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZXNzaW9uSWQiOiJiOWU3MjFjYS0yYmFkLTQzNzUtOGQ3OC0xMmFlNmUyOGUyNjQiLCJpYXQiOjE1MjE1NDg2ODR9.PLa5U6m5lrko3tD_3XLse5OfH93qXyBZgm22PKPqxCc',
}

const processModelList: ProcessModelList = await consumerApiService.getProcessModels(context);
```

### TypeScript API

```TypeScript
export class ConsumerContext {
  public identity: string;
  public Internationalization?: string;
  public localization?: string;
}

export class Event {
  public key: string;
  public id: string;
  public process_instance_id: string;
  public data: any; // TODO: Define event-payload
}

export class ProcessModel {
  public key: string;
  public startEvents: Array<Event> = [];
}

export class ProcessModelList {
  public process_models: Array<ProcessModel> = [];
}

export interface IConsumerApiService {
  getProcessModels(context: ConsumerContext): Promise<ProcessModelList>;
}
```

### Berechtigungen

Benutzer können nur die Prozessmodelle abfragen, die sie mit ihren
Berechtigungen auch sehen dürfen.

## Einzelnes Prozessmodell abfragen

### Ziel/UseCase

Unter Angabe eines `process_model_keys` kann ein einzelnes Prozessmodell direkt
abgefragt werden. Das dient dazu zu erfahren, welche StartEvents der eingeloggte
Benutzer zu diesem Prozess auslösen kann.

### Berechtigungen

Benutzer können nur die Prozessmodelle abfragen, die sie mit ihren
Berechtigungen auch sehen dürfen.

### Erforderliche und Optionale Parameter

Die Schnittstelle erfordert die folgenden Parameter:

* `context` - Der Kontext in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert).
* `process_model_key` - Der Key der das ProzessModell identifiziert, um das es
  geht

### Ergebnis/Rückgabewerte

Die zugehörige Response gleicht der von `Alle Prozessmodelle abfragen`,
mit dem Unterschied, dass hier kein Array, sondern ein einzelnes JSON-Objekt
zurückgegeben wird.

```JSON
{
  "key": "MyFancyProcess",
  "start_events": [
    {
      "key": "FancyProccessStart1",
      "id": "someStartEventId",
      "data": {}
    },
    {
      "key": "FancyProccessStart2",
      "id": "someOtherStartEventId",
      "data": {}
    }
  ]
}
```

### Was passiert in der Process Engine

- Es wird anhand des `process_model_key` das Prozessmodell angefragt.
- Alle StartEvents, die in Lanes liegen, auf die der Verwender zugriff hat
  werden dem Prozessmodell zugeteilt.
- Sollten keine StartEvents vorhanden sein, auf die der Verwender zugriff hat,
  wird ein ForbiddenError geworfen.
- Das Prozessmodell wird als Ergebnis zurückgegeben.

### Fehler, die bei der Fehlbenutzung erwartet werden müssen

Mögliche auftretende Fehler sind:
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer ist nicht berechtigt diesen Request auszuführen
- `404`: Es konnte kein Prozessmodell mit dem gegebenen `process_model_key`
gefunden werden
- `500`: Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

### Codebeispiel

```TypeScript
import {ConsumerContext, IConsumerApiService, ProcessModelList} from '@process-engine/consumer_api_contracts';

const consumerApiService: IConsumerApiService; // Get via IoC

const context: ConsumerContext = {
  identity: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZXNzaW9uSWQiOiJiOWU3MjFjYS0yYmFkLTQzNzUtOGQ3OC0xMmFlNmUyOGUyNjQiLCJpYXQiOjE1MjE1NDg2ODR9.PLa5U6m5lrko3tD_3XLse5OfH93qXyBZgm22PKPqxCc',
}

const processModelKey: string = 'test_consumer_api_process_start';

const processModelList: ProcessModelList = await consumerApiService.getProcessModelByKey(context, processModelKey);
```

### TypeScript API

```TypeScript
export class ConsumerContext {
  public identity: string;
  public Internationalization?: string;
  public localization?: string;
}

export class Event {
  public key: string;
  public id: string;
  public process_instance_id: string;
  public data: any; // TODO: Define event-payload
}

export class ProcessModel {
  public key: string;
  public startEvents: Array<Event> = [];
}

export class ProcessModelList {
  public process_models: Array<ProcessModel> = [];
}

export interface IConsumerApiService {
  getProcessModelByKey(context: ConsumerContext, processModelKey: string): Promise<ProcessModelList>;
}
```
