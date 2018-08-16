# Basic Editing

## Modeler

Im Kern benutzt BPMN-Studio
[bpmn-js](https://bpmn.io/toolkit/bpmn-js/)
um das editieren und designen von Diagrammen zu ermöglichen.

Das Tool bpmn-js, das sich intern auf
[diagram-js](https://github.com/bpmn-io/diagram-js)
stützt, ist ein Unterprojekt von
[bpmn.io](https://github.com/bpmn-io).
Das Projekt bpmn.io ist ein Open Source Projekt von camunda.

Weitere Informationen finden sie auf der Website zu
[bpmn.io](https://bpmn.io/).

Für eine genaue Anleitung zur Modellierung von BPMN-Diagrammen und Prozessen,
bietet das
[Tutorial](https://camunda.com/bpmn/)
von camunda einen guten Einstieg.

## Property Panel

Das Property Panel im BPMN-Studio ist eine Erweiterung für die bpmn-io
Komponente (Modeler/Designer) und ist in der Design-Ansicht auf der rechten
Seite zu finden.

Über den Button in der Ecke rechts oben ist es möglich das Property Panel ein-
bzw. auszublenden.

Das Property Panel erlaubt es Benutzern Eigenschaften an einzelnen
BPMN-Elementen hinzuzufügen, zu entfernen und zu konfigurieren. Diese
Eigenschaften sind unsichtbar und werden nicht in der grafischen Darstellung
zur Anzeige gebracht

Verschiedene BPMN-Elemente haben unterschiedliche Konfiguratinsmöglichkeiten im
Property Panel. Im Nachfolgenden, werden diese Möglichkeiten beschrieben.

Die Abschnitte

* `General Section` und
* `Properties Section`

sind für alle Elemente vorhanden.

Darüber hinaus gibt es Möglichkeiten, die abhängig von dem ausgewähltem Element sind.
Im Property Panel gibt es folgende Sections:

1. [General (alle Elemente)](#general)
1. [Forms (UserTasks)](#forms)
1. [Message (Receive Task, Start/Boundary Events)](#message-escalation-error-signal)
1. [Escalation (Boundary/End Events)](#message-escalation-error-signal)
1. [Error (Boundary/End Events)](#message-escalation-error-signal)
1. [Signal (Start/Boundary/End Events)](#message-escalation-error-signal)
1. [Conditional (Start/Boundary/End Events)](#conditional-event)
1. [Script (ScriptTasks)](#script)
1. [Call Activity (Call Activity Task)](#call-activity)
1. [Timer (Start/Boundary Events)](#timer)
1. [Process (Collaboration)](#process)
1. [Properties (alle Elemente)](#extension-properties)

### General

Die `General Section` behandelt mit

1. ID,
1. Name,
1. und Docs

die grundlegenden Informationen eines Elements.

Beispiel:

<img src="general-sektion.png" width="40%" />

### Forms

Die komplette `Forms Section` ist nur sichtbar, wenn ein UserTask ausgewählt ist.

<!-- TODO: Was ist ein Form Field?? -->

Es können mehrere Form Fields angelegt und entfernt werden.
Zusätzlich kann man für jeden UserTask optional einen `Form Key` setzen.

Wenn ein UserTask angewählt ist, sieht die `Forms Section` so aus:

<img src="form-sektion-leer.png" width="40%" />

Nach dem hinzufügen eines Form Fields über den `+` Button, erscheint ein
weiterer Teil der Section:

<img src="form-sektion-formfield.png" width="40%" />

In der `Form Field Section` gibt es die Möglichkeit festzulegen

1. welche ID das Form Field erhalten soll,
1. welchen Typ das Form Field haben soll,
1. welches Label gesetzt werden soll,
1. welcher Standardwert enthalten sein soll.

**Wichtig:** Die **ID** ist ein Pflichtfeld. Sie muss **einmalig** und **nicht leer**
sein.

Es stehen folgende Typen als Auswahl zur Verfügung:

1. string
1. long
1. boolean
1. date
1. enum
1. custom type

**Info**:

Wenn der Typ `enum` ausgewählt ist, erscheint eine weitere Section,
in der anhand von Key-Value-Paaren angegeben wird, welche Einträge
die Enum-Auswahl beinhalten soll.

Im BPMN-Studio wird ein UserTask vom Typ `enum` während der Ausführung als
Dropdown dargestellt.

### Message, Escalation, Error, Signal

Die

- Message Section,
- Escalation Section,
- Error Section und
- Signal Section

haben keine wesentlichen Unterschiede. Alle Sections sind sichtbar, wenn
entweder ein Boundary oder eine End -Event von einem dieser Typen angewählt ist.

Lediglich die `Message Section` wird auch bei einem angewähltem `SendTask`, oder
`ReceiveTask` angezeigt.

Die Sections sind vom Aufbau her identisch. Man fügt über den `+` Button
eine Message, einen Error, eine Escalation oder ein Signal hinzu.

Das hinzugefügte Event ist dann im Auswahldropdown automatisch ausgewählt.
Anschließend setzt man die Werte, wie zum Beispiel beim Error Event den

- Name,
- Code,
- und die Message.

So sieht zum Beispiel die `Error Section` aus:

<img src="error-sektion.png" width="40%" />

### Conditional Event

Die `Conditional Event Section` wird nur bei angewähltem `Conditional` Boundary
Event sichbar.

Hier kann

- eine Condition,
- ein Variable Name und
- ein Variable Event

angegeben werden.

<img src="conditional-sektion.png" width="40%" />

### Script

Die `Script Section` wird nur bei angewählten `ScriptTask` sichtbar.

Der `ScriptTask` wird mit

- dem Format,
- dem Script und
- einer Result Variablen

konfiguriert. Aktuell ist es so, dass JavaScript als Code ausgeführt werden
kann. Dafür würde man auch nur das Script Feld brauchen.

Als Test kann man zum Beispiel `console.log('Das ist ein Test!')` angeben, und
es würde im Backend während der Ausführung des Tasks geloggt werden.

<img src="script-sektion.png" width="40%" />

### Call Activity

Die `Call Activity Section` wird bei einem `Call Activity` Task angezeigt
und sieht wie folgt aus:

<img src="call-activity-sektion.png" width="40%" />

Wenn die Call Activity konfiguriert ist, also ein Prozess ausgewählt wurde,
wird während der Ausführung der ausgewählte Prozess gestartet und nach
beendigung wieder zurück zum eigentlichen Prozess gewechselt.

Allerdings funktioniert es nur, wenn beide Prozesse auf der verbundenen
ProcessEngine liegen.

### Timer

Die `Timer Section` erscheint bei Timer Boundary Events.

Es gibt drei Modi:

1. Date
1. Duration
1. Cycle

**Info**: Die Timer Definition muss im richtigen Format angegeben werden.

Welches Zeitformat verwendet werden muss ist
[hier](https://docs.camunda.org/manual/7.9/reference/bpmn20/events/timer-events/)
definiert.

<img src="timer-sektion.png" width="40%" />

### Process

Das erscheinen der `Process Section` erreicht man, indem man kein Element
auswählt, sondern außerhalb einer Lane klickt. Dann sollte im Property Panel
unter General die ID mit `Collaboration` anfangen und zusätzlich die
`Process Section` unter der `General Section` erscheinen.

Hier kann der Prozess als ausführbar gesetzt werden.

<img src="process-sektion.png" width="40%" />

An einer Collaboration können zusätzlich, wie bei BPMN-Elementen Properties
hinzugefügt werden.

<img src="process-properties.png" width="40%" />

### Extension Properties

Die Extension Properties werden bei jedem BPMN-Element angezeigt.
Mittels Key-Value-Paaren können dem Element Eigenschaften hinzugefügt werden.

Ein Anwendungsbeispiel ist zum Beispiel die Verwendung eines `ServiceTasks`.
Um einen `ServiceTask` zu konfigurieren muss dieser drei Eigenschaften erhalten.

Er erhält

- das Modul,
- die Methode und
- zugehörige Parameter.

<img src="service-task-example.png" width="40%" />

**Wichtig**: Die URL muss in Anführungszeichen angegeben werden.
