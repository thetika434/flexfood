import 'package:flutter/material.dart';
import 'constantes/couleurs.dart';
import 'donnees_fictives/etudiants_fictifs.dart';
import 'donnees_fictives/transactions_fictives.dart';
import 'ecrans/confirmations/page_detail_repas.dart';
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
      title: 'FlexFood — Bigo',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Couleurs.vertPrincipal),
        scaffoldBackgroundColor: Couleurs.fondPrincipal,
        useMaterial3: true,
      ),
      routes: Routes.obtenirRoutes(),

      // ── BIGO : décommente l'écran que tu veux tester ──────
      //
      // Page Changer Code Secret (par défaut) :
      initialRoute: Routes.changerCodeSecret,
      //
      // Page Détail Repas → commente initialRoute et décommente home:
      // home: PageDetailRepas(transaction: TransactionsFictives.transactions[1]),
      //
      // ──────────────────────────────────────────────────────
    );
  }
}
