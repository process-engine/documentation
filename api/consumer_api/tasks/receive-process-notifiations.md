# Erhalten von Prozessbenachrichtigungen

* [Reagieren auf Beendigung eines Prozesses](#reagieren-auf-beendigung-eines-prozesses)
* [Reagieren auf Abbruch eines Prozesses](#reagieren-auf-abbruch-eines-prozesses)
* [Reagieren auf Erreichen eines UserTasks](#reagieren-auf-erreichen-eines-usertasks)
* [Reagieren auf Abschluss eines UserTasks](#reagieren-auf-abschluss-eines-usertasks)

Der ConsumerAPI Client wird zur Laufzeit von der Process Engine über bestimmte
`Events` benachrichtigt zu werden.

So ist es z.B. möglich darüber benachrichtigt zu werden, wenn ein bestimmter
Prozess beendet wurde, oder ein durch den aktuellen Benutzer
gestarteter Prozess durch einen Fehler vorzeitig abgebrochen wurde.

Ein `Event` enthält stets nur den aktuellen Status des Prozesses, _nicht_ den
gesamten Prozesstoken mit Prozesshistorie.

Um eine bestimmte Benachrichtigung zu erhalten wird die entsprechende Methode
ausgeführt (siehe unten). Als Parameter wird eine Methode mitgegeben, die jedes
mal ausgeführt wird wenn die Benachrichtigung empfangen wird.

## Reagieren auf Beendigung eines Prozesses

```typescript
consumerApiClient.onProcessEnded((message: ProcessEndedMessage) => {
  // you can use the following properties to make use of the notification
  console.log(message.correlationId); // 13bd448c-932e-46db-9a73-747a084ec3c8
  console.log(message.processInstanceId:); // d561fad2-f404-4353-a0ab-beeaf93c1d6a
  console.log(message.flowNodeId); // EndEvent_1
  console.log(message.tokenPayload); // { key: 'value' } this contains the current token
  console.log(message.endType); // 0
});
```

## Reagieren auf Abbruch eines Prozesses

```typescript
consumerApiClient.onProcessTerminated((message: ProcessEndedMessage) => {
  // you can use the following properties to make use of the notification
  console.log(message.correlationId); // 13bd448c-932e-46db-9a73-747a084ec3c8
  console.log(message.processInstanceId:); // d561fad2-f404-4353-a0ab-beeaf93c1d6a
  console.log(message.flowNodeId); // TerminateEndEvent_1
  console.log(message.tokenPayload); // { key: 'value' } this contains the current token
  console.log(message.endType); // 1
});
```

## Reagieren auf Erreichen eines UserTasks

```typescript
consumerApiClient.onUserTaskFinished((message: UserTaskFinishedMessage) => {
  // you can use the following properties to make use of the notification
  console.log(message.correlationId); // 13bd448c-932e-46db-9a73-747a084ec3c8
  console.log(message.processInstanceId:); // d561fad2-f404-4353-a0ab-beeaf93c1d6a
  console.log(message.userTaskId); // UserTask_1
  console.log(message.userTaskResult); // this contains the result data
  // {
  //   formFields: {
  //     your_form_field_1: 'value 1',
  //     your_form_field_2: 'value 2',
  //   }
  // }
});
```

## Reagieren auf Abschluss eines UserTasks

```typescript
consumerApiClient.onUserTaskWaiting((message: UserTaskWaitingMessage) => {
  // you can use the following properties to make use of the notification
  console.log(message.correlationId); // 13bd448c-932e-46db-9a73-747a084ec3c8
  console.log(message.processInstanceId:); // d561fad2-f404-4353-a0ab-beeaf93c1d6a
  console.log(message.userTaskId); // UserTask_1
});
```
