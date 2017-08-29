# Contracts

We have already learned that modules are regular npm packages with dependencies. When dealing with a stack of this size we need to make sure that every component is exchangable through dependency injection without changing the code.

Imagine we have a class `ReportingService` in a module `reporting` that depends on the class `LoggingService` from the module `logging`.

The npm package `reporting` would not have a dependency on `logging`, but rather on `logging_contracts`.

Also the class `ReportingService` would not reference the class `LoggingService`. Instead it uses the interface `ILoggingService` from `logging_contracts`.

![Contract](images/contracts.png)

Now that the `reporting` module has no references to the implementation, we can completely change the implementation through dependency injection as long as our replacement fulfills the contract (implements the interface).
