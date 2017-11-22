# Komponenten beschreiben

## Service Task

Ein "Service Task" repräsentiert einen "Task" oder eine "Aufgabe" die ohne
menschliches hinzutun erledigt werden kann.
Es wird häufig genutzt um:

- daten einer REST API zu empfangen
- eine Mail zu versenden
- ein Script auszuführen

## User Task

Ein "User Task" repräsentiert "Tasks" oder "Aufgaben" die nur manuell
erledigt werden können.
Diese werden genutzt um:

- Nutzerdaten aufzunehmen
- Entscheidungen zu treffen
- Daten zu verifizieren die aufgrund von Gesetzen von einem Menschen geprüft
werden müssen

## Roles

"Roles" oder "Rollen" sind eine abstrakte Möglichkeit und Zuständigkeiten
aufzuzeigen.
Dies ist nicht auf Nutzer begrenzt sondern bezieht auch Maschinen, die verschiedene
Rollen übernehmen, mit ein.

Wir können einem Element in einem Diagramm also einer Rolle zuordnen. Wenn wir dies tun
wird die Process Engine überprüfen ob das System, das gerade das Diagramm ausführt,
die Forderungen der Rolle erfüllt.
Sollte dies nicht der Fall sein wird die Process Engine versuchen ein anderes System,
das diese Forderungen erfüllt, zu finden und zur weiteren Ausführung des Diagramms
zu nutzen.

Ein Beispiel:

Du kannst einem "User Task" die Rolle "Call Center Agent" zuordnen. Wenn dieser Task
zur Ausführung bereit ist, wird er nur auf einem client ausgeführt an dem ein
"Call Center Agent" eingeloggt ist.

## Gateways

"Gateways" werden genutzt um bedingte Pfade zu modellieren.

## Messages / Signals

"Messages" und "Signals" sind im Grunde nichts anderes als ein Event.

## Mappers




