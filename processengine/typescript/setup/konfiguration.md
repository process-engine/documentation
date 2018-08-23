# Konfiguration

Die Einstellungen des Process Engine Servers können über die [Konfiguration](./../konzepte/configuration.md) angepasst werden.

Das [Docker Setup](https://github.com/process-engine/skeleton/tree/develop/full-docker-image) verwendet ebenfalls den [Process Engine Server des Skeleton Projekts](https://github.com/process-engine/skeleton/tree/develop/process-engine-server).

Die Einstellung wird also für das Docker Setup ebenfalls in der oben beschrieben Konfigurationsdatei vorgenommen.

## HTTP-Endpunkt

Der Port, unter dem der HTTP-Endpunkt des Process Engine Server bereit steht, kann in der Datei `process-engine-server/config/development/http/http_extension.json` unter dem Eintrag `server.port` geändert werden.

```
{
  "server": {
    "host": "0.0.0.0",
    "port": 8000
  },
  "api": {
    "version": "v1"
  },
  "routeConfiguration": {
    "/app*": {
      "refreshOnInvalidToken": true
    }
  }
}
```

## Datenbank

Die Datenbank, die der Process Engine Server zur Persistenz nutzt, kann in der Datei `process-engine-server/config/development/data_sources/postgres.json` geändert werden.

Aktuell wird nur PostgreSQL unterstützt.

```
{
  "adapter": {
    "name": "Postgres",
    "skipMigration": false,
    "server": {
      "host": "localhost",
      "port": 5432,
      "database": "processengine",
      "user": "admin",
      "password": "admin",
      "max": 50,
      "idleTimeoutMillis": 1000

    }
  },
  "schemaMode": "full"
}
```
