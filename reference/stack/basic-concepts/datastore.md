# Datastore

If you want to work with entities you will need to load or save them somehow. This is done using the datastore.

## Datastore Service

The easiest and recommended way to consume the datastore is to use the `DatastoreService` directly via dependency injection.

You can get a generic repository for a specific entity by calling `getEntityType('YourEntity')` on the `DatastoreService`.
We call this repository the `EntityType`. You can create, load and save entities of the type you specified.

Now that you have an `EntityType`, you can use it to create a new entity: 

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

## Datastore HTTP REST API

If you want to consume the datastore from outside the domain you can use the HTTP REST API.

This is automatically hooked up on your HTTP endpoint (e.g. http://localhost:8000/datastore);

## Datastore GraphQL

If you want to consume the datastore from outside the domain you can use the GraphQL API.

This is automatically hooked up on your HTTP endpoint (e.g. http://localhost:8000/graphql);
