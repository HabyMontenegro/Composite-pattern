import '../models/course/course.dart';
import '../models/course/course_item.dart';
import '../models/course/course_module.dart';
import '../models/navigation/navigation_group.dart';
import '../models/navigation/navigation_item.dart';

class SampleData {
  static Course buildSampleCourse() {
    final course = Course("Flutter Avanzado");

    final module1 = CourseModule("Fundamentos");
    module1.add(CourseItem("Configuración del entorno"));
    module1.add(CourseItem("Widgets básicos"));

    final module2 = CourseModule("Patrones de diseño");
    module2.add(CourseItem("Factory Method"));
    module2.add(CourseItem("Composite Pattern"));
    module2.add(CourseItem("Abstract Pattern"));

    course.add(module1);
    course.add(module2);

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
