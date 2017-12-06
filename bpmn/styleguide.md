# Styleguide

## Sprache in Modellen

In Modellen ist immer die Sprache des Anwenders zu verwenden.

### Aktivitäten bezeichnen

Verwende das **Objekt-Verrichtungsprinzip**.

[Objekt] + [Verb] - Pattern

Statt:

"Zuerst muss der Einkauf der Lebensmittel erledigt werden"

Lieber:

"Lebensmittel einkaufen"

### Ereignisse bezeichnen

Verwende das **Objekt-Zustandsprinzip**.

[Objekt] + [Zustand] - Pattern

Statt:

“Die Lebensmittel wurden zuerst eingekauft.”

Lieber:

“Lebensmittel eingekauft”

## Graphisches Design

Der Prozessfluss wird immer von links (oben) nach rechts (unten) modelliert.

Es gibt keine kreuzende oder überlappende Pfade.

![Beispiel Design](./assets/example_design.svg)

## Aktivitäten typisieren

Wir verwenden keine untypisierten Aktivitäten (rot);
stattdessen typisieren wir alle Aktivitäten sinnvoll (grün);
dadurch erkennt der Betrachter sofort den Fokus der Aktivität.

![Typisierte Aktivitäten](./assets/typisierung.svg)

### Beispiele für typisierte Aktivitäten

#### Benutzeraktivität

Eine Benutzeraktivität wird immer von einem Menschen erledigt; es handelt sich
dabei um eine von der Process Engine zugewiesene Aufgabe.

| Symbol | Beispiel |
| :----: | -------- |
| ![Nutzer Task](./assets/task_benutzer.svg) | Die Genehmigung eines Antrags; die Prüfung von offiziellen Dokumenten oder die Bearbeitung einer Anfrage. |

![Beispiel Benutzer](./assets/example_benutzer.svg)

- Der Benutzer erstellt eine Einkaufsliste.

#### Service Aktitvät

Eine Serviceaktivität wird von einer Software ausgeführt.

| Symbol | Beispiel |
| :----: | -------- |
| ![Service Task](./assets/task_service.svg) | Das Abfragen von Daten einer API; die automatische Verbuchung einer Rechnung oder das Generieren eines Angebots für einen Kunden. |

![Beispiel Service](./assets/example_service.svg)

- Der Benutzer erstellt eine Einkaufsliste.
- Die Preise der Positionen werden von einem Service ermittelt.

#### Skriptaktivität

Eine Skriptaktivität enthält ein Skript, das von der Process Engine ausgeführt
wird.

Die Process Engine unterstützt JavaScript als Skriptsprache.

| Symbol | Beispiel |
| :----: | -------- |
| ![Skript Task](./assets/task_skript.svg) | Das Ausgeben von Text auf einer Konsole oder generell alle Aufgaben, die mit JavaScript erledigt werden können. |

![Beispiel Skript](./assets/example_skript.svg)

- Der Benutzer erstellt eine Einkaufsliste.
- Die Preise der Positionen werden von einem Service ermittelt.
- Der Gesamtpreis wird von einem Skript ausgegeben.

#### Aufrufaktivität

Die Aufrufaktivität ist die einzige Möglichkeit einen anderen Prozess in
einem Prozess aufzurufen.

| Symbol | Beispiel |
| :----: | -------- |
| ![Aufruf Task](./assets/task_aufruf.svg) | Der Aufruf eines anderen Prozesses in diesem Prozess. |

![Beispiel Aufruf](./assets/example_aufruf.svg)

Der gesamte Prozess wird durch die Aufrufaktivität aufgerufen.

## Verwendung von Gateways

Viele Prozesse laufen nicht immer gleich ab. Wir nutzen Gateways, um diese
Variationen abzubilden.

Beachte folgende Regeln, zum korrekten modellieren von Gateways:

- Ein Split-Gateway hat einen eingehenden und einen oder mehrere ausgehende Pfeile.

![Beispiel Split Gateway](./assets/example_split_gateway.svg)

- Ein Join-Gateway hat einen oder mehrere eingehende und einen ausgehenden Pfeil.

![Beispiel Split Join Gateway](./assets/example_split_join_gateway.svg)

- Split- und Join-Gateways korrespondieren (z.B. XOR-Split-Gateway mit
  XOR-Join-Gateway).

## Weitere Regeln

- Es sollte immer ein **Pool** verwendet werden.
- Es sollte immer eine oder mehrere **Lanes** verwendet geben.
![Beispiel Pool und Lanes](./assets/example_pool_lanes.svg)

- Ein Prozess hat ein Startevent und mindestens ein Endevent.
- Eine Aktivität hat einen eingehenden und einen ausgehenden Pfeil.
- Zum Teilen und Zusammenführen von Prozessflüssen werden Gateways verwendet.
- Boundary-Ereignisse haben einen ausgehenden Pfeil.
