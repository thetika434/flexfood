// ============================================================
// FICHIER DE DÉVELOPPEMENT — NE PAS UTILISER EN PRODUCTION
// ============================================================
// Ce fichier permet à chaque développeur de lancer directement
// son écran sans passer par la connexion.
//
// PROCÉDURE :
//   1. Décommente le bloc qui correspond à TON écran
//   2. Lance avec : flutter run -t lib/main_dev.dart
//   3. Quand tu partages ton travail, remets les commentaires
// ============================================================

import 'package:flutter/material.dart';
import 'constantes/couleurs.dart';
import 'donnees_fictives/etudiants_fictifs.dart';
// import 'donnees_fictives/transactions_fictives.dart'; // décommente si tu utilises TransactionsFictives
import 'navigation/routeur.dart';
import 'services/service_authentification.dart';

// ── Importe TON écran ici ──────────────────────────────────

// BIGO — décommente ce dont tu as besoin :
// import 'ecrans/parametres/page_changer_code_secret.dart';
// import 'ecrans/confirmations/page_confirmation_rechargement.dart';

// DAVID — décommente ce dont tu as besoin :
// import 'ecrans/historique/page_historique.dart';
// import 'ecrans/historique/page_detail_repas.dart';

// NABO — décommente ce dont tu as besoin :
// import 'ecrans/transfert/page_choisir_mode_transfert.dart';
// import 'ecrans/transfert/page_saisir_matricule.dart';
import 'ecrans/transfert/page_scanner_qr.dart';

// MOÏSE — décommente ce dont tu as besoin :
// import 'ecrans/transfert/page_montant_transfert.dart';
// import 'ecrans/confirmations/page_confirmation_transfert_envoye.dart';
// import 'ecrans/confirmations/page_confirmation_transfert_recu.dart';

// ──────────────────────────────────────────────────────────

void main() {
  // Simule un étudiant connecté pour que les écrans aient accès aux données
  Session.etudiantConnecte = EtudiantsFictifs.moi;

  runApp(const AppFlexFoodDev());
}

class AppFlexFoodDev extends StatelessWidget {
  const AppFlexFoodDev({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlexFood — Dev',
      debugShowCheckedModeBanner: true, // le bandeau rouge "DEBUG" reste visible
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Couleurs.vertPrincipal),
        scaffoldBackgroundColor: Couleurs.fondPrincipal,
        useMaterial3: true,
      ),
      routes: Routes.obtenirRoutes(),

      // ── Remplace "home" par TON écran ──────────────────────
      //
      // BIGO :
      //   home: const PageChangerCodeSecret(),
      //   home: PageConfirmationRechargement(transaction: TransactionsFictives.liste.first),
      //
      // DAVID :
      //   home: const PageHistorique(),
      //   home: PageDetailRepas(transaction: TransactionsFictives.liste.first),
      //
      // NABO :
      //   home: const PageChoisirModeTransfert(),
      //   home: const PageSaisirMatricule(),
      //   home: const PageScannerQR(),
      //
      // MOÏSE :
      //   home: PageMontantTransfert(etudiant: EtudiantsFictifs.tousLesEtudiants[1]),
      //   home: PageConfirmationTransfertEnvoye(transaction: TransactionsFictives.liste.first),
      //   home: PageConfirmationTransfertRecu(transaction: TransactionsFictives.liste.first),
      //
      // ─────────────────────────────────────────────────────

      home: const PageScannerQR(),
    );
  }
}

// Écran affiché si personne n'a encore choisi son écran dans ce fichier
class _EcranChoisirDeveloppeur extends StatelessWidget {
  const _EcranChoisirDeveloppeur();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Couleurs.fondPrincipal,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.developer_mode, size: 64, color: Couleurs.vertPrincipal),
              const SizedBox(height: 24),
              const Text(
                'Mode Développeur',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Couleurs.vertPrincipal,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ouvre lib/main_dev.dart\net décommente ton écran.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 32),
              _boutonNav(context, 'Aller à la connexion', Routes.connexion),
            ],
          ),
        ),
      ),
    );
  }

  Widget _boutonNav(BuildContext context, String texte, String route) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, route),
      style: ElevatedButton.styleFrom(
        backgroundColor: Couleurs.vertPrincipal,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(texte),
    );
  }
}
