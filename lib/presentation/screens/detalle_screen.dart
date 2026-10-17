import 'package:flutter/material.dart';

import '../../data/models/videojuego_model.dart';
import '../../logic/favoritos_controller.dart';
import '../widgets/favorite_button.dart';
import '../widgets/info_chip.dart';
import '../widgets/network_image_box.dart';
import '../widgets/primary_button.dart';
import '../widgets/rating_stars.dart';
import '../widgets/section_title.dart';

class DetalleScreen extends StatelessWidget {
  final Videojuego juego;

  const DetalleScreen({super.key, required this.juego});

  @override
  Widget build(BuildContext context) {
    final texto = Theme.of(context).textTheme;
    final controlador = FavoritosController.instancia;

    return Scaffold(
      appBar: AppBar(title: Text(juego.titulo)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          NetworkImageBox(
            url: juego.imagenUrl,
            alto: 220,
            radio: BorderRadius.circular(16),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(juego.titulo, style: texto.headlineSmall),
                    const SizedBox(height: 4),
                    Text(
                      '${juego.desarrollador} · ${juego.anio}',
                      style: texto.bodySmall,
                    ),
                  ],
                ),
              ),
              ListenableBuilder(
                listenable: controlador,
                builder: (context, _) => FavoriteButton(
                  esFavorito: controlador.esFavorito(juego),
                  onPressed: () {
                    controlador.alternar(juego);
                    final agregado = controlador.esFavorito(juego);
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Text(
                            agregado
                                ? 'Agregado a favoritos'
                                : 'Eliminado de favoritos',
                          ),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          RatingStars(calificacion: juego.calificacion, tamano: 20),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              InfoChip(texto: juego.genero, icono: Icons.category_outlined),
              InfoChip(
                texto: juego.ficha.clasificacion,
                icono: Icons.verified_user_outlined,
              ),
              InfoChip(
                texto: '${juego.ficha.duracionHoras} h aprox.',
                icono: Icons.schedule_outlined,
              ),
            ],
          ),
          const SectionTitle(
            titulo: 'Descripción',
            icono: Icons.description_outlined,
          ),
          Text(juego.descripcion, style: texto.bodyMedium),
          const SectionTitle(
            titulo: 'Plataformas',
            icono: Icons.devices_other_outlined,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: juego.plataformas
                .map(
                  (p) =>
                      InfoChip(texto: p, icono: Icons.videogame_asset_outlined),
                )
                .toList(),
          ),
          const SectionTitle(
            titulo: 'Modos de juego',
            icono: Icons.people_outline,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: juego.ficha.modos
                .map((m) => InfoChip(texto: m, icono: Icons.person_outline))
                .toList(),
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            texto: 'Regresar al catálogo',
            icono: Icons.arrow_back_rounded,
            expandido: true,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
