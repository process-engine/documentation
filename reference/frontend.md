# Frontend

You can visit the frontend on the `/app` route of the process engine HTTP endpoint on the server.

If you run the process engine locally this would likele be `http://localhost:8000/app`.

To browse and execute diagrams you need to log in with your user.

In the default setup you can log in with `admin/admin`.

## Process Explorer



### How can I create a new diagram?

You can find an example of the diagram creation in the `Hello World` example of our `Hands-On` section: 
[Creating a new diagram](../quick-start/hands-on/hello-world.md#creating-a-new-diagram)

## Editing Diagrams

{% video controls="controls"%}images/edit-process.mp4{% endvideo %}

Regular BPMN diagrams only describe the business process itself. The standard does not include technical specifications (e.g. what server addresses are used or which configuration is needed at certain points).

To execute the BPMN diagram as a software we need to include such data in the diagram somehow.

The Camunda Modeler makes use of the BPMN XML format and defines extensions to declare these technical specifications.

We will be using these extensions - which are regular key/value pairs - to define the technical specifications using the process engine frontend.

### Service Tasks

A service task represents a task that can be executed without human intervention.

It is commonly used to
* fetch data from a HTTP REST API
* send a mail using a mail server
* execute a script on some machine

#### Consuming a HTTP REST API

When consuming a HTTP REST API you can use the built-in `HttpService`.

Key | Value
---------|----------
 module | HttpService
 method | get
 params | ['http://api.fixer.io/latest']

You can use the HTTP methods `get`, `post`, `put` and `delete`.

##### Parameters

Index | Parameters | Type | Description
---------|----------|---------|---------
 0 | URI | string | The host URI of the HTTP REST API
 1 | Options | object | General request customization

The options have several properties on their own:

Parameters | Type | Description
----------|---------|---------
body | string | The HTTP request body
query | string or Array\<any\> | The HTTP request query parameters
headers | string or Array\<any\> | The HTTP request headers

#### Sending mails

To send a mail you can use the built-in `MailService`.

Key | Value
---------|----------
 module | MailService
 method | send
 params | ['i@send-this-mail.de', 'i@receive-this-mail.de', 'mail subject', 'message']

##### Parameters

Index | Parameters | Type | Description
---------|----------|---------|---------
 0 | Sender | string | The senders mail address
 1 | Recipient | string | The recipients mail address
 2 | Subject | string | The mail subject
 3 | Body | string | The mail content
 4 | Attachments | Array<any> | The mails attachments

#### Execute scripts

#### Execute domain code

### User Tasks

A user task represents those tasks of your business process that can only be dealt with manually.

It is commonly used to:
* get generic user input (form data)
* make decisions based on certain options
* validate data that legally cannot be validated by machines

#### Widgets

##### Confirm

Key | Value
---------|----------
 widgetName | Confirm
 confirmMessage | This is my message.
 confirmLayout | [ { "key": "confirm", "label": "Accept" }, { "key": "decline", "label": "Decline", "isCancel": true } ]

##### Form

Key | Value
---------|----------
 widgetName | Form

##### DropDown

##### CheckBox

##### RadioBox

##### TextField

##### DatePicker

##### AutoComplete

### Roles

Roles are an abstract way to declare who is responsible for something.

This is not restricted to human users, but also applies to machines that incarnate a certain role.

We can use this feature to tag elements in our diagram with a role.
This will cause the process engine to check whether the system currently executing the diagram satisfies these role restrictions.
If the role is not satisfied by the current system, it will try to find another known system that satisfies the role and continue the diagram execution on that system.

Example:

You could tag a user task with the role of a call center agent. If the user task is about to be executed, the process engine will continue the execution on a process engine client where a call center agent is logged in. If you got another role for a call center supervisor you could use that to mark tasks that only a supervisor is allowed to handle and it will only be executed on a client where a supervisor is logged in. 

### Gateways

A gateway can be used to model conditional execution paths. This includes some kind of condition for each following execution path.

Each condition can be configured by using a JavaScript expression on the flow following your gateway.

TODO: Video

### Messages / Signals





### Mappings

## Diagram Execution

When you select a diagram in the process explorer you will get to its detail view.

In this detail view you can execute the diagram by clicking the start button.

When the diagram execution reaches a user task, the generated UI for that user task will appear on top of the diagram.

If there is no frontend application connected to the process engine server when a user task is reached, the diagram execution will be paused until a frontend application is connected.

## BPMN Implementation