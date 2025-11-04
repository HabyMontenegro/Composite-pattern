import 'package:flutter/material.dart';
import '../models/navigation/navigation_component.dart';
import '../models/navigation/navigation_group.dart';
import '../models/navigation/navigation_item.dart';

class NavigationWidget extends StatelessWidget {
  final NavigationComponent component;
  const NavigationWidget({super.key, required this.component});

  @override
  Widget build(BuildContext context) {
    if (component is NavigationGroup) {
      final group = component as NavigationGroup;

      return Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white12, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            iconColor: Colors.deepPurpleAccent,
            collapsedIconColor: Colors.deepPurpleAccent,
            leading: const Icon(Icons.folder_open, color: Colors.deepPurpleAccent),
            title: Text(
              group.label,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            childrenPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            children: group.children.map((c) => NavigationWidget(component: c)).toList(),
          ),
        ),
      );
    }

    else if (component is NavigationItem) {
      final item = component as NavigationItem;

      return AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A).withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white12),
        ),
        child: ListTile(
          leading: const Icon(Icons.play_arrow_rounded, color: Colors.white70),
          title: Text(
            item.label,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Navegar a: ${item.label}'),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.deepPurpleAccent.withOpacity(0.8),
              ),
            );
          },
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
