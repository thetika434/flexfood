import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/dimensions.dart';
import '../../constantes/styles_texte.dart';
import '../../composants/carte_detail_transaction.dart';
import '../../composants/ligne_detail.dart';
import '../../composants/pastille_statut.dart';
import '../../modeles/transaction.dart';
import '../../utilitaires/formateur.dart';

class PageConfirmationTransfertEnvoye extends StatelessWidget {
  final Transaction transaction;

  const PageConfirmationTransfertEnvoye({super.key, required this.transaction});

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
              icon: const Icon(Icons.arrow_back, color: Couleurs.texte, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Dimensions.paddingPage),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: Dimensions.espaceL),

              // Icône succès
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Couleurs.fondIconeTransfertRecu,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_circle,
                    color: Couleurs.vertFonce, size: 44),
              ),
              const SizedBox(height: Dimensions.espaceM),

              Text('Transfert envoyé',
                  style: StylesTexte.titreGrand
                      .copyWith(color: Couleurs.vertFonce)),
              const SizedBox(height: Dimensions.espaceS),

              Text(
                Formateur.formaterMontantTransaction(transaction.montant),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: Couleurs.texte,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: Dimensions.espaceXL),

              CarteDetailTransaction(
                lignes: [
                  LigneDetail(
                    icone: Icons.person_outline,
                    label: 'DESTINATAIRE',
                    valeur: Text(
                      transaction.autrePartiNom ??
                          transaction.autrePartiMatricule ??
                          '—',
                      style: StylesTexte.corps,
                    ),
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
                        Text(transaction.id, style: StylesTexte.corps),
                    suffixe: IconButton(
                      icon: const Icon(Icons.content_copy,
                          color: Couleurs.vertPrincipal, size: 20),
                      onPressed: () {
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

              const SizedBox(height: Dimensions.espaceXL),
            ],
          ),
        ),
      ),
    );
  }
}
