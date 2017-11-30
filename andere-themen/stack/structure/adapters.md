# Adaptermodul

Ein Adaptermodul kann Daten einer externen Software an ein internes Modul senden.

Hierfür wird vom Modul eine Anfrage an den Adapter geschickt. Dieser stellt daraufhin die Verbindung zur Software her, holt die Daten und sendet sie an 
das anfragende Modul.

Der Vorteil:

Die Methode, welche die Verbindung zur Software des Drittanbieters herstellt, ist lediglich im Adapter implementiert; bei einem Wechsel der Software muss nur das Adaptermodul ausgetauscht werden.
Somit wird sichergestellt, dass keine Änderungen an dem anfragenden Modul vorgenommen werden müssen.

Die besten Beispiele hierfür sind die in dem Stack verwendeten `data source adapter`.

![Adapter](images/adapters.png)
