# Einrichtung mit integrierter ProcessEngine:

## Setup

Anwendungen, die eine integrierte ProcessEngine verwenden,
benötigen folgende Pakete:
- `@process-engine/consumer_api_core`
- `@process-engine/process-engine` - Version 2.2.0 oder höher

Ebenfalls muss sichergestellt sein, dass das IoC Module des
`@process-engine/consumer_api_core` Pakets am IoC Container registriert wird.
Das Modul kann über den Pfad `@process-engine/consumer_api_core/ioc_module`
angesteuert werden.

## Konfiguration

Das `@process-engine/consumer_api_core` Paket benötigt eine Konfigurationsdatei, die innerhalb
des Konfigurationsordners unter dem Pfad
`consumer_api_core/consumer_api_iam_service.json` abgelegt werden muss.

In dieser Datei werden die Claims konfiguriert, mit denen die Benutzer Zugriff
auf die Lanes eines Prozesses erhalten sollen.

Die Claims werden dabei stehts einem konkreten Benutzer zugeordnet.
Ebenfalls ist zu beachten, dass die zugeordneten Claims dem Namen einer `Lane`
entsprechen müssen.

Beispiel Config:

```js
{
  "claimConfig": {
    "userA": [
      "Lane_A",
      "Lane_B"
    ],
    "userB": [
      "Lane_A",
      "Lane_C",
      "Lane_D"
    ]
  }
}

```
