import 'package:flutter/material.dart';

class FactoryMethodPage extends StatelessWidget {
  const FactoryMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Factory Method')),
      body: const Center(
        child: Text('Contenido del patrón Factory Method.'),
      ),
    );
  }
}
