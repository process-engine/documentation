# Auflisten startbarer Prozessmodelle

* [Alle Prozessmodelle abfragen](#alle-prozessmodelle-abfragen)
* [Einzelnes Prozessmodell abfragen](#einzelnes-prozessmodell-abfragen)

## Alle Prozessmodelle abfragen

### Ziel/UseCase

Bezieht eine Liste aller Prozessmodelle.

Es werden nur Prozessmodelle angezeigt, auf die folgendes zutrifft:
- Der Benutzer hat die Berechtigung den Prozess zu sehen
- Der Prozess ist als ausführbar markiert (`isExecutable` Flag ist gesetzt)
- Es existiert mindestens ein `StartEvent` auf das der Benutzer Zugriff hat

Ziel ist es, dem Benutzer zu ermöglichen, Prozesse zu starten.
Dafür muss er wissen, welche Prozesse er überhaupt starten kann.

### Zugriffsberechtigungen

Benutzer können nur die Prozessmodelle abfragen, die sie mit ihren
Berechtigungen auch sehen dürfen.

Dabei ist folgendes zu beachten:
- Prozessmodelle, die mindestens 1 zugreifbares StartEvent und 1 zugreifbares
 EndEvent haben, werden ausgegeben
- Prozessmodelle, die mindestens 1 zugreifbares StartEvent, aber **kein**
zugreifbares EndEvent haben, werden ausgegeben
- Prozessmodelle, die **kein** zugreifbares StartEvent, aber ein oder mehrere
zugreifbare EndEvents haben, werden **nicht** ausgegben

Diese Konstellation ist dadurch bedingt, dass es dem Benutzer auch möglich sein
soll Prozessinstanzen zu starten, ohne sich auf ein bestimmtes EndEvent zu
subscriben, die Angabe eines StartEvents aber immer zwingend erforderlich ist.

### Was passiert in der Process Engine

- Es werden alle Prozessmodelle angefragt
- Prozessmodelle, welche keine StartEvents beinhalten auf die der Benutzer
  Zugriff hat, werden herausgefiltert
  - Welche StartEvents verfügbar sind richtet sich danach auf welcher Lane
  diese sich befinden
  > TODO: Rechtekonzept dokumentieren und hier verlinken
- Die gleiche Rechteprüfung passiert auch für EndEvents
- Die verbleibenden Prozessmodelle werden als Ergebnis zurückgegeben

### Parameter

#### Erforderliche Parameter

* `context` - Der Kontext, in dem die Abarbeitung der Funktion geschehen soll.
  Enthält u.A. einen Token, der den anfragenden Benutzer identifiziert.

#### Optionale Parameter

Die Schnittstelle hat keine optionalen Parameter.

### Ergebnis/Rückgabewerte

Die ermittelten Prozessmodelle werden als JSON-Array zurückgeben.
Jedes JSON Objekt in diesem Array beinhaltet dabei folgende Informationen:

* Den Key des Prozessmodells
* Eine Auflistung der Keys aller im Prozessmodell enthaltenen StartEvents
* Eine Auflistung der Keys aller im Prozessmodell enthaltenen EndEvents

**Wichtig**: Es werden nur Events ausgegben, auf die der Benutzer zugreifen darf.

Daraus ergibt sich folgende Response:

```JSON
{
  "processModels": [
    {
      "key": "MyFancyProcess",
      "startEvents": [
        {
          "key": "FancyProccessStart1",
          "data": {}
        },
        {
          "key": "FancyProccessStart2",
          "data": {}
        }
      ],
      "endEvents": [
        {
          "key": "FancyProccessEnd1",
          "data": {}
        }
      ]
    },
    {
      "key": "ProductTest",
      "startEvents": [
        {
          "key": "TestStart",
          "data": {}
        }
      ],
      "endEvents": [
        {
          "key": "FancyProccessEnd1",
          "data": {}
        },
        {
          "key": "FancyProccessEnd2",
          "data": {}
        }
      ]
    }
  ]
}
```

### Fehler, die erwartet werden müssen

Mögliche auftretende Fehler sind:
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer ist nicht berechtigt diesen Request
auszuführen
- `500`: Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

### REST/Messagebus API

Die HTTP-Route für die Schnittstelle sieht so aus:

```REST
GET /process_models
```

### IConsumerApi Schnittstelle

Die `IConsumerApi` Schnittstelle implementiert diesen UseCase
über die Methode `getProcessModels`.

Als Parameter nimmt diese Methode den `Context` (siehe oben)
des Benutzers entgegen.

## Einzelnes Prozessmodell abfragen

### Ziel/UseCase

Unter Angabe eines `processModelKeys` kann ein einzelnes Prozessmodell direkt
abgefragt werden.
Dies ermöglicht es dem Benutzer zu erfahren, ob er auf das Prozessmodell
zugreifen darf, welche StartEvents des Prozesses er auslösen und auf welche
EndEvents er sich subscriben darf.

### Zugriffsberechtigungen

Es gelten die gleichen Einschränkungen, wie beim Abfragen aller Prozessmodelle.

### Was passiert in der Process Engine

Es passiert hier das gleiche wie beim Abfragen aller Prozessmodelle.
Nur werden die Abfrage und die nötigen Berechtigungs-Checks gezielt für ein
einzelnes Prozessmodell ausgeführt.

Alle Einschränkungen und Besonderheiten, die beim Abfragen aller Prozessmodelle
gelten, kommen auch hier zur Geltung.

### Parameter

#### Erforderliche Parameter

* `context` - Der Kontext in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert)
* `processModelKey` - Der Key des Prozessmodells, welches der Benutzer
  abfragen möchte

#### Optionale Parameter

Die Funktion hat keine optionalen Parameter.

### Ergebnis/Rückgabewerte

Die zugehörige Response gleicht der von `Alle Prozessmodelle abfragen`,
mit dem Unterschied, dass hier kein Array, sondern ein einzelnes JSON-Objekt
zurückgegeben wird.

```JSON
{
  "key": "MyFancyProcess",
  "startEvents": [
    {
      "key": "FancyProccessStart1",
      "data": {}
    }
  ],
  "endEvents": [
    {
      "key": "FancyProccessEnd1",
      "data": {}
    }
  ]
}
```

### Fehler, die erwartet werden müssen

Mögliche auftretende Fehler sind:
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer ist nicht berechtigt das Prozesmodell zu sehen
- `404`: Es konnte kein Prozessmodell mit dem gegebenen `processModelKey`
gefunden werden
- `500`: Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

### REST/Messagebus API

Die HTTP-Route für die Schnittstelle sieht so aus:

```REST
GET /process_models/:process_model_key
```

### IConsumerApi Schnittstelle

Die `IConsumerApi` Schnittstelle implementiert diesen UseCase
über die Methode `getProcessModelByKey`.

Die weiter oben genannten Parameter müssen in folgender Reihenfolge angegeben werden:
- `context`
- `processModelKey`
