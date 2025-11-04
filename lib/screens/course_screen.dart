import 'package:flutter/material.dart';
import '../utils/sample_data.dart';
import '../widgets/course_widget.dart';
import '../models/course/course.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Course course = SampleData.buildSampleCourse();

    return Scaffold(
      appBar: AppBar(
        title: Text(course.name),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
        ],
      ),
      body: Column(
        children: [
          // header image/banner
          Container(
            width: double.infinity,
            height: 160,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: const LinearGradient(colors: [Color(0xFF0F172A), Color(0xFF1E293B)]),
              image: const DecorationImage(
                image: AssetImage('assets/images/course_header.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Color(0x77000000), BlendMode.darken),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(course.name, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 6),
                  Text('Aprende patrones y mejores prácticas', style: TextStyle(color: Colors.white.withOpacity(0.9))),
                ],
              ),
            ),
          ),

          // content
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              children: [CourseWidget(component: course)],
            ),
          ),
        ],
      ),
    );
  }
}
