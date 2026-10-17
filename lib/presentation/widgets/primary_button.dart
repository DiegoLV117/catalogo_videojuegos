import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final IconData? icono;
  final bool expandido;

  const PrimaryButton({
    super.key,
    required this.texto,
    required this.onPressed,
    this.icono,
    this.expandido = false,
  });

  @override
  Widget build(BuildContext context) {
    final estilo = FilledButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );

    final boton = icono == null
        ? FilledButton(onPressed: onPressed, style: estilo, child: Text(texto))
        : FilledButton.icon(
            onPressed: onPressed,
            style: estilo,
            icon: Icon(icono),
            label: Text(texto),
          );

    return SizedBox(width: expandido ? double.infinity : null, child: boton);
  }
}
