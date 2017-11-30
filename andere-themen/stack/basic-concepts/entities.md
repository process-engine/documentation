# Entitäten

Eine Entität ist eine Klasse zur Beibehaltung von Domänenobjekten.
Die Basisklasse `Entity` wird verwendet, um so viel Code wie möglich zu
vermeiden. 

Es gibt grundlegende Funktionen, die man nicht für jede Entität
selbst implementieren sollte. Hierzu zählen unter anderem die Zugriffsverwaltung und die Serialisierung.
Um diese Funktionalitäten standardmäßig zu erhalten, muss sich der Nutzer an wenige Muster und Konventionen halten. Diese werden nachfolgend beschrieben.

## Entitätslogik

Die in Entitäten implementierte Logik sollte nur für eine einzelne Entität gelten.

```typescript
myEntity.calculateSomething();
myEntity.applySomething();
```

Wie dargestellt, sollen die Entitätsmethoden in einer einzelnen Entität
aufgerufen werden, um ihren Zustand zu ändern oder ein auf diesem Zustand
basierendes Verhalten auszuführen.

## Entitätseigenschaften

Eine Eigenschaft besteht aus einer Getter- und einer Setter-Funktion.

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
* ein anspruchsbasiertes Rechtemanagement
* erweiterte Abfrageszenarien auf angehängten Entitäten

## Entitätsschemas

Der Stack ist datenbankunabhängig und verwendet ein eigenes
Datenmodell, dass zur Beschreibung der Persistierung von Daten dient.

Die Konfiguration des Datenmodells erfolgt mit Hilfe von ES7 Decorators.
In diesem Fall ist es der `schemaAttribute`-Dekorator.

```typescript
  @schemaAttribute({ type: SchemaAttributeType.string })
  public get name(): string {
    return this.getProperty(this, 'name');
  }

  public set name(value: string) {
    this.setProperty(this, 'name', value);
  }
```

Der Dekorator wird oberhalb der Getter-Funktion der Eigenschaft platziert und
nimmt ein `ISchemaAttribute` als Argument an. Für die Darstellung in der Datenbank muss in den meisten Fällen nur angeben werden, welcher Typ verwendet werden soll. Der Typ kann entweder eine der Optionen der Enumeration
`SchemaAttributeType` oder ein `String` (in Pascal-Case) sein, wenn man einen
eigenen Typ verwenden möchten.

## Entitätsmethoden

Jede öffentliche Methode, die implementiert wird (außer `initialize`), sollte
den `ExecutionContext` als einen seiner Parameter akzeptieren.

Der `ExecutionContext` wird verwendet, um Informationen über die
Zugriffsverwaltung zu verfolgen und den Zugriff auf den Benutzersitzungsspeicher
zu gewähren.

Wenn andere Entitäten oder Dienste aufgerufen werden, wird oft 
nach absehbarer Zeit der `ExecutionContext` benötigt.

Technisch ist dies nicht erforderlich, solange man den Parameter nicht
verwendet. Es wird jedoch als bewährte Methode angesehen, nachträgliche
Änderungen der Methodensignaturen zu vermeiden.

Wenn man eine Methode über unsere HTTP-REST-API ausführen möchte, muss
unbedingt der `ExecutionContext` in die Methodensignatur aufgenommen werden.
