# Konfiguration

Beim Konfigurieren der Anwendung soll dies auf verschiedenen Ebenen möglich sein.

Stellen Sie sich vor, Sie möchten einen anderen Port zum Hosten der Anwendung verwenden. Sie haben sicherlich eine statische Konfiguration, die Sie ändern können, um den Port anzupassen. Wenn Ihre Anwendung jedoch von einer anderen Anwendung (z. B. einem Orchestrator) gesteuert wird, möchten Sie sie anpassen können, ohne die statische Konfiguration zu ändern. Stattdessen könnten Sie Umgebungsvariablen oder Befehlszeilenargumente verwenden.

Unser Konfigurationskonzept verwendet eine Konfigurationshierarchie. Alle Konfigurationswerte innerhalb dieser Hierarchie können aus mehreren Konfigurationsquellen festgelegt werden, die sich gegenseitig in einer bestimmten Reihenfolge überschreiben.

Dies ist die Überschreibungsreihenfolge, **absteigend** nach Priorität:
* dynamische Konfiguration
* Befehlszeilen Argumente
* Umgebungsvariablen
* statische Konfiguration

## Nutzung

Jede von Ihnen deklarierte Konfiguration wird automatisch in die `config`-Eigenschaft der entsprechenden Klasse eingefügt.

Diese Injection erfolgt direkt nach der Klasseninstanziierung, so dass Sie das Konfigurationsobjekt überall erwarten und verwenden können, außer im `Konstruktor`.

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

In diesem Beispiel lautet die Konfigurationsdeklaration 'example: example_service`.

## Namenskonvention

Mit der Namenskonvention können Sie die Objekthierarchie Ihrer Konfigurationsobjekte durch einen Spacer getrennt angeben - in diesem Fall `:`.

Unser Beispiel von vorher hat zwei Schichten, die seine Hierarchie bilden - `example` und `example_service`.

In den folgenden Abschnitten wird untersucht, wie diese Hierarchien in verschiedenen Konfigurationsquellen dargestellt werden.

### Statische Konfiguration

Der Großteil Ihrer Anwendungskonfiguration ist statisch. Die statische Konfiguration wird als einzelne Konfigurationsdatei ODER als mehrere Konfigurationsdateien in einem Konfigurationsordner bereitgestellt.

#### Konfigurationsdatei

Wenn die statische Konfiguration innerhalb einer einzelnen JSON-Datei bereitgestellt wird, werden die Hierarchieebenen als Knoten dieser JSON-Datei dargestellt.

In diesem Beispiel könnte unsere JSON-Datei so aussehen:

```javascript
{
  "example": {
    "example_service": {
      "myValue": "test"
    }
  }
}
``` 

> Standardmäßig lautet die Konfigurationsdatei `./config.json` in Ihrem Projektstammverzeichnis.

#### Konfigurationsordner

Der Konfigurationsordner verwendet die gleiche Struktur wie die Konfigurationsdatei. Es teilt nur die Struktur auf mehrere Dateien und Ordner auf.

In unserem Beispiel würde die Dateistruktur so aussehen:

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

Wenn Sie dies mit der [Konfigurationsdatei] (#Konfigurationsdatei) vergleichen, besteht der Unterschied darin, dass Sie kleinere, mehr atomare Konfigurationsdateien haben, die möglicherweise einfacher für Sie zu warten sind.


> Standardmäßig wird erwartet, dass der Konfigurationsordner `./config` in Ihrem Projektstammverzeichnis ist.

### Umgebungskonfiguration

Wenn Sie einen Konfigurationswert mit einer Umgebungsvariablen festlegen möchten, ist der Abstandshalter für Hierarchieebenen `__`.

In unserem Beispiel würden wir den Wert wie folgt festlegen:

```
export example__example_service__myValue=test
```

> Hinweis: So würden Sie die Umgebungsvariable in einer **Linux**-Umgebung festlegen. Die Syntax ist in allen Betriebssystemen unterschiedlich.

### Kommandozeilenargumente

Bei Verwendung von Befehlszeilenargumenten werden die Hierarchieebenen wie in der [Deklaration](#Deklaration) verwendet.

```
node myApp --example:example_service:myValue test
```

Zusätzliche Argumente können einfach durch Anhängen eines anderen Arguments unter Verwendung derselben Syntax bereitgestellt werden.

### Dynamische Konfiguration

Im Gegensatz zu allen anderen Konfigurationsquellen ist die dynamische Konfiguration die einzige Quelle, die zur Laufzeit ausgewertet wird.

Dies gibt Ihnen Flexibilität für erweiterte Szenarien wie das Abrufen der Konfiguration von einer Netzwerkquelle oder von bedingten Konfigurationselementen.

Die dynamische Konfiguration wird mit einem `Resolver` von addict-ioc implementiert.

Sie können Resolver verwenden, um eine dynamische Konfiguration auf mehreren Layern zur Verfügung zu stellen, die sich in der Reihenfolge **absteigend** überschreiben:

  * eine Klasse
  * mehrere Klassen
  * alle Klassen, die im IoC-Container registriert sind

Darüber hinaus können Sie diese zur Laufzeit sogar überschreiben, indem Sie eine factory verwenden, die sie als zusätzlichen Parameter der `resolve` Methode des IoC-Containers oder der Factory-Funktion beim Arbeiten mit einer Lazy-Abhängigkeit zur Verfügung stellt.
