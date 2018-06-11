# !!!deprecated!!! Entity Services

## Entity Service Logik

Eine Entity soll nicht direkt den Zustand anderer Entities beeinflussen.
Deshalb gibt es keine Notwendikeit, einen EntityTypeService als
Dependency zum zugehörigen EntityType anzugeben.

Über den Entity Service können folgende Aussagen getroffen werden:

- ist zustandslos
- kann Entitäten verwalten
