# Einrichtung mit externer ProcessEngine:

## Setup

Die externe Anwendung, welche die ProcessEngine implementiert, muss folgende
Pakete installiert haben:
- `@process-engine/consumer_api_core`
- `@process-engine/consumer_api_http`
- `@process-engine/process-engine` - Version 2.2.0 oder höher

Die Anwendung, welche mit der externen Process Engine kommunizieren soll,
benötigt folgende Pakete:
- `@process-engine/consumer_api_client`
- `@process-engine/process-engine` - Version 2.2.0 oder höher

In beiden Anwendungen muss sichergestellt werden,
dass die jeweiligen IoC Module am IoC Container registriert werden.

## Konfiguration

In der Anwendung, welche die ProcessEngine enthält, muss eine Konfiguration
für das `@process-engine/consumer_api_core` Paket eingerichtet werden.
Siehe weiter oben für Details.

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

Diese Config muss im Konfigurationsordner unter dem Pfad
`consumer_api_client/consumer_api_client_service.json` abgelegt sein.
