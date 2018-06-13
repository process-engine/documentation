# Auflisten startbarer Prozessmodelle

* [Alle Prozessmodelle abfragen](#alle-prozessmodelle-abfragen)
* [Einzelnes Prozessmodell abfragen](#einzelnes-prozessmodell-abfragen)

## Alle Prozessmodelle abfragen

### Ziel/UseCase

Bezieht eine Liste aller Prozessmodelle, welche über mindestens ein
StartEvent verfügen welches der aktuell eingeloggte Benutzer sehen darf.

Ziel ist es, dem Benutzer zu ermöglichen, Prozesse zu starten. Dafür muss er
wissen, welche Prozesse er starten kann

### Erforderliche und Optionale Parameter

Die Schnittstelle erfordert die folgenden Parameter:

* `context` - Der Kontext in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert).

### Ergebnis/Rückgabewerte

Die ermittelten Prozessmodelle werden als JSON-Array zurückgeben.
Jedes JSON Objekt in diesem Array beinhaltet dabei folgende Informationen:

* Den Key des Prozessmodells
* Eine Auflistung der Keys aller im Prozessmodell enthaltenen StartEvents

Daraus ergibt sich folgende Response:

```JSON
{
  "process_models": [
    {
      "key": "MyFancyProcess",
      "start_events": [
        {
          "key": "FancyProccessStart1",
          "id": "someStartEventId",
          "data": {}
        },
        {
          "key": "FancyProccessStart2",
          "id": "someOtherStartEventId",
          "data": {}
        }
      ]
    },
    {
      "key": "ProductTest",
      "start_events": [
        {
          "key": "TestStart",
          "id": "yetAnOtherStartEventId",
          "data": {}
        }
      ]
    }
  ]
}
```

### Was passiert in der Process Engine

- Es werden alle Prozessmodelle angefragt.
- Davon werden alle übernommen, die Lanes haben auf die der Verwender zugriff
  hat. Lanes ohne StartEvents werden dabei behandlet, als hätte der Verwender
  keinen Zugriff auf die Lane.
- Jedem verbleibenden Prozessmodell werden die so bestimmten zugehörigen
  StartEvents zugeteilt.
- Die Prozessmodelle werden als Ergebnis zurückgegeben.

### Fehler, die bei der Fehlbenutzung erwartet werden müssen

Mögliche auftretende Fehler sind:
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer ist nicht berechtigt diesen Request
auszuführen
- `500`: Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

### REST/Messagebus API

Die HTTP-Route für die Schnittstelle sieht so aus:

```
GET /process_models
```

### ggf. weitere sinnvolle Infos (z.B. Regelwerk, berechtigungen usw.)

Benutzer können nur die Prozessmodelle abfragen, die sie mit ihren
Berechtigungen auch sehen dürfen.

## Einzelnes Prozessmodell abfragen

### Ziel/UseCase

Unter Angabe eines `process_model_keys` kann ein einzelnes Prozessmodell direkt
abgefragt werden. Das dient dazu zu erfahren, welche StartEvents der eingeloggte
Benutzer zu diesem Prozess auslösen kann.

### Erforderliche und Optionale Parameter

Die Schnittstelle erfordert die folgenden Parameter:

* `context` - Der Kontext in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert).
* `process_model_key` - Der Key der das ProzessModell identifiziert, um das es
  geht

### Ergebnis/Rückgabewerte

Die zugehörige Response gleicht der von `Alle Prozessmodelle abfragen`,
mit dem Unterschied, dass hier kein Array, sondern ein einzelnes JSON-Objekt
zurückgegeben wird.

```JSON
{
  "key": "MyFancyProcess",
  "start_events": [
    {
      "key": "FancyProccessStart1",
      "id": "someStartEventId",
      "data": {}
    },
    {
      "key": "FancyProccessStart2",
      "id": "someOtherStartEventId",
      "data": {}
    }
  ]
}
```

### Was passiert in der Process Engine

- Es wird anhand des `process_model_key` das Prozessmodell angefragt.
- Alle StartEvents, die in Lanes liegen, auf die der Verwender zugriff hat
  werden dem Prozessmodell zugeteilt.
- Sollten keine StartEvents vorhanden sein, auf die der Verwender zugriff hat,
  wird ein ForbiddenError geworfen.
- Das Prozessmodell wird als Ergebnis zurückgegeben.

### Fehler, die bei der Fehlbenutzung erwartet werden müssen

Mögliche auftretende Fehler sind:
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer ist nicht berechtigt diesen Request auszuführen
- `404`: Es konnte kein Prozessmodell mit dem gegebenen `process_model_key`
gefunden werden
- `500`: Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

### REST/Messagebus API

Die HTTP-Route für die Schnittstelle sieht so aus:

```
GET /process_models/{process_model_key}
```

### ggf. weitere sinnvolle Infos (z.B. Regelwerk, berechtigungen usw.)

Benutzer können nur die Prozessmodelle abfragen, die sie mit ihren
Berechtigungen auch sehen dürfen.
