# Entitäten

Eine Entität ist eine Klasse, die verwendet wird, um ein Domänenobjekt beizubehalten.

Wir verwenden die Basisklasse `Entity`, um so viel Code wie möglich zu vermeiden. Es gibt grundlegende Funktionen, die Sie nicht für jede Entität selbst implementieren möchten, wie Zugriffsverwaltung, Serialisierung usw.

Wenn Sie sich an einen kleinen Satz von Mustern und Konventionen halten, erhalten Sie diese Funktionalität standardmäßig.

## Entitätslogik

Die in Entitäten implementierte Logik sollte nur für eine einzelne Entität gelten.

```typescript
myEntity.calculateSomething();
myEntity.applySomething();
```

Wie Sie sehen können, sollen die Entitätsmethoden in einer einzelnen Entität aufgerufen werden, um ihren Status zu ändern oder ein auf diesem Zustand basierendes Verhalten auszuführen.

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

Durch den Aufruf von `getProperty` und` setProperty` erhalten Sie alle Goodies, die unter der Haube liegen wie z.B.
* Überprüfungen, um unnötige Operationen zu vermeiden
* anspruchsbasiertes Rechtemanagement
* erweiterte Abfrageszenarien auf angehängten Entitäten

## Entitätsschemas

Wie bereits erwähnt, ist der Stack datenbankunabhängig und verwendet ein eigenes Datenmodell, um zu beschreiben, wie Dinge persistiert werden können.

Als wir die Eigenschaft in [Entitätseigenschaften](entities.md#entity-properties) deklariert haben, haben Sie vielleicht bemerkt, dass es nichts gibt, das das Datenmodell zu konfigurieren scheint.

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

Der Dekorator wird oberhalb der Getter-Funktion der Eigenschaft platziert und nimmt ein `ISchemaAttribute` als Argument an. In den meisten Fällen müssen Sie nur angeben, welchen Typ Sie verwenden möchten, um es in der Datenbank darzustellen. Der Typ kann entweder eine der Optionen der Enumeration `SchemaAttributeType` oder ein `string` (in Pascal-Case) sein, wenn Sie einen eigenen Typ verwenden möchten.

## Entitätsmethoden

Jede öffentliche Methode, die Sie implementieren (außer `initialize`), sollte den `ExecutionContext` als einen seiner Parameter akzeptieren.

Der `ExecutionContext` wird verwendet, um Informationen über die Zugriffsverwaltung zu verfolgen und den Zugriff auf den Benutzersitzungsspeicher zu gewähren.

Wenn Sie andere Entitäten oder Dienste aufrufen, benötigen Sie wahrscheinlich irgendwann den `ExecutionContext`.

Technisch ist dies nicht erforderlich, solange Sie den Parameter nicht verwenden. Es wird jedoch als bewährte Methode angesehen, nachträgliche Änderungen der Methodensignaturen zu vermeiden.

Wenn Sie eine Methode über unsere HTTP-REST-API ausführen möchten, müssen Sie unbedingt den `ExecutionContext` in die Methodensignatur aufnehmen.
