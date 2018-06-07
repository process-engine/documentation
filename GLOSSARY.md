## Bridge

Bridges werden verwendet, um verschiedene Technologien lose miteinander zu
verbinden.

Siehe auch: [Bridges](../processengine/ts/stack/structure/bridges.md).


## Adapter

Siehe [Adapter](../processengine/ts/stack/structure/adapters.md).

## Integration

Integration eines BPMN-Prozesses bedeutet, dass ein regulärer BPMN-Prozess so
konfiguriert wird, dass er von der ProcessEngine ausgeführt werden kann.

## Inversion of Control

Inversion of Control ist die Idee hinter Dependency Injection. Es ist also
lediglich ein Synonym für Dependency Injection.

## Addict-ioc

Addict-ioc ist der IoC Container den wir als Plattform für unseren Stack
verwenden. Man kann diesen auf [GitHub](https://github.com/5minds/addict-ioc)
finden.

## IoC

Die Abkürzung für Inversion of Control.

## Isomorphismus

Isomorpher Javascript Code ist Code der vom Backend und Frontend gemeinsam
genutzt wird. Das ermöglicht eine höhere Konsistenz bei allen Implementierungen
im gesamten Stack.

## Domain Object

Ein Domain Object ist die Darstellung eines Objekts, dasinnerhalb unseres
Software Stacks genutzt wird. Meistens werden diese Domain Objects für
Businesslogik und/oder Persistenz verwendet.

Beispiele für Domain Objects sind: user, process, ...

## BPMN

BPMN steht für **B**usiness **P**rocess **M**odel and **N**otation. Es ist ein
Standard, der die Modellierung von Geschäftsprozessen erlaubt. Dazu definiert er
grafische Symbole und spezifiziert deren Verwendung.

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

## Task

Ein Task ist eine Aufgabe eines Prozesses. Dabei gibt es verschiedene Typen von
Tasks, die unterschiedliche Anforderungen erfüllen. Für eine Erklärung der
verschiedenen Typen siehe: https://camunda.com/bpmn/reference/#activities-task

## User Task

Ein User Task ist eine Aufgabe, die von einem bestimmten Benutzer erledigt
werden muss. Das kann zum Beispiel eine Bestätigung oder eine Eingabe sein.

## Service Task

Ein Service Task ist eine Aufgabe, die keine Eingabe eines Nutzers benötigt.
Stattdessen wird diese durch Software erledigt wird.
