# Dashboard

## Aufgaben und Motivation

Ziel des Dashboards ist es dem Benutzer einen schnellen Überblick über die
aktuell laufenden Prozesse zu geben. Diese Informationen werden von der aktuell
verbunden ProcessEngine bezogen.

## Aufbau und Strukturierung

Das Dashboard kann über den Navigationseintrag `Dashboard` geöffnet werden.

Das Dashboard besteht aus folgenden zwei Abschnitten:

Im ersten Abschnitt, `Processes running`, werden die laufenden Prozesse als
Tabelle aufgelistet. In der Tabelle wird die `Correlation Id` und die
`Process Model Id` angezeigt.

Im zweiten Abschnitt, `Task waiting`, werden UserTasks angezeigt, die auf
weitere Bearbeitung warten. In der Tabelle werden ebenfalls die
`Process Model Id` und die `User Task Id` angezeigt.

![Dashboard](dashboard.png)

## Funktion

In der Tabelle `Processes running` wird für jede laufende Prozessinstanz zwei
Links angeboten. In der Spalte `Process Model Id` ist jeweils ein Link zu der
Design-Ansicht des Prozessmodels verlinkt. Ebenfalls können alle UserTasks für
einen aktiven Prozess angezeigt werden.

Die `Task waiting` Tabelle enthält für jede wartende UserTask einen `Continue`
Button. Dieser dient dazu die entsprechende Task fortzuführen.
