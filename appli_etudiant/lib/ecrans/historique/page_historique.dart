// ============================================================
// DÉVELOPPEUR : David
// ÉCRAN       : Page Historique
// ============================================================
// DESIGN : Voir image "historique.png"
//
// IMPORTS À AJOUTER quand tu commences :
//   import '../../constantes/couleurs.dart';
//   import '../../constantes/dimensions.dart';
//   import '../../constantes/styles_texte.dart';
//   import '../../composants/element_transaction.dart';
//   import '../../composants/filtre_temporel.dart';
//   import '../../modeles/transaction.dart';
//   import '../../navigation/routeur.dart';
//   import '../../services/service_transactions.dart';
//   import '../../utilitaires/formateur.dart';
//
// LOGIQUE :
//   ServiceTransactions.obtenirTransactions() → liste de toutes les transactions
//   Formateur.formaterDateGroupe(date) → "AUJOURD'HUI", "HIER", "12 OCTOBRE"
//   Appui sur repas → Navigator.pushNamed(context, Routes.detailRepas, arguments: transaction)
// ============================================================

import 'package:flutter/material.dart';

class PageHistorique extends StatefulWidget {
  const PageHistorique({super.key});

  @override
  State<PageHistorique> createState() => _PageHistoriqueEtat();
}

class _PageHistoriqueEtat extends State<PageHistorique> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page Historique — À implémenter par David'),
      ),
    );
  }
}
