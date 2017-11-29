# Konfiguration

Die Konfiguration der Applikation soll in drei Stufen erfolgen:

1. statische Konfigurationsdatei
2. statische Umgebungsparameter
3. dynamische aus Key-Value-Store

**Beispiel**

Ändern des Ports zum Hosten der Anwendung.

Diese Konfigurationsdatei beinhaltet den

```
[config]
  port=8000
```

Führt beim Starten des Programms zu folgender Ausgabe:

```
$ my_program
Started to listen on Port 8000
```

Eine statische Konfiguraton wird von der Applikation geladen, die eine Standardkonfiguration beinhaltet.
Man stößt bei diesem Vorgehen an folgendes Problem: Ist die Anwendung Teil einer anderen Anwendung (z.B. einem Orchestrator), kann es zu Konflikten der Konfiguration kommen. Ein klassisches Beispiel stellen Ports dar, die nur einmal pro System belegt werden können.

Der oben vorgestellten drei-Stufen-Logik folgend, kann die Applikation über Umgebungsvariablen gesteuert werden:

```
$ PORT=8010 my_program
Started to listen on Port 8010
```

Eine weitere

```
$ my_program --port 9999
Started to listen on Port 9999
```

Baut man die Konfiguration der Applikation nach dem obigen Schema auf, dann kann man folgende Aussage treffen:

`Befehlszeilenargumente > statisch Umgebungsvariablen > statische Konfigurationsdatei`

An unserem Beispiel sieht das so aus:

```
$ cat config.txt
[config]
  port=8000

$ PORT=8010 my_program --port=7777
Started to listen on Port 7777
```

Am Ende werden die Argumente der Befehlszeile genommen, da diese Konfigurationsdatei und Umgebungsvariablen überschreiben.

Diese drei-Stufen-Logik ist angelehnt an die Gedanken von [12-Factor](https://12factor.net/de/config) und erlaubt eine Komposition verschiedener Applikationsbestandteile; man muss sich nicht auf Ports/Pfade/Adresse/etc. festlegen.

Unser Konfigurationskonzept verwendet eine Konfigurationshierarchie. Alle Konfigurationswerte innerhalb dieser Hierarchie können aus mehreren Konfigurationsquellen festgelegt werden, die sich gegenseitig in einer bestimmten Reihenfolge überschreiben.

Diese Reihenfolge sieht wie folgt aus:

`dynamische Konfiguration > Befehlszeilenargumente > Umgebungsvariablen > statische Konfiguration`

## Nutzung

Jede Konfiguration, welche man selbst deklariert, wird automatisch in die `config`-Eigenschaft der entsprechenden Klasse eingefügt.

Diese Injektion erfolgt direkt nach der Klasseninstanziierung, so dass man das Konfigurationsobjekt überall erwarten und verwenden kann, außer im `Konstruktor`.

```typescript
class ExampleService {
  public config: any = undefined;
  public doSomething(): void {
    console.log(this.config.myValue); // 'test'
  }
}
```

## Deklaration

Die Deklaration eines Konfigurationsobjekts erfolgt während der Registrierung der Klassen auf dem IoC-Container (siehe [Dependency Injection](../module-interaction/dependency-injection.md)).

```typescript
container.register('ExampleService', ExampleService)
  .configure('example:example_service');
```

In diesem Beispiel lautet die Konfigurationsdeklaration `example: example_service`.

## Namenskonvention

Mit der Namenskonvention kann die Objekthierarchie der Konfigurationsobjekte durch einen Spacer getrennt angeben - in diesem Fall `:`.

Das Beispiel von vorher hat zwei Schichten, die seine Hierarchie bilden - `example` und `example_service`.

In den folgenden Abschnitten wird untersucht, wie diese Hierarchien in verschiedenen Konfigurationsquellen dargestellt werden.

### Statische Konfiguration

Der Großteil der Anwendungskonfiguration ist statisch. Die statische Konfiguration wird als einzelne Konfigurationsdatei ODER als mehrere Konfigurationsdateien in einem Konfigurationsordner bereitgestellt.

#### Konfigurationsdatei

Wenn die statische Konfiguration innerhalb einer einzelnen JSON-Datei bereitgestellt wird, werden die Hierarchieebenen als Knoten dieser JSON-Datei dargestellt.

In diesem Beispiel könnte die JSON-Datei so aussehen:

```javascript
{
  "example": {
    "example_service": {
      "myValue": "test"
    }
  }
}
``` 

> Standardmäßig lautet die Konfigurationsdatei `./config.json` im Projektstammverzeichnis.

#### Konfigurationsordner

Der Konfigurationsordner verwendet die gleiche Struktur wie die Konfigurationsdatei. Es teilt nur die Struktur auf mehrere Dateien und Ordner auf.

In diesem Beispiel würde die Dateistruktur so aussehen:

```
.
+-- config
    +-- example
        +-- example_service.json
```

und der Inhalt von 'example_service.json` so:

```
{
  "myValue": "test"
}
``` 

Wenn dies mit der [Konfigurationsdatei] (#Konfigurationsdatei) verglichen wird, besteht der Unterschied darin, dass es kleinere, mehr atomare Konfigurationsdateien gibt, die möglicherweise einfacher zu warten sind.


> Standardmäßig wird erwartet, dass der Konfigurationsordner `./config` im Projektstammverzeichnis ist.

### Umgebungskonfiguration

Wenn ein Konfigurationswert mit einer Umgebungsvariable festgelegt werden soll, ist der Abstandshalter für Hierarchieebenen `__`.

In diesem Beispiel würden wir den Wert wie folgt festlegen:

```
export example__example_service__myValue=test
```

> Hinweis: So würde die Umgebungsvariable in einer **Linux**-Umgebung festgelegt werden. Die Syntax ist in allen Betriebssystemen unterschiedlich.

### Kommandozeilenargumente

Bei Verwendung von Befehlszeilenargumenten werden die Hierarchieebenen wie in der [Deklaration](#Deklaration) verwendet.

```
node myApp --example:example_service:myValue test
```

Zusätzliche Argumente können einfach durch Anhängen eines anderen Arguments unter Verwendung derselben Syntax bereitgestellt werden.

### Dynamische Konfiguration

Im Gegensatz zu allen anderen Konfigurationsquellen ist die dynamische Konfiguration die einzige Quelle, die zur Laufzeit ausgewertet wird.

Dies gib Flexibilität für erweiterte Szenarien wie das Abrufen der Konfiguration von einer Netzwerkquelle oder von bedingten Konfigurationselementen.

Die dynamische Konfiguration wird mit einem `Resolver` von addict-ioc implementiert.

Resolver können verwendendet werden, um eine dynamische Konfiguration auf mehreren Layern zur Verfügung zu stellen, die sich in dieser Reihenfolge überschreiben:

`eine Klasse > mehrere Klassen > alle Klassen, die im IoC-Container registriert sind`

Darüber hinaus können diese zur Laufzeit sogar überschrieben werden, indem eine factory verwendendet wird, die sie als zusätzlichen Parameter der `resolve` Methode des IoC-Containers oder der Factory-Funktion beim Arbeiten mit einer Lazy-Abhängigkeit zur Verfügung stellt.
