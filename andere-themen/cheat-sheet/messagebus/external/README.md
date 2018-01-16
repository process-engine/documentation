# External messagebus communication

The external messagebus communication describes what messages you can send and receive from and to
a process-engine. These messages can be used to for example start a process or listen for an event.

publishes
/participant/{participantId} -> EndEvent (end_event.ts z36)
/role/${flatRole} -> EndEvent (end_event.ts z44)
/processengine_api/event/{nodeId} -> general event (\_publishtoApi)

requests


subscribes
