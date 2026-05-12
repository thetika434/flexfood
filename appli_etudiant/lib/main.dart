import 'package:flutter/material.dart';
import 'constantes/couleurs.dart';
import 'donnees_fictives/etudiants_fictifs.dart';
import 'navigation/routeur.dart';
import 'services/service_authentification.dart';

void main() {
  Session.etudiantConnecte = EtudiantsFictifs.moi;
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
      initialRoute: Routes.choisirModeTransfert,
      routes: Routes.obtenirRoutes(),
    );
  }
}
