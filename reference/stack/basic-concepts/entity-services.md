# Entity Services

Entity services are a supplement to entities. In contrast to the entity there is no base class for entity services.

## Entity Service Logic

While entities contain the logic to work on their own state, entity services hold no state at all.

An entity service can provide methods that create entities from a given state or work on multiple entities.

In contrast to entities, there are no methods you need to implement by convention.

## Entity Service Dependency Injection

To keep all responsibilities clean and encapsulated an entity should **NOT** have its own entity service as a dependency.
