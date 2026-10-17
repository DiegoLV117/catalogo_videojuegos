import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool esFavorito;
  final VoidCallback onPressed;
  final double tamano;

  const FavoriteButton({
    super.key,
    required this.esFavorito,
    required this.onPressed,
    this.tamano = 26,
  });

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;

    return IconButton.filledTonal(
      onPressed: onPressed,
      tooltip: esFavorito ? 'Quitar de favoritos' : 'Agregar a favoritos',
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (child, animacion) =>
            ScaleTransition(scale: animacion, child: child),
        child: Icon(
          esFavorito ? Icons.favorite_rounded : Icons.favorite_border_rounded,
          key: ValueKey(esFavorito),
          size: tamano,
          color: esFavorito
              ? const Color(0xFFE57373)
              : colores.onSurfaceVariant,
        ),
      ),
    );
  }
}
