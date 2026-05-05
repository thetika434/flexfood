// ============================================================
// DÉVELOPPEUR : Moïse
// ÉCRAN       : Page Confirmation Transfert Reçu
// ============================================================
// DESIGN : Voir image "confirmation_transfert_recu.png"
//
// IMPORTS À AJOUTER quand tu commences :
//   import '../../constantes/couleurs.dart';
//   import '../../constantes/dimensions.dart';
//   import '../../constantes/styles_texte.dart';
//   import '../../composants/carte_detail_transaction.dart';
//   import '../../composants/ligne_detail.dart';
//   import '../../composants/pastille_statut.dart';
//   import '../../composants/avatar_utilisateur.dart';
//   import '../../modeles/transaction.dart';
//   import '../../utilitaires/formateur.dart';
//
// CET ÉCRAN REÇOIT une Transaction en argument :
//   final Transaction transaction; (dans le constructeur)
//   → transaction.autrePartiNom / transaction.montant / transaction.dateHeure / transaction.id
// ============================================================

import 'package:flutter/material.dart';
import '../../modeles/transaction.dart';

class PageConfirmationTransfertRecu extends StatelessWidget {
  final Transaction transaction;

  const PageConfirmationTransfertRecu({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page Confirmation Transfert Reçu — À implémenter par David'),
      ),
    );
  }
}
