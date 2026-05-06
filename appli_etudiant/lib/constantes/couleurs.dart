import 'package:flutter/material.dart';

class Couleurs {
  Couleurs._();

  // Couleurs primaires de l'application
  static const Color vertFonce     = Color(0xFF024618); // primary
  static const Color vertPrincipal = Color(0xFF024618); // primary
  static const Color vertVif       = Color(0xFF006E2A); // secondary
  static const Color vertCarte     = Color(0xFF3EC45A); // carte QR (inchangé)

  // Fonds de page et surfaces
  static const Color fondPrincipal    = Color(0xFFFAF9F6); // background
  static const Color surfaceContainer = Color(0xFFE8E8E5); // surface-container-high
  static const Color blanc            = Color(0xFFFFFFFF); // surface-container-lowest

  // Textes
  static const Color texte           = Color(0xFF1A1C1A); // on-surface
  static const Color texteSecondaire = Color(0xFF41493F); // on-surface-variant

  // Bordures
  static const Color bordure    = Color(0xFFC0C9BC); // outline-variant
  static const Color iconeGrise = Color(0xFFE2E3DF); // surface-container-highest

  // Erreur / montant négatif
  static const Color rouge = Color(0xFFD32F2F); // text-debit

  // ── Fonds des icônes de transaction ──────────────────────
  static const Color fondIconeRepas           = Color(0xFFB1F2B2); // primary-fixed
  static const Color fondIconeTransfertRecu   = Color(0xFF5CFD80); // secondary-container
  static const Color fondIconeRechargement    = Color(0xFF5CFD80); // secondary-container
  static const Color fondIconeTransfertEnvoye = Color(0xFFE2E3DF); // surface-container-highest

  // ── Couleurs des symboles dans les icônes ─────────────────
  static const Color iconeRepas           = Color(0xFF024618); // on-primary-fixed → primary
  static const Color iconeTransfertRecu   = Color(0xFF00732C); // on-secondary-container
  static const Color iconeRechargement    = Color(0xFF00732C); // on-secondary-container
  static const Color iconeTransfertEnvoye = Color(0xFF393C3B); // tertiary

  // ── Montants ──────────────────────────────────────────────
  static const Color montantPositifCouleur = Color(0xFF00A651); // text-credit
  static const Color montantNegatifCouleur = Color(0xFFD32F2F); // text-debit
}
