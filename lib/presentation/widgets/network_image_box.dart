import 'package:flutter/material.dart';

class NetworkImageBox extends StatelessWidget {
  final String url;
  final double alto;
  final BorderRadius radio;

  const NetworkImageBox({
    super.key,
    required this.url,
    this.alto = 180,
    this.radio = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;

    Widget marcador(Widget hijo) => Container(
      height: alto,
      width: double.infinity,
      color: colores.surfaceContainerHighest,
      alignment: Alignment.center,
      child: hijo,
    );

    return ClipRRect(
      borderRadius: radio,
      child: Image.network(
        url,
        height: alto,
        width: double.infinity,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progreso) => progreso == null
            ? child
            : marcador(
                const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
        errorBuilder: (context, error, stackTrace) => marcador(
          Icon(
            Icons.sports_esports_outlined,
            size: 48,
            color: colores.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
