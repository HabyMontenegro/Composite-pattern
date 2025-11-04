import 'course_component.dart';

class CourseModule implements CourseComponent {
  final String name;
  final List<CourseComponent> _children = [];

  CourseModule(this.name);

  void add(CourseComponent component) => _children.add(component);

  @override
  void display(int depth) {
    print('${'  ' * depth}> Módulo: $name');
    for (var child in _children) {
      child.display(depth + 1);
    }
  }

  List<CourseComponent> get children => _children;
}
