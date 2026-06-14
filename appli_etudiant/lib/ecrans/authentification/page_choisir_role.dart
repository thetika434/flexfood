import 'package:flutter/material.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/dimensions.dart';
import '../../constantes/styles_texte.dart';
import '../../navigation/routeur.dart';

class PageChoisirRole extends StatelessWidget {
  const PageChoisirRole({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Couleurs.fondPrincipal,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingPage),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: Couleurs.vertPrincipal,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.restaurant,
                      color: Couleurs.blanc, size: 40),
                ),

                const SizedBox(height: Dimensions.espaceL),

                Text('FlexFood', style: StylesTexte.titreMoyen),
                const SizedBox(height: Dimensions.espaceS),
                Text(
                  'Bienvenue à l\'ESATIC',
                  style: StylesTexte.corpsSecondaire,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: Dimensions.espaceXL),

                Text('Vous êtes ?',
                    style: StylesTexte.titrePetit
                        .copyWith(color: Couleurs.texteSecondaire)),

                const SizedBox(height: Dimensions.espaceM),

                _CarteRole(
                  icone: Icons.school_outlined,
                  titre: 'Étudiant',
                  description: 'Accédez à votre portefeuille étudiant',
                  onAppui: () => Navigator.pushNamed(
                    context,
                    Routes.connexion,
                    arguments: 'etudiant',
                  ),
                ),

                const SizedBox(height: Dimensions.espaceM),

                _CarteRole(
                  icone: Icons.person_outline,
                  titre: 'Enseignant',
                  description: 'Accédez à votre espace repas',
                  onAppui: () => Navigator.pushNamed(
                    context,
                    Routes.connexion,
                    arguments: 'enseignant',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CarteRole extends StatelessWidget {
  final IconData icone;
  final String titre;
  final String description;
  final VoidCallback onAppui;

  const _CarteRole({
    required this.icone,
    required this.titre,
    required this.description,
    required this.onAppui,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAppui,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(Dimensions.espaceL),
        decoration: BoxDecoration(
          color: Couleurs.blanc,
          borderRadius: BorderRadius.circular(Dimensions.rayonCarte),
          border: Border.all(color: Couleurs.surfaceContainer),
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Couleurs.fondIconeRepas,
              ),
              child: Icon(icone, color: Couleurs.vertPrincipal, size: 28),
            ),
            const SizedBox(width: Dimensions.espaceM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titre,
                    style: StylesTexte.corps
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Text(description, style: StylesTexte.corpsSecondaire),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios,
                size: 16, color: Couleurs.texteSecondaire),
          ],
        ),
      ),
    );
  }
}
