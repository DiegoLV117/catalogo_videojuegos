import 'package:flutter/material.dart';

class AppColors {
  static const primario = Color(0xFF3E6A8A); // azul acero
  static const secundario = Color(0xFF8FA7C4);
  static const fondo = Color(0xFFF5F7FA);
  static const superficie = Colors.white;
  static const texto = Color(0xFF1F2937);
  static const textoSuave = Color(0xFF6B7280);
}

class AppTheme {
  static ThemeData get claro {
    final esquema = ColorScheme.fromSeed(
      seedColor: AppColors.primario,
      primary: AppColors.primario,
      secondary: AppColors.secundario,
      surface: AppColors.superficie,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: esquema,
      scaffoldBackgroundColor: AppColors.fondo,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.fondo,
        foregroundColor: AppColors.texto,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.texto,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.superficie,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.texto,
        ),
        bodyMedium: TextStyle(color: AppColors.texto, height: 1.4),
        bodySmall: TextStyle(color: AppColors.textoSuave),
      ),
    );
  }
}
