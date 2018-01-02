# Bridge-Module

Wenn ein Basismodul an ein anderes gebunden wird,
bleiben mit Hilfe eines Brückenmoduls die Implementierungen 
völlig unabhängig voneinander.

Ein Beispiel dazu sind die `http`-Bridges.

Wenn Servicelogik über einen HTTP-Endpunkt verfügbar sein soll, muss
definiert werden über welche HTTP-Routen und -Methoden sie zu erreichen ist.
Dieser Code befindet sich im Bridge-Modul.

![Bridge](images/bridges.png)
