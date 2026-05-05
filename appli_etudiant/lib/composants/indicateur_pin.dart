import 'package:flutter/material.dart';
import '../constantes/couleurs.dart';
import '../constantes/dimensions.dart';

class IndicateurPin extends StatelessWidget {
  final int longueur;
  final int total;

  const IndicateurPin({
    super.key,
    required this.longueur,
    this.total = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (index) {
        final rempli = index < longueur;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: Dimensions.espaceS),
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: rempli ? Couleurs.vertFonce : Colors.transparent,
            border: Border.all(
              color: rempli
                  ? Couleurs.vertFonce
                  : Couleurs.texteSecondaire.withValues(alpha: 0.4),
              width: 1.5,
            ),
          ),
        );
      }),
    );
  }
}
