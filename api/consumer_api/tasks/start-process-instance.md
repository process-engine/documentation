# Starten eines Prozessmodells

## Ziel/UseCase

Startet eine Prozessinstanz durch das Auslösen eines gegebenen StartEvents.
Die Schnittstelle antwortet, sobald ein gegebenes Event erreicht wurde.

Dabei kann es sich um ein SystemEvent oder ein Bpmn-EndEvent handeln.

Prozessinstanzen sind immer Teil einer Correlation.
Daher ist es optional möglich der Schnittstelle eine eigene CorrelationId
vorzugeben, wenn man nicht wünscht, dass die ProcessEngine eine
CorrelationId automatisch generiert.

In beiden Fällen wird man jedoch immer darüber informiert, in welcher Correlation
sich die gestartete Prozessinstanz befindet.

## Zugriffsberechtigungen

Ein Benutzer kann immer nur die Prozesse starten, die er auch berechtigt ist
zu sehen.
Ebenso kann er nur StartEvents und EndEvents ansteuern, bei denen er die
entsprechenden Berechtigungen hat.

## Was passiert in der ProcessEngine

- Das Prozessmodell wird geladen
- Es wird geprüft ob sich das gegebene StartEvent in dem Prozessmodell befindet
- Es wird geprüft ob der anfragende Benutzer das StartEvent ausführen darf
- ggf. geschieht das gleiche für EndEvents
- Anhand des Prozessmodells wird eine neue Prozessinstanz erstellt
- Erzeugen der Correlation und Verknüpfen mit der Prozessinstanz
  - Wenn keine correlationId vorgegeben ist, wird eine generiert
- Die Prozessinstanz wird unter Verwendung des definierten StartEvents gestartet
- Je nach Wert von `startCallbackType` antwortet die Schnittstelle
  - nach Starten des Prozesses
  - nach Beenden des Prozesses
  - nach Erreichen des gegebenen EndEvents

## Besonderheiten beim Subscriben auf ein EndEvent

Wird explizit auf ein EndEvent subscribed, dann **muss** der Benutzer die
Berechtigung dazu haben.

Wenn jedoch eine Prozessinstanz gestartet wird, **ohne** dass der Benutzer sich
auf ein EndEvent subscribed, erfolgt diese Prüfung **nicht**.

Das ist dadurch bedingt, dass die ProcessEngine nicht vor der Prozessausführung
wissen kann, ob der Benutzer auf das EndEvent, dass die Prozessinstanz am Ende
erreichen wird, auch tatsächlich zugreifen kann.

Allerdings wird nach Prozessende sichergestellt, dass der Benutzer keine
Informationen erhält, die ggf. nicht für ihn bestimmt waren.

Das heisst:
Erreicht die Prozessinstanz ein EndEvent, dass der Benutzer nicht berechtigt
ist zu sehen, wird er zwar darüber informiert, **dass** der Prozess beendet wurde,
jedoch erhält er **nicht** das Prozessergebnis.

Gleiche Einschränkungen gelten auch für TerminateEndEvents und ErrorEndEvents.
Bei fehlender Berechtigung wird der Benutzer nur darüber informiert, **dass** ein
Fehler auftrat, jedoch nicht welche Art von Fehler.

## Parameter

### Erforderliche Parameter

* `context` - Der Kontext, in dem die Abarbeitung der Funktion geschehen soll
  (enthält u.A. einen Token, der den Aufrufer der Funktion identifiziert)
* `processModelKey` - Der Key, der das Prozessmodell identifiziert, welches
  gestartet werden soll
* `startEventKey` - Der Key, des StartEvents, das zum starten des Prozesses
  ausgelöst werden soll
* `endEventKey` - Der Key des EndEvents, bei dessen Erreichen die
  Schnittstelle antwortet. Wird nur ausgewertet, wenn `startCallbackType`
  auf `CallbackOnEndEventReached` gesetzt wurde, ist dann aber eine Pflichtangabe

### Optionale Parameter

* `payload` - Enthält Parameter für den Prozessstart
  * `correlationId` - Eine ID, anhand derer der gestartete Vorgang identifiziert
    werden kann. Wenn nicht angegeben, wird die ProcessEngine selbst eine
    correlationId generieren
  * `callerId` - Nur bei CallActivity und Subprocess zu verwenden: Enthält die
    Instanz ID des aufrufenden Prozesses
  * `inputValues` - Eingabewerte, mit denen der Prozess gestartet wird
* `startCallbackType` - Gibt an, wann die Schnittstelle antwortet. Mögliche Werte sind:
  * `CallbackOnProcessInstanceCreated` - Die Schnittstelle antwortet, wenn die
    Prozessinstanz **gestartet**  wurde
  * `CallbackOnProcessInstanceFinished` - Die Schnittstelle antwortet, wenn die
    Prozessinstanz **beendet**  wurde
  * `CallbackOnEndEventReached` - Die Schnittstelle antwortet, wenn die
    Prozessinstanz durch ein bestimmtes EndEvent **beendet** wurde
  * Default ist `CallbackOnProcessInstanceCreated`

## Ergebnis/Rückgabewerte

Der Response body enthält die correlationId des gestarteten Vorgangs:

```JSON
{
  "correlationId": "d44c820a-9a78-44b4-af64-5968625cffad"
}
```

## Fehler, die erwartet werden müssen

Mögliche auftretende Fehler sind:
- `400`:
    - Die bereitgestellten `inputValues` sind ungültig
    - Der bereitgestellte Wert für `startCallbackType` ist ungültig
- `401`: Der anfragende Benutzer hat keine gültige Authentifizierung
- `403`: Der anfragende Benutzer hat auf den angegebenen Prozess keinen Zugriff
- `404`:
  - Es konnte kein Prozessmodell mit dem gegebenen `processModelKey`
    gefunden werden
  - Das Prozessmodell hat kein Startevent mit dem angegebenen `startEventKey`
- `500`:
  - Der Prozess konnte wegen eines internen Fehlers nicht gestartet werden
  - Der Prozess brach vor Erreichen des angegebenen `startCallbackType` Events wegen
    eines Fehlers vorzeitig ab
  - Beim Verarbeiten der Anfrage trat ein systeminterner Fehler auf

### REST/Messagebus API

Die HTTP-Routen für die Schnittstelle sehen so aus:

```JavaScript
// Starte Prozessinstanz und antworte direkt nach Prozessstart
POST /process_models/:process_model_key/start_events/:start_event_key/start?startCallbackType=1

// Starte Prozessinstanz und antworte nach Prozessende
POST /process_models/:process_model_key/start_events/:start_event_key/start?startCallbackType=2

// Starte Prozessinstanz und antworte wenn das gegebene EndEvent erreicht wurde
POST /process_models/:process_model_key/start_events/:start_event_key/start?startCallbackType=3&end_event_id=endEventKey
```

### IConsumerApi Schnittstelle

Die `IConsumerApi` Schnittstelle implementiert diesen UseCase
über die Methode `startProcessInstance`.

Diese Methode benötigt die weiter oben beschriebenen Parameter in folgender
Reihenfolge:
- `context`
- `processModelKey`
- `startEventKey`
- `payload`
- `startCallbackType`
- `endEventKey`
