# External messagebus communication

The external messagebus communication describes what messages you can send and receive from and to
a process-engine. These messages can be used to for example start a process or listen for an event.

## Channels the Process Engine publishes on
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
  data: any,
}
```

**/processengine/node/{node\_id}**

Sends messages regarding that node.

- proceed-message

  Tells the process-engine that this node is finished and it should proceed
  executing.

  ```TypeScript
  {
    action: 'proceed',
    token: currentToken,
  }
  ```

## Channels the Process Engine subscribes to

**/processengine/node/{node\_id}**

Listens for messages regarding that node.

- proceed-message

  Tells the process-engine that this node is finished and it should proceed
  executing.

  ```TypeScript
  {
    action: 'proceed',
    token: userTaskResult,
  }
  ```

- event-message

  Tells the process-engine to trigger an event on that node. This means
  republishing that event-message on the internal eventAggregator. This
  in turn triggers the `event`-method of that node.
  This event-method checks if there are any boundary-events on that node
  that correspond to the event-type:

  - error = bpmn:ErrorEventDefinition
  - cancel = bpmn:CancelEventDefinition
  - data = bpmn:ConditionalEventDefinition

  all matching boundary-events get triggered. If no matching boundary-event
  is found, and the eventType is 'error' or 'cancel', the node gets canceled

  ```TypeScript
  {
    action: 'event',
    eventType: 'error '| 'cancel' | 'data',
    data: any,
  }
  ```


**/{application\_id}/datastore**

Tells all process-engines with that application-id to execute a
datastore-method. The answer is send on the result-channel given in the messages
metadata.

- If the action is `POST`, and `method` and `id` have values, then this message
will make the process-engine execute the given method on the entity identified
by `typeName` and `id`.

- If the action is `POST`, and `method` has a value, but `id` does not, then
this message will make the process-engine execute the given method on the
entityType identified by `typeName`.

- In all other cases a regular CRUD-operation (depending on the `action`) will
be performed on the entity.

```TypeScript
{
  data: any,
  action: 'POST' | 'PUT' | 'DELETE' | 'GET';
  typeName?: string;
  method?: string;
  id?: string;
  options?: any;
}
```
