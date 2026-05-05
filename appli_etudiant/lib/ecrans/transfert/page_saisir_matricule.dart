// ============================================================
// DÉVELOPPEUR : Nabo
// ÉCRAN       : Page Saisir Matricule
// ============================================================
// DESIGN : Voir image "saisir_matricule.png"
//
// IMPORTS À AJOUTER quand tu commences :
//   import '../../constantes/couleurs.dart';
//   import '../../constantes/dimensions.dart';
//   import '../../constantes/styles_texte.dart';
//   import '../../composants/champ_saisie.dart';
//   import '../../composants/bouton_principal.dart';
//   import '../../navigation/routeur.dart';
//   import '../../services/service_transactions.dart';
//
// LOGIQUE :
//   ServiceTransactions.chercherEtudiantParMatricule(matricule)
//   → etudiant trouvé → Navigator.pushNamed(context, Routes.montantTransfert, arguments: etudiant)
//   → null → afficher message "Matricule introuvable"
// ============================================================

import 'package:flutter/material.dart';

class PageSaisirMatricule extends StatefulWidget {
  const PageSaisirMatricule({super.key});

  @override
  State<PageSaisirMatricule> createState() => _PageSaisirMatriculeEtat();
}

class _PageSaisirMatriculeEtat extends State<PageSaisirMatricule> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page Saisir Matricule — À implémenter par Nabo'),
      ),
    );
  }
}
