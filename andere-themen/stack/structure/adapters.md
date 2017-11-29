## Adapter

Adapter sind Bridges sehr ähnlich, haben aber einen wichtigen Unterschied. Sie liefern den "Klebstoff", der benötigt wird, um eine Basisimplementierung des Stacks an eine Komponente oder Technologie eines Drittanbieters außerhalb des Stacks zu binden.

Die besten Beispiele hierfür sind die in dem Stack verwendeten `data source adapter`.

Für jede Drittanbieter-Datenbanktechnologie, die unterstützt werden soll, wird ein Adapter benötigt, der weiß, wie die generische Datenschicht mit der Datenbank verknüpt werden kann, damit beide zusammenarbeiten.

![Adapter](images/adapters.png)
