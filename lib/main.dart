import 'package:flutter/material.dart';

import 'presentation/screens/home_screen.dart';

void main() {
  runApp(const CatalogoApp());
}

class CatalogoApp extends StatelessWidget {
  const CatalogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Videojuegos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF5B6C8F),
      ),
      home: const HomeScreen(),
    );
  }
}
