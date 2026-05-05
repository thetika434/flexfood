import 'package:flutter/material.dart';
import '../constantes/couleurs.dart';
import '../constantes/dimensions.dart';
import '../constantes/styles_texte.dart';

class LigneDetail extends StatelessWidget {
  final IconData icone;
  final String label;
  final Widget valeur;
  final Widget? suffixe;

  const LigneDetail({
    super.key,
    required this.icone,
    required this.label,
    required this.valeur,
    this.suffixe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.espaceM),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Couleurs.fondPrincipal,
            ),
            child: Icon(icone, size: 18, color: Couleurs.texteSecondaire),
          ),
          const SizedBox(width: Dimensions.espaceM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: StylesTexte.label),
                const SizedBox(height: 2),
                valeur,
              ],
            ),
          ),
          if (suffixe != null) suffixe!,
        ],
      ),
    );
  }
}
