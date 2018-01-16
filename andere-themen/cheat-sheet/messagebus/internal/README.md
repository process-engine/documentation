# Internal messagebus communication

The internal messagebus communication describes what messages are used by the process-engine to
talk to other parts of itself or other instances of the process engine.

These messages are only interesting if you develop the process-engine stack itself. If you just
want to use the process-engine, refer to the [external messagebus communication](../external/README.md)

publishes
'/processengine/node/' + callerId -> end (process.ts z258)
`/processengine/process/${this.id}` -> end (process.ts z268)
'/processengine/node/' + callerId -> error (proces.ts z284)

'/processengine/signal/' + signal -> execute (throw_event.ts z38)
'/processengine/message/' + message -> execute (throw_event z51)

'/participant/' + this.participant -> execute (user_task.ts z46)
`/role/${flatRole}` -> execute (user_task.ts z54)

`/processengine/node/${node.id}` -> \_nodeAlreadyBelongsToOtherProcessEngine (process\_engine\_service z377)
`/processengine/${possibleRemoteTargets[0]}` -> executeProcessRemotely (process\_engine\_service z509)
`/processengine/${target.data.instanceId}` -> executeProcessRemotely (process\_engine\_service z511)

`/${targetApplicationId}/datastore` -> request (messagebus.ts (routing) z23)
