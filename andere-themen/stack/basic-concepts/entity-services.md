# Entity Services

Entity Services sind Ergänzungen zu Entitäten.
Im Gegensatz zu einer Entity gibt es keine Basisklasse für Entity Services.

## Entity Service Logik

Im Gegensatz zu einer Entity besitzt ein Entity Service keinen eigenen Zustand.

Ein Entity Service kann Methoden bereitstellen, die von Entities genutzt werden oder
andere Entities erstellen.

Im Gegensatz zu Entitäten gibt es aber keine Methoden, die Sie per Konvention
implementieren müssen.

## Entity Service Dependency Injection

Um alle Verantwortlichkeiten sauber getrennt voneinandern zu halten, sollte eine Entity
**KEINEN** eigenen Entity Service als Abhängigkeit haben.
