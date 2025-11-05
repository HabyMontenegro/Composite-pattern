# Diagrama Completo del Proyecto

Este diagrama muestra la estructura completa del proyecto, incluyendo todas las clases, sus relaciones y la organización en paquetes.

## Estructura del Proyecto

### 1. App Core
- `CompositeApp`: Widget raíz de la aplicación
- `HomeScreen`: Pantalla principal con navegación
- `TransitionWrapper`: Maneja transiciones entre pantallas

### 2. Screens
- Pantallas principales (`CourseScreen`, `NavigationScreen`)
- Páginas de demostración de patrones:
  - `CompositePatternPage`
  - `FactoryMethodPage`
  - `ObserverPatternPage`

### 3. Widgets
Componentes reutilizables:
- `GlassCard`: Efecto visual de cristal
- `CourseWidget`: Renderiza estructura de cursos
- `NavigationWidget`: Renderiza menú de navegación
- `AnimatedBackground`: Fondo animado

### 4. Models
#### Course (Composite Pattern)
- `CourseComponent`: Interfaz base
- `Course`: Raíz de la jerarquía
- `CourseModule`: Nodo compuesto
- `CourseItem`: Hoja

#### Navigation (Composite Pattern)
- `NavigationComponent`: Interfaz base
- `NavigationGroup`: Nodo compuesto
- `NavigationItem`: Hoja

### 5. Utils
- `SampleData`: Datos de ejemplo
- `AppTheme`: Configuración visual

## Relaciones Principales

1. **Composición**
   - Course → CourseComponent
   - CourseModule → CourseComponent
   - NavigationGroup → NavigationComponent

2. **Navegación**
   - HomeScreen → CourseScreen
   - HomeScreen → NavigationScreen

3. **Uso de Widgets**
   - Screens → Widgets específicos
   - Widgets → Models para renderizado

## Cómo leer el diagrama

- Flechas sólidas: Herencia/Implementación
- Flechas punteadas: Dependencia/Uso
- Diamantes: Composición/Agregación
- Paquetes: Agrupación lógica de clases

## Notas de implementación

1. **Patrón Composite**
   - Implementado dos veces: Cursos y Navegación
   - Permite estructuras jerárquicas flexibles

2. **Arquitectura Flutter**
   - Separación clara de Widgets/Screens/Models
   - Reutilización de componentes
   - Manejo de estado con StatefulWidget

3. **Organización**
   - Módulos claramente separados
   - Bajo acoplamiento entre componentes
   - Alta cohesión dentro de cada paquete