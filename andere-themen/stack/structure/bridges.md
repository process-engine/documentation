# Bridges

Wenn ein Basismodul an ein anderes gebunden wird, sind die Implementierungen
völlig unabhängig voneinander.

Ein Beispiel sind `http`-Bridges.

Wenn Servicelogik über einen HTTP-Endpunkt verfügbar sein soll, muss
definiert werden über welche HTTP-Routen und -Methoden sie zu erreichen ist.
Dieser Code befindet sich im Bridge-Modul.

![Bridge](images/bridges.png)
