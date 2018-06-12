# Einrichtung mit externer ProcessEngine:

Dieser Abschnitt beschreibt die Einrichtung einer ConsumerAPI, unter Verwendung
einer ProcessEngine, die außerhalb der Anwendung liegt.

![Aufbau](images/consumer_api_architecture_external.png)

## Setup

Die externe Anwendung, welche die ProcessEngine implementiert, muss folgende
Pakete installiert haben:
- `@process-engine/consumer_api_core`
- `@process-engine/consumer_api_http`
- `@process-engine/process-engine` - Version 6.0.2 oder höher

Die Anwendung, welche mit der externen Process Engine kommunizieren soll,
benötigt folgende Pakete:
- `@process-engine/consumer_api_client`
- `@process-engine/process-engine` - Version 6.0.2 oder höher

In beiden Anwendungen muss sichergestellt werden,
dass die jeweiligen IoC Module am IoC Container registriert werden.

## Konfiguration

### Externe Anwendung

In der Anwendung, welche die ProcessEngine implementiert, muss eine
Konfiguration für das `@process-engine/consumer_api_core` Paket eingerichtet
werden.

Diese muss unter dem Konfigurationspfad
`consumer_api_core:consumer_api_iam_service` abgelegt werden.

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
      "Lane_A"
    ],
    "userB": [
      "Lane_A",
      "Lane_B"
    ]
  }
}

```

In diesem Beispiel haben wir 2 Benutzer:
- `UserA`: Hat auf alle Lanes mit dem Namen `Lane_A` und `Lane_B` Zugriff
- `UserB`: Hat auf alle Lanes mit dem Namen `Lane_A`, `Lane_C` und `Lane_D` Zugriff

Wichtig ist: Die ConsumerAPI selbst besitzt keinerlei Benutzerverwaltung.
Um sich an der ConsumerAPI zu authentifizeren, ist ein gültiger JWT Token
erforderlich, der einem [ConsumerContext](./public_api.md#consumercontext) mitgegeben wird.

### Client Anwendung

Die Anwendung, welche mit der externen ProcessEngine kommunizieren soll,
benötigt folgende Konfiguration für `@process-engine/consumer_api_client`:

```js
{
  "url": "http://address-to-external-application/api/consumer/v1"
}

```

`url` bezeichnet dabei die HTTP Adresse, unter der die externe Anwendung
erreichbar ist.
Das Suffix `/api/consumer/v1` ist zwingend erforderlich.

Die Konfiguration muss unter dem Konfigurationspfad
`consumer_api_client:consumer_api_client_service` abgelegt sein.
