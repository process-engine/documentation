# Contracts

Es wurde bereits erläutert, dass Module reguläre NPM-Pakete mit Abhängigkeiten
sind. Wenn mit einem Stack dieser Größe gearbeitet wird, muss sichergestellt
werden, dass jede Komponente durch Dependency Injection austauschbar ist.

Beispielsweise gibt es eine Klasse `ReportingService` in einem Modul
`reporting`, das von der Klasse `LoggingService` des Moduls `logging` abhängt.

Das NPM-Paket `reporting` hat keine Abhängigkeit auf `logging`, sondern von `logging_contracts`.

Auch die Klasse `ReportingService` verweist nicht auf die Klasse
`LoggingService`. Stattdessen verwendet es die Schnittstelle `ILoggingService`
von` logging_contracts`.

![](images/contracts.png)

Da das `reporting`-Modul keine Referenzen auf die Implementierung von `logging` hat, kann die
Implementierung vollständig durch Dependency Injcetion geändert werden, solange
unser Ersatz die richtige Schnittstelle implementiert.
