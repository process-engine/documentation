# Datenspeicher

Der Datenspeicher ist ein allgemeingültiges Modul zum interagieren mit
Entitäten. Mit ihm können:

- Entitäten erstellt, geladen und gespeichert werden.
- Methoden auf den Entitäten und [Entitäten-Service](./entity-services.md)
  aufgerufen werden.
- Entitäten-Definitionen (sogenannte `EntityTypes`) angefragt werden.

## Datenspeicher Service

Der `DatastoreService` implementiert die Logik des Datenspeichermoduls.
Er bietet Methoden zum:

- Anfragen der bekannten Entitäten-Definitionen
  ```TypeScript
  // getCatalog(context: ExecutionContext): any;
  const catalog = this.datastoreService.getCatalog();

  /*
  catalog = {  
    "catalog":{  
      "classes":[  
        "BoundaryEvent",
        "CatchEvent",
        "FlowDef",
        "Lane",
        "NodeDef",
        ...
      ]
    }
  }
  */
  ```

- Anfragen der Entitäten zu einer Definition
  ```TypeScript
  /*
  getCollection<T extends IEntity>(typeName: TypeKey,
                                   context: ExecutionContext,
                                   options?: IPublicGetOptions): Promise<IEntityCollection<T>>;
  */
  const flowDefCollection = this.datastoreService.getCollection('FlowDef', context);


  /*
  flowDefCollection = {  
    "count": 12,
    "offset":0,
    "limit":40,
    "data":[  
      FlowDefEntity {},
      FlowDefEntity {},
      FlowDefEntity {},
      ...
    ],
    _options: {
      orderBy: undefined,
      query: undefined,
      expandEntity: [],
      expandCollection: []
    },
    _entityType: EntityType {}
  }
  */
  ```

- Eine Entität erstellen
  ```TypeScript
  /*
  saveNewEntity<T extends IEntity>(typeName: TypeKey,
                                   data: any,
                                   context: ExecutionContext,
                                   options?: IPublicSaveOptions): Promise<T>;
  */
  const newEntity = this.datastoreService.saveNewEntity('flowDef', {
    name: 'test',
  }, context);
  ```

- Eine Entität anhand seiner ID anfragen
  ```TypeScript
  /*
  getById<T extends IEntity>(typeName: TypeKey,
                             id: string, context: ExecutionContext,
                             options?: IPublicGetOptions): Promise<T>;
  */
  const flowEntity = this.datastoreService.getById('747c095e-0461-43b5-a052-ad8842253577', context);
  ```

- Eine Entität aktualisieren
  ```TypeScript
  /*
  updateEntity<T extends IEntity>(typeName: TypeKey,
                                  id: string,
                                  data: any,
                                  context: ExecutionContext,
                                  options?: IPublicSaveOptions): Promise<T>;
  */
  const updatedEntity = this.datastoreService.updateEntity('flowDef', '747c095e-0461-43b5-a052-ad8842253577', {
    name: 'test',
  }, context);
  ```

- Eine Entität löschen
  ```TypeScript
  /*
  removeEntity(typeName: TypeKey,
               id: string,
               context: ExecutionContext, 
               ptions?: IPublicRemoveOptions): Promise<void>;
  */
  this.datastoreService.removeEntity('flowDef', '747c095e-0461-43b5-a052-ad8842253577', context);
  ```

- Eine Methode auf einer Entität ausführen
  ```TypeScript
  /*
  executeEntityMethod(typeName: TypeKey,
                      id: string,
                      method: string,
                      data: any,
                      context: ExecutionContext,
                      options?: IPublicGetOptions): Promise<any>;
  */
  const userTaskData = this.datastoreService.executeEntityMethod('UserTask', '7aca65af-a4df-496f-998c-a17ec21c0da8', 'getUserTaskData', {}, context);

  /*
  userTaskData = {
    userTaskEntity: UserTaskEntity {},
    uiName: 'Form',
    uiData: { history: {} },
    uiConfig: undefined
  }
  */
  ```

- Eine Methode auf einem [Entitäten-Service](./entity-services.md) ausführen
  ```TypeScript
  /*
  executeEntityTypeMethod(typeName: TypeKey,
                          method: string,
                          data: any,
                          context: ExecutionContext,
                          options?: IPublicGetOptions): Promise<any>;
  */
  const entityType = this.datastoreService.executeEntityTypeMethod('NodeInstance', 'getEntityTypeFromBpmnType', {
    bpmnType: 'bpmn:CallActivity'
  }, context);

  // entityType = SubprocessExternalEntityType {};
  ```

## Datenspeicher HTTP REST API

Der Datenspeicher ist auch über eine [HTTP-REST-API](http://dev.wtf/pe_apidoc.html#tag-datastore) verfügbar.

> TODO: Korrekten API-Link verwenden. Dieser hier ist temporär

