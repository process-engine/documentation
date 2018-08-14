# Basic Editing

## Modeler

In seinem Kern benutzt BPMN-Studio [bpmn-js](https://bpmn.io/toolkit/bpmn-js/)
um das editieren und designen von Diagrammen zu ermöglichen.

Das Tool bpmn-js, das sich intern auf [diagram-js](https://github.com/bpmn-io/diagram-js)
stützt ist ein Unterprojekt von [bpmn.io](https://github.com/bpmn-io), einem
Open Source Projekt von camunda.

Weitere Informationen finden sie auf der Website zu [bpmn.io](https://bpmn.io/).

Für eine genaue Anleitung zur Modellierung von BPMN-Diagrammen und Prozessen
bitten wir Sie sich auf das [Tutorial](https://camunda.com/bpmn/) von camunda
zu beziehen.

## Property Panel

Das Property Panel im BPMN-Studio ist eine Erweiterung für die bpmn-io 
Komponente (Modeler/Designer) und ist in der Design-Ansicht auf der rechten
Seite zu finden. Über den Button in der Ecke rechts oben ist es möglich
das Property Panel ein und auszublenden.

Es erlaubt Benutzern unsichtbare Eigenschaften an einzelnen BPMN-Elementen
hinzuzufügen, zu entfernen und zu konfigurieren.

Verschiede BPMN-Elemente haben unterschiedliche Konfiguratinsmöglichkeiten
im Property Panel. Die General Sektion und die Properties Sektion ist für alle 
Elemente vorhanden.

Im Property Panel werden folgende Sektionen behandelt:

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

Die General Sektion behandelt mit

1. ID,
1. Name,
1. und Docs

die grundlegenden Informationen eines Elements.

Beispiel: 

<img src="general-sektion.png" width="40%" />

### Forms

Die komplette Forms Sektion ist nur sichtbar, wenn ein UserTask selektiert ist.

Es können mehrere Form Fields angelegt und entfernt werden.
Zusätzlich kann man für jeden UserTask optional einen `Form Key` setzen.

Wenn ein UserTask angewählt ist sieht die Forms Sektion so aus:

<img src="form-sektion-leer.png" width="40%" />

Nach dem hinzufügen eines Form Fields über den `+` Button erscheint ein
weiterer Teil der Sektion:

<img src="form-sektion-formfield.png" width="40%" />

In der Form Field Sektion gibt es die Möglichkeit festzulegen

1. welche ID das Form Field erhalten soll,
1. welchen Typ das Form Field haben soll,
1. welches Label gesetzt werden soll,
1. welcher Standardwert drin stehen soll.

**Wichtig** hierbei ist das die **ID** einmalig sein muss und nicht leer sein darf.

Es stehen folgende Typen als Auswahl zur Verfügung:

1. string
1. long
1. boolean
1. date
1. enum
1. custom type

**Info**: 

Wenn der Typ `enum` ausgewählt ist, erscheint eine weitere Sektion, 
in der anhand von Key-Value-Paaren angegeben wird, welche Einträge
die Enum-Auswahl beinhalten soll.

Im BPMN-Studio wird ein UserTask vom Typ `enum` während der Ausführung als
Dropdown dargestellt.

### Message, Escalation, Error, Signal

Die 

- Message Sektion,
- Escalation Sektion,
- Error Sektion und
- Signal Sektion

haben keine großen Unterschiede. Alle Sektionen sind sichtbar, wenn entweder
ein Boundary oder eine End -Event von einem dieser Typen angewählt ist.

Lediglich die Message Sektion wird auch bei einem angewähltem `SendTask`, oder 
`ReceiveTask` angezeigt.

Die Sektionen sind vom Aufbau her identisch. Man fügt über den `+` Button
eine Message, einen Error, eine Escalation oder ein Signal hinzu.

Das hinzugefügte Event ist dann im Auswahldropdown automatisch ausgewählt.
Anschließend setzt man die Werte, wie zum Beispiel beim Error Event den

- Name,
- Code,
- und die Message.

So sieht zum Beispiel die Error Sektion aus:

<img src="error-sektion.png" width="40%" />

