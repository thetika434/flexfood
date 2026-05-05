import 'package:flutter/material.dart';
import 'constantes/couleurs.dart';
import 'navigation/routeur.dart';

void main() {
  runApp(const AppFlexFood());
}

class AppFlexFood extends StatelessWidget {
  const AppFlexFood({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlexFood',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Couleurs.vertPrincipal),
        scaffoldBackgroundColor: Couleurs.fondPrincipal,
        useMaterial3: true,
      ),
      initialRoute: Routes.historique,
      routes: Routes.obtenirRoutes(),
    );
  }
}
