// ============================================================
// DÉVELOPPEUR : Bigo
// ÉCRAN       : Page Détail Repas
// ============================================================
// DESIGN : Voir image "detail_repas.png"
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
//   → transaction.titre / transaction.montant / transaction.dateHeure / transaction.id
// ============================================================

import 'package:flutter/material.dart';
import '../../modeles/transaction.dart';

class PageDetailRepas extends StatelessWidget {
  final Transaction transaction;

  const PageDetailRepas({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page Détail Repas — À implémenter par Bigo'),
      ),
    );
  }
}
