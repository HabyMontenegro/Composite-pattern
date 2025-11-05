import 'dart:math';
import 'package:flutter/material.dart';

/// Página didáctica para explicar y mostrar el patrón Observer.
class ObserverPatternPage extends StatefulWidget {
	const ObserverPatternPage({super.key});

	@override
	State<ObserverPatternPage> createState() => _ObserverPatternPageState();
}

class _ObserverPatternPageState extends State<ObserverPatternPage> {
	final TextEditingController _observerName = TextEditingController();
	final ConcreteSubject _subject = ConcreteSubject();

	@override
	void initState() {
		super.initState();
		// inicial: un observer de ejemplo
		_subject.attach(ConcreteObserver('Observer 1'));
	}

	@override
	void dispose() {
		_observerName.dispose();
		super.dispose();
	}

	void _addObserver() {
		final name = _observerName.text.trim();
		if (name.isEmpty) return;
		setState(() {
			_subject.attach(ConcreteObserver(name));
			_observerName.clear();
		});
	}

	void _removeObserver(Observer obs) {
		setState(() => _subject.detach(obs));
	}

	void _changeSubjectState() {
		// ejemplo: generar un número aleatorio como nuevo estado
		final value = Random().nextInt(1000);
		setState(() => _subject.setState('Nuevo valor: $value'));
	}

	@override
	Widget build(BuildContext context) {
		final theme = Theme.of(context);
		return Scaffold(
			appBar: AppBar(title: const Text('Observer Pattern — Demo')),
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
										Text('Estado actual del Subject: ${_subject.state ?? "(vacío)"}'),
										const SizedBox(height: 8),
										Row(children: [
											ElevatedButton.icon(onPressed: _changeSubjectState, icon: const Icon(Icons.change_circle), label: const Text('Cambiar estado')),
											const SizedBox(width: 12),
											ElevatedButton.icon(onPressed: () => setState(() => _subject.notify()), icon: const Icon(Icons.notifications), label: const Text('Notificar')),
										]),
										const Divider(height: 18),
										Row(children: [
											Expanded(
												child: TextField(controller: _observerName, decoration: const InputDecoration(labelText: 'Nombre del observer')),
											),
											const SizedBox(width: 8),
											ElevatedButton(onPressed: _addObserver, child: const Text('Agregar'))
										]),
										const SizedBox(height: 12),
										Text('Observers (${_subject.observers.length})', style: theme.textTheme.titleSmall),
										const SizedBox(height: 8),
										..._subject.observers.map((o) => Card(
													child: ListTile(
														title: Text(o.name),
														subtitle: Text('Última notificación: ${(o as ConcreteObserver).lastReceived ?? "(ninguna)"}'),
														trailing: IconButton(icon: const Icon(Icons.delete), onPressed: () => _removeObserver(o)),
													),
												))
									],
								),
							),
						),
						const SizedBox(height: 12),
						Text('Notas para la presentación', style: theme.textTheme.titleSmall),
						const SizedBox(height: 6),
						Text('- Subject mantiene lista de observers y les notifica cuando cambia su estado.', style: theme.textTheme.bodySmall),
						Text('- Observers reaccionan al cambio sin que el Subject conozca su implementación concreta.', style: theme.textTheme.bodySmall),
					],
				),
			),
		);
	}

	Widget _buildHeader(ThemeData theme) {
		return Container(
			padding: const EdgeInsets.all(14),
			decoration: BoxDecoration(
				gradient: const LinearGradient(colors: [Color(0xFFD47AE2), Color(0xFF6C63FF)]),
				borderRadius: BorderRadius.circular(10),
				boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 8)],
			),
			child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
				Text('Observer Pattern', style: theme.textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
				const SizedBox(height: 6),
				Text('Permite que varios objetos se suscriban para recibir actualizaciones de otro objeto (subject).', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white70)),
			]),
		);
	}

	Widget _buildDescription(ThemeData theme) {
		return Card(
			child: Padding(
				padding: const EdgeInsets.all(12),
				child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
					Text('¿Qué resuelve?', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
					const SizedBox(height: 8),
					Text('• Desacopla el emisor de eventos (subject) de los receptores (observers).', style: theme.textTheme.bodyMedium),
					const SizedBox(height: 6),
					Text('• Facilita notificaciones y reacciones en tiempo real en la aplicación.', style: theme.textTheme.bodyMedium),
				]),
			),
		);
	}

	Widget _buildSnippet() {
		const snippet = '''
// Interfaz Observer
abstract class Observer { String get name; void update(String? state); }

// Interfaz Subject
abstract class Subject { void attach(Observer o); void detach(Observer o); void notify(); }
''';

		return Container(
			padding: const EdgeInsets.all(12),
			decoration: BoxDecoration(color: const Color(0xFF0B1221), borderRadius: BorderRadius.circular(10)),
			child: SelectableText(snippet, style: const TextStyle(fontFamily: 'monospace', fontSize: 12, color: Colors.white70)),
		);
	}
}

// --- Implementación simple para demo (Subject/Observer) ---
abstract class Observer {
	String get name;
	void update(String? state);
}

abstract class Subject {
	void attach(Observer o);
	void detach(Observer o);
	void notify();
}

class ConcreteSubject implements Subject {
	final List<Observer> _observers = [];
	String? state;

	List<Observer> get observers => List.unmodifiable(_observers);

	@override
	void attach(Observer o) => _observers.add(o);

	@override
	void detach(Observer o) => _observers.remove(o);

	@override
	void notify() {
		for (var o in List.of(_observers)) {
			o.update(state);
		}
	}

	void setState(String s) {
		state = s;
		notify();
	}
}

class ConcreteObserver implements Observer {
	@override
	final String name;
	String? lastReceived;
	ConcreteObserver(this.name);

	@override
	void update(String? state) {
		lastReceived = state;
	}
}

