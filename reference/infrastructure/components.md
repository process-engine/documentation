# Components

Typically an environment working with the process engine will contain the following:

* one or many database servers
* one or many machines running distinct tasks
* one or many servers hosting the process engine
* many clients

## Databases
The process engine is database independent, so it can work with any number of different databases combined. Each process engine uses its own data model and exposes it in a generic datastore.

Queries against this data model can be performed by using the HTTP REST API, GraphQL or the Client API (via Messagebus).

## Apps
Alongside the process engine you might have several other machines - e.g. a client pc next to a production line or a server running archiving jobs. Those could be part of your business processes as well and the process engine can make them work as a part of the process execution.

## Clients
Your business processes will most likely contain manual user tasks at some point. A user can log into the process engine frontend in the browser and take care of these tasks. The UI will be automatically generated based on the preferences in the business process.
