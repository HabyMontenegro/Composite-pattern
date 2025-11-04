import 'course_component.dart';

class Course implements CourseComponent {
  final String name;
  final List<CourseComponent> _modules = [];

  Course(this.name);

  void add(CourseComponent module) => _modules.add(module);

  @override
  void display(int depth) {
    print('${'  ' * depth}Curso: $name');
    for (var m in _modules) {
      m.display(depth + 1);
    }
  }

  List<CourseComponent> get modules => _modules;
}
