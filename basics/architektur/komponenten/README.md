# Komponenten beschreiben

## Service Task

Ein "Service Task" repräsentiert einen "Task" oder eine "Aufgabe", die ohne
menschliches hinzutun erledigt werden kann.
Es wird häufig genutzt um:

- Daten von einer REST API zu empfangen.
- Eine Mail zu versenden.
- Ein Script auszuführen.

## User Task

Ein "User Task" repräsentiert einen "Tasks" oder ein "Aufgaben" die nur manuell
erledigt werden kann.
Diese werden genutzt um:

- Nutzerdaten aufzunehmen.
- Entscheidungen zu treffen.
- Daten zu verifizieren, die aufgrund von Gesetzen von einem Menschen geprüft
werden müssen.

## Roles

"Roles" oder "Rollen" sind eine abstrakte Möglichkeit Zuständigkeiten
definieren.

Das ist nicht auf Nutzer begrenzt sondern bezieht auch Maschinen mit ein.

Wir können einem Element in einem Diagramm also eine Rolle zuordnen. Wenn wir
das tun, wird die Process Engine überprüfen, ob die Instanz, die gerade das
Diagramm ausführt, die Anforderungen der Rolle erfüllt. Sollte das nicht der
fall sein, wird die Process Engine versuchen eine Instanz zu finden, die die
Anforderungen erfüllt und die weitere Diagrammausführung an sie delegieren.

Ein Beispiel:

Du kannst einem "User Task" die Rolle "Call Center Agent" zuordnen. Wenn dieser Task
ausgeführt werden soll, wird er nur auf einem [Client]() ausgeführt, an dem ein
"Call Center Agent" eingeloggt ist.

## Gateways

"Gateways" werden genutzt, um Fallunterscheidungen zu modellieren. Dabei kann
der aktuelle Ausführungspfad in mehrere Pfade aufgeteilt werden, oder mehrere Pfade
zu einem zusammengeführt werden

## Messages / Signals

"Messages" und "Signals" sind im Grunde nichts anderes als Events.

## Mappers
