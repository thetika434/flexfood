import 'package:flutter/material.dart';
import '../constantes/couleurs.dart';
import '../constantes/dimensions.dart';
import 'ligne_detail.dart';

class CarteDetailTransaction extends StatelessWidget {
  final List<LigneDetail> lignes;

  const CarteDetailTransaction({
    super.key,
    required this.lignes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Couleurs.blanc,
        borderRadius: BorderRadius.circular(Dimensions.rayonCarte),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: lignes.length,
        separatorBuilder: (_, __) =>
            const Divider(height: 1, indent: 72, color: Couleurs.bordure),
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.espaceM,
          ),
          child: lignes[index],
        ),
      ),
    );
  }
}
