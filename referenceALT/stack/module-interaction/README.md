# Module Interaction

When using a stack with so many classes we will have classes that depend on other classes to do their job. There will likely be a whole lot of such dependencies so that we need a uniform way of dealing with them to prevent chaos.

We achieve this by using an IoC container that we register all dependencies to. 
The result of all registrations is what we call the dependency graph.
