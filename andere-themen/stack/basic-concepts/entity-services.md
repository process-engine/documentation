# Entity Services

Entity Services sind Klassen zur Verwaltung von bestimmten Entitäten.

## Entity Service Logik

Ein Entity Service:

- ist zustandslos
- kann Entitäten verwalten

## Entity Service Dependency Injection

Eine Entity soll nicht direkt den Zustand anderer Entities beeinflussen.
Deshalb gibt es keine Notwendikeit, einen EntityTypeService als
Dependency zum zugehörigen EntityType anzugeben.
