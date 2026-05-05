// ============================================================
// DÉVELOPPEUR : Nabo
// ÉCRAN       : Page Choisir Mode Transfert
// ============================================================
// DESIGN : Voir image "choisir_mode_transfert.png"
//
// IMPORTS À AJOUTER quand tu commences :
//   import '../../constantes/couleurs.dart';
//   import '../../constantes/dimensions.dart';
//   import '../../constantes/styles_texte.dart';
//   import '../../composants/avatar_utilisateur.dart';
//   import '../../modeles/favori.dart';
//   import '../../navigation/routeur.dart';
//   import '../../services/service_transactions.dart';
//   import '../../donnees_fictives/etudiants_fictifs.dart';
//
// LOGIQUE :
//   ServiceTransactions.obtenirFavoris() → liste des favoris
//   Appui "Scanner QR"   → Navigator.pushNamed(context, Routes.scannerQR)
//   Appui "Saisir Matricule" → Navigator.pushNamed(context, Routes.saisirMatricule)
//   Appui favori → Navigator.pushNamed(context, Routes.montantTransfert, arguments: etudiant)
// ============================================================

import 'package:flutter/material.dart';

class PageChoisirModeTransfert extends StatelessWidget {
  const PageChoisirModeTransfert({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page Choisir Mode Transfert — À implémenter par Nabo'),
      ),
    );
  }
}
