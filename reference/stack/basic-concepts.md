## Basic Concepts

## Entities

An entity is a class used to persist a domain object.

We use the base class `Entity` to prevent boilerplate code as much as possible. There's basic functionality you don't want to implement yourself for every entity such as access management, lazy loading, serialization, etc.

By sticking to a small set of patterns and conventions you get this functionality by default.

### Entity Logic

The logic implemented in entities should only apply to a single entity.

```typescript
myEntity.calculateSomething();
myEntity.applySomething();
```

As you can see the entity methods are meant to be called on a single entity to modify its state or to execute behavior based on that state.

### Entity Properties

A property consists of a getter and a setter function. Both are pretty self explanatory.

```typescript
  public get name(): string {
    return this.getProperty(this, 'name');
  }

  public set name(value: string) {
    this.setProperty(this, 'name', value);
  }
```

By calling `getProperty` and `setProperty` you get all the goodies that lie under the hood.

### Entity Schemas

As mentioned before the stack is database independent and uses its own data model to describe how things can be persisted.

When we declared the property in 4.1.1 you might have noticed that there is nothing that seems to configure the data model.

This is done by using ES7 Decorators (a modern JavaScript feature), in this case the `schemaAttribute`-decorator.

```typescript
  @schemaAttribute({ type: SchemaAttributeType.string })
  public get name(): string {
    return this.getProperty(this, 'name');
  }

  public set name(value: string) {
    this.setProperty(this, 'name', value);
  }
```

The decorator is placed above the getter function of the property and takes an `ISchemaAttribute` as its argument. In most cases you only need to specify what type you want to use to represent it in the database. The type can be either one of the options of the enum `SchemaAttributeType` or a `string` if you want to use one of your own types (e.g. other entities).

### Entity Methods

Each public method you implement (except `initialize`) should accept the `ExecutionContext` as one of its parameters. The execution context is used to track information for access management. 

When calling other entities or services you are likely to need the `ExecutionContext` at some point anyway.

Technically this is not necessary as long as you don't use the parameter, but it is considered a best practice to avoid changing method signatures afterwards.

If you plan to execute a method via our HTTP REST API, it is mandatory to include the `ExecutionContext` in the method signature.

## Entity Services

Entity services are a supplement to entities. In contrast to the entity there is no base class for entity services.

### Entity Service Logic

While entities contain the logic to work on their own state, entity services hold no state at all.

An entity service can provide methods that create entities from a given state or work on multiple entities.

### Entity Service Dependency Injection

To keep all responsibilities clean and encapsulated an entity should **NOT** have its own entity service as a dependency.

## Datastore

If you want to work with entities you will need to load or save them somehow. This is done using the datastore.

### Datastore Service

The easiest and recommended way to consume the datastore is to use the `DatastoreService` directly via dependency injection.

Because the datastore is generic, the first thing you want to do is get a specialized repository for the entity you want to load or save. We call this the `EntityType`.

Now that you have a `EntityType` you can use it to create a new entity: 

```typescript
const processTokenEntityType = await this.datastoreService.getEntityType('ProcessToken');

const processTokenEntity = await processTokenEntityType.createEntity(context);
processTokenEntity.save();
```

You can also use the `EntityType` to get a specific entity (using `getById`) or to get a collection of entities that match your criteria (using `query`).

```typescript
const processTokenEntityType = await this.datastoreService.getEntityType('ProcessToken');

const processTokenEntity = await processTokenEntityType.getById(id, context);

const queryOptions = {
  operator: 'and',
  queries: [
    { attribute: 'id', operator: '=', value: myId },
    { attribute: 'process', operator: '=', value: this.process }
  ]
};
const processTokenEntities = await processTokenEntityType.query(context, queryOptions);
```

### Datastore HTTP REST API

If you want to consume the datastore from outside the domain you can use the HTTP REST API.

This is automatically hooked up on your HTTP endpoint (e.g. http://localhost:8000/datastore);

### Datastore GraphQL

If you want to consume the datastore from outside the domain you can use the GraphQL API.

This is automatically hooked up on your HTTP endpoint (e.g. http://localhost:8000/graphql);

## Identity & Access Management

### Decorators

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
      [ClaimActionType.read, ['special_role_a38']]
    ]
  })
  public get myProperty(): string {
    return this.getProperty(this, 'myProperty');
  }
}
```

### Configuration

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

#### Default

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

#### Entity Type
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

#### Entity Type Services

Entity Type Services are no different in configuration than Entity Types.

But they are defined in the folder `entity_type_services` instead of `entity_types`.
The JSON file doesn't contain a suffix as well.

The two block are representing roles defined to fulfill `class level` and `member level` claims.

### Usage

#### Entity Types / Entity Type Services
Optional elements are marked with braces.

##### Class Level
```
(namespace.)type(.action)
```

##### Member Level
A member can either be a property or a method.
```
(namespace.)type.member(.action)
```

#### Custom
There can be defined multiple segments before the type. 
```
(namespace.)(segment.)type(.member)
```

### Naming Convention

Claims consist of several segments separated by a dot as a spacer between the segments.

```
something.something.something
```

#### Segments

There are special kinds of segments.

If a segment is no such special kind it is only used to define a namespace that is easy to understand and that correlates to the folder structure of the code.

#### Action

An action is an optional element of the claim and has to be the last segment of the claim.

It can be one of the following values:
* create
* read
* write
* delete
* execute
* all

#### Type

Types refer to a class type in the implementation.

Because types must be parsable from a string, only known types that are identifiable by a naming convention can be used as a type.

Currently the following types are supported:

Type | Naming Convention
---------|----------
 Entity | Suffix `Entity` in the type segment
 Entity Service | Suffix `EntityService` in the type segment

If a segment could not be parsed as a type, it will be parsed as a key (see [Key](#key)).

#### Key

Keys refer to class members (properties or methods).

They are parsed by the segment position inside the claim. (see [Naming Convention](#naming-convention)) 

### Promotion

## Extensions

### HTTP Extension




