# Abschließen eines UserTasks

### Ziel/UseCase

Wenn ein UserTask fertig bearbeitet wurde, wird der Process Engine über diese
Schnittstelle das Ergebnis des UserTasks mitgeteilt. Das hat zur Folge, dass
der dazugehörige Prozesspfad weiter ausgeführt wird.

### Berechtigungen

Benutzer können nur die UserTasks abschließen, die sie auch berechtigt
sind zu sehen.

### Erforderliche und Optionale Parameter

Die Schnittstelle erfordert die folgenden Parameter:

* `context` - Der Kontext in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert).
* `process_model_key` - Der Key der das Prozessmodell identifiziert, welches
  den abzuschließenden UserTask beinhaltet.
* `correlation_id` - Die ID die den Vorgang identifiziert, zu dem der wartende
  UserTask gehört.
* `user_task_id` - Die ID des UserTasks der abgeschlossen werden soll.
* `result` -  Das Ergebnis des UserTasks

### Ergebnis/Rückgabewerte

Bei Erfolg ist das Ergebnis leer.

### Was passiert in der Process Engine

- Es werden alle wartenden UserTasks abgefragt, die zu dem gegebenen
  ProzessModell in der gegebenen Correlation gehören (siehe
  [Auflisten wartender UserTasks](./auflisten-wartender-usertasks.md)).
- Es wird ein EventListener am EventAggregator registriert, um darauf reagieren
  zu können, wenn der UserTask erfolgreich abgeschlossen wurde.
- Es wird ein Event am EventAggregator gepublished, um der ProcessEngine mit
  zu teilen, dass der UserTask bearbeitet wurde.

### Fehler, die bei der Fehlbenutzung erwartet werden müssen

Mögliche auftretende Fehler sind:
- `400`: Der bereitgestellte `result` Payload ist ungültig
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer ist nicht berechtigt diesen Request auszuführen
- `404`:
  - Es konnte kein Prozessmodell mit dem gegebenen `process_model_key`
    gefunden werden
  - Es konnte keine Correlation mit der gegebenen `correlation_id`
    gefunden werden
  - Es konnte kein UserTask mit der gegebenen `user_task_id`
    gefunden werden
- `500`: Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

### Codebeispiel

```TypeScript
import {ConsumerContext, IConsumerApiService, UserTaskResult} from '@process-engine/consumer_api_contracts';

const consumerApiService: IConsumerApiService; // Get via IoC

// start a process
const context: ConsumerContext = {
  identity: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZXNzaW9uSWQiOiJiOWU3MjFjYS0yYmFkLTQzNzUtOGQ3OC0xMmFlNmUyOGUyNjQiLCJpYXQiOjE1MjE1NDg2ODR9.PLa5U6m5lrko3tD_3XLse5OfH93qXyBZgm22PKPqxCc',
};

const processModelKey: string = 'consumer_api_usertask_test';

const {correlation_id: correlationId} = await consumerApiService.startProcess(context, processModelKey, 'StartEvent_1'));

// Wait for the process to reach a user task
// ...

// finish the user task
const userTaskId: string = 'Task_1vdwmn1';
const userTaskResult: UserTaskResult = {
  form_fields: {
    Form_XGSVBgio: true,
  },
};

consumerApiService.finishUserTask(context, processModelKey, correlationId, userTaskId, userTaskResult);
```

### TypeScript API
```TypeScript
export class ConsumerContext {
  public identity: string;
  public Internationalization?: string;
  public localization?: string;
}

export class UserTaskResult {
  public form_fields: {
    [fieldId: string]: any,
  };
}

export interface IConsumerApiService {
  finishUserTask(context: ConsumerContext, process_model_key: string, correlation_id: string, user_task_id: string, result: UserTaskResult): Promise<void>
}
```
