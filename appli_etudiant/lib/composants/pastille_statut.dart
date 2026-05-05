import 'package:flutter/material.dart';
import '../constantes/couleurs.dart';
import '../constantes/styles_texte.dart';

class PastilleStatut extends StatelessWidget {
  final String texte;
  final bool succes;

  const PastilleStatut({
    super.key,
    this.texte = 'Succès',
    this.succes = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: succes ? Couleurs.vertVif : Couleurs.rouge,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        texte,
        style: StylesTexte.corps.copyWith(
          color: Couleurs.blanc,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }
}
