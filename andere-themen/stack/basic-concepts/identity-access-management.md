# Identitäts- und Zugriffsverwaltung (IAM)

## Dekoratoren

Um Implementierungen und Daten zu schützen, kann man mögliche Aktionen mit einer
Rolle verknüpfen, die für die Ausführung erforderlich ist.

Der Dekorator, der dazu verwendet wird, kann an Klassen,
Eigenschaften und Methoden platziert werden.

_Hinweis: Dekoratoren an Methoden und Eigenschaften überschreiben für diese 
Methode/Eigenschaft den Klassendekorator._

```typescript
@requiresClaim({
  actions: [
    [ClaimActionType.all, ['guest']]
  ]
})
export class MyClass {

  @requiresClaim({
    actions: [
      [ClaimActionType.execute, ['admin']]
    ]
  })
  public myMethod(): void {
    console.log('looks like you are an admin');
  }

  @requiresClaim({
    actions: [
      [ClaimActionType.write, ['special_role_a38']],
      [ClaimActionType.read, ['unspecial_role']]
    ]
  })
  public get myProperty(): string {
    return this.getProperty(this, 'myProperty');
  }
}
```

## Konfiguration

Claims werden unter dem folgenden Pfad konfiguriert:

```
.
+-- config
    +-- development
        +-- iam
            +-- claim_service
                +-- claims
                    +-- <<namespace>>
```

Der `namespace` ist der Namespace der Claims, die man konfigurieren möchten.
Wenn man den Standardnamespace verwendet, heißt der Namespace in der
Konfigurationsstruktur `default_namespace`.

### Default

Die Standardberechtigungen für einen Namespace können in der Datei
`default_permissions.json` direkt im Namespace-Ordner konfiguriert werden.

Die Datei sieht wie folgt aus:
```
{
  "permissions": {
    "all": [
      "user",
      "guest"
    ]
  }
}
```

### Entitätstyp

```
.
+-- <<namespace>>
    +-- entity_types
        +-- <<type>>.json
```

In der JSON-Datei sieht die Struktur wie folgt aus:

```
{
  "permissions": {
    "<<action>>": [
      "_iam_internal"
    ]
  },
  "class_members": {
    "<<member>>": {
      "permissions": {
        "<<action>>": [
          "_iam_internal"
        ]
      }
    },
    ...
  }
}
```

### Entity Type Services

Entity Type Services unterscheiden sich in der Konfiguration nicht von Entity Types.

Sie sind im Ordner `entity_type_services` anstelle von `entity_types` definiert.
Die JSON-Datei enthält ebenfalls kein Suffix.

Die zwei Blöcke repräsentieren Rollen, die definiert sind, um Ansprüche der
`class level` und `member level` zu erfüllen.

## Benutzung

### Entity Types / Entity Type Services

Optionale Elemente sind mit Klammern markiert.

#### Class Level
```
(namespace.)type(.action)
```

#### Member Level

Ein Member kann entweder eine Eigenschaft oder eine Methode sein.

```
(namespace.)type.member(.action)
```

### Custom

Vor dem Typ können mehrere Segmente definiert werden.

```
(namespace.)(segment.)type(.member)
```

## Naming Convention

Claims bestehen aus mehreren Segmenten, die durch einen Punkt als Abstandhalter
getrennt sind.

```
something.something.something
```

### Segments

Es gibt spezielle Arten von Segmenten.

Wenn ein Segment keine solche spezielle Art ist, wird es nur verwendet, um einen
Namespace zu definieren, der leicht zu verstehen ist und mit der Ordnerstruktur
des Codes korreliert.

### Action

Eine Aktion ist ein optionales Element des Claims und muss das letzte Segment
des Claims sein.

Es kann einer der folgenden Werte sein:
* create
* read
* write
* delete
* execute
* all

### Type

Typen beziehen sich auf einen Klassentyp in der Implementierung.

Da Typen aus einem String geparst werden müssen, können nur bekannte Typen, die
durch eine Benennungskonvention identifizierbar sind, als Typ verwendet werden.

Derzeit werden die folgenden Typen unterstützt:

Type | Naming Convention
---------|----------
 Entity | Suffix `Entity` in the type segment
 Entity Service | Suffix `EntityService` in the type segment

Wenn ein Segment nicht als Typ geparst werden kann, wird es als Key geparst (siehe [Key](#key)).

### Key

Schlüssel beziehen sich auf Klassenmitglieder (Eigenschaften oder Methoden).

Sie werden von der Segmentposition innerhalb des Claims geparst. (siehe [Namenskonvention](#naming-convention))

## Promotion

TODO: document promotion and promotion decorator (Sebastian)
