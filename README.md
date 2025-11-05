# composite_menu_app

## Planteamiento del problema
Caso: “Gestor de Contenidos Interactivo para una App Educativa”

Una empresa de educación digital llamada EduNova necesita una aplicación móvil donde los estudiantes puedan navegar por los cursos que la institución ofrece.

Cada curso está dividido en módulos, y cada módulo contiene lecciones individuales.
Además, algunos módulos pueden contener submódulos (por ejemplo, “Unidad 1 → Tema 1.1 → Tema 1.1.1”), y cada lección tiene su propio contenido y recursos (videos, PDFs, quizzes, etc.).


## Descripción del patrón usado (Composite)

Este proyecto implementa el patrón de diseño Composite para representar y manipular estructuras jerárquicas de forma uniforme. El objetivo es tratar objetos simples (hojas) y compuestos (nodos que contienen otros nodos) a través de una misma abstracción, permitiendo operaciones recursivas sin que el cliente tenga que distinguir los tipos en tiempo de ejecución.

Cómo se aplica aquí (mapeo a archivos del repo):

- Componente base (abstracción):
	- `lib/models/course/course_component.dart` — `CourseComponent` (abstracto)
	- `lib/models/navigation/navigation_component.dart` — `NavigationComponent` (abstracto)

- Hojas (Leafs):
	- `lib/models/course/course_item.dart` — `CourseItem` (lección)
	- `lib/models/navigation/navigation_item.dart` — `NavigationItem` (opción simple de menú)

- Compuestos (Composites):
	- `lib/models/course/course_module.dart` — `CourseModule` (módulo que contiene hijos)
	- `lib/models/navigation/navigation_group.dart` — `NavigationGroup` (grupo de menú con subopciones)

- Raíz semántica:
	- `lib/models/course/course.dart` — `Course` (extiende `CourseModule` y representa un curso completo)

- Datos de ejemplo / fábrica:
	- `lib/utils/sample_data.dart` — construye instancias de `Course` y `NavigationGroup` para demos y pruebas.

- Renderizado recursivo en UI:
	- `lib/widgets/course_widget.dart` — renderiza recursivamente `CourseComponent` usando `ExpansionTile` para compuestos y `ListTile` para hojas.
	- `lib/widgets/navigation_widget.dart` — hace lo equivalente para `NavigationComponent`.

Por qué esto es Composite:
- Existe una abstracción común (`CourseComponent` / `NavigationComponent`).
- Hay clases hoja (sin hijos) y clases compuestas (con una lista privada de hijos y métodos `add`/`remove`/`children`).
- Las operaciones que recorren la estructura (por ejemplo `printStructure`) son recursivas y funcionan indistintamente sobre hojas y compuestos.

Notas sobre diseño y buenas prácticas observadas en el código:
- Actualmente las implementaciones exponen `add`/`remove`/`children` en las clases compuestas. Si se desea un contrato más estricto, se puede añadir estos métodos en la interfaz base con implementación por defecto que lance `UnsupportedError`, o crear una subclase `CompositeComponent` que los declare.
- Los widgets realizan comprobaciones de tipo (`is CourseModule`) para decidir la forma de renderizado. Esto es pragmático y claro; alternativamente se podría delegar la responsabilidad de render a los modelos o usar Visitor si se busca desacoplar más la presentación.

Ejemplo rápido para demo en consola

Puedes imprimir la estructura de ejemplo en `main.dart` para mostrar la jerarquía:

```dart
final course = SampleData.sampleCourse();
course.printStructure();
```

Ventajas de usar Composite en este proyecto:
- Facilidad para representar jerarquías arbitrarias (módulos con submódulos y lecciones).
- Extensibilidad: añadir un nuevo tipo de nodo requiere implementar la interfaz y no romperá el código que recorre o renderiza la estructura.
- Reutilización del mismo código de presentación/recorrido para distintos tipos de nodos.

Dónde mirar primero en el código para entenderlo rápido:
- `lib/models/course/` y `lib/models/navigation/` para ver la implementación del patrón.
- `lib/utils/sample_data.dart` para ver ejemplos concretos de árboles.
- `lib/widgets/*_widget.dart` y `lib/screens/*_screen.dart` para ver cómo se renderiza la estructura.
