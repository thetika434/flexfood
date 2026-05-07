import 'package:flutter/material.dart';
import 'constantes/couleurs.dart';
import 'donnees_fictives/etudiants_fictifs.dart';
import 'donnees_fictives/transactions_fictives.dart';
import 'ecrans/confirmations/page_confirmation_rechargement.dart';
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
      title: 'FlexFood — David',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Couleurs.vertPrincipal),
        scaffoldBackgroundColor: Couleurs.fondPrincipal,
        useMaterial3: true,
      ),
      routes: Routes.obtenirRoutes(),

      // ── DAVID : décommente l'écran que tu veux tester ─────
      //
      // Page Historique (par défaut) :
      initialRoute: Routes.historique,
      //
      // Page Confirmation Rechargement → commente initialRoute et décommente home:
      // home: PageConfirmationRechargement(transaction: TransactionsFictives.transactions[2]),
      //
      // ──────────────────────────────────────────────────────
    );
  }
}
