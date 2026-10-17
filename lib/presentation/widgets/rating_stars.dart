import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double calificacion; // escala de 0 a 10
  final double tamano;

  const RatingStars({super.key, required this.calificacion, this.tamano = 16});

  IconData _iconoPara(int indice) {
    final valor = calificacion / 2; // convierte a escala de 5 estrellas
    if (valor >= indice + 1) return Icons.star_rounded;
    if (valor >= indice + 0.5) return Icons.star_half_rounded;
    return Icons.star_outline_rounded;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < 5; i++)
          Icon(_iconoPara(i), size: tamano, color: const Color(0xFFE0A526)),
        const SizedBox(width: 4),
        Text(
          calificacion.toStringAsFixed(1),
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
