// ============================================================
// DÉVELOPPEUR : Bigo
// ÉCRAN       : Page Changer Code Secret
// ============================================================
// DESIGN : Voir image "changer_code_secret.png"
//
// IMPORTS À AJOUTER quand tu commences :
//   import '../../constantes/couleurs.dart';
//   import '../../constantes/dimensions.dart';
//   import '../../constantes/styles_texte.dart';
//   import '../../composants/champ_saisie.dart';
//   import '../../composants/bouton_principal.dart';
//   import '../../services/service_authentification.dart';
//
// LOGIQUE :
//   ServiceAuthentification.changerCodeSecret(ancien, nouveau, confirmation)
//   → true = succès → Navigator.pop(context)
//   → false = erreur → afficher message
// ============================================================

import 'package:flutter/material.dart';

class PageChangerCodeSecret extends StatefulWidget {
  const PageChangerCodeSecret({super.key});

  @override
  State<PageChangerCodeSecret> createState() => _PageChangerCodeSecretEtat();
}

class _PageChangerCodeSecretEtat extends State<PageChangerCodeSecret> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page Changer Code Secret — À implémenter par Bigo'),
      ),
    );
  }
}
