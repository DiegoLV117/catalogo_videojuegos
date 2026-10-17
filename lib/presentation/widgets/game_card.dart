import 'package:flutter/material.dart';

import '../../data/models/videojuego_model.dart';
import 'info_chip.dart';
import 'network_image_box.dart';
import 'rating_stars.dart';

class GameCard extends StatelessWidget {
  final Videojuego juego;
  final VoidCallback onTap;

  const GameCard({super.key, required this.juego, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final texto = Theme.of(context).textTheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NetworkImageBox(url: juego.imagenUrl, alto: 170),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    juego.titulo,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: texto.titleMedium,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${juego.desarrollador} · ${juego.anio}',
                    style: texto.bodySmall,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: [
                            InfoChip(
                              texto: juego.genero,
                              icono: Icons.category_outlined,
                            ),
                            InfoChip(
                              texto: juego.ficha.clasificacion,
                              icono: Icons.verified_user_outlined,
                            ),
                          ],
                        ),
                      ),
                      RatingStars(calificacion: juego.calificacion),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
