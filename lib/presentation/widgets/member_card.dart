import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  final String nombre;
  final String rol;
  final String usuarioGithub;

  const MemberCard({
    super.key,
    required this.nombre,
    required this.rol,
    required this.usuarioGithub,
  });

  String get _iniciales => nombre
      .trim()
      .split(' ')
      .where((parte) => parte.isNotEmpty)
      .take(2)
      .map((parte) => parte[0].toUpperCase())
      .join();

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;

    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        leading: CircleAvatar(
          backgroundColor: colores.primaryContainer,
          foregroundColor: colores.onPrimaryContainer,
          child: Text(_iniciales),
        ),
        title: Text(nombre),
        subtitle: Text('$rol · @$usuarioGithub'),
      ),
    );
  }
}
