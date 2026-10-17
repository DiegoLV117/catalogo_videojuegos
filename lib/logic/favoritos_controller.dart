import 'package:flutter/foundation.dart';

import '../data/models/videojuego_model.dart';

/// Guarda los videojuegos favoritos y avisa a la UI cuando cambian.
class FavoritosController extends ChangeNotifier {
  FavoritosController._();
  static final FavoritosController instancia = FavoritosController._();

  final List<Videojuego> _favoritos = [];

  List<Videojuego> get favoritos => List.unmodifiable(_favoritos);
  int get total => _favoritos.length;

  bool esFavorito(Videojuego juego) =>
      _favoritos.any((favorito) => favorito.id == juego.id);

  void alternar(Videojuego juego) {
    if (esFavorito(juego)) {
      _favoritos.removeWhere((favorito) => favorito.id == juego.id);
    } else {
      _favoritos.add(juego);
    }
    notifyListeners(); // las pantallas que escuchan se redibujan
  }
}
