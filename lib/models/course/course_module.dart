import 'course_component.dart';

class CourseModule extends CourseComponent {
  @override
  final String name;
  final List<CourseComponent> _children = [];

  CourseModule(this.name);

  @override
  void add(CourseComponent component) => _children.add(component);
  @override
  void remove(CourseComponent component) => _children.remove(component);

  @override
  void display(int depth) {
    print('${'  ' * depth}> Módulo: $name');
    for (var child in _children) {
      child.display(depth + 1);
    }
  }

  List<CourseComponent> get children => _children;
}
