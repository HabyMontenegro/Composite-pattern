import 'course_component.dart';

class Course extends CourseComponent {
  final String name;
  final List<CourseComponent> _modules = [];

  Course(this.name);

  void add(CourseComponent module) => _modules.add(module);
  void remove(CourseComponent module) => _modules.remove(module);

  @override
  void display(int depth) {
    print('${'  ' * depth}Curso: $name');
    for (var m in _modules) {
      m.display(depth + 1);
    }
  }

  List<CourseComponent> get modules => _modules;

  @override
  List<CourseComponent> get children => modules;
}
