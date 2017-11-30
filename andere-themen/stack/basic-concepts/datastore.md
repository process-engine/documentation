# Datenspeicher
Wenn mit Entitäten gearbeitet werden soll, müssen diese irgendwie geladen oder
gespeichert werden. Dies geschieht mithilfe des Datenspeichers.

## Datenspeicher Service

Die einfachste und empfohlene Methode zur Verwendung des Datenspeichers besteht
darin, den `DatastoreService` direkt per Dependency Injection zu verwenden.

Man kann ein generisches Repository für eine bestimmte Entität abrufen, indem
`getEntityType ('YourEntity')` im `DatastoreService` aufgerufen wird. Dieses
Repository wird `EntityType` genannt. Es ist möglich Entitäten des angegebenen
Typs zu erstellen, zu laden und zu speichern.

Folgendes Codebeispiel zeigt wie eine neue Entität erstellt und gespeichert wird:

```typescript
const processTokenEntityType = await this.datastoreService.getEntityType('ProcessToken');

const processTokenEntity = await processTokenEntityType.createEntity(context);
processTokenEntity.save();
```

Es ist auch möglich den `EntityType` zu verwenden, um eine bestimmte Entität zu
erhalten (mit `getById`), oder um eine ganze Sammlung von Entitäten zu erhalten,
die Ihren Kriterien entspricht (mit `query`).

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

Der Datenspeicher ist auch über eine HTTP-REST-API verfügbar.

Diese wird automatisch an Ihrem HTTP-Endpunkt angeschlossen (z. B. http://localhost:8000/datastore).

## Datenspeicher GraphQL

Zusätzlich ist es möglich den Datenspeicher über eine GraphQL-API zu verwenden.

Diese wird auch automatisch an Ihrem HTTP-Endpunkt angeschlossen (z. B. http://localhost:8000/graphql);
