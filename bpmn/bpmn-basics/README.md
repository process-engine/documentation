# BPMN Basics

## Definition von BPMN

Die Verwendung der **B**usiness **P**rocess **M**odel and **N**otation
(**BPMN**) erlaubt die Modellierung von Geschäftsprozessen.

BPMN ist ein Standard, der dazu grafische Symbole und deren Verwendung
definiert.

<img title="Beispiel für ein Prozessmodell" src="./muedigkeit.svg" width="100%" />

## Überblick über die Verwendung von BPMN

Man unterscheidet zwischen zwei Arten von Prozessmodellen, die beide mit BPMN
Modelliert werden können:

1. **Strategische** Prozessmodelle:

   - Sie beschreiben einen Ablauf so kompakt wie möglich.
   - Man erhält schnell einen Überblick über den gesamten Prozess.
   - Die Sprache ist abstrakt und logisch, und dient dem schnellen Verständnis
     des ganzen Prozesses.
   - Diese Prozesse sind nicht automatisierbar.

1. **Operative** Prozessmodelle:

   - Sie beschreiben einen Ablauf so konkret wie möglich.
   - Es ist genau definiert, was wann wie geschehen muss.
   - Die Sprache ist physisch und konkret, und dient der tatsächlichen
     Ausführung des Prozesses.
   - Diese Prozesse sind in Teilen oder als Ganzes automatisierbar.

## Grundlegende BPMN-Elemente

Hier werden die wichtigsten BPMN-Elemente beschrieben:

- [Aktivität](#aktivität) (grün)
- [Sequenzfluss](#sequenzfluss) (orange)
- [Gateway](#gateway) (Blau)
- [Ereignis](#ereignis) (Lila)
- [Pools und Lanes](#pools-und-lanes) (hier nicht dargestellt)

![](./overview.svg)

### Aktivität

Eine Aktivität symbolisiert, dass etwas getan werden soll.

![Symbol einer Aktivität](./activity.svg)

#### Spezialformen der Aktivität

|       Name        |                     Symbol                     |                                                                  Beschreibung                                                                   |
| ----------------- | ---------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| Benutzeraktivität | <img width="200px" src="./user_task.svg"/>     | Stellt eine Aktivität dar, die eine Benutzerinteraktion erfordert.                                                                              |
| Serviceaktivität  | <img width="200px" src="./service_task.svg"/>  | Stellt eine Aktivität dar, die einen Dienst wie einen Webdienst oder eine automatisierte Anwendung verwendet.                                   |
| Skriptaktivität   | <img width="200px" src="./script_task.svg"/>   | Stellt eine Aktivität dar, die ein Skript beinhaltet, welches von einer Process Engine ausgeführt werden soll.                                  |
| Aufrufaktivität   | <img width="200px" src="./call_activity.svg"/> | Stellt eine Aktivität dar, die einen anderen Prozess aufruft. Sobald der aufgerufene Prozess beendet ist, ist auch die Aufrufaktivität beendet. |

### Sequenzfluss

Ein Sequenzfluss wird verwendet, um die Ablauf-Reihenfolge der Prozesselemente
darzustellen.

![Symbol eines Sequenzflusses](./flow.svg)

### Gateway

Ein Gateway teilt den Prozessfluss in mehrere Flüsse auf, oder führt mehrere
Flüsse wieder zusammen.

![Symbol eines Gateways](./gateway.svg)

#### Spezialformen des Gateways

|         Name          |                      Symbol                       |                                                                 Beschreibung                                                                 |
| --------------------- | ------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| Exklusives<br>Gateway | <img width="50px" src="./exclusive_gateway.svg"/> | <ul><li>Folge <b>einem</b> der Ausgangsflüssen</li><li>Setze den Prozess fort sobald <b>einer</b> der Eingangsflüsse erreicht wird</li></ul> |
| Paralleles<br>Gatway  | <img width="50px" src="./parallel_gateway.svg"/>  | <ul><li>Folge <b>allen</b> Ausgangsflüssen</li><li>Setze den Prozess fort sobald <b>alle</b> Eingangsflüsse erreicht wurden</li></ul>        |

### Ereignis

Ein Ereignis symbolisiert, dass etwas passiert. Ereignisse können:
- Ein eigenes Element im Diagramm sein.

  ![](./event.svg)

- An eine Aktivität gebunden sein.

  ![](./activity_event.svg)

#### Spezialformen des Ereignisses

Die Art des Ereignisses wird in dessen Symbol durch vier Charakteristika dargestellt:

##### 1. Art der Linie des Kreises

|       Name       |                          Symbol                          |                                    Beschreibung                                     |
| ---------------- | -------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| Startereignis    | <img width="50px" src="./event.svg"/>                    | Eine einzelne, dünne Linie bedeutet: Das Ereignis startet den Prozess.              |
| Zwischenereignis | <img width="50px" src="./intermediate_throw_event.svg"/> | Doppelte, dünne Linien bedeuten: Das Ereignis tritt während des Prozessablaufs auf. |
| Endereignis      | <img width="50px" src="./end_event.svg"/>                | Eine einzelne, dicke Linie bedeutet: Das Ereignis beendet den Prozess.              |

##### 2. Durchgezogene oder gestrichelte Linie

|                Name                 |                        Symbol                         |                                                                               Beschreibung                                                                               |
| ----------------------------------- | ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Unterbrechendes<br>Ereignis         | <img width="50px" src="./event.svg">                  | Durchgezogenen Linien bedeuten: je nach Kontext wird bei Eintritt<ul><li>Der Oberprozess abgebrochen.</li><li>Die zugehörige Aktivität abgebrochen.</li></ul>            |
| Nicht unter-<br>brechendes Ereignis | <img width="50px" src="./non_interrupting_event.svg"> | Gestrichelten Linien bedeuten: je nach Kontext wird bei Eintritt<ul><li>Der Oberprozess nicht abgebrochen.</li><li>Die zugehörige Aktivität nicht abgebrochen.</li></ul> |

##### 3. Ausgefülltes oder nicht ausgefülltes Symbol

|          Name           |                     Symbol                     |                                             Beschreibung                                              |
| ----------------------- | ---------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| Eintretendes Ereignisse | <img width="50px" src="./receiving_event.svg"> | Ein nicht ausgefülltes Symbol bedeutet:<br>Der Prozess läuft erst weiter, wenn das Ereignis eintritt. |
| Auslösendes Ereignis    | <img width="50px" src="./throwing_event.svg">  | Ein Ausgefülltes Symbol bedeutet:<br>Das Ereignis wird ausgelöst und der Prozess läuft weiter.        |

##### 4. Gewähltes Symbol

|   Name    |                                              Symbol                                               |                           Beschreibung                            |
| --------- | ------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| Nachricht | <img width="50px" src="./message_event.svg"> <img width="50px" src="./message_receive_event.svg"> | Empfang und Versand von Nachrichten.                              |
| Zeit      | <img width="50px" src="./timer_event.svg">                                                        | Periodisch zeitliche Ereignisse, Zeitpunkte oder Zeitspannen.     |
| Signal    | <img width="50px" src="./signal_event.svg"> <img width="50px" src="./signal_receive_event.svg">   | Sendet oder reagiert auf ein Signal.                              |
| Bedingung | <img width="50px" src="./signal_event.svg"> <img width="50px" src="./signal_receive_event.svg">   | Reagiert auf veränderte Bedingungen im Bezug auf Geschäftsregeln. |
| Fehler    | <img width="50px" src="./error_event.svg"> <img width="50px" src="./error_receive_event.svg">     | Auslösen oder Behandeln von Fehlern.                              |

### Pools und Lanes

Ein Prozess besteht aus einem oder mehreren Pools. Jeder Pool stellt einen
Prozessbeteiligten dar, z.B. ein Unternehmen, einen Kunden, eine Abteilung oder
ein System.

Ein Pool kann in Lanes unterteilt sein, um genauer zu beschreiben, wer für die
Erledigung von Aktivitäten zuständig ist. Eine Lane kann z.B. eine Benutzerrolle
oder ein System sein.

![Beispielprozess zum demonstrieren von Pools und Lanes. Die Abteilungen und der Kunde sind Pools, Techniker und Telefonist sind Lanes.](./pool_mit_lanes.svg)

#### Eigenschaften des Pools

Falls der Inhalt eines Pools nicht bekannt oder für den Prozess nicht von
Bedeutung ist, kann er zugeklappt werden. Der Pool wird dann als Rechteck mit
Beschriftung dargestellt, hat aber keinen weiteren Inhalt.

Sequenzflüsse können über mehrere Lanes gehen, aber nicht über mehrere Pools.

Die Process Engine hat zurzeit noch folgende Einschränkungen:
- Es wird nur ein Pool pro Diagramm unterstützt.
- Ein Pool muss immer eine Lane haben.

## Weitere BPMN-Elemente

BPMN definiert neben den Basiselementen weitere Elemente. BPMN-Elemente die hier
nicht beschrieben werden, werden von der Process Engine noch nicht unterstützt.

Die [Anmerkung](#anmerkung) ist zurzeit das einzige Element in dieser Kategorie.

### Anmerkung

Eine Anmerkung ist ein Kommentar im BPMN-Diagramm. Sie wird von der Process
Engine nicht beachtet.

![Eine alleinstehende Anmerkung](./comment.svg)

![Eine Anmerkung zu einer Aktivität](./comment_on_activity.svg)
