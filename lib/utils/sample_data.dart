import '../models/course/course.dart';
import '../models/course/course_item.dart';
import '../models/course/course_module.dart';
import '../models/navigation/navigation_group.dart';
import '../models/navigation/navigation_item.dart';

class SampleData {
  static Course buildSampleCourse() {
    final course = Course("Flutter Avanzado");

    final module1 = CourseModule("1. Fundamentos");
    module1.add(CourseItem("Configuración del entorno"));
    module1.add(CourseItem("Widgets básicos"));

    final module2 = CourseModule("2. Patrones de diseño");
    module2.add(CourseItem("Factory Method"));
    module2.add(CourseItem("Composite Pattern"));
    module2.add(CourseItem("Abstract Pattern"));
    module2.add(CourseItem("Observer Pattern"));

    // Módulo 3 con submódulos
    final module3 = CourseModule("3. Prácticas avanzadas");

    // Submódulo 3.1
    final subModule1 = CourseModule(" 3.1. Proyecto UI");
    subModule1.add(CourseItem("3.1.1. Pantalla de login"));
    subModule1.add(CourseItem("3.1.2. Pantalla de perfil"));

    // Submódulo 3.2
    final subModule2 = CourseModule("3.2. Proyecto Backend");
    subModule2.add(CourseItem("3.2.1. API de autenticación"));
    subModule2.add(CourseItem("3.2.2. API de usuarios"));

    // Agregar submódulos al módulo 3
    module3.add(subModule1);
    module3.add(subModule2);

    course.add(module1);
    course.add(module2);
    course.add(module3);

    return course;
  }

  static NavigationGroup buildSampleMenu() {
    final home = NavigationItem("Inicio");
    final courses = NavigationGroup("Cursos");
    courses.add(NavigationItem("Flutter"));
    courses.add(NavigationItem("Dart"));
    courses.add(NavigationItem("Arquitectura"));

    final course2 = NavigationGroup("Cursos II");
    course2.add(NavigationItem("Flutter II"));
    course2.add(NavigationItem("Dart II"));
    course2.add(NavigationItem("Arquitectura III"));

    final settings = NavigationGroup("Configuración");
    settings.add(NavigationItem("Perfil"));
    settings.add(NavigationItem("Privacidad"));

    final root = NavigationGroup("Menú principal");
    root.add(home);
    root.add(courses);
    root.add(course2);
    root.add(settings);

    return root;
  }
}
