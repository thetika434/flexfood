// ============================================================
// DÉVELOPPEUR : Bigo
// ÉCRAN       : Page Détail Repas
// ============================================================
// DESIGN : Converti depuis "page confirmation rechargemen.html"
// ============================================================

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constantes/couleurs.dart';
import '../../constantes/dimensions.dart';
import '../../constantes/styles_texte.dart';
import '../../modeles/transaction.dart';
import '../../utilitaires/formateur.dart';

class PageDetailRepas extends StatelessWidget {
  final Transaction transaction;

  const PageDetailRepas({super.key, required this.transaction});

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
                  const Expanded(child: SizedBox.shrink()),
                  Flexible(
                    flex: 10,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _EnteteDetailRepas(transaction: transaction),
                          const SizedBox(height: Dimensions.espaceXL),
                          _CarteDetailsRepas(transaction: transaction),
                        ],
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox.shrink()),
                  const _IndicateurBas(),
                  const SizedBox(height: Dimensions.espaceL),
                ],
              ),
            ),
            Positioned(
              top: Dimensions.espaceL,
              left: Dimensions.espaceXS,
              child: _BoutonRetour(
                onAppui: () {
                  Navigator.maybePop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BoutonRetour extends StatelessWidget {
  final VoidCallback onAppui;

  const _BoutonRetour({required this.onAppui});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Couleurs.iconeGrise,
      shape: const CircleBorder(),
      elevation: 1,
      child: InkWell(
        onTap: onAppui,
        customBorder: const CircleBorder(),
        child: const SizedBox(
          width: 48,
          height: 48,
          child: Icon(
            Icons.arrow_back,
            color: Couleurs.texte,
            size: 30,
          ),
        ),
      ),
    );
  }
}

class _EnteteDetailRepas extends StatelessWidget {
  final Transaction transaction;

  const _EnteteDetailRepas({required this.transaction});

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
              color: Couleurs.fondIconeRepas,
              boxShadow: [
                BoxShadow(
                  color: Color(0x10000000),
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(
              Icons.restaurant,
              color: Couleurs.iconeRepas,
              size: 48,
            ),
          ),
          const SizedBox(height: Dimensions.espaceL),
          Text(
            'Repas confirmé',
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

class _CarteDetailsRepas extends StatelessWidget {
  final Transaction transaction;

  const _CarteDetailsRepas({required this.transaction});

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
            _LigneDetailRepas(
              icone: Icons.payments,
              label: 'MÉTHODE',
              valeur: Text(
                'Service de Restauration',
                style: _StylesDetails.valeur,
              ),
            ),
            const _SeparateurDetails(),
            _LigneDetailRepas(
              icone: Icons.restaurant_menu,
              label: 'REPAS',
              valeur: Text(
                transaction.titre,
                style: _StylesDetails.valeur,
              ),
            ),
            const _SeparateurDetails(),
            _LigneDetailRepas(
              icone: Icons.schedule,
              label: 'DATE & HEURE',
              valeur: Text(
                Formateur.formaterDate(transaction.dateHeure),
                style: _StylesDetails.valeur,
              ),
            ),
            const _SeparateurDetails(),
            const _LigneDetailRepas(
              icone: Icons.check_circle,
              label: 'STATUT',
              valeur: _PastilleSucces(),
            ),
            const _SeparateurDetails(),
            _LigneDetailRepas(
              icone: Icons.label,
              label: 'ID TRANSACTION',
              valeur: Text(
                transaction.id,
                style: _StylesDetails.valeur,
              ),
              suffixe: _BoutonCopie(transactionId: transaction.id),
            ),
          ],
        ),
      ),
    );
  }
}

class _LigneDetailRepas extends StatelessWidget {
  final IconData icone;
  final String label;
  final Widget valeur;
  final Widget? suffixe;

  const _LigneDetailRepas({
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

class _BoutonCopie extends StatelessWidget {
  final String transactionId;

  const _BoutonCopie({required this.transactionId});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () => _copierTransaction(context),
        borderRadius: BorderRadius.circular(10),
        child: const SizedBox(
          width: 40,
          height: 40,
          child: Icon(
            Icons.content_copy,
            color: Couleurs.vertVif,
            size: 22,
          ),
        ),
      ),
    );
  }

  void _copierTransaction(BuildContext context) {
    unawaited(Clipboard.setData(ClipboardData(text: transactionId)));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('ID transaction copié')),
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
