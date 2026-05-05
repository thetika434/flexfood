import 'package:flutter/material.dart';
import 'couleurs.dart';

class StylesTexte {
  StylesTexte._();

  static const TextStyle titreGrand = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Couleurs.texte,
  );

  static const TextStyle titreMoyen = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Couleurs.vertFonce,
  );

  static const TextStyle titrePetit = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Couleurs.texte,
  );

  static const TextStyle corps = TextStyle(
    fontSize: 14,
    color: Couleurs.texte,
  );

  static const TextStyle corpsSecondaire = TextStyle(
    fontSize: 13,
    color: Couleurs.texteSecondaire,
  );

  static const TextStyle label = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: Couleurs.texteSecondaire,
    letterSpacing: 1.2,
  );

  static const TextStyle solde = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: Couleurs.texte,
  );

  static const TextStyle montantPositif = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Couleurs.vertVif,
  );

  static const TextStyle montantNegatif = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Couleurs.rouge,
  );

  static const TextStyle bouton = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Couleurs.blanc,
  );

  static const TextStyle lien = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Couleurs.vertPrincipal,
  );
}
