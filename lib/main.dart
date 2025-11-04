import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(const CompositeApp());

class CompositeApp extends StatelessWidget {
  const CompositeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Composite Example',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.deepPurple,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color.fromARGB(255, 90, 119, 188),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
