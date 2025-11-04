import 'course_component.dart';

class CourseItem implements CourseComponent {
  final String name;

  CourseItem(this.name);

  @override
  void display(int depth) {
    print('${'  ' * depth}- $name');
  }
}
