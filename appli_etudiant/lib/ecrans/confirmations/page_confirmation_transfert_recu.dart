// ============================================================
// DÉVELOPPEUR : Moïse
// ÉCRAN       : Page Confirmation Transfert Reçu
// ============================================================
// DESIGN : Voir image "confirmation_transfert_recu.png"
//
// IMPORTS À AJOUTER quand tu commences :
import '../../constantes/couleurs.dart';
import '../../constantes/dimensions.dart';
import '../../constantes/styles_texte.dart';
import '../../composants/carte_detail_transaction.dart';
import '../../composants/ligne_detail.dart';
import '../../composants/pastille_statut.dart';
import '../../composants/avatar_utilisateur.dart';
import '../../modeles/transaction.dart';
import '../../utilitaires/formateur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//
// CET ÉCRAN REÇOIT une Transaction en argument :
//   final Transaction transaction; (dans le constructeur)
//   → transaction.autrePartiNom / transaction.montant / transaction.dateHeure / transaction.id
// ============================================================

class PageConfirmationTransfertRecu extends StatelessWidget {
  final Transaction transaction;

  const PageConfirmationTransfertRecu({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Couleurs.fondPrincipal,
          elevation: 0,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Couleurs.texte),
              onPressed: () {
                Navigator.pop(context);
              })),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: Dimensions.espaceM),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Couleurs.fondIconeTransfertRecu,
                ),
                child: const Icon(
                  Icons.arrow_downward,
                  color: Couleurs.iconeTransfertRecu,
                  size: 50,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Couleurs.blanc,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(2),
                child: const Icon(
                  Icons.check_circle,
                  color: Couleurs.iconeTransfertRecu,
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: Dimensions.espaceM),
          const Text("Transfert reçu de Kyra",
              style: TextStyle(
                  color: Couleurs.vertPrincipal,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          const Text("+500 FCFA",
              style: TextStyle(
                  color: Couleurs.texte,
                  fontSize: 35,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 40),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: Dimensions.paddingPage),
            padding: const EdgeInsets.all(Dimensions.espaceM),
            decoration: BoxDecoration(
              color: Couleurs.blanc,
              borderRadius: BorderRadius.circular(Dimensions.rayonCarte),
            ),
            child: Column(
              children: [
                _construireLigneDetail(
                    icone: Icons.person_outline,
                    titre: "EXPÉDITEUR",
                    valeur: "Kyra",
                    initialesAvatar: "KY"),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: Dimensions.espaceM),
                  child:
                      Divider(color: Couleurs.bordure, thickness: 1, height: 1),
                ),
                _construireLigneDetail(
                    icone: Icons.access_time,
                    titre: "DATE ET HEURE",
                    valeur: "24 oct., 19:30"),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: Dimensions.espaceM),
                  child:
                      Divider(color: Couleurs.bordure, thickness: 1, height: 1),
                ),
                _construireLigneDetailStatut(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: Dimensions.espaceM),
                  child:
                      Divider(color: Couleurs.bordure, thickness: 1, height: 1),
                ),
                _construireLigneDetail(
                    icone: Icons.local_offer_outlined,
                    titre: "ID TRANSACTION",
                    valeur: "#4504",
                    avecCopie: true,
                    context: context),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _construireLigneDetail(
      {required IconData icone,
      required String titre,
      required String valeur,
      bool avecCopie = false,
      String? initialesAvatar,
      BuildContext? context}) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(Dimensions.espaceS),
          decoration: const BoxDecoration(
            color: Couleurs.iconeGrise,
            shape: BoxShape.circle,
          ),
          child: Icon(icone,
              color: Couleurs.texteSecondaire, size: Dimensions.tailleIcone),
        ),
        const SizedBox(width: Dimensions.espaceM),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titre,
                  style: const TextStyle(
                      fontSize: 12,
                      color: Couleurs.texteSecondaire,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: Dimensions.espaceXS),
              Text(valeur,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Couleurs.texte,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        if (initialesAvatar != null)
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Couleurs.vertFonce,
              shape: BoxShape.circle,
            ),
            child: Text(
              initialesAvatar,
              style: const TextStyle(
                color: Couleurs.blanc,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        if (avecCopie)
          IconButton(
            icon: const Icon(Icons.copy_outlined,
                color: Couleurs.vertPrincipal, size: 24),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: valeur));
              if (context != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("$titre copié !"),
                    duration: const Duration(seconds: 2),
                    backgroundColor: Couleurs.vertPrincipal,
                  ),
                );
              }
            },
          ),
      ],
    );
  }

  Widget _construireLigneDetailStatut() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(Dimensions.espaceS),
          decoration: const BoxDecoration(
            color: Couleurs.iconeGrise,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check_circle_outline,
              color: Couleurs.texteSecondaire, size: Dimensions.tailleIcone),
        ),
        const SizedBox(width: Dimensions.espaceM),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("STATUT",
                style: TextStyle(
                    fontSize: 12,
                    color: Couleurs.texteSecondaire,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: Dimensions.espaceXS),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Couleurs.fondIconeTransfertRecu,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text("Succès",
                  style: TextStyle(
                      fontSize: 14,
                      color: Couleurs.iconeTransfertRecu,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ],
    );
  }
}
