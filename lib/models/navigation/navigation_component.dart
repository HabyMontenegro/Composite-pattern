abstract class NavigationComponent {
  String get label;

  /// Default: no children. Groups override this.
  List<NavigationComponent> get children => const [];

  /// Mutation API for composites. Leaves inherit an UnsupportedError by default.
  void add(NavigationComponent child) => throw UnsupportedError('add not supported for this component');
  void remove(NavigationComponent child) => throw UnsupportedError('remove not supported for this component');

  void display(int depth);
}
