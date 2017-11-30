# Konfiguration

Die Konfiguration einer Applikation soll in vier Stufen erfolgen:

1. statische Konfigurationsdatei
2. Umgebungsvariablen
3. Kommandozeilenargumente
4. dynamische Konfiguration

**Beispiel**

Ändern des Ports zum Hosten einer Anwendung.

Die Konfigurationsdatei der Anwedung beinhaltet:

```
[config]
  port=8000
```

Das führt beim Starten des Programms zu folgender Ausgabe:

```
$ my_program
Started to listen on Port 8000
```

Der oben vorgestellten Vierstufenlogik folgend, kann die Applikation über
Umgebungsvariablen gesteuert werden:

```
$ PORT=8010 my_program
Started to listen on Port 8010
```

Oder mit Kommandozeilenargumenten:

```
$ my_program --port 9999
Started to listen on Port 9999
```

Baut man die Konfiguration der Applikation nach dem obigen Schema auf, dann kann
man folgende Aussage treffen:

`Befehlszeilenargumente > statisch Umgebungsvariablen > statische Konfigurationsdatei`

An unserem Beispiel sieht das wie folgt aus:

```
$ cat config.txt
[config]
  port=8000

$ PORT=8010 my_program --port=7777
Started to listen on Port 7777
```

Diese Vierstufenlogik ist angelehnt an die Gedanken von
[12-Factor](https://12factor.net/de/config) und erlaubt eine Komposition
verschiedener Applikationsbestandteile; man muss sich also nicht auf
Ports/Pfade/Adressen/etc. festlegen.

Unsere komplette Konfigurationhierarchie sieht demnach wie folgt aus:

`dynamische Konfiguration > Befehlszeilenargumente > Umgebungsvariablen > statische Konfiguration`

## Nutzung

Jede Konfiguration, welche man selbst deklariert, wird automatisch in die
`config`-Eigenschaft der entsprechenden Klasse eingefügt.

Diese Injektion erfolgt direkt nach der Klasseninstanziierung, sodass man das
Konfigurationsobjekt überall, außer im Konstruktor, verwenden kann.

```typescript
class ExampleService {
  public config: any = undefined;
  public doSomething(): void {
    console.log(this.config.myValue); // 'test'
  }
}
```

## Deklaration

Die Deklaration eines Konfigurationsobjekts erfolgt während der Registrierung
der Klassen auf dem IoC-Container (siehe
[Dependency Injection](../module-interaction/dependency-injection.md)).

```typescript
container.register('ExampleService', ExampleService)
  .configure('example:example_service');
```

In diesem Beispiel lautet die Konfigurationsdeklaration `example:example_service`.

## Namenskonvention

Mit der Namenskonvention kann man die Objekthierarchie der Konfigurationsobjekte
durch einen Spacer getrennt angeben - in diesem Fall `:`.

Das Beispiel von vorher hat zwei Schichten, die seine Hierarchie bilden -
`example` und `example_service`.

In den folgenden Abschnitten wird untersucht, wie diese Hierarchien in
verschiedenen Konfigurationsquellen dargestellt werden.

### Statische Konfiguration

Die statische Konfiguration kann:

1. als einzelne Konfigurationsdatei
1. als mehrere Konfigurationsdateien

in einem Konfigurationsordner bereitgestellt werden.

#### Konfigurationsdatei

Wenn die statische Konfiguration innerhalb einer einzelnen JSON-Datei
bereitgestellt wird, werden die Hierarchieebenen als Knoten dieser JSON-Datei
dargestellt.

Ein möglicher Aufbau der JSON-Konfigurationsdatei ist:

```javascript
{
  "example": {
    "example_service": {
      "myValue": "test"
    }
  }
}
```

Standardmäßig lautet die Konfigurationsdatei `./config.json` im Projektstammverzeichnis.

#### Konfigurationsordner

Der Konfigurationsordner verwendet die gleiche Struktur wie die
Konfigurationsdatei. Die Knoten der JSON-Datei werden hier als Dateien und
Ordner dargestellt.

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

Standardmäßig wird erwartet, dass der Konfigurationsordner `./config` im
Projektstammverzeichnis ist.

### Umgebungskonfiguration

Wenn ein Konfigurationswert mit einer Umgebungsvariable festgelegt werden soll,
ist der Abstandshalter für Hierarchieebenen `__`.

In diesem Beispiel würden wir den Wert wie folgt festlegen:

```
export development__example__example_service__myValue=test
```

Hinweis: So würde die Umgebungsvariable in einer **Linux**-Umgebung festgelegt
werden. Der Befehl zum Anlegen einer Umgebungsvariable ist abhängig vom
Betriebssystem.

### Kommandozeilenargumente

Bei Verwendung von Befehlszeilenargumenten werden die Hierarchieebenen wie in
der [Deklaration](#Deklaration) verwendet.

```
node myApp --example:example_service:myValue test
```

Zusätzliche Argumente können einfach durch Anhängen eines anderen Arguments
unter Verwendung derselben Syntax bereitgestellt werden.

```
node myApp \
      --example:example_service:myValue \
      --example2:example_service2:myValueBla \
      test
```

### Dynamische Konfiguration

Grundsätzlich ist die Konfiguration statisch;
wir unterscheiden vier Quellen für die Konfiguration;
drei statische, eine dynamische;
die Dynamische Konfiguration ist die einzige Quelle, die zur Laufzeit geändert werden kann.

Die dynamische Konfiguration wird mit einem `Resolver` von addict-ioc
implementiert.

Resolver können verwendet werden, um eine dynamische Konfiguration auf
mehreren Layern zur Verfügung zu stellen, die sich in dieser Reihenfolge
überschreiben:

`eine Klasse > mehrere Klassen > alle Klassen, die im IoC-Container registriert sind`

Mit einer "factory" können diese sogar zur Laufzeit übrschrieben werden.
Dazu wird sie als zusätzlicher Parameter der `resolve` Methode des IoC-Containers
zur Verfügung gestellt.
