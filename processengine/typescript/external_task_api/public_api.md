# Public API

Nachfolgend wird die öffentliche API der TypeScript Implementierung
der ExternalTaskAPI erläutert.

Die Schnittstellen sind im Paket `@process-engine/external_task_api_contracts` definiert.

## IExternalTaskAPI

Das IExternalTaskAPI Interface stellt die Schnittstellen bereit, die sowohl
in `ExternalTaskAPICore`, als auch in `ExternalTaskAPIClient` verwendet werden.

Dadurch ist gewährleistet, dass beide Komponenten sich auf die gleiche Art
verwenden und leicht austauschen lassen.

```TypeScript
export interface IExternalTaskApi {

  /**
   * Fetches the tasks available for a particular (external) service and locks
   * them for a defined time.
   *
   * @async
   * @param   identity           The requesting users identity.
   * @param   workerId           The ID of the worker on whose behalf tasks are
   *                             fetched.
   *                             The returned tasks are locked for that worker
   *                             and can only be completed when providing the
   *                             same worker id.
   * @param   topicName          The name of the topic. This topic is used to get
   *                             the tasks for an external worker from the BPMN.
   * @param   maxTasks           The maximum number of tasks to return.
   * @param   longPollingTimeout The Long Polling timeout in milliseconds.
   * @param   lockDuration       The amount of time in ms until the fetched tasks
   *                             will be locked and inaccessible to other workers.
   * @returns                    A list of fetched and locked ExternalTasks.
   * @throws                     403, if the requesting User is forbidden to
   *                             access ExternalTasks.
   */
  fetchAndLockExternalTasks<TPayload>(identity: IIdentity,
                                      workerId: string,
                                      topicName: string,
                                      maxTasks: number,
                                      longPollingTimeout: number,
                                      lockDuration: number,
                                     ): Promise<Array<ExternalTask<TPayload>>>;

  /**
   * Extends the timeout of a lock by a given amount of time.
   *
   * @async
   * @param identity           The requesting users identity.
   * @param workerId           The ID of a worker who is locking the ExternalTask.
   * @param externalTaskId     The ID of the ExternalTask.
   * @param additionalDuration The additional amount of time by which to extend
   *                           the lock, based on the current datetime.
   * @throws                   403, if the requesting User is forbidden to access
   *                           the ExternalTask.
   * @throws                   404, if the ExternalTask was not found.
   */
  extendLock(identity: IIdentity,
             workerId: string,
             externalTaskId: string,
             additionalDuration: number,
            ): Promise<void>;

  /**
   * Reports a business error in the context of a running ExternalTask
   * with a specific ID.
   * The error code must be specified to identify the BPMN error handler.
   *
   * @async
   * @param identity       The requesting users identity.
   * @param workerId       The ID of the worker that reports the failure.
   *                       Must match the ID of the worker who has most recently
   *                       locked the task.
   * @param externalTaskId The ID of the ExternalTask, in whose context a BPMN
   *                       error has occured.
   * @param errorCode      An error code that indicates the predefined error.
   *                       This is used to identify the BPMN error handler.
   * @throws               403, if the requesting User is forbidden to access
   *                       the ExternalTask.
   * @throws               404, if the ExternalTask was not found.
   */
  handleBpmnError(identity: IIdentity,
                  workerId: string,
                  externalTaskId: string,
                  errorCode: string,
                 ): Promise<void>;

  /**
   * Reports a failure to execute an ExternalTask with a specific ID.
   * A number of retries and a timout, after which task execution is finally
   * aborted, can be specified.
   * If retries are set to 0, an incident for this task is created.
   *
   * @async
   * @param identity       The requesting users identity.
   * @param workerId       The ID of the worker that reports the failure.
   *                       Must match the ID of the worker that has most
   *                       recently locked the task.
   * @param externalTaskId The ID of the ExternalTask to report a failure for.
   * @param errorMessage   A message indicating the reason for the failure.
   * @param errorDetails   A detailed error description.
   * @throws               403, if the requesting User is forbidden to access
   *                       the ExternalTask.
   * @throws               404, if the ExternalTask was not found.
   */
  handleServiceError(identity: IIdentity,
                     workerId: string,
                     externalTaskId: string,
                     errorMessage: string,
                     errorDetails: string,
                    ): Promise<void>;

  /**
   * Completes an ExternalTask by ID and updates any related process variables.
   *
   * @async
   * @param  identity       The requesting users identity.
   * @param  workerId       The ID of the worker that completes the task.
   *                        Must match the ID of the worker who has most
   *                        recently locked the task.
   * @param  externalTaskId The ID of the ExternalTask to finish.
   * @param  result         The result of the ExternalTasks execution.
   * @throws                403, if the requesting User is forbidden to access
   *                        the ExternalTask.
   * @throws                404, if the ExternalTask was not found.
   */
  finishExternalTask<TResult>(identity: IIdentity,
                              workerId: string,
                              externalTaskId: string,
                              result: TResult,
                             ): Promise<any>;
}
```

## IExternalTaskRepository

Das `IExternalTaskRepository` beschreibt die Schnittstelle, die ein Repository
implementieren muss, damit es von der ExternalTaskAPI verwendet werden kann.

```TypeScript
export interface IExternalTaskRepository {

  /**
   * Creates a new ExternalTask in the database.
   *
   * @async
   * @param topic              The ExternalTasks topic.
   * @param correlationId      The ID of the Correlation that contains the
   *                           FlowNodeInstance with the ExternalTasks definition.
   * @param processInstanceId  The ID of the ProcessInstance that contains the
   *                           FlowNodeInstance with the ExternalTasks definition.
   * @param flowNodeInstanceId The ID of the FlowNodeInstance that contains the
   *                           ExternalTasks definition.
   * @param payload            Contains data that the ExternalTaskAPI will need
   *                           for processing the ExternalTask.
   */
  create<TPayload>(topic: string,
                       correlationId: string,
                       processInstanceId: string,
                       flowNodeInstanceId: string,
                       payload: TPayload): Promise<void>;

  /**
   * Gets an ExternalTask by its ID.
   *
   * @async
   * @param   externalTaskId The ID of the ExternalTask to get.
   * @returns                The retrieved ExternalTask.
   * @throws                 404, if the ExternalTask was not found.
   */
  getById<TPayload>(externalTaskId: string): Promise<ExternalTaskFromRepository<TPayload>>;

  /**
   * Fetches all tasks with a matching topic that are currently available
   * for processing.
   *
   * @async
   * @param   topicName The name of the topic. This topic is used to get
   *                    the tasks for an external worker from the BPMN.
   * @param   maxTasks  The maximum number of tasks to return.
   * @returns           A list of fetched and locked ExternalTasks.
   */
  fetchAvailableForProcessing<TPayload>(topicName: string,
                                        maxTasks: number,
                                       ): Promise<Array<ExternalTaskFromRepository<TPayload>>>;

  /**
   * Fetches the tasks available for a particular (external) service and locks
   * them for a defined time.
   *
   * @async
   * @param   workerId           The ID of the worker on whose behalf the
   *                             ExternalTask is locked.
   * @param   externalTaskId     The ID of the ExternalTask to lock.
   * @param   lockExpirationTime The time at which the lock will be released.
   * @returns                    A list of fetched and locked ExternalTasks.
   * @throws                     404, if the ExternalTask was not found.
   */
  lockForWorker(workerId: string,
                externalTaskId: string,
                lockExpirationTime: Date,
               ): Promise<void>;

  /**
   * Marks the given ExternalTask as finished, using the given error object
   * as a failure result.
   *
   * @async
   * @param externalTaskId The ID of the ExternalTask, in whose context a BPMN
   *                       error has occured.
   * @param error          The error that occured.
   * @throws               404, if the ExternalTask was not found.
   */
  finishWithError(externalTaskId: string, error: Error): Promise<void>;

  /**
   * Marks the given ExternalTask as finished, using the given object
   * as a success result.
   *
   * @async
   * @param  externalTaskId The ID of the ExternalTask to finish.
   * @param  result         The result of the ExternalTasks execution.
   * @throws                404, if the ExternalTask was not found.
   */
  finishWithSuccess<TResult>(externalTaskId: string,
                             result: TResult,
                            ): Promise<any>;
}
```


## ExternalTask Datenmodell

### IExternalTask

Das nachfolgende Objekt beschreibt einen `ExternalTask`:

```TypeScript
export interface IExternalTask {
  id: string;
  workerId?: string;
  topic: string;
  flowNodeInstanceId: string;
  correlationId: string;
  processInstanceId: string;
  lockExpirationTime?: Date;
  readonly isLocked?: boolean;
  payload: any;
  state: ExternalTaskState;
  finishedAt?: Date;
  result?: any;
  error?: any;
  createdAt?: Date;
}
```

`isLocked` wird zur Laufzeit dynamisch berechnet und ergibt sich aus der
gesetzten `lockExpirationTime`.

Ist diese ein *vergangener* Zeitpunkt, so ist der ExternalTask nicht mehr
gesperrt und `isLocked` ist `false`.
Andernfalls, ist der ExternalTask für einen Worker gesperrt und
`isLocked` ist `true`.

Sowohl `ExternalTask` als auch `ExternalTaskFromRepository` implementieren
dieses Interface.

### ExternalTaskState

Eine Enum, welche die möglichen States eines ExternalTasks beschreibt.
- pending: Der Task wartet auf Verarbeitung
- finished: Der Task wurde abgearbeitet

```TypeScript
export enum ExternalTaskState {
  pending = 'pending',
  finished = 'finished',
}
```

## Messages

Die ExternalTaskAPI wird nach Beenden eines `ExternalTasks` eine Nachricht
über den EventAggregator an die ProcessEngine schicken, damit diese die
Ausführung des mit dem ExternalTask verknüpften Prozessmodels fortsetzen kann.

Derzeit werden zwei verschiedene Nachrichtentypen verschicht.

### ExternalTaskSuccessMessage

Wird verschickt, wenn die Verarbeitung des ExternalTasks erfolgreich
abgeschlossen wurde.

Die Nachricht enthält das endgültige Ergebis des ExternalTasks.

```TypeScript
/**
 * Contains a message about a successfully finished ExternalTask.
 */
export class ExternalTaskSuccessMessage {

  public readonly result: any;

  constructor(result: any) {
    this.result = result;
  }
}

```

### ExternalTaskErrorMessage

Wird verschickt, wenn die Verarbeitung des ExternalTasks aufgrund eines Fehlers
nicht abgeschlossen werden konnte.

Die Nachricht enthält den aufgetretenen Fehler.

```TypeScript
/**
 * Contains a message about a failed ExternalTask.
 */
export class ExternalTaskErrorMessage {

  public readonly error: Error;

  constructor(error: Error) {
    this.error = error;
  }
}
```

## POST Bodies

Für die durch die ExternalTaskAPI unterstützten POST Requests sind folgende
Bodies definiert.

### FetchAndLockRequestPayload

Beschreibt den Body, der bei einem `fetchAndLock` Request erwartet wird.

```TypeScript
export class FetchAndLockRequestPayload {

  public readonly workerId: string;
  public readonly topicName: string;
  public readonly maxTasks: number;
  public readonly longPollingTimeout: number;
  public readonly lockDuration: number;

  constructor(workerId: string, topicName: string, maxTasks: number, longPollingTimeout: number, lockDuration: number) {
    this.workerId = workerId;
    this.topicName = topicName;
    this.maxTasks = maxTasks;
    this.longPollingTimeout = longPollingTimeout;
    this.lockDuration = lockDuration;
  }
}
```

### ExtendLockRequestPayload

Beschreibt den Body, der bei einem `extendLock` Request erwartet wird.

```TypeScript
export class ExtendLockRequestPayload {

  public readonly workerId: string;
  public readonly additionalDuration: number;

  constructor(workerId: string, additionalDuration: number) {
    this.workerId = workerId;
    this.additionalDuration = additionalDuration;
  }
}
```

### FinishExternalTaskRequestPayload

Beschreibt den Body, der bei einem `finishExternalTask` Request erwartet wird.

```TypeScript
export class FinishExternalTaskRequestPayload<TResultType> {

  public readonly workerId: string;
  public readonly result: any;

  constructor(workerId: string, result: TResultType) {
    this.workerId = workerId;
    this.result = result;
  }
}
```

### HandleBpmnErrorRequestPayload

Beschreibt den Body, der bei einem `handleBpmnError` Request erwartet wird.

```TypeScript
export class HandleBpmnErrorRequestPayload {

  public readonly workerId: string;
  public readonly errorCode: string;

  constructor(workerId: string, errorCode: string) {
    this.workerId = workerId;
    this.errorCode = errorCode;
  }
}
```

### HandleServiceErrorRequestPayload

Beschreibt den Body, der bei einem `handleServiceError` Request erwartet wird.

```TypeScript
export class HandleServiceErrorRequestPayload {

  public readonly workerId: string;
  public readonly errorDetails: string;
  public readonly errorMessage: string;

  constructor(workerId: string, errorMessage: string, errorDetails: string) {
    this.workerId = workerId;
    this.errorMessage = errorMessage;
    this.errorDetails = errorDetails;
  }
}
```
