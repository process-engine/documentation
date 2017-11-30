# Entity Services

Entity Services sind eine Ergänzung zu Entitäten. Im Gegensatz zur Entität gibt
es keine Basisklasse für Entity Services.

## Entity Service Logik

Während Entitäten die Logik enthalten, um an ihrem eigenen Zustand zu arbeiten,
besitzen Entity Services überhaupt keinen Zustand.

Ein Entity Service kann Methoden bereitstellen, die Entitäten aus einem
bestimmten Status erstellen oder an mehreren Entitäten arbeiten.

Im Gegensatz zu Entitäten gibt es keine Methoden, die Sie per Konvention
implementieren müssen.

## Entity Service Dependency Injection

Um alle Verantwortlichkeiten sauber und gekapselt zu halten, sollte ein Entity
**NICHT** einen eigenen Entity Service als Abhängigkeit haben.
