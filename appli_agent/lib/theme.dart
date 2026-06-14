import 'package:flutter/material.dart';

class AppColors {
  // Couleurs exactes de l'app étudiant
  static const Color primary      = Color(0xFF024618);
  static const Color primaryLight = Color(0xFF006E2A);
  static const Color vertCarte    = Color(0xFF3EC45A);

  static const Color background   = Color(0xFFFAF9F6);
  static const Color surface      = Color(0xFFFFFFFF);
  static const Color surfaceVar   = Color(0xFFF0F4F0);
  static const Color border       = Color(0xFFE8E8E5);

  static const Color textPrimary  = Color(0xFF1A1C1A);
  static const Color textMuted    = Color(0xFF41493F);
  static const Color neutral      = Color(0xFF41493F);

  static const Color success      = Color(0xFF00A651);
  static const Color successBg    = Color(0xFFB1F2B2);
  static const Color error        = Color(0xFFD32F2F);
  static const Color errorBg      = Color(0xFFFFEBEE);

  static const Color onPrimary    = Colors.white;
}

class AppTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      surface: AppColors.surface,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surface,
      foregroundColor: AppColors.primary,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: AppColors.primary,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      iconTheme: IconThemeData(color: AppColors.primary),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary, width: 1.5),
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Color(0xFF8A9187),
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      selectedLabelStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontSize: 11),
    ),
    dividerTheme: const DividerThemeData(color: AppColors.border, space: 1),
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.border),
      ),
    ),
  );
}

class Creneaux {
  static const List<Map<String, dynamic>> liste = [
    {
      'nom': 'Petit-déjeuner',
      'debut': '5h00', 'fin': '8h00', 'prix': 100,
      'debutH': 5, 'debutM': 0, 'finH': 8, 'finM': 0,
    },
    {
      'nom': 'Déjeuner',
      'debut': '11h30', 'fin': '14h00', 'prix': 200,
      'debutH': 11, 'debutM': 30, 'finH': 14, 'finM': 0,
    },
    {
      'nom': 'Dîner',
      'debut': '17h30', 'fin': '20h00', 'prix': 200,
      'debutH': 17, 'debutM': 30, 'finH': 20, 'finM': 0,
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
