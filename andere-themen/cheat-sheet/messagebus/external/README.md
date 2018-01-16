# External messagebus communication

The external messagebus communication describes what messages you can send and receive from and to
a process-engine. These messages can be used to for example start a process or listen for an event.

## Publishing
**/participant/{participant_id}**

if no participantId exists, these messages are sent to `/role/{user_role}`
instead.

- endEvent-message

  notifies, that an end-event was executed (aka a token arrived at an end-event)

  ```TypeScript
  {
    action: 'endEvent',
    data: currentToken
  }
  ```

- userTask-message

  notifies, that a userTask was executed (aka a token arrived at a userTask)

  ```TypeScript
  {
    action: 'userTask',
    data: {
      userTaskEntity: IUserTaskEntity;
      uiName: string;
      uiData: any;
      uiConfig: any;
    }
  }
  ```

**/role/{user_role}**

gets the same messages as `/participant/{participant_id}`. These messages are
sent to `/participant/{participant_id}` if a participantId exists, otherwise
they are sent here.

**/processengine_api/event/{nodeId}**

notifies about boundaryEvents that got triggered

```TypeScript
{
  action: 'event',
  eventType: 'error' | 'cancel' | 'timer' | 'signal' | 'message' | 'conditional'
  data: data,
}
```

**/processengine/node/{node_id}**

- proceed-message

  Tells the process-engine that this node is finished and it should proceed
  executing

  ```TypeScript
  {
    action: 'proceed',
    token: currentToken,
  }
  ```
