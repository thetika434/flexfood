import 'dart:convert';
import 'package:flutter/material.dart';
import 'constantes/couleurs.dart';
import 'modeles/etudiant.dart';
import 'navigation/routeur.dart';
import 'services/service_authentification.dart';
import 'services/service_stockage_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final matricule = await ServiceStockageLocal.recupererMatricule();
  final token = await ServiceStockageLocal.recupererToken();
  String routeInitiale = Routes.connexion;

  if (matricule != null && token != null) {
    final etudiantJson = await ServiceStockageLocal.recupererEtudiantJson();
    if (etudiantJson != null) {
      try {
        Session.etudiantConnecte =
            Etudiant.fromJson(jsonDecode(etudiantJson) as Map<String, dynamic>);
        routeInitiale = Routes.deverrouillage;
      } catch (_) {
        // JSON corrompu → retour à la connexion
      }
    }
  }

  runApp(AppFlexFood(routeInitiale: routeInitiale));
}

class AppFlexFood extends StatelessWidget {
  final String routeInitiale;

  const AppFlexFood({super.key, required this.routeInitiale});

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
      initialRoute: routeInitiale,
      routes: Routes.obtenirRoutes(),
    );
  }
}
