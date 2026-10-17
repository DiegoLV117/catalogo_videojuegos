class FichaTecnica {
  final String clasificacion;
  final List<String> modos;
  final int duracionHoras;

  const FichaTecnica({
    required this.clasificacion,
    required this.modos,
    required this.duracionHoras,
  });

  factory FichaTecnica.fromJson(Map<String, dynamic> json) {
    return FichaTecnica(
      clasificacion: json['clasificacion'] as String,
      modos: List<String>.from(json['modos'] as List),
      duracionHoras: json['duracionHoras'] as int,
    );
  }
}

class Videojuego {
  final int id;
  final String titulo;
  final String desarrollador;
  final int anio;
  final String genero;
  final List<String> plataformas;
  final double calificacion;
  final String imagenUrl;
  final String descripcion;
  final FichaTecnica ficha;

  const Videojuego({
    required this.id,
    required this.titulo,
    required this.desarrollador,
    required this.anio,
    required this.genero,
    required this.plataformas,
    required this.calificacion,
    required this.imagenUrl,
    required this.descripcion,
    required this.ficha,
  });

  factory Videojuego.fromJson(Map<String, dynamic> json) {
    return Videojuego(
      id: json['id'] as int,
      titulo: json['titulo'] as String,
      desarrollador: json['desarrollador'] as String,
      anio: json['anio'] as int,
      genero: json['genero'] as String,
      plataformas: List<String>.from(json['plataformas'] as List),
      calificacion: (json['calificacion'] as num).toDouble(),
      imagenUrl: json['imagenUrl'] as String,
      descripcion: json['descripcion'] as String,
      ficha: FichaTecnica.fromJson(json['ficha'] as Map<String, dynamic>),
    );
  }
}
