import 'package:flutter/material.dart';
import '../../models/course/course_component.dart';

class DefaultCoursePage extends StatelessWidget {
  final CourseComponent courseComponent;

  const DefaultCoursePage({super.key, required this.courseComponent});

  @override
  Widget build(BuildContext context) {
    final children = courseComponent.children;

    return Scaffold(
      appBar: AppBar(
        title: Text(courseComponent.name),
        backgroundColor: Colors.indigoAccent,
      ),
      backgroundColor: const Color(0xFF1C2331),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: children.isEmpty
            ? Center(
                child: Text(
                  'Este componente no tiene subelementos.',
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              )
            : ListView.builder(
                itemCount: children.length,
                itemBuilder: (context, index) {
                  final child = children[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A3447),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white12),
                    ),
                    child: ListTile(
                      title: Text(
                        child.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Colors.white38,
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Abrir: ${child.name}'),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor:
                                Colors.indigo.withOpacity(0.9),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
