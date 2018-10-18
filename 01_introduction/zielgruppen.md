## Zielgruppen {#zielgruppen}

Wir entwickeln die Ideen von process-engine.io für drei Personengruppen, deren
Probleme wir lösen wollen:

1. Prozess-Ersteller

   Wir verstehen darunter Verantwortliche und Entwickler.

1. Prozess-Beteiligte

   Das sind Akteure Rund um den Prozess.

1. Laufzeitumgebung

   Technische Helfer für Prozesse bilden diese Gruppe.

Im Folgenden wird diese grobe Übersicht verfeinert und die von uns verstandene
Rolle der jeweiligen Gruppe erklärt.

### Prozess-Ersteller {#prozessersteller}

Eine Person dieser Gruppe:

* **entwirft** die Prozesslandschaft.
* **designed** und deployed die Prozessmodelle.
* **beobachtet** die Ausführung.

Die Prozess-Ersteller entwerfen die Prozesslandschaft.
Sie haben eine High-Level-Sicht auf die Prozesse.

Sie designen und deployen die Prozessmodelle.

Wenn die Prozesse dann in der ProcessEngine ablaufen, beobachten sie die
Ausführung.

### Prozess-Beteiligte {#prozessbeteiligte}

Diese Personengruppe hat folgende Interessen:

* Prozesse **starten/beenden**
* **Benutzer Tasks** bearbeiten
* **Service Tasks** bearbeiten

Ein Prozess-Beteiligter, dass kann z.B.:

* die Fachanwendung sein, die den Prozess startet.
* ein Kunde sein, der Waren kaufen will.
* ein einfacher Dienst sein, der Daten des Prozess verarbeitet.
* ein Sachbearbeiter welcher Benutzer Aufgaben (genannt UserTasks im
  BPMN-Standard) bearbeitet.
* ein Programm, welches externe Task bearbeitet oder Prozesse mit Events
  benachrichtigt.

### Laufzeitumgebung {#laufzeitumgebung}

Wir haben die technischen Notwendigkeiten unter der Laufzeitumgebung
zusammengefasst. Kurzgesagt verstehen darunter alles was:

* Unterstützung für die Ausführung der ProcessEngine

bietet. Darunter fällt alles, was die ProcessEngine zur Ausführung
benötigt, beispielsweise:

* Anbindung an die Datenbank oder
* Anschluss an einen MessageBus.

Die Anbindung verschiedener unterstützende Dienste sind denkbar, wie:

* externe Logging Mechanismen und
* Metriken.
