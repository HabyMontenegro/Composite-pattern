import 'navigation_component.dart';

class NavigationItem extends NavigationComponent {
  final String label;

  NavigationItem(this.label);

  @override
  void display(int depth) {
    print('${'  ' * depth}- $label');
  }
}
