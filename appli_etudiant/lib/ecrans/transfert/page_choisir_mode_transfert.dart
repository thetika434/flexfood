// ============================================================
// DÉVELOPPEUR : Nabo
// ÉCRAN       : Page Choisir Mode Transfert
// ============================================================
// DESIGN : Voir image "choisir_mode_transfert.png"
//
// IMPORTS À AJOUTER quand tu commences :
//   import '../../constantes/couleurs.dart';
//   import '../../constantes/dimensions.dart';
//   import '../../constantes/styles_texte.dart';
//   import '../../composants/avatar_utilisateur.dart';
//   import '../../modeles/favori.dart';
//   import '../../navigation/routeur.dart';
//   import '../../services/service_transactions.dart';
//   import '../../donnees_fictives/etudiants_fictifs.dart';
//
// LOGIQUE :
//   ServiceTransactions.obtenirFavoris() → liste des favoris
//   Appui "Scanner QR"   → Navigator.pushNamed(context, Routes.scannerQR)
//   Appui "Saisir Matricule" → Navigator.pushNamed(context, Routes.saisirMatricule)
//   Appui favori → Navigator.pushNamed(context, Routes.montantTransfert, arguments: etudiant)
// ============================================================

import 'package:flutter/material.dart';

import '../../composants/avatar_utilisateur.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/dimensions.dart';
import '../../constantes/styles_texte.dart';
import '../../donnees_fictives/etudiants_fictifs.dart';
import '../../modeles/favori.dart';
import '../../navigation/routeur.dart';
import '../../services/service_transactions.dart';

class PageChoisirModeTransfert extends StatelessWidget {
  const PageChoisirModeTransfert({super.key});

  @override
  Widget build(BuildContext context) {
    final favoris = ServiceTransactions.obtenirFavoris();

    return Scaffold(
      backgroundColor: Couleurs.fondPrincipal,
      appBar: AppBar(
        backgroundColor: Couleurs.fondPrincipal,
        elevation: 0,
        scrolledUnderElevation: 0,
        leadingWidth: 88,
        leading: IconButton(
          padding: const EdgeInsets.only(left: Dimensions.paddingPage),
          alignment: Alignment.centerLeft,
          onPressed: () => Navigator.maybePop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Couleurs.vertFonce,
            size: 36,
          ),
        ),
        toolbarHeight: 96,
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            Dimensions.paddingPage,
            Dimensions.espaceS,
            Dimensions.paddingPage,
            Dimensions.espaceXL,
          ),
          children: [
            Text(
              'Choisir le mode de transfert',
              style: StylesTexte.titreGrand.copyWith(
                color: Couleurs.vertFonce,
              ),
            ),
            const SizedBox(height: Dimensions.espaceS),
            const Text(
              'Envoyez de l argent rapidement a un autre etudiant.',
              style: StylesTexte.corpsSecondaire,
            ),
            const SizedBox(height: Dimensions.espaceXL),
            _CarteModeTransfert(
              icone: Icons.qr_code_scanner,
              titre: 'Scanner QR',
              description: 'Scanner le code QR du destinataire',
              onAppui: () => Navigator.pushNamed(context, Routes.scannerQR),
            ),
            const SizedBox(height: Dimensions.espaceM),
            _CarteModeTransfert(
              icone: Icons.badge_outlined,
              titre: 'Saisir Matricule',
              description: 'Entrer le matricule du destinataire',
              onAppui: () =>
                  Navigator.pushNamed(context, Routes.saisirMatricule),
            ),
            const SizedBox(height: Dimensions.espaceXL),
            Text(
              'Favoris',
              style: StylesTexte.titrePetit.copyWith(
                color: Couleurs.vertFonce,
              ),
            ),
            const SizedBox(height: Dimensions.espaceM),
            if (favoris.isEmpty)
              const _MessageFavorisVide()
            else
              ...favoris.map(
                (favori) => _ElementFavori(
                  favori: favori,
                  onAppui: () => _ouvrirFavori(context, favori),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _ouvrirFavori(BuildContext context, Favori favori) {
    final etudiant = EtudiantsFictifs.chercherParMatricule(favori.matricule);

    if (etudiant == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Etudiant introuvable')),
      );
      return;
    }

    Navigator.pushNamed(
      context,
      Routes.montantTransfert,
      arguments: etudiant,
    );
  }
}

class _CarteModeTransfert extends StatelessWidget {
  final IconData icone;
  final String titre;
  final String description;
  final VoidCallback onAppui;

  const _CarteModeTransfert({
    required this.icone,
    required this.titre,
    required this.description,
    required this.onAppui,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Couleurs.blanc,
      borderRadius: BorderRadius.circular(Dimensions.rayonCarte),
      child: InkWell(
        onTap: onAppui,
        borderRadius: BorderRadius.circular(Dimensions.rayonCarte),
        child: Container(
          padding: const EdgeInsets.all(Dimensions.espaceM),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.rayonCarte),
            border: Border.all(color: Couleurs.bordure.withValues(alpha: 0.7)),
          ),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Couleurs.vertFonce,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icone,
                  color: Couleurs.blanc,
                  size: Dimensions.tailleIcone,
                ),
              ),
              const SizedBox(width: Dimensions.espaceM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(titre, style: StylesTexte.titrePetit),
                    const SizedBox(height: Dimensions.espaceXS),
                    Text(description, style: StylesTexte.corpsSecondaire),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Couleurs.texteSecondaire,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ElementFavori extends StatelessWidget {
  final Favori favori;
  final VoidCallback onAppui;

  const _ElementFavori({
    required this.favori,
    required this.onAppui,
  });

  @override
  Widget build(BuildContext context) {
    final etudiant = EtudiantsFictifs.chercherParMatricule(favori.matricule);
    final initiales = etudiant?.initiales ?? _initialesDepuisNom(favori.nom);
    final nom = etudiant?.nomComplet ?? favori.nom;

    return Padding(
      padding: const EdgeInsets.only(bottom: Dimensions.espaceS),
      child: Material(
        color: Couleurs.blanc,
        borderRadius: BorderRadius.circular(Dimensions.rayonChamp),
        child: InkWell(
          onTap: onAppui,
          borderRadius: BorderRadius.circular(Dimensions.rayonChamp),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.espaceM,
              vertical: Dimensions.espaceS,
            ),
            child: Row(
              children: [
                AvatarUtilisateur(
                  initiales: initiales,
                  couleurFond: Couleurs.vertVif,
                ),
                const SizedBox(width: Dimensions.espaceM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nom, style: StylesTexte.corps),
                      const SizedBox(height: Dimensions.espaceXS),
                      Text(
                        favori.matricule,
                        style: StylesTexte.corpsSecondaire,
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Couleurs.texteSecondaire,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _initialesDepuisNom(String nom) {
    final morceaux = nom.trim().split(RegExp(r'\s+'));
    if (morceaux.isEmpty || morceaux.first.isEmpty) return '?';

    final premiere = morceaux.first[0].toUpperCase();
    final seconde = morceaux.length > 1 && morceaux.last.isNotEmpty
        ? morceaux.last[0].toUpperCase()
        : '';

    return '$premiere$seconde';
  }
}

class _MessageFavorisVide extends StatelessWidget {
  const _MessageFavorisVide();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimensions.espaceL),
      decoration: BoxDecoration(
        color: Couleurs.surfaceContainer,
        borderRadius: BorderRadius.circular(Dimensions.rayonCarte),
      ),
      child: const Text(
        'Aucun favori pour le moment',
        textAlign: TextAlign.center,
        style: StylesTexte.corpsSecondaire,
      ),
    );
  }
}
