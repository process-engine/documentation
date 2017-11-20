# Extensions

The entry point for the whole stack is the `AppBootstrapper`. It uses the `ExtensionBootstrapper` to discover extensions. After discovering them the `ExtensionBootstrapper` has two phases. First it initializes all extensions by calling the `initialize`-method. Then it starts them by calling the `start`-method.

When the two phases have completed and the bootstrapper is done, the application is considered as `started`.

Although extensions are technically suited for all kinds of uses we solely use them to represent the communication endpoints of an application.

For example, the `HttpExtension` starts a HTTP server and discovers components that can register routes on the HTTP server. An `AmqpExtension` could do something similar to that with the AMQP protocol.

![Extension](images/extensions.png)
