import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String titulo;
  final IconData? icono;

  const SectionTitle({super.key, required this.titulo, this.icono});

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Row(
        children: [
          if (icono != null) ...[
            Icon(icono, size: 20, color: colores.primary),
            const SizedBox(width: 8),
          ],
          Text(
            titulo,
            style: Theme.of(context).textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
