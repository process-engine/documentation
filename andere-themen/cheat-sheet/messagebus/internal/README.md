# Internal messagebus communication

The internal messagebus communication describes what messages are used by the process-engine to
talk to other parts of itself or other instances of the process engine.

These messages are only interesting if you develop the process-engine stack itself. If you just
want to use the process-engine, refer to the [external messagebus communication](../external/README.md)

## Publishing

**/processengine/node/{node_id}**

Sends messages regarding that node.

- check-message

checks if any other process-engine-isntance is already handling this node

```TypeScript
{
  action: 'checkResponsibleInstance',
}
```

- event-message

  see `event-message` under `Subscribing`

**/processengine/process/{process\_instance\_id}**

- process-end-message

  see `process-end-message` under `Subscribing`

## Subscribing

**/processengine/node/{node_id}**

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

  asks the process-engine if it is responsibel for that node

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
**/processengine/signal/{signal}**


'/processengine/signal/' + signal -> execute (throw_event.ts z38)
'/processengine/message/' + message -> execute (throw_event z51)

'/participant/' + this.participant -> execute (user_task.ts z46)
`/role/${flatRole}` -> execute (user_task.ts z54)

`/processengine/node/${node.id}` -> \_nodeAlreadyBelongsToOtherProcessEngine (process\_engine\_service z377)
`/processengine/${possibleRemoteTargets[0]}` -> executeProcessRemotely (process\_engine\_service z509)
`/processengine/${target.data.instanceId}` -> executeProcessRemotely (process\_engine\_service z511)

`/${targetApplicationId}/datastore` -> request (messagebus.ts (routing) z23)



## Subscribing

**/processengine/node/{node_id}**

**/processengine/signal/{signal}**

**/processengine/message/{message}**

**/processengine/{application_id}**

**/processengine/{application\_instance\_id}**

**/processengine**

**/processengine/bootup**

**/processengine/process/{process\_instance\_id}**

subscribes
`/processengine/node/${node.id}` -> subscibeToNodeChannels (node_instance.ts z221)

'/processengine/signal/' + signal -> initializeSignal (event.ts z115)

'/processengine/message/' + message -> initializeMessage (event.ts z162)

`/processengine/${this.applicationService.id}` -> \_initializeMessageBus (process\_engine\_service z235)
`/processengine/${this.applicationService.instanceId}` -> \_initializeMessageBus (process\_engine\_service z239)
`/processengine` -> \_initializeMessageBus (process\_engine\_service z246)
`/processengine/bootup` -> _waitForMessagebus (process\_engine\_service z424)
`/processengine/process/${processInstance.id}` -> executeProcessLocally (process\_engine\_service z469)
