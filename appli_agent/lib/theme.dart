import 'package:flutter/material.dart';

class AppColors {
  static const Color primary     = Color(0xFF1B5E20);
  static const Color primaryDark = Color(0xFF003300);
  static const Color secondary   = Color(0xFF00C853);
  static const Color tertiary    = Color(0xFFB9F6CA);
  static const Color neutral     = Color(0xFF9E9E9E);
  static const Color neutralDark = Color(0xFF424242);
  static const Color background  = Color(0xFFF9FBF9);
  static const Color surface     = Color(0xFFFFFFFF);
  static const Color surfaceVar  = Color(0xFFF1F8F1);
  static const Color onPrimary   = Colors.white;
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textMuted   = Color(0xFF757575);
  static const Color border      = Color(0xFFE0E0E0);
  static const Color success     = Color(0xFF00C853);
  static const Color successBg   = Color(0xFFE8F5E9);
  static const Color error       = Color(0xFFD32F2F);
  static const Color errorBg     = Color(0xFFFFEBEE);
  static const Color warning     = Color(0xFFF57C00);
  static const Color warningBg   = Color(0xFFFFF3E0);
}

class AppTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.surface,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.onPrimary,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: AppColors.onPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: AppColors.onPrimary),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary, width: 1.5),
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceVar,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      labelStyle: const TextStyle(color: AppColors.textMuted),
      hintStyle: const TextStyle(color: AppColors.neutral),
      prefixIconColor: AppColors.neutral,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.neutral,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),
    dividerTheme: const DividerThemeData(color: AppColors.border, space: 1),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.surfaceVar,
      selectedColor: AppColors.primary,
      labelStyle: const TextStyle(fontSize: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}

class Creneaux {
  static const List<Map<String, dynamic>> liste = [
    {
      'nom': 'Petit-déjeuner', 'emoji': '🌅',
      'debut': '6h30', 'fin': '7h30', 'prix': 100,
      'debutH': 6, 'debutM': 30, 'finH': 7, 'finM': 30,
    },
    {
      'nom': 'Déjeuner', 'emoji': '☀️',
      'debut': '11h30', 'fin': '13h45', 'prix': 200,
      'debutH': 11, 'debutM': 30, 'finH': 13, 'finM': 45,
    },
    {
      'nom': 'Dîner', 'emoji': '🌙',
      'debut': '17h30', 'fin': '20h00', 'prix': 200,
      'debutH': 17, 'debutM': 30, 'finH': 20, 'finM': 00,
    },
  ];

  static Map<String, dynamic>? getActif() {
    final now  = DateTime.now();
    final mins = now.hour * 60 + now.minute;
    for (final c in liste) {
      final debut = (c['debutH'] as int) * 60 + (c['debutM'] as int);
      final fin   = (c['finH']   as int) * 60 + (c['finM']   as int);
      if (mins >= debut && mins <= fin) return c;
    }
    return null;
  }
}