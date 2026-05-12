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
import 'package:flutter/services.dart'; // Pour la fonction de copie

import '../../constantes/couleurs.dart';
import '../../constantes/dimensions.dart';
import '../../constantes/styles_texte.dart';
import '../../composants/carte_detail_transaction.dart';
import '../../composants/ligne_detail.dart';
import '../../composants/pastille_statut.dart';
import '../../modeles/transaction.dart';
import '../../utilitaires/formateur.dart';

class PageDetailRepas extends StatelessWidget {
  final Transaction transaction;

  const PageDetailRepas({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Couleurs.fondPrincipal,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Couleurs.blanc,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon:
                  const Icon(Icons.arrow_back, color: Couleurs.texte, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingPage,
            vertical: Dimensions.espaceM,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center, // Tout est centré en haut
            children: [
              // 1. Cercle vert vif avec l'icône de couverts
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Couleurs.vertCarte, // Le vert clair de votre charte
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.restaurant,
                  color: Couleurs.vertFonce,
                  size: 40,
                ),
              ),
              const SizedBox(height: Dimensions.espaceM),

              // 2. Titre (Ex: Repas Midi)
              Text(
                transaction.titre,
                style:
                    StylesTexte.titreGrand.copyWith(color: Couleurs.vertFonce),
              ),
              const SizedBox(height: Dimensions.espaceS),

              // 3. Montant (Ex: -200 FCFA)
              Text(
                Formateur.formaterMontantTransaction(transaction.montant),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight:
                      FontWeight.w900, // Très gras pour faire ressortir le prix
                  color: Couleurs.texte,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: Dimensions.espaceXL),

              // 4. Carte blanche contenant les lignes de détails
              CarteDetailTransaction(
                lignes: [
                  const LigneDetail(
                    icone: Icons.storefront_outlined,
                    label: 'MARCHAND',
                    valeur:
                        Text('Restaurant servira', style: StylesTexte.corps),
                  ),
                  LigneDetail(
                    icone: Icons.access_time,
                    label: 'DATE & HEURE',
                    valeur: Text(
                      Formateur.formaterDate(transaction.dateHeure),
                      style: StylesTexte.corps,
                    ),
                  ),
                  const LigneDetail(
                    icone: Icons.check_circle_outline,
                    label: 'STATUT',
                    valeur: PastilleStatut(texte: 'Succès', succes: true),
                  ),
                  LigneDetail(
                    icone: Icons.label_outline,
                    label: 'ID TRANSACTION',
                    valeur:
                        Text('#${transaction.id}', style: StylesTexte.corps),
                    suffixe: IconButton(
                      icon: const Icon(Icons.content_copy,
                          color: Couleurs.vertPrincipal, size: 20),
                      onPressed: () {
                        // Copie l'ID dans le presse-papier
                        Clipboard.setData(ClipboardData(text: transaction.id));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('ID copié dans le presse-papier')),
                        );
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60), // Espace pour aérer le bas

              // 5. La petite barre grise tout en bas (style "Home indicator" d'iOS)
              Container(
                width: 120,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: Dimensions.espaceM),
            ],
          ),
        ),
      ),
    );
  }
}
