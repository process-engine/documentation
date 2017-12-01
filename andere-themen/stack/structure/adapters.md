# Adaptermodul

Ein Adaptermodul implementiert eine Schnittstelle zwischen einem internen Modul und einer drittanbieter-software.

Hierfür wird vom Modul eine Anfrage an den Adapter geschickt. Dieser stellt daraufhin die Verbindung zur Software her, holt die Daten und sendet sie an 
das anfragende Modul.

Der Vorteil:

Die Methode, welche die Verbindung zur Software des Drittanbieters herstellt, ist lediglich im Adapter implementiert; bei einem Wechsel der Software muss nur das Adaptermodul ausgetauscht werden.
Somit wird sichergestellt, dass keine Änderungen an dem anfragenden Modul vorgenommen werden müssen.

Die besten Beispiele hierfür sind die in dem Stack verwendeten `data source adapter`.

![Adapter](images/adapters.png)
