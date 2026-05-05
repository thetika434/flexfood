// ============================================================
// DÉVELOPPEUR : Moïse
// ÉCRAN       : Page Confirmation Transfert Envoyé
// ============================================================
// DESIGN : Voir image "confirmation_transfert_envoye.png"
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
//   → transaction.autrePartiNom / transaction.montant / transaction.dateHeure / transaction.id
// ============================================================

import 'package:flutter/material.dart';
import '../../modeles/transaction.dart';

class PageConfirmationTransfertEnvoye extends StatelessWidget {
  final Transaction transaction;

  const PageConfirmationTransfertEnvoye({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page Confirmation Transfert Envoyé — À implémenter par David'),
      ),
    );
  }
}
