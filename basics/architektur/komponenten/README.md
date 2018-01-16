# Komponenten beschreiben

## Service Task

Ein "[Service Task](../../../anhang/GLOSSARY.md#service-task)" repräsentiert
eine Aufgabe, die ohne menschliches Hinzutun erledigt werden kann. Es wird
häufig genutzt um:

- Daten von einer REST-API zu empfangen
- Eine Mail zu versenden
- Ein Script auszuführen

## User Task

Ein "[User Task](../../../anhang/GLOSSARY.md#user-task)" repräsentiert eine
Aufgabe, die nur manuell erledigt werden kann. Diese werden genutzt um:

- Nutzerdaten aufzunehmen
- dem Nutzer Informationen zu präsentieren


## Roles

"Roles" (Rollen) sind eine abstrakte Möglichkeit Zuständigkeiten
zu definieren.

Das ist nicht auf Nutzer begrenzt, sondern bezieht auch Maschinen mit ein.

Wir können einem Element in einem Diagramm also eine Rolle zuordnen. Wenn wir
das tun, wird die ProcessEngine überprüfen, ob die Instanz, die gerade das
Diagramm ausführt, die Anforderungen der Rolle erfüllt. Sollte das nicht der
Fall sein, wird die ProcessEngine versuchen eine Instanz zu finden, die die
Anforderungen erfüllt, und die weitere Diagrammausführung an sie delegieren.

Ein Beispiel:

Du kannst einem "[User Task](../../../anhang/GLOSSARY.md#user-task)" die Rolle
"Call Center Agent" zuordnen. Wenn dieser
[Task](../../../anhang/GLOSSARY.md#task) ausgeführt werden soll, wird er nur auf
einem [Client]() ausgeführt, an dem ein "Call Center Agent" eingeloggt ist.

## Gateways

"[Gateways](../../../anhang/GLOSSARY.md#gateway)" werden genutzt, um
Fallunterscheidungen zu modellieren. Dabei kann der aktuelle Ausführungspfad in
mehrere Pfade aufgeteilt oder mehrere Pfade zu einem zusammengeführt werden.

## Messages / Signals

"Messages" und "Signals" sind spezielle Formen von
[Ereignissen](../../../anhang/GLOSSARY.md#ereignis) im Kontext eines Prozesses.

## Mappers
