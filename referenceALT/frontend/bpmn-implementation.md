# BPMN Implementation

Currently the following elements of the BPMN standard are interpreted by the process engine. They can hold certain parameters to fulfil specific requirements and behaviours during process execution.

Other elements although can be modeled but are ignored by the process engine if possible.

Am overview of the BPMN standard and its symbols can be found i.e. here <https://camunda.org/bpmn/reference/>.

## Supported elements

Element group | elements
---------|----------
 Participants | Pool, Lane
 Tasks | Service Task, User Task, Script Task
 Subprocesses | Call Acitivty
 Gateways | Exclusive Gateway, Parallel Gateway
 Events | Message, Timer, Error, Conditional, Signal, Cancel

* Currently there is only one Pool possible per model.
* Lanes can't be nested.
* Manual Tasks describe explicitely an execution without involving a process engine and can therefore be used anyway.
*  Events include usage as Intermediate and Boundary Events.


## Unsupported elements

Element group | elements
---------|----------
 Tasks | Send Task, Receive Task, Business Rules Task
 Subprocesses | implicite Subprocess
 Gateways | Inclusive Gateway, Event Based Gateway, Complex Gateway
 Events | Termination, Link, Compensation, Escalation


