import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../widgets/member_card.dart';
import '../widgets/primary_button.dart';
import '../widgets/section_title.dart';

class EquipoScreen extends StatelessWidget {
  const EquipoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;
    final texto = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Equipo')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Icon(Icons.sports_esports_rounded, size: 64, color: colores.primary),
          const SizedBox(height: 12),
          Text(
            AppStrings.nombreApp,
            textAlign: TextAlign.center,
            style: texto.headlineSmall,
          ),
          const SizedBox(height: 4),
          Text(
            AppStrings.materia,
            textAlign: TextAlign.center,
            style: texto.bodySmall,
          ),
          const SectionTitle(
            titulo: 'Integrantes',
            icono: Icons.group_outlined,
          ),
          const MemberCard(
            nombre: 'Diego Adair Nicolás Mendoza',
            rol: 'Desarrollador',
            usuarioGithub: 'DiegoAdairNicolasMendoza',
          ),
          const MemberCard(
            nombre: 'Diego Ernesto López Vásquez',
            rol: 'Desarrollador',
            usuarioGithub: 'DiegoLV117',
          ),
          const SectionTitle(
            titulo: 'Acerca de la app',
            icono: Icons.info_outline,
          ),
          Text(AppStrings.descripcion, style: texto.bodyMedium),
          const SizedBox(height: 4),
          Text(AppStrings.unidad, style: texto.bodySmall),
          const SizedBox(height: 24),
          PrimaryButton(
            texto: 'Regresar',
            icono: Icons.arrow_back_rounded,
            expandido: true,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
