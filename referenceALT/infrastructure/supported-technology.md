# Supported Technology

## Environments

The libraries that form the process engine are isomorphic wherever possible. But there will always be use cases where an environment cannot provide an adequate fallback - e.g. a browser won't provide access to the file system or network ports.

In cases like this the environment-specific parts are encapsulated into a separate library. This library contains only the isomorphic core functionality that can be executed in every environment.  

* Node.js (Windows, Linux, OS X)
* Browser (every browser that supports ECMAScript 5 or higher)

To clarify: the whole process engine stack can run in the browser as well - including data layer, access management and process execution.

## Database Adapters

The data layer is abstracted in the process engine so that the same data model can be used to consume a relational database and an object database.

* Postgres
* MongoDB
* OrientDB
* Redis
* Local Storage

### Special Adapters

Rather than building a bridge to a database technology, special adapters aim to provide a different way to work with the data layer.

* Proxy
  * Uses another process engine instance as a database adapter remotely
* In Memory
  * Stores data in memory without directly persisting it

## Messagebus Adapters

The messagebus uses a channel-name-based pub/sub pattern. This is the only thing a messagebus has to support in order to be compatible to the process engine.

Currently implemented adapters:

* [Faye](https://github.com/faye/faye)