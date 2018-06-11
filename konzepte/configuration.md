# Konfiguration

Die Konfiguration einer Applikation kann in vier Stufen erfolgen:

1. statische Konfigurationsdatei
2. Umgebungsvariablen
3. Kommandozeilenargumente
4. dynamische Konfiguration

**Beispiel**

Ändern des Ports zum Hosten einer Anwendung.

Die Konfigurationsdatei der Anwendung beinhaltet:

```json
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

Die Priorisierung sich überdeckender Konfigurationen kann man mit folgender Aussage beschreiben:

`Befehlszeilenargumente > statisch Umgebungsvariablen > statische Konfigurationsdatei`

An unserem Beispiel sieht das wie folgt aus:

```
$ cat config.ini
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

Die Konfiguration einer Klasse kann über den
[IoC-Container](./../anhang/GLOSSARY.md#ioc) registriert werden (siehe
[Dependency Injection](./../processengine/ts/architektur/dependendy-injection.md)).

```typescript
container.register('ExampleService', ExampleService)
  .configure('example:example_service');
```

In diesem Beispiel würde die Konfiguration z.B. aus einer Datei
`example_service.json` aus einem Ordner `example` geladen.

## Namenskonvention

Eine Namenskonvention besagt, dass die Ebenen der Konfigurations-Quellen-Angabe
mit einem `:` getrennt werden.

Das vorige Beispiel hat zwei Schichten, die seine Hierarchie bilden -
`example` und `example_service`.

In den folgenden Abschnitten wird beschrieben, wie diese Hierarchien in
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

Standardmäßig ist der Name der Konfigurationsdatei `./config.json` im
Projektstammverzeichnis.

#### Konfigurationsordner

Der Konfigurationsordner verwendet die gleiche Struktur wie die
Konfigurationsdatei. Die Knoten der JSON-Datei werden hier als Dateien und
Ordner dargestellt.

In dem Beispiel würde die Dateistruktur so aussehen:

```
.
$ tree config
basics
└── example
   └── example_service.json
```

und der Inhalt von `example_service.json` so:

```json
{
  "myValue": "test"
}
```

Standardmäßig wird erwartet, dass der Konfigurationsordner `./config` im
Projektstammverzeichnis liegt.

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

Bei Verwendung von Kommandozeilenargumenten werden die Hierarchieebenen wie in
der [Deklaration](#Deklaration) verwendet.

**Beispiel**

Überschreiben einer statischen Variable der Konfiguration über die Kommandozeile.

Befehl:

```
node myApp --example:example_service:myValue test
```

Bedeutung:

Der Umgebungsvariable `myValue` aus der Datei `example_service`,
aus dem Ordner `example`, wird der Wert `test` zugewiesen.

Zusätzliche Argumente können einfach durch Anhängen eines anderen Arguments
unter Verwendung derselben Syntax bereitgestellt werden.

```
node myApp \
      --example:example_service:myValue \
      --example2:example_service2:myValueBla \
      test
```

### Dynamische Konfiguration

Grundsätzlich ist die Konfiguration statisch; wir unterscheiden vier Quellen für
die Konfiguration; drei statische, eine dynamische; die dynamische Konfiguration
ist die einzige Quelle, die zur Laufzeit geändert werden kann.

Wenn man den [IoC-Container](../anhang/GLOSSARY.md#ioc) beauftragt, eine
neue Instanz einer Klasse zu erzeugen, kann dabei ein Konfigurationsobjekt
mitgegeben werden.
