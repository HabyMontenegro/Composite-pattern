import 'package:flutter/material.dart';

/// Página didáctica para explicar y mostrar el patrón Composite.
class CompositePatternPage extends StatefulWidget {
	const CompositePatternPage({super.key});

	@override
	State<CompositePatternPage> createState() => _CompositePatternPageState();
}

class _CompositePatternPageState extends State<CompositePatternPage> {
	final CompositeNode _root = CompositeNode('Raíz');
	final TextEditingController _nameController = TextEditingController();
	bool _isComposite = false;
	int? _selectedParentId;

	@override
	void initState() {
		super.initState();
		_selectedParentId = _root.id;
		// Add an initial sample for clearer demo
		_buildSampleTree();
	}

	void _buildSampleTree() {
		_root.children.clear();
		final course = CompositeNode('Curso: Flutter');
		final module1 = CompositeNode('Módulo: Fundamentos');
		module1.add(Leaf('Lección: Widgets básicos'));
		module1.add(Leaf('Lección: Estado y setState'));

		final module2 = CompositeNode('Módulo: Patrones');
		module2.add(Leaf('Lección: Factory Method'));
		module2.add(Leaf('Lección: Composite Pattern'));

		course.add(module1);
		course.add(module2);

		_root.add(course);
	}

	List<CompositeNode> _collectComposites() {
		final list = <CompositeNode>[];
		void walk(Component node) {
			if (node is CompositeNode) {
				list.add(node);
				for (var c in node.children) {
					walk(c);
				}
			}
		}

		walk(_root);
		return list;
	}

	CompositeNode? _findById(int id) {
		CompositeNode? result;
		void walk(Component node) {
			if (node is CompositeNode) {
				if (node.id == id) result = node;
				for (var c in node.children) {
					walk(c);
				}
			}
		}

		walk(_root);
		return result;
	}

	void _addNode() {
		final name = _nameController.text.trim();
		if (name.isEmpty) return;

		final parent = _findById(_selectedParentId ?? _root.id) ?? _root;
		if (_isComposite) {
			parent.add(CompositeNode(name));
		} else {
			parent.add(Leaf(name));
		}

		_nameController.clear();
		setState(() {});
	}

	void _reset() {
		setState(() {
			_root.children.clear();
			_buildSampleTree();
		});
	}

	@override
	void dispose() {
		_nameController.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		final theme = Theme.of(context);
		final composites = _collectComposites();

		return Scaffold(
			appBar: AppBar(title: const Text('Composite Pattern — Demo')),
			body: SingleChildScrollView(
				padding: const EdgeInsets.all(16),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.stretch,
					children: [
						_buildHeader(theme),
						const SizedBox(height: 12),
						_buildDescription(theme),
						const SizedBox(height: 12),
						_buildSnippet(),
						const SizedBox(height: 12),
						Card(
							child: Padding(
								padding: const EdgeInsets.all(12),
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.stretch,
									children: [
										Text('Demo interactivo', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
										const SizedBox(height: 8),
										Row(
											children: [
												Expanded(
													child: TextField(
														controller: _nameController,
														decoration: const InputDecoration(labelText: 'Nombre del nodo', hintText: 'Ej: Lección: Introducción'),
													),
												),
												const SizedBox(width: 12),
												Column(
													children: [
														Row(children: [
															const Text('Hoja'),
															Switch(value: _isComposite, onChanged: (v) => setState(() => _isComposite = v)),
															const Text('Compuesto'),
														]),
														const SizedBox(height: 8),
														SizedBox(
															width: 200,
															child: DropdownButtonFormField<int>(
																value: _selectedParentId,
																items: composites.map((c) => DropdownMenuItem(value: c.id, child: Text(c.name))).toList(),
																onChanged: (v) => setState(() => _selectedParentId = v),
																decoration: const InputDecoration(labelText: 'Padre'),
															),
														),
													],
												)
											],
										),
										const SizedBox(height: 12),
										Row(children: [
											ElevatedButton.icon(onPressed: _addNode, icon: const Icon(Icons.add), label: const Text('Agregar')),
											const SizedBox(width: 12),
											OutlinedButton.icon(onPressed: _reset, icon: const Icon(Icons.refresh), label: const Text('Restablecer muestra')),
										])
									],
								),
							),
						),
						const SizedBox(height: 12),
						Text('Estructura actual', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
						const SizedBox(height: 8),
						_buildTreeView(_root),
						const SizedBox(height: 24),
						Text('Notas para la presentación', style: theme.textTheme.titleSmall),
						const SizedBox(height: 6),
						Text('- Las hojas representan elementos atómicos (no tienen hijos).', style: theme.textTheme.bodySmall),
						Text('- Los compuestos contienen hijos y delegan operaciones recursivamente.', style: theme.textTheme.bodySmall),
						Text('- Beneficio: tratar hojas y compuestos de forma uniforme (polimorfismo).', style: theme.textTheme.bodySmall),
					],
				),
			),
		);
	}

	Widget _buildHeader(ThemeData theme) {
		return Container(
			padding: const EdgeInsets.all(14),
			decoration: BoxDecoration(
				gradient: const LinearGradient(colors: [Color(0xFF00BFA6), Color(0xFF0077B6)]),
				borderRadius: BorderRadius.circular(10),
				boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 8)],
			),
			child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
				Text('Composite Pattern', style: theme.textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
				const SizedBox(height: 6),
				Text('Representa jerarquías y permite tratar objetos individuales y compuestos de manera uniforme.', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white70)),
			]),
		);
	}

	Widget _buildDescription(ThemeData theme) {
		return Card(
			child: Padding(
				padding: const EdgeInsets.all(12),
				child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
					Text('¿Dónde se usa?', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
					const SizedBox(height: 8),
					Text('En este proyecto usamos Composite para modelar cursos y menús jerárquicos (lecciones y módulos).', style: theme.textTheme.bodyMedium),
				]),
			),
		);
	}

	Widget _buildSnippet() {
		const snippet = '''
// Componente base
abstract class Component { String get name; void display(int depth); }

// Hoja
class Leaf implements Component { /* ... */ }

// Compuesto
class CompositeNode implements Component {
	final List<Component> children = [];
	void add(Component c) => children.add(c);
	void display(int depth) { for (var c in children) c.display(depth+1); }
}
''';

		return Container(
			padding: const EdgeInsets.all(12),
			decoration: BoxDecoration(color: const Color(0xFF0B1221), borderRadius: BorderRadius.circular(10)),
			child: SelectableText(snippet, style: const TextStyle(fontFamily: 'monospace', fontSize: 12, color: Colors.white70)),
		);
	}

	Widget _buildTreeView(Component node, [int depth = 0]) {
		final indent = depth * 12.0;
		final tile = ListTile(
			dense: true,
			leading: Icon(node is CompositeNode ? Icons.folder : Icons.insert_drive_file),
			title: Text(node.name),
			subtitle: Text(node is CompositeNode ? 'Composite' : 'Leaf'),
			contentPadding: EdgeInsets.only(left: indent + 8, right: 8),
		);

		if (node is CompositeNode) {
			return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
				tile,
				Padding(
					padding: const EdgeInsets.only(left: 8),
					child: Column(children: node.children.map((c) => _buildTreeView(c, depth + 1)).toList()),
				)
			]);
		} else {
			return tile;
		}
	}
}

// --- Modelo simple incluido para la demostración ---

abstract class Component {
	// contador incremental para asegurar ids únicos
	static int _idCounter = 0;
	final int id;
	final String name;
	Component(this.name) : id = ++_idCounter;
}

class Leaf extends Component {
	Leaf(String name) : super(name);
}

class CompositeNode extends Component {
	final List<Component> children = [];
	CompositeNode(String name) : super(name);
	void add(Component c) => children.add(c);
}


