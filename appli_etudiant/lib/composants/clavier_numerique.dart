import 'package:flutter/material.dart';
import '../constantes/couleurs.dart';
import '../constantes/styles_texte.dart';

class ClavierNumerique extends StatelessWidget {
  final Function(String) onChiffre;
  final VoidCallback onEffacer;
  final bool avecVirgule;

  const ClavierNumerique({
    super.key,
    required this.onChiffre,
    required this.onEffacer,
    this.avecVirgule = false,
  });

  Widget _touche(Widget enfant, VoidCallback onAppui) {
    return Expanded(
      child: GestureDetector(
        onTap: onAppui,
        child: Container(
          height: 70,
          alignment: Alignment.center,
          child: enfant,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = StylesTexte.titreMoyen.copyWith(fontSize: 26);

    return Column(
      children: [
        Row(children: [
          _touche(Text('1', style: style), () => onChiffre('1')),
          _touche(Text('2', style: style), () => onChiffre('2')),
          _touche(Text('3', style: style), () => onChiffre('3')),
        ]),
        Row(children: [
          _touche(Text('4', style: style), () => onChiffre('4')),
          _touche(Text('5', style: style), () => onChiffre('5')),
          _touche(Text('6', style: style), () => onChiffre('6')),
        ]),
        Row(children: [
          _touche(Text('7', style: style), () => onChiffre('7')),
          _touche(Text('8', style: style), () => onChiffre('8')),
          _touche(Text('9', style: style), () => onChiffre('9')),
        ]),
        Row(children: [
          avecVirgule
              ? _touche(Text(',', style: style), () => onChiffre(','))
              : Expanded(child: Container(height: 70)),
          _touche(Text('0', style: style), () => onChiffre('0')),
          _touche(
            const Icon(Icons.backspace_outlined,
                size: 24, color: Couleurs.vertFonce),
            onEffacer,
          ),
        ]),
      ],
    );
  }
}
