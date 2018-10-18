# Intro

Maßgeschneiderte Software reagiert schwerfällig auf Änderungen der an sie
gestellten Anforderungen.

Durch die Verwendung von Geschäftsprozessen erhält man die Flexibilität auf
Änderungen zu reagieren und man gewinnt ein mächtiges Werkzeug für die
Kommunikation zwischen Technikern und Fachabteilungen.

Ein wichtiger Effekt entsteht: Besseres Verständnis auf allen Seiten.

Für die ProcessEngine sind Prozesse zweierlei:

1. Dokumentation und
1. Blaupause der Software.

In komplexen Anwendungsfällen reduziert die Verwendung von Prozessen als Basis
der Software die Menge an Code, die zu entwickeln ist, und steigert
Produktivität und Stabilität der Lösungen.

## Motivation

Viel Erfahrung und Lessons-Learned, sind in die Entwicklung der ProcessEngine
geflossen. Die Software ist der Ergebnis jahrelanger Projekterfahrung mit
zahlreichen Kunden und wurde nicht am Reißbrett entworfen.

Aus der Erfahrung heraus, haben wir uns auf das Wesentliche konzentriert:

> Software nie wieder wegwerfen müssen.

Was wie eine fixe Idee anmutet, wird durch das Vorgehensmodell und die
ProcessEngine Realität. Moderne Software besteht aus APIs und gliedert sich aus
Microservices; BPMN bildet aus unserer Sicht die ideale Grundlage für die
Erfüllung des Nachhaltigkeitsversprechens.

## Zielgruppen

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

### Prozess-Ersteller

* entwirft die Prozesslandschaft
* designed und deployed die Prozessmodelle
* beobachtet die Ausführung

Die Prozess-Ersteller entwerfen die Prozesslandschaft.
Sie haben eine High-Level-Sicht auf die Prozesse.

Sie designen und deployen die Prozessmodelle.

Wenn die Prozesse dann in der ProcessEngine ablaufen, beobachten sie die
Ausführung.

### Prozess-Beteiligte

Diese Personengruppe hat folgende Interessen:

* Prozesse starten/beenden
* Benutzer Tasks bearbeiten
* Service Tasks bearbeiten

Genau zu diesem Zeitpunkt kommen auch die Prozess-Beteiligten ins Spiel.
Die kann z.B. die Fachanwendung sein, die den Prozess startet.

Oder ein Sachbearbeiter welcher Benutzer Aufgaben (genannt UserTasks im
BPMN-Standard) bearbeitet.

Vielleicht sogar ein Programm, welches externe Task bearbeitet oder Prozesse
mit Events benachrichtigt.

### Laufzeitumgebung

Wir haben die technischen Notwendigkeiten unter der Laufzeitumgebung
zusammengefasst. Kurzgesagt verstehen darunter alles was:

* Unterstützung für die Ausführung der ProcessEngine

beinhaltet. Darunter fällt alles, was die ProcessEngine zur Ausführung
benötigt, beispielsweise:

* Anbindung an die Datenbank oder
* Anschluss an einen MessageBus.

Die Anbindung verschiedener unterstützende Dienste sind denkbar, wie:

* externe Logging Mechanismen und
* Metriken.

## Bestandteile process-engine.io

Die Marke process-engine.io besteht aus vier Bestandteilen:

1. Vorgehensmodell
1. BPMN-Studio
1. ProcessEngine
1. API Domänen

## Denken-Malen-Messen

<!-- TODO: Inhalt -->

## Denken (Think)

Eine Übersicht der Prozesslandschaft und Zusammenspiel aller Prozesse ist
essentiell um geschäftskritische Schnittstellen zu identifizieren und steuernd
eingreifen zu können. Wir denken, überlegen und legen den besten
Domänenzuschnitt fest.

## Design (Design)

Prozessverantwortliche und Techniker gestalten gemeinsam in dieser Phase: ein
Bild sagt mehr als tausend Worte. Missverständnisse werden minimiert, denn es
wird eine gemeinsame Sprache entwickelt; iterativ wird die geplante Vision
umgesetzt und Bausteine heben die Qualität und fördern Nachhaltigkeit.

## Inspect (Inspect)

Performance zu analysieren und Leistung der Prozesse zu validieren ist
essentiell. Dashboards unterstützen bei der Identifikation von Engpässen;
Heatmaps helfen Hot-Spots zu erkennen; wir finden das optimale Design.

Die gewonnenen Erkenntnisse liefern eine wertvolle Grundlage für die optimale
Ausnutzung der Wertschöpfungskette; indem auf der Basis von Metriken neu
gedacht wird.

## Gesamtbild

Ganzheitlich betrachtet kann der Vorteil einer prozessbasierten
Entwicklung darauf reduziert werden, dass ein Unternehmen nachhaltig
transformiert wird; Es wird zur Gewohnheit iterativ das Geschäft selbst zu
Messen, zu bewerten und evtl. neu auszurichten. Alle Unternehmensbereiche sind
damit Teil der Wertschöpfungskette.
