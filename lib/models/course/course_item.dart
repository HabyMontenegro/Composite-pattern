import 'course_component.dart';

class CourseItem extends CourseComponent {
  final String name;

  CourseItem(this.name);

  @override
  void display(int depth) {
    print('${'  ' * depth}- $name');
  }
}
