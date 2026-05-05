import 'package:flutter/material.dart';
import '../constantes/couleurs.dart';
import '../constantes/dimensions.dart';
import '../constantes/styles_texte.dart';

class BoutonPrincipal extends StatelessWidget {
  final String texte;
  final VoidCallback onAppui;
  final IconData? icone;

  const BoutonPrincipal({
    super.key,
    required this.texte,
    required this.onAppui,
    this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Dimensions.hauteurBouton,
      child: ElevatedButton(
        onPressed: onAppui,
        style: ElevatedButton.styleFrom(
          backgroundColor: Couleurs.vertFonce,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.rayonBouton),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(texte, style: StylesTexte.bouton),
            if (icone != null) ...[
              const SizedBox(width: 8),
              Icon(icone, color: Couleurs.blanc, size: 20),
            ],
          ],
        ),
      ),
    );
  }
}
