import 'package:flutter/material.dart';
import '../constantes/couleurs.dart';
import '../constantes/dimensions.dart';
import '../constantes/styles_texte.dart';

class AvatarUtilisateur extends StatelessWidget {
  final double taille;
  final String? initiales;
  final Color? couleurFond;

  const AvatarUtilisateur({
    super.key,
    this.taille = Dimensions.tailleAvatar,
    this.initiales,
    this.couleurFond,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: taille,
      height: taille,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: couleurFond ?? Couleurs.iconeGrise.withValues(alpha: 0.3),
      ),
      child: Center(
        child: initiales != null
            ? Text(
                initiales!,
                style: StylesTexte.titrePetit.copyWith(
                  color: couleurFond != null
                      ? Couleurs.blanc
                      : Couleurs.texteSecondaire,
                  fontSize: taille * 0.35,
                ),
              )
            : Icon(
                Icons.person,
                size: taille * 0.55,
                color: Couleurs.texteSecondaire,
              ),
      ),
    );
  }
}
