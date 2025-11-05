abstract class CourseComponent {
  String get name;


  List<CourseComponent> get children => const [];


  void add(CourseComponent child) => throw UnsupportedError('add not supported for this component');
  void remove(CourseComponent child) => throw UnsupportedError('remove not supported for this component');

  void display(int depth);
}
