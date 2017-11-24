## Adapter

Adapter sind Bridges sehr ähnlich, haben aber einen wichtigen Unterschied. Sie liefern den "Klebstoff", der benötigt wird, um eine Basisimplementierung unseres Stacks an eine Komponente oder Technologie eines Drittanbieters außerhalb unseres Stacks zu binden.

Die besten Beispiele hierfür sind die in unserem Stack verwendeten `data source adapter`.

Für jede Drittanbieter-Datenbanktechnologie, die wir unterstützen möchten, benötigen wir einen Adapter, der weiß, wie unsere generische Datenschicht mit der Datenbank verknüpft werden kann, damit beide zusammenarbeiten.

![Adapter](images/adapters.png)
