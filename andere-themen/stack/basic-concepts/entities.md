# Entitäten

Eine Entität ist eine Klasse, die verwendet wird, um ein Domänenobjekt beizubehalten.

Es wird die Basisklasse `Entity` verwendet, um so viel Code wie möglich zu vermeiden. Es gibt grundlegende Funktionen, die man nicht für jede Entität selbst implementieren möchten, wie Zugriffsverwaltung, Serialisierung usw.

Um diese Funktionalitäten standardmäßig zu erhalten, muss sich nur an ein paar Mustern und Konventionen gehalten werden.

## Entitätslogik

Die in Entitäten implementierte Logik sollte nur für eine einzelne Entität gelten.

```typescript
myEntity.calculateSomething();
myEntity.applySomething();
```

Wie dargestellt, sollen die Entitätsmethoden in einer einzelnen Entität aufgerufen werden, um ihren Status zu ändern oder ein auf diesem Zustand basierendes Verhalten auszuführen.

## Entitätseigenschaften

Eine Eigenschaft besteht aus einer Getter- und einer Setter-Funktion. Beide sind ziemlich selbsterklärend.

```typescript
  public get name(): string {
    return this.getProperty(this, 'name');
  }

  public set name(value: string) {
    this.setProperty(this, 'name', value);
  }
```

Durch den Aufruf von `getProperty` und `setProperty` erhält man alle verfügbaren Features wie z.B.
* Überprüfungen, um unnötige Operationen zu vermeiden
* anspruchsbasiertes Rechtemanagement
* erweiterte Abfrageszenarien auf angehängten Entitäten

## Entitätsschemas

Wie bereits erwähnt, ist der Stack datenbankunabhängig und verwendet ein eigenes Datenmodell, um zu beschreiben, wie Dinge persistiert werden können.

Als die Eigenschaften in [Entitätseigenschaften](entities.md#entity-properties) deklariert wurden, ist eventuell aufgefallen, dass es nichts gibt, das das Datenmodell zu konfigurieren scheint.

Dies geschieht mit Hilfe von ES7 Decorators (eine moderne JavaScript-Funktion), in diesem Fall der `schemaAttribute`-Dekorator.

```typescript
  @schemaAttribute({ type: SchemaAttributeType.string })
  public get name(): string {
    return this.getProperty(this, 'name');
  }

  public set name(value: string) {
    this.setProperty(this, 'name', value);
  }
```

Der Dekorator wird oberhalb der Getter-Funktion der Eigenschaft platziert und nimmt ein `ISchemaAttribute` als Argument an. In den meisten Fällen muss nur angeben werden, welcher Typ verwendet werden soll, um es in der Datenbank darzustellen. Der Typ kann entweder eine der Optionen der Enumeration `SchemaAttributeType` oder ein `string` (in Pascal-Case) sein, wenn man einen eigenen Typ verwenden möchten.

## Entitätsmethoden

Jede öffentliche Methode, die implementiert wird (außer `initialize`), sollte den `ExecutionContext` als einen seiner Parameter akzeptieren.

Der `ExecutionContext` wird verwendet, um Informationen über die Zugriffsverwaltung zu verfolgen und den Zugriff auf den Benutzersitzungsspeicher zu gewähren.

Wenn andere Entitäten oder Dienste aufgerufen werden, benötigt man wahrscheinlich irgendwann den `ExecutionContext`.

Technisch ist dies nicht erforderlich, solange man den Parameter nicht verwendet. Es wird jedoch als bewährte Methode angesehen, nachträgliche Änderungen der Methodensignaturen zu vermeiden.

Wenn man eine Methode über unsere HTTP-REST-API ausführen möchten, muss unbedingt der `ExecutionContext` in die Methodensignatur aufgenommen werden.
