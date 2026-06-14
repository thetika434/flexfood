import 'package:flutter/material.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/dimensions.dart';
import '../../constantes/styles_texte.dart';
import '../../navigation/routeur.dart';
import '../../services/service_authentification.dart';

class PageProfil extends StatelessWidget {
  const PageProfil({super.key});

  Future<void> _confirmerDeconnexion(BuildContext context) async {
    final confirme = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Déconnexion'),
        content: const Text('Voulez-vous vraiment vous déconnecter ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Déconnecter',
                style: TextStyle(color: Couleurs.rouge)),
          ),
        ],
      ),
    );
    if (confirme == true && context.mounted) {
      ServiceAuthentification.deconnecter();
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.connexion, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final etudiant = Session.etudiantConnecte;
    if (etudiant == null) return const SizedBox();

    return Scaffold(
      backgroundColor: Couleurs.fondPrincipal,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: const BoxDecoration(
              color: Couleurs.blanc,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back,
                  color: Couleurs.texte, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: Text('Mon Profil', style: StylesTexte.titrePetit),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Dimensions.paddingPage),
          child: Column(
            children: [
              const SizedBox(height: Dimensions.espaceL),

              // Avatar avec initiales
              Container(
                width: 88,
                height: 88,
                decoration: const BoxDecoration(
                  color: Couleurs.vertPrincipal,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    etudiant.initiales,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: Dimensions.espaceM),

              Text(etudiant.nomComplet, style: StylesTexte.titreMoyen),
              const SizedBox(height: 4),
              Text(etudiant.matricule,
                  style: StylesTexte.corpsSecondaire),


              const SizedBox(height: Dimensions.espaceL),

              // Infos détaillées
              _CarteInfo(
                icone: Icons.badge_outlined,
                label: 'Matricule',
                valeur: etudiant.matricule,
              ),
              const SizedBox(height: Dimensions.espaceS),
              _CarteInfo(
                icone: Icons.person_outline,
                label: 'Prénom',
                valeur: etudiant.prenom,
              ),
              const SizedBox(height: Dimensions.espaceS),
              _CarteInfo(
                icone: Icons.person_outline,
                label: 'Nom',
                valeur: etudiant.nom,
              ),


              const SizedBox(height: Dimensions.espaceL),

              // Actions
              _BoutonAction(
                icone: Icons.lock_reset,
                label: 'Changer le code secret',
                onAppui: () =>
                    Navigator.pushNamed(context, Routes.changerCodeSecret),
              ),
              const SizedBox(height: Dimensions.espaceS),
              _BoutonAction(
                icone: Icons.logout,
                label: 'Se déconnecter',
                couleur: Couleurs.rouge,
                onAppui: () => _confirmerDeconnexion(context),
              ),

              const SizedBox(height: Dimensions.espaceL),
            ],
          ),
        ),
      ),
    );
  }
}

class _CarteInfo extends StatelessWidget {
  final IconData icone;
  final String label;
  final String valeur;

  const _CarteInfo({
    required this.icone,
    required this.label,
    required this.valeur,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.espaceM, vertical: 14),
      decoration: BoxDecoration(
        color: Couleurs.blanc,
        borderRadius: BorderRadius.circular(Dimensions.rayonCarte),
        border: Border.all(color: Couleurs.bordure),
      ),
      child: Row(
        children: [
          Icon(icone, color: Couleurs.texteSecondaire, size: 20),
          const SizedBox(width: Dimensions.espaceM),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: StylesTexte.corpsSecondaire
                      .copyWith(fontSize: 11)),
              Text(valeur, style: StylesTexte.corps),
            ],
          ),
        ],
      ),
    );
  }
}

class _BoutonAction extends StatelessWidget {
  final IconData icone;
  final String label;
  final VoidCallback onAppui;
  final Color couleur;

  const _BoutonAction({
    required this.icone,
    required this.label,
    required this.onAppui,
    this.couleur = Couleurs.texte,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAppui,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.espaceM, vertical: 16),
        decoration: BoxDecoration(
          color: Couleurs.blanc,
          borderRadius: BorderRadius.circular(Dimensions.rayonCarte),
          border: Border.all(color: Couleurs.bordure),
        ),
        child: Row(
          children: [
            Icon(icone, color: couleur, size: 22),
            const SizedBox(width: Dimensions.espaceM),
            Text(label,
                style: StylesTexte.corps.copyWith(color: couleur)),
            const Spacer(),
            Icon(Icons.chevron_right,
                color: Couleurs.texteSecondaire, size: 20),
          ],
        ),
      ),
    );
  }
}
