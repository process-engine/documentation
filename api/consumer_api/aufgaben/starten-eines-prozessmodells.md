# Starten eines Prozessmodells

* [Starten und auf ein `System Event` warten](#starten-und-auf-ein-system-event-warten)
* [Starten und auf ein bestimmtes EndEvent warten](#starten-und-auf-ein-bestimmtes-endevent-warten)

## Starten und auf ein `System Event` warten

### Ziel/UseCase

Startet einen Prozess durch das Auslösen eines Start-Events. Die Schnittstelle
antwortet je nach Verwendung der Parameter entweder sofort nach dem
erfolgreichen Start des Prozesses, oder nachdem er beendet wurde.

### Erforderliche und Optionale Parameter

Die Schnittstelle erfordert die folgenden Parameter:

* `context` - Der Kontext in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert).
* `process_model_key` - Der Key der das Prozessmodell identifiziert, welches
  gestartet werden soll.
* `start_event_key` - Der Key des StartEvents, Das zum starten des Prozesses
  ausgelöst werden soll.

Die Schnittstelle bietet die folgenden optionalen Parameter:

* `correlation_id` - Eine ID, anhand derer der gestartete Vorgang identifiziert
  werden kann. Wenn nicht angegeben, wird die Process Engine eine correlation_id
  generieren.

* `input_values` - Eingabewerte, mit denen der Prozess gestartet wird.

* `return_on` - Gibt an, wann die Schnittstelle antwortet. Mögliche Werte sind:
  * `on_process_instance_started` - Die Schnittstelle antwortet, wenn die
    Prozessinstanz **gestartet**  wurde.
  * `on_process_instance_finished` - Die Schnittstelle antwortet, wenn die
    Prozessinstanz **beendet** wurde.

  Wenn nicht angegeben, wird implizit `on_process_instance_started` verwendet.

### Ergebnis/Rückgabewerte

Der Response body enthält die correlation_id des gestarteten Vorgangs:

```JSON
{
  "correlation_id": "d44c820a-9a78-44b4-af64-5968625cffad"
}
```

### Was passiert in der Process Engine

- Es werden alle StartEvents zu dem Prozessmodell angefragt, die in Lanes
  liegen, auf die der Verwender Zugriff hat.
- Es wird anhand des Prozessmodells eine neue Prozessinstanz erstellt.
- Wenn keine correlation_id vorgegeben ist, wird eine generiert.
- Die Prozessinstanz wird unter Verwendung des definierte StartEvents gestartet.
- Je nach Wert von `return_on` wird entweder direkt nach dem erfolgreichen Start
  geantwortet, oder sobald der Prozess beendet wurde.

### Fehler, die bei der Fehlbenutzung erwartet werden müssen

Mögliche auftretende Fehler sind:
- `400`:
    - Die bereitgestellten `input_values` sind ungültig
    - Der bereitgestellte Wert für `return_on` ist ungültig
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer hat auf den angegebenen Prozess keinen Zugriff
- `404`:
  - Es konnte kein Prozessmodell mit dem gegebenen `process_model_key`
    gefunden werden
  - Das Prozessmodell hat kein Startevent mit dem angegebenen `start_event_key`
- `500`:
  - Der Prozess konnte wegen eines internen Fehlers nicht gestartet werden
  - Der Prozess brach vor erreichen des angegebenen `return_on` Events wegen
    eines Fehlers vorzeitig ab
  - Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

### ggf. weitere sinnvolle Infos (z.B. Regelwerk, berechtigungen usw.)

> TODO: Zusätzliche Infos zu der Schnittstelle aufschreiben.

## Starten und auf ein bestimmtes EndEvent warten

### Ziel/UseCase

Startet einen Prozess durch das Auslösen eines Start-Events. Die Schnittstelle
antwortet sobald ein gegebenes BPMN-EndEvent erreicht wurde

### Erforderliche und Optionale Parameter

Die Schnittstelle erfordert die folgenden Parameter:

* `context` - Der Kontext in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert).
* `process_model_key` - Der Key der das Prozessmodell identifiziert, welches
  gestartet werden soll.
* `start_event_key` - Der Key des StartEvents, Das zum starten des Prozesses
  ausgelöst werden soll.
* `end_event_key` - Der Key des EndEvents, bei dessen erreichen die
  Schnittstelle antwortet

Die Schnittstelle bietet die folgenden optionalen Parameter:

* `correlation_id` - Eine ID, anhand derer der gestartete Vorgang identifiziert
  werden kann. Wenn nicht angegeben, wird die Process Engine eine correlation_id
  generieren.

* `input_values` - Eingabewerte, mit denen der Prozess gestartet wird.

### Ergebnis/Rückgabewerte

Als Rückgabewert erhält man die correlation_id zu dem Vorgang den man gestartet
hat:

```JSON
{
  "correlation_id": "d44c820a-9a78-44b4-af64-5968625cffad"
}
```

### Was passiert in der Process Engine

- Es werden alle StartEvents und EndEvents zu dem Prozessmodell angefragt, die
  in Lanes liegen, auf die der Verwender Zugriff hat.
- Es wird anhand des Prozessmodells eine neue Prozessinstanz erstellt.
- Wenn keine correlation_id vorgegeben ist, wird eine generiert.
- Die Prozessinstanz wird unter Verwendung des definierte StartEvents gestartet.
- Sobald das vorgegebene EndEvent erreicht ist, wird geantwortet.

### Fehler, die bei der Fehlbenutzung erwartet werden müssen

Mögliche auftretende Fehler sind:
- `400`: Der bereitgestellte request body ist ungültig
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer hat auf den angegebenen Prozess keinen Zugriff
- `404`:
  - Es konnte kein Prozessmodell mit dem angegebenen `process_model_key`
    gefunden werden
  - Das Prozessmodell hat kein StartEvent mit dem gegebenen `start_event_key`
  - Das Prozessmodell hat kein EndEvent mit dem gegebenen `end_event_key`
- `500`:
  - Der Prozess konnte wegen eines internen Fehlers nicht gestartet werden
  - Der Prozess brach vor erreichen des angegebenen `return_on` Events wegen
    eines Fehlers vorzeitig ab
  - Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

### REST/Messagebus API

Die HTTP-Route für die Schnittstelle sieht so aus:

```JavaScript
POST /process_models/{process_model_key}/start_events/{start_event_key}/end_event/{end_event_key}/start_and_resolve_by_end_event

// body
{
  "correlation_id": "d44c820a-9a78-44b4-af64-5968625cffad",
  "input_values": {}
}
```

### ggf. weitere sinnvolle Infos (z.B. Regelwerk, berechtigungen usw.)

Wenn der Prozess aufgrund eines Fehlers beendet wird, ohne dass das angegebene
EndEvent erreicht wird, wird die Fehlernachricht keine Details dazu beinhalten,
da der Verwender unter Umständen nicht berechtigt ist, diese Details einzusehen.
