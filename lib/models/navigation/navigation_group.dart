import 'navigation_component.dart';

class NavigationGroup implements NavigationComponent {
  final String label;
  final List<NavigationComponent> _children = [];

  NavigationGroup(this.label);

  void add(NavigationComponent component) => _children.add(component);

  List<NavigationComponent> get children => _children;

  @override
  void display(int depth) {
    print('${'  ' * depth}> Grupo: $label');
    for (var child in _children) {
      child.display(depth + 1);
    }
  }
}
