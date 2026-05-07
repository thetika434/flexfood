import 'package:flutter/material.dart';
import '../modeles/transaction.dart';
import '../modeles/etudiant.dart';
import '../ecrans/accueil/page_tableau_bord.dart';
import '../ecrans/authentification/page_connexion.dart';
import '../ecrans/authentification/page_deverrouillage.dart';
import '../ecrans/historique/page_historique.dart';
import '../ecrans/confirmations/page_detail_repas.dart';
import '../ecrans/transfert/page_choisir_mode_transfert.dart';
import '../ecrans/transfert/page_saisir_matricule.dart';
import '../ecrans/transfert/page_montant_transfert.dart';
import '../ecrans/transfert/page_scanner_qr.dart';
import '../ecrans/confirmations/page_confirmation_transfert_envoye.dart';
import '../ecrans/confirmations/page_confirmation_transfert_recu.dart';
import '../ecrans/confirmations/page_confirmation_rechargement.dart';
import '../ecrans/parametres/page_changer_code_secret.dart';

class Routes {
  Routes._();

  // Noms des routes — utilise ces constantes dans tout le projet
  static const String connexion = '/connexion';
  static const String deverrouillage = '/deverrouillage';
  static const String accueil = '/accueil';
  static const String historique = '/historique';
  static const String detailRepas = '/historique/detail-repas';
  static const String choisirModeTransfert = '/transfert';
  static const String scannerQR = '/transfert/scanner';
  static const String saisirMatricule = '/transfert/matricule';
  static const String montantTransfert = '/transfert/montant';
  static const String confirmationTransfertEnvoye = '/transfert/confirmation-envoye';
  static const String confirmationTransfertRecu = '/transfert/confirmation-recu';
  static const String confirmationRechargement = '/confirmation-rechargement';
  static const String changerCodeSecret = '/parametres/changer-code';

  static Map<String, WidgetBuilder> obtenirRoutes() {
    return {
      connexion: (_) => const PageConnexion(),
      deverrouillage: (_) => const PageDeverrouillage(),
      accueil: (_) => const PageTableauBord(),
      historique: (_) => const PageHistorique(),
      detailRepas: (context) => PageDetailRepas(
            transaction: ModalRoute.of(context)!.settings.arguments
                as Transaction,
          ),
      choisirModeTransfert: (_) => const PageChoisirModeTransfert(),
      scannerQR: (_) => const PageScannerQR(),
      saisirMatricule: (_) => const PageSaisirMatricule(),
      montantTransfert: (context) => PageMontantTransfert(
            etudiant: ModalRoute.of(context)!.settings.arguments as Etudiant,
          ),
      confirmationTransfertEnvoye: (context) =>
          PageConfirmationTransfertEnvoye(
            transaction: ModalRoute.of(context)!.settings.arguments
                as Transaction,
          ),
      confirmationTransfertRecu: (context) => PageConfirmationTransfertRecu(
            transaction: ModalRoute.of(context)!.settings.arguments
                as Transaction,
          ),
      confirmationRechargement: (context) => PageConfirmationRechargement(
            transaction: ModalRoute.of(context)!.settings.arguments
                as Transaction,
          ),
      changerCodeSecret: (_) => const PageChangerCodeSecret(),
    };
  }
}
