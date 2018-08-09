## Einstieg

Um einen ersten Überblick in die Arbeitsweise mit der API zu erhalten, wird hier ein Überlick über die 
Grundlegenden Routen und Parameter gegeben.

Tipp: Um bei den Abfragen Ergebnisse zu erhalten, muss mindestens ein 'executeable Diagram' vorhanden sein.

### Routen

Bei standardmäßiger Installation ist der API Server unter `http://localhost:8000` erreichbar. 

Es müssen daher alle Routen in diesem Tutorial um die Serveradresse ergänzt werden.

**Beispiel:**
```REST
GET /api/management/v1/process_models
```
entspricht
```REST
GET http://localhost:8000/api/management/v1/process_models
```

### Prozessmodell anlegen oder ändern

```REST
POST /api/management/v1/process_models/<name>/update
```
*Header*: `Content-Type: application/json`

*Body*: `{"xml":"..."}`

**Beispiel**:
```REST
POST /api/management/v1/process_models/test/update
```

*Header*: `Content-Type: application/json`

*Body*: `{"xml":"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<bpmn:definitions xmlns:bpmn=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:dc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:camunda=\"http://camunda.org/schema/1.0/bpmn\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" id=\"Definition_1\" targetNamespace=\"http://bpmn.io/schema/bpmn\" exporter=\"BPMN Studio\" exporterVersion=\"1\"><bpmn:collaboration id=\"Collaboration_1cidyxu\" name=\"\"><bpmn:participant id=\"Participant_0px403d\" name=\"test\" processRef=\"test\" /></bpmn:collaboration><bpmn:process id=\"test\" name=\"test\" isExecutable=\"false\"><bpmn:laneSet><bpmn:lane id=\"Lane_1xzf0d3\" name=\"Lane\"><bpmn:flowNodeRef>StartEvent_1mox3jl</bpmn:flowNodeRef><bpmn:flowNodeRef>EndEvent_0eie6q6</bpmn:flowNodeRef><bpmn:flowNodeRef>Task_1r295fz</bpmn:flowNodeRef></bpmn:lane></bpmn:laneSet><bpmn:startEvent id=\"StartEvent_1mox3jl\" name=\"Start Event\"><bpmn:outgoing>SequenceFlow_1jdocur</bpmn:outgoing><bpmn:outgoing>SequenceFlow_0ozkqtk</bpmn:outgoing></bpmn:startEvent><bpmn:sequenceFlow id=\"SequenceFlow_1jdocur\" sourceRef=\"StartEvent_1mox3jl\" targetRef=\"Task_1r295fz\" /><bpmn:endEvent id=\"EndEvent_0eie6q6\" name=\"End Event\"><bpmn:incoming>SequenceFlow_0ymsb9h</bpmn:incoming></bpmn:endEvent><bpmn:sequenceFlow id=\"SequenceFlow_0ozkqtk\" sourceRef=\"StartEvent_1mox3jl\" targetRef=\"Task_1r295fz\" /><bpmn:sequenceFlow id=\"SequenceFlow_0ymsb9h\" sourceRef=\"Task_1r295fz\" targetRef=\"EndEvent_0eie6q6\" /><bpmn:userTask id=\"Task_1r295fz\" name=\"\" camunda:formKey=\"Form Key\"><bpmn:extensionElements><camunda:formData><camunda:formField id=\"Form_w7eKi2IV\" label=\"\" type=\"string\" defaultValue=\"\" /></camunda:formData></bpmn:extensionElements><bpmn:incoming>SequenceFlow_0ozkqtk</bpmn:incoming><bpmn:incoming>SequenceFlow_1jdocur</bpmn:incoming><bpmn:outgoing>SequenceFlow_0ymsb9h</bpmn:outgoing></bpmn:userTask></bpmn:process><bpmndi:BPMNDiagram id=\"BPMNDiagram_1\"><bpmndi:BPMNPlane id=\"BPMNPlane_1\" bpmnElement=\"Collaboration_1cidyxu\"><bpmndi:BPMNShape id=\"Participant_0px403d_di\" bpmnElement=\"Participant_0px403d\"><dc:Bounds x=\"5\" y=\"4\" width=\"581\" height=\"170\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Lane_1xzf0d3_di\" bpmnElement=\"Lane_1xzf0d3\"><dc:Bounds x=\"35\" y=\"4\" width=\"551\" height=\"170\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"StartEvent_1mox3jl_di\" bpmnElement=\"StartEvent_1mox3jl\"><dc:Bounds x=\"83\" y=\"69\" width=\"36\" height=\"36\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"EndEvent_0eie6q6_di\" bpmnElement=\"EndEvent_0eie6q6\"><dc:Bounds x=\"503\" y=\"69\" width=\"36\" height=\"36\" /></bpmndi:BPMNShape><bpmndi:BPMNEdge id=\"SequenceFlow_1jdocur_di\" bpmnElement=\"SequenceFlow_1jdocur\"><di:waypoint x=\"119\" y=\"87\" /><di:waypoint x=\"212\" y=\"87\" /></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"SequenceFlow_0ozkqtk_di\" bpmnElement=\"SequenceFlow_0ozkqtk\"><di:waypoint x=\"119\" y=\"87\" /><di:waypoint x=\"212\" y=\"87\" /></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"SequenceFlow_0ymsb9h_di\" bpmnElement=\"SequenceFlow_0ymsb9h\"><di:waypoint x=\"312\" y=\"87\" /><di:waypoint x=\"503\" y=\"87\" /></bpmndi:BPMNEdge><bpmndi:BPMNShape id=\"UserTask_0lw35hu_di\" bpmnElement=\"Task_1r295fz\"><dc:Bounds x=\"212\" y=\"47\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape></bpmndi:BPMNPlane></bpmndi:BPMNDiagram></bpmn:definitions>"}
`

### Alle Prozessmodelle abfragen

```REST
GET /api/management/v1/process_models
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

### Prozessmodell abfragen

```REST
GET /api/management/v1/process_models/<processmodels_id>
```
**Beispiel**:
```REST
GET /api/management/v1/process_models/HelloWorld
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

### Events anzeigen

```REST
GET /api/management/v1/process_models/<processmodels_id>/events
```
**Beispiel**:
```REST
GET /api/management/v1/process_models/HelloWorld/events
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

### UserTasks anzeigen

```REST
GET /api/management/v1/process_models/<processmodels_id>/user_tasks
```
**Beispiel**:
```REST
GET /api/management/v1/process_models/HelloWorld/user_tasks
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

### Prozesse starten

```REST
POST /api/management/v1/process_models/<processmodels_id>/start_events/<start_event_id>/start?start_callback_type=<callback_type>
```
`callback_type`
* `1`: Starte Prozessinstanz und antworte direkt nach Prozessstart.
* `2`: Starte Prozessinstanz und antworte nach Prozessende.
* `3`: Starte Prozessinstanz und antworte wenn das gegebene EndEvent erreicht wurde.

**Beispiel (`callback_type` = 1)**:
```REST
POST /api/management/v1/process_models/HelloWorld/start_events/StartEvent_1mox3jl/start?start_callback_type=1
```

```JSON
{
    "correlationId": "d7703aff-f003-4d0a-bffb-f85de6b01fcc"
}
```
**Beispiel (`callback_type` = 2)**:

*Hinweis: Ergebnis erscheint erst nach Prozessende.*
```REST
POST /api/management/v1/process_models/HelloWorld/start_events/StartEvent_1mox3jl/start?start_callback_type=2
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
POST /api/management/v1/process_models/HelloWorld/start_events/StartEvent_1mox3jl/start?start_callback_type=3&end_event_id=EndEvent_0eie6q6
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

### Aktive Prozesse anzeigen

```REST
GET /api/management/v1/correlations/active
```
**Beispiel**:
```JSON
[
    {
        "id": "b426922c-b134-4768-8e81-1372d78e5d36",
        "processModelId": "HelloWorld"
    }
]
```

### UserTasks fertigstellen

```REST
POST /api/management/v1/process_models/<processmodels_id>/correlations/<correlation_id>/user_tasks/<user_task_id>/finish
```
*Header*: `Content-Type: application/json`

*Body*: `{"formFields":{"<form_field>":"<form_value>"}}`

**Beispiel**:
```REST
POST /api/management/v1/process_models/HelloWorld/correlations/2b0cfee3-9ae4-489d-95b5-f450ed93f203/user_tasks/Task_0tvsrla/finish
```

*Header*: `Content-Type: application/json`

*Body*: `{"formFields":{"Form_qJOQHD8n":"123"}}`