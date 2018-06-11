# !!!deprecated!!! Identitäts- und Zugriffsverwaltung (IAM)

Das IAM innerhalb der Process Engine bedient sich der Interfaces aus
[iam_contracts](https://github.com/essential-projects/iam_contracts)
und den zugehörigen Implementierungen in
[iam](https://github.com/essential-projects/iam).

Die Process Engine verwendet Claims, um die Beschränkung auf
Ressourcen zu erlauben. Ein Claim ist in der Regel einer Rolle
zugeordnet. Zwei unterschiedliche Rollen, können dem Benutzer denselben
Claim zuordnen.

**Anmerkung**:

Die Process Engine ist kein Identity Provider!

Es sollte immer ein externer Provider bereitgestellt werden.
Beispielsweise kann der [IdentityServer](https://identityserver.io/)
dafür verwendet werden.

## Dekoratoren

Um Implementierungen und Daten zu schützen, kann man mögliche Aktionen mit einer
Claims verknüpfen, die für die Ausführung erforderlich ist.

Der Dekorator, der dazu verwendet wird, kann an Klassen,
Eigenschaften und Methoden platziert werden.

Hinweis: Dekoratoren an Methoden und Eigenschaften überschreiben für diese
Methode/Eigenschaft den Klassendekorator.

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
$ tree config
  └── development
      └── iam
          └── claim_service
              └── claims
                  └── <<namespace>>
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

## Verwendung von Claims

### Entity Types / Entity Type Services

Optionale Elemente sind von ()-Klammern umschlossen.

#### Class Level

```
(namespace.)type(.action)
```

### Custom Segmentss

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

### Segmente

Es gibt zwei Arten von Segmenten:

1. Allgemeine: den Namespace definierende
1. Spezielle: die Aktion beschreibende

### Action

Eine Aktion ist ein optionaler Teil des Claims;
eine Aktion muss das letzte Segment des Claims sein.

Das letzte Segment, kann einer der folgenden sechs Werte sein:

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
