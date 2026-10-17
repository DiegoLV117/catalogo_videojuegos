import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String mensaje;
  final String? detalle;
  final IconData icono;

  const EmptyState({
    super.key,
    required this.mensaje,
    this.detalle,
    this.icono = Icons.search_off_rounded,
  });

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;
    final texto = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icono, size: 64, color: colores.outline),
            const SizedBox(height: 16),
            Text(
              mensaje,
              textAlign: TextAlign.center,
              style: texto.titleMedium,
            ),
            if (detalle != null) ...[
              const SizedBox(height: 6),
              Text(
                detalle!,
                textAlign: TextAlign.center,
                style: texto.bodySmall,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
