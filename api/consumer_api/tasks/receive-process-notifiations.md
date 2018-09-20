# Erhalten von Prozessbenachrichtigungen

* [Beendigung eines Prozesses](#beendigung-eines-prozesses)
* [Abbruch eines Prozesses](#abbruch-eines-prozesses)
* [Erreichen eines UserTasks](#erreichen-eines-usertasks)
* [Abschluss eines UserTasks](#abschluss-eines-usertasks)

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

## Beendigung eines Prozesses

```typescript
consumerApiClient.onProcessEnded((message: ProcessEndedMessage) => {
  // Die folgenden Eigenschaften können für die weitere Verarbeitung der
  // Benachrichtigung genutzt werden:
  console.log(message.correlationId); // 13bd448c-932e-46db-9a73-747a084ec3c8
  console.log(message.processInstanceId:); // d561fad2-f404-4353-a0ab-beeaf93c1d6a
  console.log(message.flowNodeId); // EndEvent_1
  console.log(message.tokenPayload); // { key: 'value' } enthält den aktuellen Token
  console.log(message.endType); // 0
});
```

## Abbruch eines Prozesses

```typescript
consumerApiClient.onProcessTerminated((message: ProcessEndedMessage) => {
  // Die folgenden Eigenschaften können für die weitere Verarbeitung der
  // Benachrichtigung genutzt werden:
  console.log(message.correlationId); // 13bd448c-932e-46db-9a73-747a084ec3c8
  console.log(message.processInstanceId:); // d561fad2-f404-4353-a0ab-beeaf93c1d6a
  console.log(message.flowNodeId); // TerminateEndEvent_1
  console.log(message.tokenPayload); // { key: 'value' } enthält den aktuellen Token
  console.log(message.endType); // 1
});
```

## Erreichen eines UserTasks

```typescript
consumerApiClient.onUserTaskFinished((message: UserTaskFinishedMessage) => {
  // Die folgenden Eigenschaften können für die weitere Verarbeitung der
  // Benachrichtigung genutzt werden:
  console.log(message.correlationId); // 13bd448c-932e-46db-9a73-747a084ec3c8
  console.log(message.processInstanceId:); // d561fad2-f404-4353-a0ab-beeaf93c1d6a
  console.log(message.userTaskId); // UserTask_1
  console.log(message.userTaskResult);
  // Enthält das Ergebnis, mit dem der User Task abgeschlossen wurde
  // {
  //   formFields: {
  //     your_form_field_1: 'value 1',
  //     your_form_field_2: 'value 2',
  //   }
  // }
});
```

## Abschluss eines UserTasks

```typescript
consumerApiClient.onUserTaskWaiting((message: UserTaskWaitingMessage) => {
  // Die folgenden Eigenschaften können für die weitere Verarbeitung der
  // Benachrichtigung genutzt werden:
  console.log(message.correlationId); // 13bd448c-932e-46db-9a73-747a084ec3c8
  console.log(message.processInstanceId:); // d561fad2-f404-4353-a0ab-beeaf93c1d6a
  console.log(message.userTaskId); // UserTask_1
});
```
