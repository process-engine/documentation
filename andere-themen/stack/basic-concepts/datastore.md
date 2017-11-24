# Datenspeicher

Wenn Sie mit Entitäten arbeiten möchten, müssen Sie sie irgendwie laden oder speichern. Dies geschieht mithilfe des Datenspeichers.

## Datenspeicher Service

Die einfachste und empfohlene Methode zur Verwendung des Datenspeichers besteht darin, den `DatastoreService` direkt per Dependency Injection zu verwenden.

Sie können ein generisches Repository für eine bestimmte Entität abrufen, indem Sie `getEntityType ('YourEntity')` im `DatastoreService` aufrufen.
Wir nennen dieses Repository den `EntityType`. Sie können Entitäten des angegebenen Typs erstellen, laden und speichern.

Jetzt, da Sie einen `EntityType` haben, können Sie ihn verwenden, um eine neue Entität zu erstellen:

```typescript
const processTokenEntityType = await this.datastoreService.getEntityType('ProcessToken');

const processTokenEntity = await processTokenEntityType.createEntity(context);
processTokenEntity.save();
```

Sie können auch den `EntityType` verwenden, um eine bestimmte Entität zu erhalten (mit `getById`) oder um eine Sammlung von Entitäten zu erhalten, die Ihren Kriterien entsprechen (mit `query`).

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

## Datenspeicher HTTP REST API

Wenn Sie den Datenspeicher außerhalb der Domain verwenden möchten, können Sie die HTTP-REST-API verwenden.

Diese wird automatisch an Ihrem HTTP-Endpunkt angeschlossen (z. B. http://localhost:8000/datastore).

## Datenspeicher GraphQL

Wenn Sie den Datenspeicher außerhalb der Domäne verwenden möchten, können Sie die GraphQL-API verwenden.

Diese wird automatisch an Ihrem HTTP-Endpunkt angeschlossen (z. B. http://localhost:8000/graphql);
