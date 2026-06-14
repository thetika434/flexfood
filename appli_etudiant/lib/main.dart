import 'dart:convert';
import 'package:flutter/material.dart';
import 'composants/banniere_notification.dart';
import 'constantes/couleurs.dart';
import 'modeles/etudiant.dart';
import 'navigation/routeur.dart';
import 'services/service_authentification.dart';
import 'services/service_stockage_local.dart';
import 'services/service_websocket.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final matricule = await ServiceStockageLocal.recupererMatricule();
  final token = await ServiceStockageLocal.recupererToken();
  String routeInitiale = Routes.choisirRole;

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

  ServiceWebSocket.onNotification((titre, message) {
    BanniereNotification.afficher(titre, message);
  });

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
      builder: (context, child) => BanniereNotification(
        key: BanniereNotification.cle,
        enfant: child!,
      ),
    );
  }
}
