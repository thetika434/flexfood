import 'package:flutter/material.dart';
import 'constantes/couleurs.dart';
import 'donnees_fictives/etudiants_fictifs.dart';
import 'ecrans/transfert/page_montant_transfert.dart';
import 'navigation/routeur.dart';
import 'services/service_authentification.dart';
import 'ecrans/confirmations/page_confirmation_transfert_envoye.dart';
import 'ecrans/confirmations/page_confirmation_transfert_recu.dart';
import 'donnees_fictives/transactions_fictives.dart';

void main() {
  Session.etudiantConnecte = EtudiantsFictifs.moi;
  runApp(const AppFlexFood());
}

class AppFlexFood extends StatelessWidget {
  const AppFlexFood({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlexFood — Moïse',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Couleurs.vertPrincipal),
        scaffoldBackgroundColor: Couleurs.fondPrincipal,
        useMaterial3: true,
      ),
      routes: Routes.obtenirRoutes(),

      // ── MOÏSE : décommente l'écran que tu veux tester ─────
      //
      // Page Montant Transfert (par défaut) :
      //home:
      //    PageMontantTransfert(etudiant: EtudiantsFictifs.tousLesEtudiants[1]),
      //
      // Page Confirmation Transfert Envoyé :
      home: PageConfirmationTransfertEnvoye(
          transaction: TransactionsFictives.transactions[3]),
      //
      // Page Confirmation Transfert Reçu :
      //home: PageConfirmationTransfertRecu(
      //  transaction: TransactionsFictives.transactions[0]),
      //
      // ──────────────────────────────────────────────────────
    );
  }
}
