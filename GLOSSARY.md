## Adapter

Siehe [Adapter](processengine/typescript/architektur/adapters.md).

## Addict-IoC

Addict-IoC ist der IoC Container, den wir als Plattform für unseren Stack
verwenden. Man kann diesen auf [GitHub](https://github.com/5minds/addict-ioc)
finden.

## Aktivität

Eine Aktivität zeigt an, dass etwas getan werden soll.

## Anmerkung

Eine Anmerkung ist ein Kommentar im BPMN-Diagramm.

## Bridge

Bridges werden verwendet, um verschiedene Technologien lose miteinander zu
verbinden.

## BPMN

BPMN steht für **B**usiness **P**rocess **M**odel and **N**otation. Es ist ein
Standard, der die Modellierung von Geschäftsprozessen erlaubt. Dazu definiert er
grafische Symbole und spezifiziert deren Verwendung.

## BpmnEvent/BPMN Event

Mit dem Begriff `BpmnEvent` ist immer ein Event gemeint, welches in einem
Prozessmodell modelliert wurde.

Beispiele für `BpmnEvents`:

* Ein modelliertes EndEvent wurde erreicht
* Der Prozess sendet ein Signal
* Eine Nachricht wurde empfangen
* Ein Timer ist abgelaufen

## BPMN-Studio

BPMN-Studio ist eine Web- und Desktop-Applikation zur Erstellung, Verwaltung,
Ausführung und Auswertung von BPMN-Prozessen. Es setzt auf
[bpmn-js](https://github.com/bpmn-io/bpmn-js)
auf und unterstützt Digramme, die den BPMN-Standard 2 verwenden.

[Dokumentation zum BPMN-Studio](bpmn-studio/ueberblick.md)

## Consumer

Ein Consumer ist eine Person oder ein Programm, das in die Ausführung
eines Prozesses involviert ist. Er ist ein Akteur in einem Prozess.

Beispiele sind:

* Eine Person, die ein Formular ausfüllen muss, das vom Prozess benötigt wird.
* Ein Programm, das einen laufenden Prozess über eine Zustandsveränderung
  informiert.
* Eine Person oder ein Programm, das einen Prozess startet.

## Correlation

Es kann vorkommen, dass das Ausführen eines Prozesses den Start anderer
Prozesse mit sich zieht, oder dass mehrere Prozesse nacheinander ablaufen
und so eine Prozesskette bilden.

Derartige Konstrukte werden als `Vorgang`, oder `Correlation` bezeichnet.

_Hinweis_: Ein Vorgang muss nicht _zwingend_ aus mehreren Prozessen bestehen.
Man kann auch einen Vorgang mit einem einzelnen Prozess definieren.

## Domain Object

Ein Domain Object ist die Darstellung eines Objekts, das innerhalb unseres
Software Stacks genutzt wird. Meistens werden diese Domain Objects für
Businesslogik und/oder Persistenz verwendet.

Beispiele für Domain Objects sind: user, process, ...

## Event

Das `Event` bezeichnet die allgemeine Basis für Ereignisse, die bei der
Verarbeitung von Prozessmodellen innerhalb der ProcessEngine aufkommen können.

Es wird zwischen zwei Arten von `Events` unterschieden:

* `BpmnEvent`-Events, die durch den BPMN 2.0 Standard definiert sind.
* `SystemEvent`-Events, die durch die Verarbeitung eines Prozessmodells
  innerhalb der ProcessEngine vom System ausgelöst werden und nicht durch
  den BPMN Standard definiert sind.

## Gateway

Ein Gateway teilt den Prozessfluss in einem BPMN-Diagramm in mehrere Flüsse auf,
oder führt mehrere Flüsse wieder zusammen.

## Inversion of Control

Inversion of Control ist die Idee hinter Dependency Injection. Es ist also
lediglich ein Synonym für Dependency Injection.

## IoC

Die Abkürzung für Inversion of Control.

## Kollaboration

Kollaboration bezeichnet die Zusammenarbeit mehrerer unabhängiger Prozesse. Die
Zusammenarbeit wird über den Austausch von Nachrichten zwischen den Prozessen
realisiert.

Das Diagramm, das diese Prozesse und ihre Nachrichten darstellt, heißt
Kollaborationsdiagramm.

## Lane

Ein Pool kann in Lanes unterteilt sein; damit kann genauer beschrieben werden
wer für die Erledigung von Aktivitäten zuständig ist; eine Lane kann z.B. eine
Benutzerrolle oder ein System repräsentieren.

## Pool

Ein Pool ist ein Symbol zur Darstellung der Grenzen eines Geschäftsprozesses.
Ein Geschäftsprozess muss in sich abgeschlossen sein; er kann sich nicht über
mehrere Pools erstrecken. Mehrere Prozesse können über Nachrichten miteinander
kollaborieren.

## Process-Engine/Workflow-Engine

Eine ProcessEngine/Workflow-Engine beschreibt ein Tool welches in der Lage ist,
BPMN-Prozesse auszuführen. Ein entsprechender Prozess, welcher automatisiert
ausgeführt werden soll, wird dabei als BPMN-Diagramm notiert.

## Sequenzfluss

Ein Sequenzfluss wird verwendet, um die Ablauf-Reihenfolge der Prozesselemente
in einem BPMN-Diagramm darzustellen.

## Service Task

Ein Service Task ist eine Aufgabe, die keine Eingabe eines Nutzers benötigt.
Stattdessen wird diese durch Software erledigt wird.

Nachfolgend sind die wichtigsten Begriffe definiert, die in der Consumer API
Dokumentation benutzt werden:

## Solution

In einer Solution werden alle Diagramme die zur Lösung eines Problems notwendig sind
gebündelt und organisiert. Auf einem Dateisystem ist eine Solution nichts
anderes als ein Ordner der eine Menge von Diagrammen enthält.

## SystemEvent

Ein `SystemEvent` bezeichnet ein Event, welches sich auf die Ausführung eines
Prozesses oder Vorgangs bezieht, aber **nicht** innerhalb des zugehörigen
Prozesmodells modelliert ist.

`SystemEvents` sind zum Beispiel:

* Prozess gestartet
* Prozess beendet
* Prozess abgebrochen

## Task

Ein Task ist eine Aufgabe eines Prozesses. Dabei gibt es verschiedene Typen von
Tasks, die unterschiedliche Anforderungen ausdrücken. Für eine Erklärung der
verschiedenen Typen siehe: https://camunda.com/bpmn/reference/#activities-task

## Token

Der Token beschreibt ein Objekt, welches beim Prozessablauf über die
Sequenzflüsse hinweg von Knoten zu Knoten mitgereicht wird.  Die
durchwanderten Knoten können den Token anreichern und Informationen
von ihm abfragen.

Beim Prozessstart wird automatisch ein leerer Token
generiert. Prozesse können auch mit bereits angereichten Tokens
gestartet werden (etwa über Call Activities).

Tokens bieten die Möglichkeit des Transports von Informationen über
Elemente innerhalb eines Diagramms und auch zu anderen Prozessen.

## User Task

Ein User Task ist eine Aufgabe, die von einem bestimmten Benutzer erledigt
werden muss. Das kann zum Beispiel eine Bestätigung oder eine Eingabe sein.
