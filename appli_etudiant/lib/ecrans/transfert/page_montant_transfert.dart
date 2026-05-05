// ============================================================
// DÉVELOPPEUR : Moïse
// ÉCRAN       : Page Montant Transfert
// ============================================================
// DESIGN : Voir image "montant_transfert.png"
//
// IMPORTS À AJOUTER quand tu commences :
//   import '../../constantes/couleurs.dart';
//   import '../../constantes/dimensions.dart';
//   import '../../constantes/styles_texte.dart';
//   import '../../composants/clavier_numerique.dart';
//   import '../../composants/avatar_utilisateur.dart';
//   import '../../composants/bouton_principal.dart';
//   import '../../modeles/etudiant.dart';
//   import '../../navigation/routeur.dart';
//   import '../../services/service_transactions.dart';
//
// CET ÉCRAN REÇOIT un Etudiant en argument :
//   final Etudiant etudiant; (dans le constructeur)
//
// LOGIQUE :
//   ServiceTransactions.effectuerTransfert(etudiant.matricule, montant)
//   → transaction → Navigator.pushNamed(context, Routes.confirmationTransfertEnvoye, arguments: transaction)
//   → null → afficher "Solde insuffisant"
//   RÈGLE : montant doit être multiple de 100 FCFA
// ============================================================

import 'package:flutter/material.dart';
import '../../modeles/etudiant.dart';

class PageMontantTransfert extends StatefulWidget {
  final Etudiant etudiant;

  const PageMontantTransfert({super.key, required this.etudiant});

  @override
  State<PageMontantTransfert> createState() => _PageMontantTransfertEtat();
}

class _PageMontantTransfertEtat extends State<PageMontantTransfert> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page Montant Transfert — À implémenter par Moïse'),
      ),
    );
  }
}
