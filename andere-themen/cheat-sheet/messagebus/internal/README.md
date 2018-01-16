# Internal messagebus communication

The internal messagebus communication describes what messages are used by the process-engine to
talk to other parts of itself or other instances of the process engine.

These messages are only interesting if you develop the process-engine stack itself. If you just
want to use the process-engine, refer to the [external messagebus communication](../external/README.md)

## Publishing

**/processengine/node/{node\_id}**

Sends messages regarding that node.

- check-message

  see `checkResponsibleInstance-message` under `Subscribing`

- event-message

  see `event-message` under `Subscribing`

**/processengine/process/{process\_instance\_id}**

- process-end-message

  see `process-end-message` under `Subscribing`

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

see the same route under `Subscribing`

**/processengine/{application\_instance\_id}**

see the same route under `Subscribing`

**/{application\_id}/datastore**

see the same route under `Subscribing`

## Subscribing

**/processengine/node/{node\_id}**

Listens for messages regarding that node.

- proceed-message

  Tells the process-engine that this node is finished and it should proceed
  executing

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
    data: data,
  }
  ```

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





## Subscribing


**/processengine**

**/processengine/bootup**

**/processengine/process/{process\_instance\_id}**

subscribes

`/processengine` -> \_initializeMessageBus (process\_engine\_service z246)
`/processengine/bootup` -> _waitForMessagebus (process\_engine\_service z424)
`/processengine/process/${processInstance.id}` -> executeProcessLocally (process\_engine\_service z469)
