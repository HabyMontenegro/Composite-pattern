import 'package:flutter/material.dart';
import '../utils/sample_data.dart';
import '../widgets/navigation_widget.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final root = SampleData.buildSampleMenu();

    return Scaffold(
      appBar: AppBar(title: const Text('Menú jerárquico')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: ListView(
          children: [NavigationWidget(component: root)],
        ),
      ),
    );
  }
}
