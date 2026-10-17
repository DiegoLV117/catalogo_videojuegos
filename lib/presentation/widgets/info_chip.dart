import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  final String texto;
  final IconData? icono;

  const InfoChip({super.key, required this.texto, this.icono});

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: colores.secondaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icono != null) ...[
            Icon(icono, size: 14, color: colores.onSecondaryContainer),
            const SizedBox(width: 4),
          ],
          Text(
            texto,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: colores.onSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
