// ============================================================
// DÉVELOPPEUR : David
// ÉCRAN       : Page Confirmation Rechargement
// ============================================================
// DESIGN : Voir fichier HTML "page confirmation rechargemen.html"
// ============================================================

import 'package:flutter/material.dart';

import '../../constantes/couleurs.dart';
import '../../constantes/dimensions.dart';
import '../../constantes/styles_texte.dart';
import '../../modeles/transaction.dart';
import '../../utilitaires/formateur.dart';

class PageConfirmationRechargement extends StatelessWidget {
  final Transaction transaction;

  const PageConfirmationRechargement({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Couleurs.fondPrincipal,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingPage,
              ),
              child: Column(
                children: [
                  const Expanded(
                    child: SizedBox.shrink(),
                  ),
                  Flexible(
                    flex: 10,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _EnteteConfirmation(transaction: transaction),
                          const SizedBox(height: Dimensions.espaceXL),
                          _CarteDetailsRechargement(transaction: transaction),
                        ],
                      ),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox.shrink(),
                  ),
                  const _IndicateurBas(),
                  const SizedBox(height: Dimensions.espaceL),
                ],
              ),
            ),
            const Positioned(
              top: Dimensions.espaceL,
              left: Dimensions.espaceXS,
              child: _BoutonRetourVisuel(),
            ),
          ],
        ),
      ),
    );
  }
}

class _BoutonRetourVisuel extends StatelessWidget {
  const _BoutonRetourVisuel();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Couleurs.iconeGrise,
        boxShadow: [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: const Icon(
        Icons.arrow_back,
        color: Couleurs.texte,
        size: 30,
      ),
    );
  }
}

class _EnteteConfirmation extends StatelessWidget {
  final Transaction transaction;

  const _EnteteConfirmation({
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimensions.espaceXXL,
        bottom: Dimensions.espaceS,
      ),
      child: Column(
        children: [
          Container(
            width: 96,
            height: 96,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Couleurs.fondIconeRechargement,
              boxShadow: [
                BoxShadow(
                  color: Color(0x10000000),
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(
              Icons.account_balance_wallet,
              color: Couleurs.iconeRechargement,
              size: 48,
            ),
          ),
          const SizedBox(height: Dimensions.espaceL),
          Text(
            'Rechargement réussi',
            textAlign: TextAlign.center,
            style: StylesTexte.titreGrand.copyWith(
              color: Couleurs.vertPrincipal,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: Dimensions.espaceS),
          Text(
            Formateur.formaterMontantTransaction(transaction.montant),
            textAlign: TextAlign.center,
            style: StylesTexte.titreGrand.copyWith(
              color: Couleurs.texte,
              fontSize: 32,
              fontWeight: FontWeight.w800,
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }
}

class _CarteDetailsRechargement extends StatelessWidget {
  final Transaction transaction;

  const _CarteDetailsRechargement({
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 448),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(Dimensions.espaceL),
        decoration: BoxDecoration(
          color: Couleurs.blanc,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Couleurs.surfaceContainer),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 80,
              offset: Offset(0, 40),
            ),
          ],
        ),
        child: Column(
          children: [
            const _LigneDetailRechargement(
              icone: Icons.payments,
              label: 'MÉTHODE',
              valeur: Text(
                'Service de Restauration',
                style: _StylesDetails.valeur,
              ),
            ),
            const _SeparateurDetails(),
            _LigneDetailRechargement(
              icone: Icons.schedule,
              label: 'DATE & HEURE',
              valeur: Text(
                Formateur.formaterDate(transaction.dateHeure),
                style: _StylesDetails.valeur,
              ),
            ),
            const _SeparateurDetails(),
            const _LigneDetailRechargement(
              icone: Icons.check_circle,
              label: 'STATUT',
              valeur: _PastilleSucces(),
            ),
            const _SeparateurDetails(),
            _LigneDetailRechargement(
              icone: Icons.label,
              label: 'ID TRANSACTION',
              valeur: Text(
                transaction.id,
                style: _StylesDetails.valeur,
              ),
              suffixe: const _BoutonCopieVisuel(),
            ),
          ],
        ),
      ),
    );
  }
}

class _LigneDetailRechargement extends StatelessWidget {
  final IconData icone;
  final String label;
  final Widget valeur;
  final Widget? suffixe;

  const _LigneDetailRechargement({
    required this.icone,
    required this.label,
    required this.valeur,
    this.suffixe,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFF4F4F0),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icone,
            color: Couleurs.vertPrincipal,
            size: Dimensions.tailleIcone,
          ),
        ),
        const SizedBox(width: Dimensions.espaceM),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: StylesTexte.label.copyWith(
                  fontSize: 12,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: Dimensions.espaceXS),
              valeur,
            ],
          ),
        ),
        if (suffixe != null) ...[
          const SizedBox(width: Dimensions.espaceS),
          suffixe!,
        ],
      ],
    );
  }
}

class _SeparateurDetails extends StatelessWidget {
  const _SeparateurDetails();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.espaceL),
      child: Divider(
        height: 1,
        thickness: 1,
        color: Couleurs.iconeGrise,
      ),
    );
  }
}

class _PastilleSucces extends StatelessWidget {
  const _PastilleSucces();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Couleurs.fondIconeRechargement,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        'Succès',
        style: StylesTexte.label.copyWith(
          color: Couleurs.iconeRechargement,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),
      ),
    );
  }
}

class _BoutonCopieVisuel extends StatelessWidget {
  const _BoutonCopieVisuel();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 40,
      height: 40,
      child: Icon(
        Icons.content_copy,
        color: Couleurs.vertVif,
        size: 22,
      ),
    );
  }
}

class _IndicateurBas extends StatelessWidget {
  const _IndicateurBas();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128,
      height: 6,
      decoration: BoxDecoration(
        color: const Color(0x331A1C1A),
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }
}

class _StylesDetails {
  _StylesDetails._();

  static const TextStyle valeur = TextStyle(
    color: Couleurs.texte,
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );
}
