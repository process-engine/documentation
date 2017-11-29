# Bridges

Wenn ein Basismodul an ein anderes gebunden werden soll, wird es so sein, dass die Implementierungen völlig unabhängig voneinander sind.

Ein Beispiel sind `http`-Bridges. Normalerweise enthalten Basismodule meist Dienste, die Logik kapseln.

Wenn die Service-Logik über einen HTTP-Endpunkt verfügbar sein soll, muss definiert sein, welche HTTP-Routen und -Methoden verwendet werden können, um die Service-Logik auszuführen. Der Code, der dies bewirkt, befindet sich im Bride-Modul.

![Bridge](images/bridges.png)

Üblicherweise werden Bridge-Module mit _Inversion of Control_ (siehe 3.1) gefunden.
