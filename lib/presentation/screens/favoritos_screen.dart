import 'package:flutter/material.dart';

import '../../logic/favoritos_controller.dart';
import '../widgets/empty_state.dart';
import '../widgets/game_card.dart';
import 'detalle_screen.dart';

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controlador = FavoritosController.instancia;

    return Scaffold(
      appBar: AppBar(title: const Text('Mis favoritos')),
      body: ListenableBuilder(
        listenable: controlador,
        builder: (context, _) {
          final favoritos = controlador.favoritos;

          if (favoritos.isEmpty) {
            return const EmptyState(
              mensaje: 'Aún no tienes favoritos',
              detalle: 'Toca el corazón en el detalle de un juego para guardarlo aquí.',
              icono: Icons.favorite_border_rounded,
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            itemCount: favoritos.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final juego = favoritos[index];
              return GameCard(
                juego: juego,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetalleScreen(juego: juego),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
