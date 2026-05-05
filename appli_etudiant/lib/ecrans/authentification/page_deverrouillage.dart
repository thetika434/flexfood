// ============================================================
// DÉVELOPPEUR : Bigo
// ÉCRAN       : Page Déverrouillage (connexions suivantes)
// ============================================================
// DESIGN : Voir image "deverrouillage.png" dans le dossier design/
//
// À IMPLÉMENTER :
//   - Fond gris clair avec vagues décoratives
//   - Bouton retour en haut à gauche
//   - Icône empreinte digitale dans un cercle vert foncé
//   - Titre "Déverrouillage" en vert foncé
//   - Sous-titre explicatif
//   - 4 ronds indicateurs du PIN  → utilise IndicateurPin()
//   - Clavier numérique 1-9, 0, effacer  → utilise ClavierNumerique()
//   - Lien "Code oublié ?" en bas
//
// LOGIQUE :
//   - Chaque touche ajoute un chiffre à _pin
//   - Quand _pin.length == 4 → vérifier automatiquement
//   - ServiceAuthentification.verifierPin(_pin)
//   - ✅ Correct → Navigator.pushNamed(context, Routes.accueil)
//   - ❌ Incorrect → vider _pin + afficher message erreur
//   - Après 3 erreurs → bloquer 5 minutes (afficher compte à rebours)
// ============================================================

import 'package:flutter/material.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/dimensions.dart';
import '../../constantes/styles_texte.dart';
import '../../composants/indicateur_pin.dart';
import '../../composants/clavier_numerique.dart';
import '../../navigation/routeur.dart';
import '../../services/service_authentification.dart';

class PageDeverrouillage extends StatefulWidget {
  const PageDeverrouillage({super.key});

  @override
  State<PageDeverrouillage> createState() => _PageDeverrouillageEtat();
}

class _PageDeverrouillageEtat extends State<PageDeverrouillage> {
  String _pin = '';
  int _nbErreurs = 0;
  String? _messageErreur;

  void _ajouterChiffre(String chiffre) {
    if (_pin.length >= 4) return;
    setState(() {
      _pin += chiffre;
      _messageErreur = null;
    });
    if (_pin.length == 4) _verifierPin();
  }

  void _effacerDernier() {
    if (_pin.isEmpty) return;
    setState(() => _pin = _pin.substring(0, _pin.length - 1));
  }

  void _verifierPin() {
    final correct = ServiceAuthentification.verifierPin(_pin);
    if (correct) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.accueil,
        (route) => false,
      );
    } else {
      setState(() {
        _nbErreurs++;
        _pin = '';
        _messageErreur = _nbErreurs >= 3
            ? 'Trop de tentatives. Réessayez dans 5 minutes.'
            : 'Code incorrect. Tentative $_nbErreurs/3';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO Bigo : Applique le vrai design (fond avec vagues, icône empreinte)
    return Scaffold(
      backgroundColor: Couleurs.fondPrincipal,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(Dimensions.paddingPage),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back, color: Couleurs.texte),
                ),
              ),
            ),

            const Spacer(),

            // TODO Bigo : Icône empreinte digitale dans cercle vert foncé

            const SizedBox(height: Dimensions.espaceL),

            Text('Déverrouillage', style: StylesTexte.titreMoyen),
            const SizedBox(height: Dimensions.espaceS),
            Text(
              'Votre code secret est requis pour déverrouiller\nl\'accès à votre portefeuille',
              style: StylesTexte.corpsSecondaire,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: Dimensions.espaceL),

            IndicateurPin(longueur: _pin.length),

            if (_messageErreur != null) ...[
              const SizedBox(height: Dimensions.espaceS),
              Text(
                _messageErreur!,
                style:
                    StylesTexte.corpsSecondaire.copyWith(color: Couleurs.rouge),
              ),
            ],

            const Spacer(),

            ClavierNumerique(
              onChiffre: _ajouterChiffre,
              onEffacer: _effacerDernier,
            ),

            const SizedBox(height: Dimensions.espaceM),
            Text('Code oublié ?', style: StylesTexte.lien),
            const SizedBox(height: Dimensions.espaceL),
          ],
        ),
      ),
    );
  }
}
