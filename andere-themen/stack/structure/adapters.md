# Adaptermodul

Ein Modul kann über ein Adaptermodul Daten einer externen Software erhalten.

Hierfür wird vom Modul eine Anfrage an den Adapter geschickt. Dieser stellt daraufhin die Verbindung zur Software her, holt die Daten und sendet sie an 
das anfragende Modul. 

Der Vorteil: 

Die Methode, welche die Verbindung zur Software des Dritt-Anbieters herstellt, ist lediglich in dem Adapter implementiert. Bei einem Wechsel der Software muss nur das Adapter-Modul ausgetauscht werden. Es wird somit sichergestellt, dass keine Änderungen an dem anfragenden Modul vorgenommen werden müssen.

Die besten Beispiele hierfür sind die in dem Stack verwendeten `data source adapter`.

![Adapter](images/adapters.png)
