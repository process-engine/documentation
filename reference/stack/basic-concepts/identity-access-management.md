# Identity & Access Management

## Decorators

You can protect your implementation and data by associating possible actions with a role required to perform them.

The decorator used to define these can be placed on classes, properties and methods.

_Note: You can override the class decorator with method- and property-decorators. This will only override it for the methods and properties decorated. Undecorated properties will still apply the class settings._

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

## Configuration

Claims are configured under the following path:
```
.
+-- config
    +-- development
        +-- iam
            +-- claim_service
                +-- claims
                    +-- <<namespace>>
```

The `namespace` is the namespace of the claims you want to configure.
If you are using the default namespace, the namespace is called `default_namespace` in the configuration structure.

### Default

The default permissions for a namespace can be configured in the file `default_permissions.json`, directly in the namespace folder.

The file looks like the following:
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

### Entity Type
```
.
+-- <<namespace>>
    +-- entity_types
        +-- <<type>>.json
```

The `type` is the name of the entity described without any entity suffix.

Inside the JSON file the structure looks like the following:

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

Entity Type Services are no different in configuration than Entity Types.

But they are defined in the folder `entity_type_services` instead of `entity_types`.
The JSON file doesn't contain a suffix as well.

The two block are representing roles defined to fulfill `class level` and `member level` claims.

## Usage

### Entity Types / Entity Type Services
Optional elements are marked with braces.

#### Class Level
```
(namespace.)type(.action)
```

#### Member Level
A member can either be a property or a method.
```
(namespace.)type.member(.action)
```

### Custom
There can be defined multiple segments before the type. 
```
(namespace.)(segment.)type(.member)
```

## Naming Convention

Claims consist of several segments separated by a dot as a spacer between the segments.

```
something.something.something
```

### Segments

There are special kinds of segments.

If a segment is no such special kind it is only used to define a namespace that is easy to understand and that correlates to the folder structure of the code.

### Action

An action is an optional element of the claim and has to be the last segment of the claim.

It can be one of the following values:
* create
* read
* write
* delete
* execute
* all

### Type

Types refer to a class type in the implementation.

Because types must be parsable from a string, only known types that are identifiable by a naming convention can be used as a type.

Currently the following types are supported:

Type | Naming Convention
---------|----------
 Entity | Suffix `Entity` in the type segment
 Entity Service | Suffix `EntityService` in the type segment

If a segment could not be parsed as a type, it will be parsed as a key (see [Key](#key)).

### Key

Keys refer to class members (properties or methods).

They are parsed by the segment position inside the claim. (see [Naming Convention](#naming-convention)) 

## Promotion

