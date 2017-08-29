# Discovery

Whenever there is a dynamic branch in our dependency graph we use a discovery mechanism that is based on the registrations on the IoC container.

![Discovery](images/discovery.png)

In this example the `DataModel` has a dependency on the `container` (which is the IoC container instance itself) and among others it has a dynamic dependency on entities. The dependency graph is not aware that the `DataModel` uses entities, the `DataModel` just asks the `container` for all registrations that are tagged as an entity.

With this mechanism the number of entities can vary amongst applications without the need of changing the underlying code.

The current discoveries are:

Discovery Tag | Description
---------|----------
 Schema | JSON Schemas based on the TypeScript Definitions
 Entity | Classes derived from the `Entity` base class the generic `EntityType` consumes
 Router | Classes derived from the `RouterBase` base class the `HttpExtension` consumes
 Extension | Classes following the extension pattern of the bootstrapper
 TokenAdapter | Classes implementing the `ITokenAdapter` interface the `TokenService` consumes 
 FeatureGenerator | Classes following the generator pattern of the `FeatureService`
