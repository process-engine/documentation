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

#### Spezialformen der Aktivität:

Name        |         Symbol          |                                                  Beschreibung
----------------- | ----------------------- | --------------------------------------------------------------------------------------------------------------
Benutzeraktivität | <img width="200px" src="./user_task.svg"/> | Stellt eine Aktivität dar, die eine Benutzerinteraktion erfordert.
Serviceaktivität  | <img width="200px" src="./service_task.svg"/> | Stellt eine Aktivität dar, die einen Dienst wie einen Webdienst oder eine automatisierte Anwendung verwendet.
Skriptaktivität   | <img width="200px" src="./script_task.svg"/>  | Stellt eine Aktivität dar, die ein Skript beinhaltet, welches von einer Process Engine ausgeführt werden soll.
Aufrufaktivität | <img width="200px" src="./call_activity.svg"/> | Stellt eine Aktivität dar, die einen anderen Prozess aufruft. Sobald der aufgerufene Prozess beendet ist, ist auch die Aufrufaktivität beendet

### Ereignis

![](./event.svg)

