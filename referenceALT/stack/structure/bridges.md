# Bridges

When we need to tie one base module to another we want to do it in a way that keeps them loosely coupled. This means that the implementations we tied together are completely independent from one another.

We achieve the loose coupling by putting all the glue that ties modules together into bridge modules.

One example you will often find are `http`-bridges. Normally base module mostly contain services that encapsulate logic.

If we want to expose service logic via a HTTP endpoint we have to define which HTTP routes and methods can be used to execute the service logic. The code that does this resides in the bridge module.

![Bridge](images/bridges.png)

Usually bridge modules are discovered using _Inversion of Control_ (see 3.1).
