import 'package:flutter/material.dart';
import '../constantes/couleurs.dart';
import '../constantes/dimensions.dart';
import '../constantes/styles_texte.dart';

class ChampSaisie extends StatelessWidget {
  final String label;
  final String indice;
  final IconData icone;
  final TextEditingController controleur;
  final bool masquer;
  final Widget? iconeSuffixe;
  final TextInputType typeClavier;

  const ChampSaisie({
    super.key,
    required this.label,
    required this.indice,
    required this.icone,
    required this.controleur,
    this.masquer = false,
    this.iconeSuffixe,
    this.typeClavier = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: StylesTexte.label),
        const SizedBox(height: Dimensions.espaceS),
        TextField(
          controller: controleur,
          obscureText: masquer,
          keyboardType: typeClavier,
          style: StylesTexte.corps,
          decoration: InputDecoration(
            hintText: indice,
            hintStyle: StylesTexte.corpsSecondaire,
            prefixIcon:
                Icon(icone, color: Couleurs.texteSecondaire, size: 20),
            suffixIcon: iconeSuffixe,
            filled: true,
            fillColor: Couleurs.fondPrincipal,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.rayonChamp),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.rayonChamp),
              borderSide: BorderSide.none,
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
}
