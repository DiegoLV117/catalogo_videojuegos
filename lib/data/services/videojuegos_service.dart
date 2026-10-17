import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../models/videojuego_model.dart';

class VideojuegosService {
  static const String _rutaJson = 'assets/data/videojuegos.json';

  static Future<List<Videojuego>> cargarVideojuegos() async {
    final String contenido = await rootBundle.loadString(_rutaJson);
    final List<dynamic> datos = json.decode(contenido) as List<dynamic>;
    return datos
        .map((item) => Videojuego.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
