# Consuming an HTTP REST API

Create a new diagram, just like in the hello-world example.

After that, create a service task to fetch some data, and a user-task to display the data:

{% video controls="controls"%}../images/consuming-rest-api.mp4{% endvideo %}

With the `Extensions`-panel, we can tell the service-task what to do: In this case, call our API

Next, we tell the flow (the arrow) how the result is to be interpreted and forwarded to the user-task.

At last, we tell the user-task what to display (again, in the `Extensions`-panel)

This is the `uiConfig` used in the user-task:
```
${ "message": "1 EUR = " + token.current + " USD", "layout": [ { "key": "confirm", "label": "OK"}] };
```

{% video controls="controls"%}../images/integrate-rest-api.mp4{% endvideo %}

Let's test it:

{% video controls="controls"%}../images/run-rest-api.mp4{% endvideo %}