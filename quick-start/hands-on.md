# Hello World

Let's start with the all time classic example `Hello World`.

We want to execute BPMN diagram with a single user task. 

![Hello World](images/hello-world.png)

This user task is supposed to show us the `Hello World` message as well as a confirm dialog to finish the user task. 

## Creating a new diagram

First we need to create a new diagram.

![Creating Diagram](images/creating-new-diagram.gif)

Open the process manager and click on the `+`-button on the top left to create a new process.

You need to specify the name of the process and the key used to reference the diagram.

For now, let's just use `Hello World` for both.

If you double click on the newly created diagram you get into the detail view.

## Modeling the diagram

Now you can see the BPMN editor showing your diagram with only a lane and a start event.

By selecting an element using the context you can create new elements that are directly connected.

![Hello World](images/hello-world.gif)

Looks fine so far. But we cannot execute the process yet. First we need to integrate the BPMN diagram.

## Integrating the diagram

![Integrate Hello World](images/integrate-hello-world.gif)

If we want the process engine to render a UI for out user task it needs to know what we want the UI to look like.

With the `extensions` panel on the right side of the editor we can specify that with key/value pairs.

By using the key `uiName` we can decide which kind of UI component we want to use to represent the user task in the UI.

We`ll use a confirm dialog as an easy first example.

The key `uiConfig` is used to specify details for the UI component - in this case which message and buttons do display in the confirm dialog.

Now we configured what the user task should look like in the UI - time to execute!

![Execute Hello World](images/execute-hello-world.gif)

# Consuming a REST API

![Consuming REST API](images/consuming-rest-api.gif)

# Sending Mail


