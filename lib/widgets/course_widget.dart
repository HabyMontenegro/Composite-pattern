import 'package:composite_menu_app/registry/page_registry.dart';
import 'package:flutter/material.dart';
import '../models/course/course_component.dart';

class CourseWidget extends StatelessWidget {
  final CourseComponent component;
  const CourseWidget({super.key, required this.component});

  @override
  Widget build(BuildContext context) {
    // Use the uniform API: if the component has children -> composite, else -> leaf
    if (component.children.isNotEmpty) {
      return _buildGroupCard(
        title: component.name,
        children: component.children,
        context: context,
        color: Colors.indigoAccent,
      );
    }

    return _buildAnimatedItem(context, component);
  }

  Widget _buildGroupCard({
    required String title,
    required List<CourseComponent> children,
    required BuildContext context,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.15), Colors.black.withOpacity(0.4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: color,
          collapsedIconColor: color,
          leading: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color.withOpacity(0.9), color.withOpacity(0.6)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.folder, color: Colors.white),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          childrenPadding: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
          children: children.map((c) => CourseWidget(component: c)).toList(),
        ),
      ),
    );
  }

  Widget _buildAnimatedItem(BuildContext context, CourseComponent item) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, (1 - value) * 20),
            child: child,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
        decoration: BoxDecoration(
          color: const Color(0xFF20293A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white10),
        ),
        child: ListTile(
          leading: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.play_arrow_rounded,
              color: Colors.amberAccent,
            ),
          ),
          title: Text(
            item.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.white38),
          onTap: () {
            final page = PageRegistry.getPageFor(item);
            Navigator.push(context, MaterialPageRoute(builder: (_) => page));
          },
        ),
      ),
    );
  }
}
