// ============================================================
// DÉVELOPPEUR : Bigo
// ÉCRAN       : Page Confirmation Rechargement
// ============================================================
// DESIGN : Voir image "confirmation_rechargement.png"
//
// IMPORTS À AJOUTER quand tu commences :
//   import '../../constantes/couleurs.dart';
//   import '../../constantes/dimensions.dart';
//   import '../../constantes/styles_texte.dart';
//   import '../../composants/carte_detail_transaction.dart';
//   import '../../composants/ligne_detail.dart';
//   import '../../composants/pastille_statut.dart';
//   import '../../modeles/transaction.dart';
//   import '../../utilitaires/formateur.dart';
//
// CET ÉCRAN REÇOIT une Transaction en argument :
//   final Transaction transaction; (dans le constructeur)
//   → transaction.montant / transaction.dateHeure / transaction.id
// ============================================================

import 'package:flutter/material.dart';
import '../../modeles/transaction.dart';

class PageConfirmationRechargement extends StatelessWidget {
  final Transaction transaction;

  const PageConfirmationRechargement({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page Confirmation Rechargement — À implémenter par Bigo'),
      ),
    );
  }
}
