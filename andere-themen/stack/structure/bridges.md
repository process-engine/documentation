# Bridges

Wenn wir ein Basismodul an ein anderes binden wollen, wollen wir es so machen, dass es locker gekoppelt bleibt. Das bedeutet, dass die Implementierungen, die wir zusammenbinden, völlig unabhängig voneinander sind.

Wir erreichen die lose Kopplung, indem wir den ganzen "Kleber", der die Module zu Brückenmodulen verbindet, aufsetzen.

Ein Beispiel, das Sie oft finden werden, sind `http`-Bridges. Normalerweise enthalten Basismodule meist Dienste, die Logik kapseln.

Wenn wir die Service-Logik über einen HTTP-Endpunkt verfügbar machen wollen, müssen wir definieren, welche HTTP-Routen und -Methoden verwendet werden können, um die Service-Logik auszuführen. Der Code, der dies bewirkt, befindet sich im Bridge-Modul.

![Bridge](images/bridges.png)

Üblicherweise werden Bridge-Module mit _Inversion of Control_ (siehe 3.1) gefunden.