# Entitäten

Eine Entität ist eine Klasse zur Beibehaltung von Domänenobjekten.

Spezielle Entitäten leiten von der Basisklasse `Entity` ab.

Die Klasse `Entity` beinhaltet folgende Methoden, Felder:

```js
class 
(...)
```

Die Verwendung der Basisklasse soll es dem Nutzer erleichtern, mit der ProcessEngine zu arbeiten.

## Entitätslogik

Die in Entitäten implementierte Logik sollte nur für eine einzelne Entität gelten.

```typescript
myEntity.calculate();
myEntity.apply();
```

Wie dargestellt, sollen die Entitätsmethoden in einer einzelnen Entität
aufgerufen werden, um ihren Zustand zu ändern oder Verhalten auszuführen.

## Entitätseigenschaften

Eine Eigenschaft besteht aus einer Getter- und einer Setter-Methoden.

```typescript
  public get name(): string {
    return this.getProperty(this, 'name');
  }

  public set name(value: string) {
    this.setProperty(this, 'name', value);
  }
```

## Entitätsschemata

Der Stack ist datenbankunabhängig und verwendet ein eigenes Datenmodell.

Die Konfiguration des Datenmodells erfolgt mit Hilfe von ES7 Decorators.

Die Verwendung von Decorators sieht so aus:

```typescript
  @schemaAttribute({ type: SchemaAttributeType.string })
  public get name(): string {
    return this.getProperty(this, 'name');
  }

  public set name(value: string) {
    this.setProperty(this, 'name', value);
  }
```

Der Dekorator wird oberhalb der Eigenschaft platziert;
der Decorator nimmt ein `ISchemaAttribute` als Argument an;
für die Speicherung in der Datenbank muss angeben werden, welcher Typ verwendet werden soll;

Der Typ kann eine der Optionen der Enumeration `SchemaAttributeType` sein;
Der Typ kann ein `String` (in Pascal-Case) sein;
Das erlaubt die Verwendung eigener Datentypen.

## Entitätsmethoden

Jede öffentliche Methode, die implementiert wird - außer `initialize` -, soll
dem `ExecutionContext` als einen seiner Parameter akzeptieren.

Der `ExecutionContext` wird verwendet, um Informationen über die
Zugriffsverwaltung zu verfolgen und den Zugriff auf den Benutzersitzungsspeicher
zu gewähren.

Wenn andere Entitäten oder Dienste aufgerufen werden, wird der `ExecutionContext` benötigt.

Technisch ist dies nicht erforderlich, solange man den Parameter nicht
verwendet. Es wird jedoch als bewährte Methode angesehen, nachträgliche
Änderungen der Methodensignaturen zu vermeiden.

Wenn man eine Methode über die API ausführen möchte, muss der `ExecutionContext`
in die Methodensignatur aufgenommen werden.
