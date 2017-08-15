# Sending Mail

Continue with the example from [Consuming an HTTP REST API](consuming-rest-api.md).

We will now update the Process, so it will ask for an email-address, ask for confirmation and then send a mail with the conversion-rate to the specified email-address

To achieve this, we'll perform the following steps:

- `0:00 - 0:09` Rename the process to `Sending mails`
- `0:10 - 0:17` Increase the lane-size, so we have more playroom
- `0:18 - 1:14` Add a form to ask for an email address
- `1:17 - 1:20` Give the `Fetch Data` task an id, so we can use its result later
- `1:22 - 1:27` Remove a mapper that we no longer need
- `1:12 - 1:54` Update the `Show Data` task (`Send Data` in the Video) to become `Confirm Data`
- `1:55 - 2:05` Add a gateway so we can either send the mail on `ok` or abort on `cancel`
- `2:06 - 3:10` Add the `Send email` Service-Task
- `3:15 - 3:52` Configure the gateway-flows, so that `ok` will send the mail, and `cancel` will abort

{% video controls="controls"%}../images/create-send-email.mp4{% endvideo %}

The copy-pasted values in the video are:
```JavaScript
// uiConfig for "Confirm Data"
${ "message": "1 EUR = " + JSON.parse(token.history.fetch_data.result).rates.USD + " USD - email: " + token.current.email, "layout": [ { "key": "confirm", "label": "OK"}, { "key": "cancel", "label": "cancel"}] };

// params for "send mail"
[null, token.history.get_email.email, "EUR to USD conversion rate", "1 EUR = " + JSON.parse(token.history.fetch_data.result).rates.USD + " USD"]
```

Now let's try it out:

> TODO: make the video displaying the execution of the send-mail-process

{% video controls="controls"%}images/run-send-email.mp4{% endvideo %}