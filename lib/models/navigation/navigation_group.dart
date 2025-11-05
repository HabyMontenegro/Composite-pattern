import 'navigation_component.dart';

class NavigationGroup extends NavigationComponent {
  final String label;
  final List<NavigationComponent> _children = [];

  NavigationGroup(this.label);

  @override
  void add(NavigationComponent component) => _children.add(component);

  @override
  void remove(NavigationComponent component) => _children.remove(component);

  @override
  List<NavigationComponent> get children => _children;

  @override
  void display(int depth) {
    print('${'  ' * depth}> Grupo: $label');
    for (var child in _children) {
      child.display(depth + 1);
    }
  }
}
