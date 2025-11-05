import 'package:flutter/material.dart';

/// Página didáctica que explica y demuestra el patrón Factory Method.
class FactoryMethodPage extends StatefulWidget {
  const FactoryMethodPage({super.key});

  @override
  State<FactoryMethodPage> createState() => _FactoryMethodPageState();
}

class _FactoryMethodPageState extends State<FactoryMethodPage> {
  final List<Product> _created = [];

  void _createWith(Factory factory) {
    final p = factory.createProduct();
    setState(() => _created.add(p));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Factory Method — Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(theme),
            const SizedBox(height: 16),
            _buildDescriptionCard(theme),
            const SizedBox(height: 16),
            _buildExampleSnippet(),
            const SizedBox(height: 16),
            _buildDemoControls(),
            const SizedBox(height: 12),
            _buildCreatedList(),
            const SizedBox(height: 24),
            Center(child: Text('Ejemplo simplificado para demostración en clase', style: theme.textTheme.bodySmall)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF6D5DF6), Color(0xFF3EA1DB)]),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Factory Method', style: theme.textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          Text('Crea objetos sin acoplar el código cliente a clases concretas.', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _buildDescriptionCard(ThemeData theme) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('¿Qué resuelve?', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Text('• Separa la creación de objetos de su uso (desacopla).', style: theme.textTheme.bodyMedium),
            const SizedBox(height: 4),
            Text('• Facilita añadir nuevas familias de productos sin cambiar el código cliente.', style: theme.textTheme.bodyMedium),
            const SizedBox(height: 8),
            Text('Uso típico en este repo: mostrar cómo construir distintos tipos de componentes sin depender de clases concretas.', style: theme.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleSnippet() {
    const snippet = '''
// Interfaz producto
abstract class Product { String get name; }

// Creator (factory method)
abstract class Factory { Product createProduct(); }

// Fábricas concretas
class FactoryA implements Factory { Product createProduct() => ProductA(); }
class FactoryB implements Factory { Product createProduct() => ProductB(); }

// Productos concretos
class ProductA implements Product { String get name => 'Producto A'; }
class ProductB implements Product { String get name => 'Producto B'; }
''';

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white10),
      ),
      child: SelectableText(snippet, style: const TextStyle(fontFamily: 'monospace', fontSize: 12, color: Colors.white70)),
    );
  }

  Widget _buildDemoControls() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.ac_unit),
            label: const Text('Usar Factory A'),
            onPressed: () => _createWith(FactoryA()),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.bolt),
            label: const Text('Usar Factory B'),
            onPressed: () => _createWith(FactoryB()),
          ),
        ),
      ],
    );
  }

  Widget _buildCreatedList() {
    if (_created.isEmpty) {
      return const Card(
        child: Padding(padding: EdgeInsets.all(14), child: Text('Ningún producto creado aún. Pulsa un botón para generar uno.')),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _created.reversed.map((p) => Card(
        child: ListTile(
          leading: const Icon(Icons.widgets),
          title: Text(p.name),
          subtitle: Text('Instancia de p'),
        ),
      )).toList(),
    );
  }
}

// --- Ejemplo simple (definiciones incluidas en el mismo archivo para demo) ---
abstract class Product { String get name; }

abstract class Factory { Product createProduct(); }

class FactoryA implements Factory {
  @override
  Product createProduct() => ProductA();
}

class FactoryB implements Factory {
  @override
  Product createProduct() => ProductB();
}

class ProductA implements Product {
  @override
  String get name => 'Producto A (de FactoryA)';
}

class ProductB implements Product {
  @override
  String get name => 'Producto B (de FactoryB)';
}

