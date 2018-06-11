#  !!!deprecated!!! Messagebus

The messagebus-API describes what messages are published on the messagebus by the process-engine,
and what messages can be published on the messagebus by you.

The messagebus allows you to order the process-engine to do things, and to listen for events by the process-engine.

## Internal messagebus communication

The internal messagebus communication describes what messages are used by the process-engine to
talk to other parts of itself or other instances of the process engine.

These messages are only interesting if you develop the process-engine stack itself. If you just
want to use the process-engine, refer to the [external messagebus communication](../external/README.md)

### Channels the Process Engine publishes on

**/processengine/node/{node\_id}**

Sends messages regarding that node.

- checkResponsibleInstance-message

  Asks the process-engine if it is responsible for that node.

  ```TypeScript
  {
    action: 'checkResponsibleInstance',
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

**/processengine/process/{process\_instance\_id}**

- process-end-message

  Tells the process-engine, that a process finished executing and is now
  terminated.

  ```TypeScript
  {
    event: 'end',
    token: processToken.data.current,
  }
  ```

**/processengine/signal/{signal\_name}**

Dispatches a bpmn-signal.

```TypeScript
{
  process: this.process.getEntityReference().toPojo(),
  token: this.processToken.data.current,
}
```

**/processengine/message/{message\_name}**

Dispatches a bpmn-message.

```TypeScript
{
  process: this.process.getEntityReference().toPojo(),
  token: this.processToken.data.current,
}
```
**/processengine/{application\_id}**

Orders all process-engines with that application-id to do something

- getInstanceId

  Answers with the application-instance-id of the process-engine.
  The answer is send on the result-channel given in the messages metadata.

  ```TypeScript
  {
    event: 'getInstanceId',
  }
  ```

  Answer:
  ```TypeScript
  {
    instanceId: this.applicationService.instanceId,
  }
  ```

- executeProcess

  Executes a process and answers with the result of the process-execution.
  The answer is send on the result-channel given in the messages metadata.

  ```TypeScript
  {
    event: 'executeProcess',
    id: process_model_id, // optional, if key is set
    key: process_model_key, // optional, if id is set
    initialToken: initial_token, // optional
    version: process_version, // otional
  }
  ```

**/processengine/{application\_instance\_id}**

Orders the process-engine with that application-instance-id to do something

The possible messages are identical to the messages for the channel
`/processengine/{application\_id}`

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

### Channels the Process Engine subscribes to

**/processengine/node/{node\_id}**

Listens for messages regarding that node.

- checkResponsibleInstance-message

  Asks the process-engine if it is responsible for that node.

  ```TypeScript
  {
    action: 'checkResponsibleInstance',
  }
  ```

**/processengine/process/{process\_instance\_id}**

- process-end-message

  Tells the process-engine, that a process finished executing and is now
  terminated.

  ```TypeScript
  {
    event: 'end',
    token: processToken.data.current,
  }
  ```

**/processengine/signal/{signal\_name}**

Informs the process-engine, that a bpmn-signal was dispatched

```TypeScript
{
  process: this.process.getEntityReference().toPojo(),
  token: this.processToken.data.current,
}
```

**/processengine/message/{message\_name}**

Informs the process-engine, that a bpmn-message was dispatched

```TypeScript
{
  process: this.process.getEntityReference().toPojo(),
  token: this.processToken.data.current,
}
```

**/processengine/{application\_id}**

Orders all process-engines with that application-id to do something

- getInstanceId

  Answers with the application-instance-id of the process-engine.
  The answer is send on the result-channel given in the messages metadata.

  ```TypeScript
  {
    event: 'getInstanceId',
  }
  ```

  Answer:
  ```TypeScript
  {
    instanceId: this.applicationService.instanceId,
  }
  ```

- executeProcess

  Executes a process and answers with the result of the process-execution.
  The answer is send on the result-channel given in the messages metadata.

  ```TypeScript
  {
    event: 'executeProcess',
    id: process_model_id, // optional, if key is set
    key: process_model_key, // optional, if id is set
    initialToken: initial_token, // optional
    version: process_version, // otional
  }
  ```

**/processengine/{application\_instance\_id}**

Orders the process-engine with that application-instance-id to do something

The possible messages are identical to the messages for the channel
`/processengine/{application\_id}`

**/processengine**

(only available, if the process-engine is configured as messagebus-master)

Tells the process-engine to start a process

```
{
  action: 'start',
  key: process_model_key,
  token: initial_process_token,
  isSubProcess: true | false,
}
```

**/processengine/bootup**

This subscription is not used to receive messages. It allows to create a promise
that will resolve as soon as the messagebus is ready to be used.

This subscription only exists to check when the messagebus is ready. No message
is ever published on it.

## External messagebus communication

The external messagebus communication describes what messages you can send and receive from and to
a process-engine. These messages can be used to for example start a process or listen for an event.

### Channels the Process Engine publishes on

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

### Channels the Process Engine subscribes to

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
