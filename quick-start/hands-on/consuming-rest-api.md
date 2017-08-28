# Consuming an HTTP REST API

In this example we'll fetch data of currency exchange rates from a REST API and display the fetched data.

Create a new diagram, just like in the [Hello World](hello-world.md) example.

After that, create a service task to fetch some data, and a user task to display the data:

{% video controls="controls"%}../images/consuming-rest-api.mp4{% endvideo %}

With the `Extensions`-panel, we can tell the service task what to do: In this case, call a HTTP REST API.

> You can find a detailed explanation of what those settings do in the [Frontend Documentation](../../reference/frontend.md#consuming-a-http-rest-api).

---

Next, we tell the flow how the result is to be interpreted and forwarded to the user task.

The flow mapping will restructure how the result data of the previous task is persisted in the process token.

```javascript
JSON.parse(token.current.result).rates.USD
```

In this case we don't want to use all the exchange rates we retrieved, but only the USD rates.
After the mapping, the next BPMN node after the flow can use the USD rate by accessing `token.current`. 

> You can find a detailed explanation of the flow mappings in the [Frontend Documentation](../../reference/frontend.md#mappings).

---

At last, we tell the user task what to display (again, in the `Extensions`-panel)

By using `Confirm` as the `uiName` we can choose a confirm dialog and supply a `uiConfig` to the generated UI:
```JavaScript
${ "message": "1 EUR = " + token.current + " USD", "layout": [ { "key": "confirm", "label": "OK"}] };
```

{% video controls="controls"%}../images/integrate-rest-api.mp4{% endvideo %}

Let's test it:

{% video controls="controls"%}../images/run-rest-api.mp4{% endvideo %}