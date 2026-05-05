import 'package:flutter/material.dart';
import '../constantes/couleurs.dart';
import '../constantes/dimensions.dart';
import '../constantes/styles_texte.dart';

class FiltreTemporel extends StatelessWidget {
  final List<String> options;
  final int indexSelectionne;
  final Function(int) onSelection;

  const FiltreTemporel({
    super.key,
    required this.options,
    required this.indexSelectionne,
    required this.onSelection,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: options.asMap().entries.map((entree) {
          final index = entree.key;
          final texte = entree.value;
          final estSelectionne = index == indexSelectionne;

          return Padding(
            padding: EdgeInsets.only(
              right: index < options.length - 1 ? Dimensions.espaceS : 0,
            ),
            child: GestureDetector(
              onTap: () => onSelection(index),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color:
                      estSelectionne ? Couleurs.vertFonce : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  border: estSelectionne
                      ? null
                      : Border.all(color: Couleurs.bordure, width: 1),
                ),
                child: Text(
                  texte,
                  style: StylesTexte.corps.copyWith(
                    color: estSelectionne
                        ? Couleurs.blanc
                        : Couleurs.texteSecondaire,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
