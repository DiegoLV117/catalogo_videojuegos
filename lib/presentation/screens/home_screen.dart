import 'package:flutter/material.dart';

import '../../data/models/videojuego_model.dart';
import '../../data/services/videojuegos_service.dart';
import '../widgets/game_card.dart';
import '../widgets/search_field.dart';
import 'detalle_screen.dart';
import '../../logic/favoritos_controller.dart';
import 'equipo_screen.dart';
import 'favoritos_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Videojuego> _todos = [];
  List<Videojuego> _filtrados = [];
  bool _cargando = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _cargar();
  }

  Future<void> _cargar() async {
    try {
      final juegos = await VideojuegosService.cargarVideojuegos();
      if (!mounted) return;
      setState(() {
        _todos = juegos;
        _filtrados = juegos;
        _cargando = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = 'No se pudo cargar el catálogo';
        _cargando = false;
      });
    }
  }

  String _normalizar(String texto) {
    const conAcento = 'áéíóúüñ';
    const sinAcento = 'aeiouun';
    var resultado = texto.toLowerCase().trim();
    for (var i = 0; i < conAcento.length; i++) {
      resultado = resultado.replaceAll(conAcento[i], sinAcento[i]);
    }
    return resultado;
  }

  void _buscar(String texto) {
    final consulta = _normalizar(texto);
    setState(() {
      _filtrados = _todos.where((juego) {
        return _normalizar(juego.titulo).contains(consulta) ||
            _normalizar(juego.genero).contains(consulta) ||
            _normalizar(juego.desarrollador).contains(consulta);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Videojuegos'),
        actions: [
          ListenableBuilder(
            listenable: FavoritosController.instancia,
            builder: (context, _) {
              final total = FavoritosController.instancia.total;
              return IconButton(
                tooltip: 'Favoritos',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FavoritosScreen()),
                ),
                icon: Badge(
                  isLabelVisible: total > 0,
                  label: Text('$total'),
                  child: const Icon(Icons.favorite_border_rounded),
                ),
              );
            },
          ),
          IconButton(
            tooltip: 'Equipo',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const EquipoScreen()),
            ),
            icon: const Icon(Icons.groups_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: SearchField(
              hint: 'Buscar por título, género o estudio',
              onChanged: _buscar,
            ),
          ),
          Expanded(child: _contenido()),
        ],
      ),
    );
  }

  Widget _contenido() {
    if (_cargando) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(child: Text(_error!));
    }
    if (_filtrados.isEmpty) {
      return const Center(child: Text('No se encontraron videojuegos'));
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      itemCount: _filtrados.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final juego = _filtrados[index];
        return GameCard(
          juego: juego,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => DetalleScreen(juego: juego)),
          ),
        );
      },
    );
  }
}
