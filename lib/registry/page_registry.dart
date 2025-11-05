import 'package:composite_menu_app/screens/pages/default_course_page.dart';
import 'package:composite_menu_app/screens/pages/factory_method_page.dart';
import 'package:flutter/material.dart';
import '../models/course/course_component.dart';

typedef PageBuilder = Widget Function(CourseComponent component);

class PageRegistry {
  static final Map<String, PageBuilder> _pages = {
    "Factory Method": (_) => const FactoryMethodPage(),
    //"Composite Pattern": (_) => const CompositePatternPage(),
    //"Abstract Pattern": (_) => const AbstractPatternPage(),
  };

  static Widget getPageFor(CourseComponent component) {
    final builder = _pages[component.name];
    if (builder != null) {
      return builder(component);
    }
    return DefaultCoursePage(courseComponent: component);
  }
}
