## bridge
Bridges are used to tie together different technologies in a loosely-coupled fashion.

See also: [Bridges](reference/stack/structure.md#bridges).

## adapter
See [Adapters](reference/stack/structure.md#adapters).

## integrate
Integrating a BPMN process means configuring a regular BPMN process to be executable by the process engine.

## inversion of control
Inversion of control is the idea behind dependency injection. It is used as a synonym to dependency injection.

## addict-ioc
This is the IoC container we use as a platform for our stack. You can find it on [GitHub](https://github.com/5minds/addict-ioc).

## IoC
The abbreviation for inversion of control.

## flow
A line connecting BPMN elements.

## isomorphic
Isomorphic javascript code is code that is shared by backend and frontend. It enables higher consistency throughout implementations in the whole stack.

## domain object
A domain object is the representation of an object that is used inside of our software stack. Most of the times these domain objects are used for business logic and/or persistance.

Examples of domain objects are: user, process, ...

## BPMN

BPMN steht für Business Process Model and Notation. Es ist ein Standard der
die Modellierung von Geschäftsprozessen erlaubt. Dazu definiert er grafische
Symbole und spezifiziert deren Verwendung.

### Kollaboration

Kollaboration bezeichnet die Zusammenarbeit mehrerer unabhängiger Prozesse. Die
Zusammenarbeit wird über den Austausch von Nachrichten zwischen den Prozessen
realisiert.

Das Diagramm, das diese Prozesse und ihre Nachrichten darstellt, heißt
Kollaborationsdiagramm.

## Aktivität

Eine Aktivität zeigt an, dass etwas getan werden soll.

## Sequenzfluss

Ein Sequenzfluss wird verwendet, um die Ablauf-Reihenfolge der Prozesselemente
in einem BPMN-Diagramm darzustellen.

## Gateway

Ein Gateway teilt den Prozessfluss in einem BPMN-Diagramm in mehrere Flüsse auf,
oder führt mehrere Flüsse wieder zusammen.

## Ereignis

Ein Ereignis symbolisiert, dass etwas passiert.

## Pool

Ein Pool ist ein Symbol zur Darstellung der Grenzen eines Geschäftsprozesses.
Ein Geschäftsprozess muss in sich abgeschlossen sein; er kann sich nicht über
mehrere Pools erstrecken. Mehrere Prozesse können über Nachrichten miteinander
kollaborieren.

## Lane

Ein Pool kann in Lanes unterteilt sein; damit kann genauer beschrieben werden
wer für die Erledigung von Aktivitäten zuständig ist; eine Lane kann z.B. eine
Benutzerrolle oder ein System repräsentieren.

## Anmerkung

Eine Anmerkung ist ein Kommentar im BPMN-Diagramm.
