# Diagramas de Patrones de Diseño

Este directorio contiene los diagramas UML que ilustran la estructura y relaciones de los patrones de diseño implementados en el proyecto.

## Estructura del Proyecto

El diagrama principal `patterns.puml` muestra tres patrones de diseño:

1. **Patrón Composite**
   - Interfaz `CourseComponent`
   - Clases compuestas: `Course` y `CourseModule`
   - Clase hoja: `CourseItem`

2. **Patrón Observer**
   - Interfaces: `Subject` y `Observer`
   - Implementaciones concretas: `ConcreteSubject` y `ConcreteObserver`

3. **Patrón Factory Method**
   - Interfaces: `Product` y `Factory`
   - Implementaciones: `ProductA/B` y `FactoryA/B`

## Cómo generar los diagramas

Para generar los diagramas necesitarás:
1. PlantUML instalado
2. Java Runtime Environment (JRE)
3. Graphviz (para el renderizado)

Comandos para generar:
```bash
# Generar PNG
plantuml patterns.puml

# Generar SVG
plantuml -tsvg patterns.puml
```

## Notas sobre el diseño

- Las relaciones se muestran con diferentes tipos de flechas:
  - `--|>` para implementación/herencia
  - `..>` para dependencias
  - `-->` para asociaciones
  - `o-->` para composición/agregación

- Los paquetes agrupan las clases por patrón para mejor organización

- Se incluyen los métodos y propiedades más relevantes de cada clase

## Vista previa

Para ver una vista previa rápida del diagrama, puedes:
1. Usar un editor con soporte PlantUML (VS Code + extensión PlantUML)
2. Usar el servidor web de PlantUML
3. Generar el diagrama localmente con los comandos anteriores