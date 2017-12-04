# BPMN Basics

## Definition von BPMN

Die Verwendung der **B**usiness **P**rocess **M**odel and **N**otation
(**BPMN**) erlaubt die Modellierung von Geschäftsprozessen.

BPMN ist ein Standard, der dazu grafische Symbole und deren Verwendung
definiert.

Ein Beispiel für einen Prozessmodell ist im folgenden Bild abgebildet:

<img src="./muedigkeit.svg" width="100%" />

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

## BPMN-Elemente

### Aktivität

Eine Aktivität symbolisiert, dass etwas getan werden soll. Das Symbol sieht so
aus:

![](./activity.svg)

#### Spezialformen der Aktivität

|       Name        |                     Symbol                     |                                                                  Beschreibung                                                                  |
| ----------------- | ---------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| Benutzeraktivität | <img width="200px" src="./user_task.svg"/>     | Stellt eine Aktivität dar, die eine Benutzerinteraktion erfordert.                                                                             |
| Serviceaktivität  | <img width="200px" src="./service_task.svg"/>  | Stellt eine Aktivität dar, die einen Dienst wie einen Webdienst oder eine automatisierte Anwendung verwendet.                                  |
| Skriptaktivität   | <img width="200px" src="./script_task.svg"/>   | Stellt eine Aktivität dar, die ein Skript beinhaltet, welches von einer Process Engine ausgeführt werden soll.                                 |
| Aufrufaktivität   | <img width="200px" src="./call_activity.svg"/> | Stellt eine Aktivität dar, die einen anderen Prozess aufruft. Sobald der aufgerufene Prozess beendet ist, ist auch die Aufrufaktivität beendet |

### Ereignis

Ein Ereignis symbolisiert, dass etwas passiert. Das Symbol sieht so aus:

![](./event.svg)

#### Eintrittszeitpunkte von Ereignissen

|       Name       |                      Symbolbeispiel                      |                                         Beschreibung                                         |
| ---------------- | -------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| Startereignis    | <img width="50px" src="./event.svg"/>                    | Eine einzelne, dünne Linie stellt ein Ereignis dar, welches den Prozess startet.             |
| Zwischenereignis | <img width="50px" src="./intermediate_throw_event.svg"/> | Doppelte dünne Linien stellen ein Ereignis dar, welches Während des Prozessablaufs auftritt. |
| Endereignis      | <img width="50px" src="./end_event.svg"/>                | Eine einzelne, dicke Linie stellt ein Ereignis dar, welches den Prozess beendet.             |

#### Unterbrechungsart von Ereignissen

|              Name              |                     Symbolbeispiel                     |                                                                              Beschreibung                                                                               |
| ------------------------------ | ------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Unterbrechendes Ereignis       | <img width="50px" src="./event.svg">                   | Durchgezogene Linien stellen ein Ereignis dar, welches je nach Kontext:<ul><li>Den Oberprozess abbricht.</li><li>Die zugehörige Aktivität abbricht.</li></ul>           |
| Nicht unterbrechendes Ereignis | <img width="150px" src="./non_interrupting_event.svg"> | Gestrichelte Linien stellen ein Ereignis dar, welches je nach Kontext:<ul><li>Den Oberprozess nicht abbricht</li><li>Die zugehörige Aktivität nicht abbricht.</li></ul> |

#### Empfangen/Auslösen von Ereignissen

|          Name           |                 Symbolbeispiel                 |                                                                           Beschreibung                                                                           |
| ----------------------- | ---------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Empfangendes Ereignisse | <img width="50px" src="./receiving_event.svg"> | Ein nicht-ausgefülltes Ereignissymbol stellt ein empfangendes Ereignis dar. Hier angekommen wird der Prozess erst weiter ausgeführt, wenn das Ereignis eintritt  |
| Auslösendes Ereignis    | <img width="50px" src="./throwing_event.svg">  | Ein ausgefülltes Ereignissymbol stellt ein auslösendes Ereignis dar. Hier angekommen wird das Ereignis ausgelöst, und der Prozess wird sofort weiter ausgeführt. |

#### Symbole von Ereignissen
