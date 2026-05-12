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
import '../../composants/bouton_principal.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/styles_texte.dart';
import '../../constantes/dimensions.dart';
import '../../services/service_authentification.dart';

class PageChangerCodeSecret extends StatefulWidget {
  const PageChangerCodeSecret({super.key});

  @override
  State<PageChangerCodeSecret> createState() => _PageChangerCodeSecretState();
}

class _PageChangerCodeSecretState extends State<PageChangerCodeSecret> {
  final _ancienCodeController = TextEditingController();
  final _nouveauCodeController = TextEditingController();
  final _confirmerCodeController = TextEditingController();

  @override
  void dispose() {
    _ancienCodeController.dispose();
    _nouveauCodeController.dispose();
    _confirmerCodeController.dispose();
    super.dispose();
  }

  void _validerChangement() {
    final ancien = _ancienCodeController.text;
    final nouveau = _nouveauCodeController.text;
    final confirmer = _confirmerCodeController.text;

    if (ancien.isEmpty || nouveau.isEmpty || confirmer.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs')),
      );
      return;
    }

    bool succes =
        ServiceAuthentification.changerCodeSecret(ancien, nouveau, confirmer);

    if (succes) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mot de passe modifié avec succès !'),
          backgroundColor: Couleurs.vertPrincipal,
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erreur : Ancien code incorrect ou format invalide.'),
          backgroundColor: Couleurs.rouge,
        ),
      );
    }
  }

  // --- CHAMP SUR-MESURE POUR OBTENIR EXACTEMENT LA MAQUETTE ---
  Widget _buildCustomField({
    required String label,
    required String indice,
    required IconData icone,
    required TextEditingController controleur,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: StylesTexte.label),
        const SizedBox(height: Dimensions.espaceS),
        TextField(
          controller: controleur,
          obscureText: true, // Toujours masqué par des points
          keyboardType: TextInputType.number,
          style: StylesTexte.corps,
          decoration: InputDecoration(
            hintText: indice,
            hintStyle: StylesTexte.corpsSecondaire.copyWith(letterSpacing: 2),
            prefixIcon: Icon(icone, color: Couleurs.texteSecondaire, size: 20),
            filled: true,
            fillColor: Colors.white, // Fond parfaitement blanc
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.rayonChamp),
              borderSide: const BorderSide(
                  color: Couleurs.bordure), // Bordure apparente
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.rayonChamp),
              borderSide: const BorderSide(
                  color: Couleurs.bordure), // Bordure apparente
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.rayonChamp),
              borderSide:
                  const BorderSide(color: Couleurs.vertPrincipal, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Couleurs.fondPrincipal,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Couleurs.texte, size: 28),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Dimensions.paddingPage),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Changer mon mot de passe',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Couleurs.vertFonce,
                ),
              ),
              const SizedBox(height: Dimensions.espaceS),
              const Text(
                'Protégez votre compte FlexFood en utilisant un code secret robuste.',
                style: StylesTexte.corpsSecondaire,
              ),
              const SizedBox(height: Dimensions.espaceXL),
              _buildCustomField(
                label: 'Ancien code secret',
                indice: '••••',
                icone: Icons.lock_outline,
                controleur: _ancienCodeController,
              ),
              const SizedBox(height: Dimensions.espaceM),
              _buildCustomField(
                label: 'Nouveau code secret',
                indice: '••••',
                icone: Icons.vpn_key_outlined,
                controleur: _nouveauCodeController,
              ),
              const SizedBox(height: Dimensions.espaceM),
              _buildCustomField(
                label: 'Confirmer le nouveau code secret',
                indice: '••••',
                icone: Icons.verified_user_outlined,
                controleur: _confirmerCodeController,
              ),
              const SizedBox(height: Dimensions.espaceL),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Couleurs.surfaceContainer,
                  borderRadius: BorderRadius.circular(Dimensions.rayonChamp),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.info_outline,
                        color: Couleurs.vertFonce, size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: const Text(
                        'Le code secret doit être composé uniquement de 4 chiffres',
                        style: StylesTexte.corpsSecondaire,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Dimensions.espaceXL),
              BoutonPrincipal(
                texte: 'Valider le changement',
                icone: Icons.check_circle_outline,
                onAppui: _validerChangement,
              ),
              const SizedBox(height: Dimensions.espaceXL),
            ],
          ),
        ),
      ),
    );
  }
}
