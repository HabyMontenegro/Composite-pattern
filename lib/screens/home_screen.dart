import 'package:flutter/material.dart';
import '../screens/course_screen.dart';
import '../screens/navigation_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildHeroCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
    required List<Color> gradient,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: gradient, begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 18, offset: const Offset(0, 8)),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Row(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.14),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 32, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800)),
                      const SizedBox(height: 6),
                      Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final padding = width > 900 ? 36.0 : (width > 600 ? 24.0 : 16.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('EduNova — Demos de Composite'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.onBackground,
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            // Darkened a bit from the original very pale gradient
            colors: [Color(0xFFCFDCE6), Color(0xFFBFC9D6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8),
                Text('Bienvenido a EduNova', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800, color: Colors.black87)),
                const SizedBox(height: 6),
                Text('Explora ejemplos del patrón Composite aplicados a cursos y menús', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black87)),
                const SizedBox(height: 18),

                // Search bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 12, offset: const Offset(0,6))],
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.black54),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration.collapsed(hintText: 'Buscar cursos, lecciones o secciones...'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Filtrar'),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                // Hero cards (responsive)
                LayoutBuilder(builder: (ctx, constraints) {
                  final useRow = constraints.maxWidth > 700;
                  if (useRow) {
                    return Row(
                      children: [
                        Expanded(
                          child: _buildHeroCard(
                            title: 'Explorar cursos',
                            subtitle: 'Estructura modular: Curso → Módulo → Lección',
                            icon: Icons.school,
                            gradient: const [Color(0xFF2196F3), Color(0xFF00BCD4)],
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CourseScreen())),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildHeroCard(
                            title: 'Menú de navegación',
                            subtitle: 'Construcción dinámica del menú desde un árbol',
                            icon: Icons.menu_book,
                            gradient: const [Color(0xFF7B1FA2), Color(0xFF512DA8)],
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NavigationScreen())),
                          ),
                        ),
                      ],
                    );
                  }

                  return Column(
                    children: [
                      _buildHeroCard(
                        title: 'Explorar cursos',
                        subtitle: 'Estructura modular: Curso → Módulo → Lección',
                        icon: Icons.school,
                        gradient: const [Color(0xFF2196F3), Color(0xFF00BCD4)],
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CourseScreen())),
                      ),
                      const SizedBox(height: 12),
                      _buildHeroCard(
                        title: 'Menú de navegación',
                        subtitle: 'Construcción dinámica del menú desde un árbol',
                        icon: Icons.menu_book,
                        gradient: const [Color(0xFF7B1FA2), Color(0xFF512DA8)],
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NavigationScreen())),
                      ),
                    ],
                  );
                }),

                const SizedBox(height: 22),
                // Descripción: tarjeta con fondo sutil complementario
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFF5F8FB)]),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 12, offset: const Offset(0,6))],
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Descripción', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black87)),
                        SizedBox(height: 8),
                        Text('Esta app demuestra dos maneras de aplicar Composite: estructura de contenido y menú dinámico.', style: TextStyle(color: Colors.black87)),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // Previews removed as requested. Keep spacing consistent.
                const SizedBox(height: 8),

                const SizedBox(height: 28),
                Center(child: Text('Hecho con ❤️ — EduNova', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black54))),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
