# Sending Mail

Continue with the example from [Consuming an HTTP REST API](consuming-rest-api.md).

We now update the user-task, so that the user will be given a choice to accept or cancel.

Using a Gateway, we will tell the process to end, if the user cancels, or to send a mail, if the user accepts.

To send the mail, we'll use another service-task (like the one for the rest-call), but with different parameters.

> TODO: make the video displaying the creation of the send-email-process

{% video controls="controls"%}images/create-send-email.mp4{% endvideo %}

Now let's try it out:

> TODO: make the video displaying the execution of the send-mail-process

{% video controls="controls"%}images/run-send-email.mp4{% endvideo %}