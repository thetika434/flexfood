// ============================================================
// DÉVELOPPEUR : Bigo
// ÉCRAN       : Page Connexion (première connexion)
// ============================================================
// DESIGN : Voir image "connexion.png" dans le dossier design/
//
// À IMPLÉMENTER :
//   - Fond avec dégradé vert en haut à droite
//   - Logo FlexFood (icône fourchette dans un carré vert arrondi)
//   - Titre "FlexFood" + sous-titre de bienvenue
//   - Champ MATRICULE ÉTUDIANT  → utilise ChampSaisie()
//   - Champ CODE SECRET masqué (avec icône œil pour révéler)  → utilise ChampSaisie()
//   - Bouton "Se connecter"  → utilise BoutonPrincipal()
//   - Lien "Code secret oublié ?" en bas
//
// NAVIGATION :
//   ServiceAuthentification.connecter(matricule, codeSecret)
//   ✅ Succès  → Navigator.pushNamed(context, Routes.accueil)
//   ❌ Échec   → Afficher un message d'erreur sous les champs
// ============================================================

import 'package:flutter/material.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/dimensions.dart';
import '../../constantes/styles_texte.dart';
import '../../composants/champ_saisie.dart';
import '../../composants/bouton_principal.dart';
import '../../navigation/routeur.dart';
import '../../services/service_authentification.dart';

class PageConnexion extends StatefulWidget {
  const PageConnexion({super.key});

  @override
  State<PageConnexion> createState() => _PageConnexionEtat();
}

class _PageConnexionEtat extends State<PageConnexion> {
  final _controleurMatricule = TextEditingController();
  final _controleurCodeSecret = TextEditingController();
  bool _codeVisible = false;
  String? _messageErreur;

  @override
  void dispose() {
    _controleurMatricule.dispose();
    _controleurCodeSecret.dispose();
    super.dispose();
  }

  void _seConnecter() {
    final matricule = _controleurMatricule.text.trim();
    final codeSecret = _controleurCodeSecret.text.trim();

    final etudiant = ServiceAuthentification.connecter(matricule, codeSecret);

    if (etudiant != null) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.accueil,
        (route) => false,
      );
    } else {
      setState(() {
        _messageErreur = 'Matricule ou code secret incorrect.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO Bigo : Remplace ce Scaffold par le vrai design
    return Scaffold(
      backgroundColor: Couleurs.fondPrincipal,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Dimensions.paddingPage),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TODO Bigo : Logo FlexFood ici

                const SizedBox(height: Dimensions.espaceL),

                const Text('FlexFood', style: StylesTexte.titreMoyen),
                const SizedBox(height: Dimensions.espaceS),
                const Text(
                  'Bienvenue à l\'ESATIC. Connectez-vous\npour accéder à votre portefeuille étudiant.',
                  style: StylesTexte.corpsSecondaire,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: Dimensions.espaceXL),

                ChampSaisie(
                  label: 'MATRICULE ÉTUDIANT',
                  indice: 'Ex: 21-ESATIC0123',
                  icone: Icons.badge_outlined,
                  controleur: _controleurMatricule,
                ),

                const SizedBox(height: Dimensions.espaceM),

                ChampSaisie(
                  label: 'CODE SECRET',
                  indice: '••••',
                  icone: Icons.lock_outline,
                  controleur: _controleurCodeSecret,
                  masquer: !_codeVisible,
                  iconeSuffixe: IconButton(
                    icon: Icon(
                      _codeVisible ? Icons.visibility_off : Icons.visibility,
                      color: Couleurs.texteSecondaire,
                    ),
                    onPressed: () =>
                        setState(() => _codeVisible = !_codeVisible),
                  ),
                ),

                if (_messageErreur != null) ...[
                  const SizedBox(height: Dimensions.espaceS),
                  Text(
                    _messageErreur!,
                    style: StylesTexte.corpsSecondaire
                        .copyWith(color: Couleurs.rouge),
                  ),
                ],

                const SizedBox(height: Dimensions.espaceXL),

                BoutonPrincipal(
                  texte: 'Se connecter',
                  onAppui: _seConnecter,
                ),

                const SizedBox(height: Dimensions.espaceM),

                const Text('Code secret oublié ?', style: StylesTexte.lien),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
