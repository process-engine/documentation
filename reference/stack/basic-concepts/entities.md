# Entities

An entity is a class used to persist a domain object.

We use the base class `Entity` to prevent boilerplate code as much as possible. There's basic functionality you don't want to implement yourself for every entity such as access management, lazy loading, serialization, etc.

By sticking to a small set of patterns and conventions you get this functionality by default.

## Entity Logic

The logic implemented in entities should only apply to a single entity.

```typescript
myEntity.calculateSomething();
myEntity.applySomething();
```

As you can see the entity methods are meant to be called on a single entity to modify its state or to execute behavior based on that state.

## Entity Properties

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

## Entity Schemas

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

## Entity Methods

Each public method you implement (except `initialize`) should accept the `ExecutionContext` as one of its parameters. The execution context is used to track information for access management. 

When calling other entities or services you are likely to need the `ExecutionContext` at some point anyway.

Technically this is not necessary as long as you don't use the parameter, but it is considered a best practice to avoid changing method signatures afterwards.

If you plan to execute a method via our HTTP REST API, it is mandatory to include the `ExecutionContext` in the method signature.
