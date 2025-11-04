import 'navigation_component.dart';

class NavigationItem implements NavigationComponent {
  final String label;

  NavigationItem(this.label);

  @override
  void display(int depth) {
    print('${'  ' * depth}- $label');
  }
}
