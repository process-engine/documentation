# Advanced Concepts

## Configuration

When configuring the application you want to be able to do that on different levels.

Imagine you want to use a different port to host the application. You certainly have a static configuration you could change to adjust the port. But especially when your application is controled by another application (e.g. an orchestrator), you want to be able to adjust it without changing the static configuration. Instead you could use environment variables or command-line arguments.

Our configuration concept uses a configuration hierarchy. All the configuration values inside that hierarchy can be set from multiple configuration sources that overwrite one another in a distinct order.

This is the overwrite-order, **descending** by priority:
* dynamic configuration
* command-line arguments
* environment variables
* static configuration

### Usage

Any configuration you declared will be automatically injected into the `config` property of the corresponding class.

This injection happens right after class instantiation so that you can expect and use the configuration object everywhere except in the `constructor`.

```typescript
class ExampleService {
  public config: any = undefined;
  public doSomething(): void {
    console.log(config.myValue); // 'test'
  }
}
```

### Declaration

The declaration of a configuration object is done during registration of classes on the IoC container (see [Dependency Injection](module-interaction.md#dependency-injection)).

```typescript
container.register('ExampleService', ExampleService)
  .configure('example:example_service');
```

In this example the configuration declaration is `example:example_service`.

 

### Naming Convention

The naming convention allows you to specify the object hierarchy of your configuration objects, separated by a spacer - in this case `:`.

Our example from before has two layers that make up its hierarchy - `example` and `example_service`.

The following sections will explore how these hierarchies are represented across different configuration sources.

#### Static Configuration

Most of your application configuration will be static. Static configuration is provided within a single or multiple configuration files.

##### Configuration File

If the static configuration is provided within a single JSON file, the hierarchy layers will be represented as knodes of that JSON file.

In this example our JSON file could look like this:

```javascript
{
  "example": {
    "example_service": {
      "myValue": "test"
    }
  }
}
``` 

##### Configuration Folder

The configuration folder uses the same structure as the configuration file. It just splits the structure up across multiple files and folders.

In our example the file structure would look like this:

```
.
+-- config
    +-- example
        +-- example_service.json
```

and the content of `example_service.json` like this:

```
{
  "myValue": "test"
}
``` 

If you compare this with the [Configuration File](#configuration-file), the difference is that you have smaller, more atomic configuration files that might be easier to maintain for you.

#### Environment Configuration

In case you want to set a configuration value with an environment variable the spacer for hierarchy layers is `__`.

Sticking to our example, we would set the value like this:

```
export example__example_service__myValue=test
```

> Note: this is how you would set the environment variable in a **Linux** environment. The syntax differs across operating systems.

#### Command Line Arguments

When using command line arguments the hierarchy layers are used as in the [declaration](#declaration).

```
node myApp --example:example_service:myValue test
```

Additional arguments can simply be supplied by appending another argument using the same syntax.

#### Dynamic Configuration