# Einstieg

Um einen ersten Überblick in die Arbeitsweise mit der API zu erhalten, wird
hier ein Überblick über die Grundlegenden Routen und Parameter gegeben.

Tipp: Um bei den Abfragen Ergebnisse zu erhalten, muss mindestens ein
ausführbares Diagramm vorhanden sein.

## Routen

Bei standardmäßiger Installation ist der API Server unter
`http://localhost:8000` erreichbar.

Es müssen daher alle Routen in diesem Tutorial um die Serveradresse ergänzt
werden.

**Beispiel:**

```REST
GET /api/consumer/v1/process_models
```

entspricht

```REST
GET http://localhost:8000/api/consumer/v1/process_models
```

## Alle Prozessmodelle abfragen

Die nachfolgende Abfrage zeigt alle Prozesse an, die den Kriterien unter
[Auflisten startbarer Prozessmodelle](list-startable-process-models.md)
entsprechen.

```REST
GET /api/consumer/v1/process_models
```

**Beispiel**:

```JSON
{
    "processModels": [
        {
            "id": "HelloWorld",
            "startEvents": [
                {
                    "id": "StartEvent_1mox3jl"
                }
            ],
            "endEvents": [
                {
                    "id": "EndEvent_0eie6q6"
                }
            ]
        }
    ]
}
```

## Prozessmodell abfragen

Mehr Informationen unter [Einzelnes Prozessmodell
abfragen](list-startable-process-models.md#einzelnes-prozessmodell-abfragen)
entsprechen.

```REST
GET /api/consumer/v1/process_models/:process_model_id
```

**Beispiel**:

```REST
GET /api/consumer/v1/process_models/HelloWorld
```

```JSON
{
    "id": "HelloWorld",
    "startEvents": [
        {
            "id": "StartEvent_1mox3jl"
        }
    ],
    "endEvents": [
        {
            "id": "EndEvent_0eie6q6"
        }
    ],
    "xml": "<?xml version=\"1.0\" ... >"
}
```

## Events anzeigen

```REST
GET /api/consumer/v1/process_models/:process_model_id/events
```

**Beispiel**:

```REST
GET /api/consumer/v1/process_models/HelloWorld/events
```

```JSON
{
    "events": [
        {
            "id": "startEvent_1",
            "processInstanceId": "",
            "data": {}
        }
    ]
}
```

## UserTasks anzeigen

```REST
GET /api/consumer/v1/process_models/:process_model_id/user_tasks
```

**Beispiel**:

```REST
GET /api/consumer/v1/process_models/HelloWorld/user_tasks
```

```JSON
{
    "userTasks": [
        {
            "id": "Task_0k8m2if",
            "correlationId": "c5433825-ed03-4df4-b391-391e84b51f95",
            "processModelId": "HelloWorld",
            "data": {
                "formFields": [
                    {
                        "id": "Form_qJOQHD8n",
                        "label": "Log Message",
                        "type": "string",
                        "defaultValue": ""
                    }
                ]
            },
            "tokenPayload": {}
        }
    ]
}
```

## Prozesse starten

Mehr Informationen unter [Starten von Prozessinstanzen
](api/consumer_api/tasks/start-process-instance.md) entsprechen.

```REST
POST /api/consumer/v1/process_models/:process_model_id/start_events/:start_event_id/start?start_callback_type=<callback_type>
```

Die Prozessinstanz wird gestartet und es wird bei `callback_type`

- `1` direkt geantwortet.
- `2` nach Prozessende geantwortet.
- `3` geantwortet wenn das angegeben EntEvent erreicht wurde.

**Beispiel (`callback_type` = 1)**:

```REST
POST /api/consumer/v1/process_models/HelloWorld/start_events/StartEvent_1mox3jl/start?start_callback_type=1
```

```JSON
{
    "correlationId": "d7703aff-f003-4d0a-bffb-f85de6b01fcc"
}
```
**Beispiel (`callback_type` = 2)**:

*Hinweis: Ergebnis erscheint erst nach Prozessende.*

```REST
POST /api/consumer/v1/process_models/HelloWorld/start_events/StartEvent_1mox3jl/start?start_callback_type=2
```

```JSON
{
    "correlationId": "c07a5301-d0dc-4a99-9d39-3ed07f17eff2",
    "endEventId": "EndEvent_0eie6q6",
    "tokenPayload": {
        "form_fields": {
            "Form_qJOQHD8n": "123"
        }
    }
}
```
**Beispiel (`callback_type` = 3)**:

*Hinweis: Ergebnis erscheint erst nach Prozessende.*

```REST
POST /api/consumer/v1/process_models/HelloWorld/start_events/StartEvent_1mox3jl/start?start_callback_type=3&end_event_id=EndEvent_0eie6q6
```

```JSON
{
    "correlationId": "91dfb9e5-4a60-461d-959a-8df222167ad5",
    "endEventId": "EndEvent_0eie6q6",
    "tokenPayload": {
        "form_fields": {
            "Form_qJOQHD8n": "123"
        }
    }
}
```

## Ergebnisse anzeigen

```REST
GET /api/consumer/v1/correlations/:correlation_id/process_models/:process_model_id/results
```

**Beispiel**:

```REST
GET /api/consumer/v1/correlations/c5433825-ed03-4df4-b391-391e84b51f95/process_models/HelloWorld/results
```

```JSON
[
    {
        "correlationId": "c5433825-ed03-4df4-b391-391e84b51f95",
        "endEventId": "EndEvent_0eie6q6",
        "tokenPayload": {
            "form_fields": {
                "Form_qJOQHD8n": "123"
            }
        }
    }
]
```

## Events von Ergebnissen anzeigen

```REST
GET /api/consumer/v1/process_models/:process_model_id/correlations/:correlation_id/events
```

**Beispiel**:

```REST
GET /api/consumer/v1/process_models/HelloWorld/correlations/c5433825-ed03-4df4-b391-391e84b51f95/events
```

```JSON
{
    "events": [
        {
            "id": "startEvent_1",
            "processInstanceId": "",
            "data": {}
        }
    ]
}
```

## Events von Ergebnissen triggern

```REST
POST /api/consumer/v1/process_models/:process_model_id/correlations/:correlation_id/events/:event_id/trigger
```

**Beispiel**:

```REST
POST /api/consumer/v1/process_models/HelloWorld/correlations/c5433825-ed03-4df4-b391-391e84b51f95/events/startEvent_1/trigger
```

```JSON
Not implemented yet!
```

## UserTasks fertigstellen

```JSON
Content-Type: application/json,
payload: {
   "formFields":{
      "<form_field>":"<form_value>"
   }
}
```

```REST
POST /api/consumer/v1/process_models/:process_model_id/correlations/:correlation_id/user_tasks/:user_task_id/finish
```
Bei erfolgreicher Ausführung ist der Statuscode **204** und die Response ist leer.

**Beispiel**:

```JSON
Content-Type: application/json
payload: {"formFields":{"Form_qJOQHD8n":"123"}}
```

```REST
POST /api/consumer/v1/process_models/HelloWorld/correlations/2b0cfee3-9ae4-489d-95b5-f450ed93f203/user_tasks/Task_0tvsrla/finish
```
