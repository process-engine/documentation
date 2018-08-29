# Konfiguration

Die Einstellungen der ProcessEngine-Runtime können über die
[Konfiguration](./../konzepte/configuration.md) angepasst werden.

Das [Docker Setup](https://github.com/process-engine/skeleton/tree/develop/full-docker-image)
verwendet ebenfalls die [ProcessEngine-Runtime des Skeleton Projekts](https://github.com/process-engine/skeleton/tree/develop/process-engine-server).

Die Einstellung wird also für das Docker Setup ebenfalls in der oben beschrieben
Konfigurationsdatei vorgenommen.

## Datenbank

Wir verwenden [Sequelize]() basierte Repositories um auf unsere Datenbanken
zuzugreifen.

Dank Sequelize ist es möglich viele verschiedene Datenbanken anzusteuern, ohne
funktionell etwas ändern zu müssen.
Lediglich die Konfiguration des Repositories muss angepasst werden, wenn eine
andere Art von Datenbank verwendet werden soll als die bisherige.

**Wichtig**:
Sequelize unterstützt zwar zahlreiche Datenbanksysteme, ausführlich getestet
wurden von uns bisher allerdings nur folgende:
- Postgres
- SQLite

Zwar sind wir stehts bemüht die Implementierungen der Repositories generisch
genug zu halten, so dass es mit anderen Systemen keine Probleme geben **sollte**,
allerdings kann es derzeit nicht garantiert werden, dass z.B. bei MySql die
gleiche Funktionalität vorhanden ist, wie z.B. bei Postgres!


### Repositories

Derzeit besitzen wir drei Repositories.
Wie diese benannt sind, was deren Aufgabe ist und wie sie zu konfigurieren sind,
wird nun nachfolgend erläutert.

#### ProcessModels

In diesem Repository werden die Prozessmodelle gespeichert.

Die Konfigurationsdatei findet sich unter
`config/<database-type>/process_engine/process_model_repository.json`.

Durch die Verwendung von Sequelize ist das Konfigurationsschema in jedem Fall
identisch.

Lediglich die Werte unterscheiden sich für SQLite und Postgres.

**Hinweis**:
Im oben beschriebenen Pfad steht `<database-type>` für die verwendete
Datenbanktechnologie.

Dadurch ergeben sich folgende Pfade:
- Für Postgres: `process-engine-server/config/postgres/http/http_extension.json`
- Für Sqlite: `process-engine-server/config/sqlite/http/http_extension.json`

1. Minimale Konfiguration Postgres

```
{
  "username": "admin",
  "password": "admin",
  "database": "processengine",
  "host": "localhost",
  "port": 5432,
  "dialect": "postgres",
  "supportBigNumbers": true,
  "resetPasswordRequestTimeToLive": 12
}
```

1. Minimale Konfiguration SQLite

```
{
  "dialect": "sqlite",
  "storage": "processengine.sqlite",
  "supportBigNumbers": true,
  "resetPasswordRequestTimeToLive": 12,
  "logging": false
}
```

Standardmäßig schreiben wir alle Tabellen in eine gleich benannte Datenbank
namens `processengine`.

Man kann die Repositories jedoch auch problemlos auf mehrere Datenbanken
aufteilen, indem man den Wert in `storage` (SQLite),
bzw. `database` (Postgres) ändert.

Somit ist es auch möglich für jedes Repository eine eigene Datenbank zu
verwenden.

Auch eine gemischte Nutzung von SQLite und Postgres ist dank Sequelize
kein Problem.

#### FlowNodeInstances

In diesem Repository werden die Instanzen zu allen FlowNodes abgelegt.

Die Konfigurationsdatei findet sich unter
`config/<database-type>/process_engine/flow_node_instance_repository.json`.

Die Konfiguration erfolgt nach dem exakt gleichen Schema, wie im
Abschnitt `ProcessModels` beschrieben.

#### Timers

In diesem Repository werden alle Timer Objekte gespeichert, die zu einem
`TimerEvent` oder `TimerBoundaryEvent` gehören.

Die Konfigurationsdatei findet sich unter
`config/<database-type>/process_engine/timers_repository.json`.

Die Konfiguration erfolgt nach dem exakt gleichen Schema, wie im
Abschnitt `ProcessModels` beschrieben.


## HTTP-Endpunkt

Der Port, unter dem der HTTP-Endpunkt der ProcessEngine-Runtime bereit steht,
kann in der Datei `process-engine-server/config/<database-type>/http/http_extension.json`
unter dem Eintrag `server.port` geändert werden.

Eine vollständige HTTP Konfiguration sieht folgendermaßen aus:

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
