// ============================================================
// DÉVELOPPEUR : David
// ÉCRAN       : Page Historique
// ============================================================
// DESIGN : Converti depuis "historique.html"
// ============================================================

import 'dart:async';

import 'package:flutter/material.dart';

import '../../constantes/couleurs.dart';
import '../../constantes/dimensions.dart';
import '../../constantes/styles_texte.dart';
import '../../modeles/transaction.dart';
import '../../navigation/routeur.dart';
import '../../services/service_transactions.dart';
import '../../utilitaires/formateur.dart';

enum _FiltreHistorique {
  recent,
  semaine,
  mois,
  personnalise,
}

class PageHistorique extends StatefulWidget {
  const PageHistorique({super.key});

  @override
  State<PageHistorique> createState() => _PageHistoriqueEtat();
}

class _PageHistoriqueEtat extends State<PageHistorique> {
  _FiltreHistorique _filtreSelectionne = _FiltreHistorique.recent;
  DateTimeRange? _periodePersonnalisee;
  late final List<Transaction> _transactions;

  @override
  void initState() {
    super.initState();
    _transactions = ServiceTransactions.obtenirTransactions()
      ..sort((a, b) => b.dateHeure.compareTo(a.dateHeure));
  }

  List<Transaction> get _transactionsFiltrees {
    final maintenant = DateTime.now();

    return _transactions.where((transaction) {
      final date = transaction.dateHeure;

      switch (_filtreSelectionne) {
        case _FiltreHistorique.recent:
          return true;
        case _FiltreHistorique.semaine:
          return _estDansLaSemaine(date, maintenant);
        case _FiltreHistorique.mois:
          return date.year == maintenant.year && date.month == maintenant.month;
        case _FiltreHistorique.personnalise:
          final periode = _periodePersonnalisee;
          return periode == null || _estDansLaPeriode(date, periode);
      }
    }).toList();
  }

  bool _estDansLaSemaine(DateTime date, DateTime reference) {
    final debutSemaine = DateTime(
      reference.year,
      reference.month,
      reference.day - reference.weekday + DateTime.monday,
    );
    final finSemaine = debutSemaine.add(const Duration(days: 7));

    return !date.isBefore(debutSemaine) && date.isBefore(finSemaine);
  }

  bool _estDansLaPeriode(DateTime date, DateTimeRange periode) {
    final debut = DateTime(
      periode.start.year,
      periode.start.month,
      periode.start.day,
    );
    final fin = DateTime(
      periode.end.year,
      periode.end.month,
      periode.end.day,
    ).add(const Duration(days: 1));

    return !date.isBefore(debut) && date.isBefore(fin);
  }

  Map<String, List<Transaction>> _grouperTransactions(
    List<Transaction> transactions,
  ) {
    final groupes = <String, List<Transaction>>{};

    for (final transaction in transactions) {
      final titreGroupe = Formateur.formaterDateGroupe(transaction.dateHeure);
      groupes.putIfAbsent(titreGroupe, () => []).add(transaction);
    }

    return groupes;
  }

  void _selectionnerFiltre(_FiltreHistorique filtre) {
    if (filtre == _FiltreHistorique.personnalise) {
      unawaited(_choisirPeriodePersonnalisee());
      return;
    }

    setState(() {
      _filtreSelectionne = filtre;
    });
  }

  Future<void> _choisirPeriodePersonnalisee() async {
    final maintenant = DateTime.now();
    final periode = await showDateRangePicker(
      context: context,
      firstDate: DateTime(maintenant.year - 2),
      lastDate: DateTime(maintenant.year + 1),
      initialDateRange: _periodePersonnalisee,
      helpText: 'Choisir une période',
      saveText: 'Valider',
      cancelText: 'Annuler',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Couleurs.vertFonce,
                  secondary: Couleurs.vertVif,
                  surface: Couleurs.blanc,
                ),
          ),
          child: child!,
        );
      },
    );

    if (periode == null || !mounted) return;

    setState(() {
      _periodePersonnalisee = periode;
      _filtreSelectionne = _FiltreHistorique.personnalise;
    });
  }

  void _ouvrirTransaction(Transaction transaction) {
    switch (transaction.type) {
      case TypeTransaction.repas:
        Navigator.pushNamed(
          context,
          Routes.detailRepas,
          arguments: transaction,
        );
        return;
      case TypeTransaction.rechargement:
        Navigator.pushNamed(
          context,
          Routes.confirmationRechargement,
          arguments: transaction,
        );
        return;
      case TypeTransaction.transfertEnvoye:
      case TypeTransaction.transfertRecu:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final groupes = _grouperTransactions(_transactionsFiltrees);

    return Scaffold(
      backgroundColor: Couleurs.fondPrincipal,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            Dimensions.paddingPage,
            Dimensions.espaceM,
            Dimensions.paddingPage,
            Dimensions.espaceXL,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _BoutonRetour(onAppui: () => Navigator.maybePop(context)),
              const SizedBox(height: Dimensions.espaceL),
              const Text('Historique', style: StylesTexte.titreGrand),
              const SizedBox(height: Dimensions.espaceL),
              _FiltresHistorique(
                filtreSelectionne: _filtreSelectionne,
                onSelection: _selectionnerFiltre,
              ),
              const SizedBox(height: Dimensions.espaceL),
              if (groupes.isEmpty)
                const _EtatVide()
              else
                ...groupes.entries.map((groupe) {
                  return _SectionTransactions(
                    titre: groupe.key,
                    transactions: groupe.value,
                    onTransactionAppui: _ouvrirTransaction,
                  );
                }),
            ],
          ),
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
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onAppui,
        customBorder: const CircleBorder(),
        child: const SizedBox(
          width: 44,
          height: 44,
          child: Icon(
            Icons.arrow_back,
            color: Couleurs.texte,
            size: 34,
          ),
        ),
      ),
    );
  }
}

class _FiltresHistorique extends StatelessWidget {
  final _FiltreHistorique filtreSelectionne;
  final ValueChanged<_FiltreHistorique> onSelection;

  const _FiltresHistorique({
    required this.filtreSelectionne,
    required this.onSelection,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _PuceFiltre(
            libelle: "Aujourd'hui",
            selectionnee: filtreSelectionne == _FiltreHistorique.recent,
            onAppui: () => onSelection(_FiltreHistorique.recent),
          ),
          const SizedBox(width: Dimensions.espaceS),
          _PuceFiltre(
            libelle: 'Cette semaine',
            selectionnee: filtreSelectionne == _FiltreHistorique.semaine,
            onAppui: () => onSelection(_FiltreHistorique.semaine),
          ),
          const SizedBox(width: Dimensions.espaceS),
          _PuceFiltre(
            libelle: 'Ce mois',
            selectionnee: filtreSelectionne == _FiltreHistorique.mois,
            onAppui: () => onSelection(_FiltreHistorique.mois),
          ),
          const SizedBox(width: Dimensions.espaceS),
          _PuceFiltre(
            libelle: 'Personnalisé',
            icone: Icons.calendar_today,
            selectionnee:
                filtreSelectionne == _FiltreHistorique.personnalise,
            transparenteQuandInactive: true,
            onAppui: () => onSelection(_FiltreHistorique.personnalise),
          ),
        ],
      ),
    );
  }
}

class _PuceFiltre extends StatelessWidget {
  final String libelle;
  final IconData? icone;
  final bool selectionnee;
  final bool transparenteQuandInactive;
  final VoidCallback onAppui;

  const _PuceFiltre({
    required this.libelle,
    required this.selectionnee,
    required this.onAppui,
    this.icone,
    this.transparenteQuandInactive = false,
  });

  @override
  Widget build(BuildContext context) {
    final couleurFond = selectionnee
        ? Couleurs.vertFonce
        : transparenteQuandInactive
            ? Colors.transparent
            : Couleurs.surfaceContainer;
    final couleurTexte =
        selectionnee ? Couleurs.blanc : Couleurs.texteSecondaire;

    return Material(
      color: couleurFond,
      borderRadius: BorderRadius.circular(Dimensions.rayonBouton),
      child: InkWell(
        onTap: onAppui,
        borderRadius: BorderRadius.circular(Dimensions.rayonBouton),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.rayonBouton),
            border: Border.all(
              color: transparenteQuandInactive && !selectionnee
                  ? Couleurs.bordure
                  : Colors.transparent,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icone != null) ...[
                Icon(icone, size: 18, color: couleurTexte),
                const SizedBox(width: Dimensions.espaceS),
              ],
              Text(
                libelle,
                style: StylesTexte.label.copyWith(
                  color: couleurTexte,
                  fontSize: 12,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTransactions extends StatelessWidget {
  final String titre;
  final List<Transaction> transactions;
  final ValueChanged<Transaction> onTransactionAppui;

  const _SectionTransactions({
    required this.titre,
    required this.transactions,
    required this.onTransactionAppui,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimensions.espaceL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SeparateurGroupe(titre: titre),
          const SizedBox(height: Dimensions.espaceM),
          ...transactions.map((transaction) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _CarteTransaction(
                transaction: transaction,
                onAppui: () => onTransactionAppui(transaction),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _SeparateurGroupe extends StatelessWidget {
  final String titre;

  const _SeparateurGroupe({required this.titre});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(titre.toUpperCase(), style: StylesTexte.label),
        const SizedBox(width: Dimensions.espaceS),
        const Expanded(
          child: Divider(
            height: 1,
            thickness: 1,
            color: Couleurs.surfaceContainer,
          ),
        ),
      ],
    );
  }
}

class _CarteTransaction extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback onAppui;

  const _CarteTransaction({
    required this.transaction,
    required this.onAppui,
  });

  IconData get _icone {
    switch (transaction.type) {
      case TypeTransaction.repas:
        return Icons.restaurant;
      case TypeTransaction.rechargement:
        return Icons.account_balance_wallet;
      case TypeTransaction.transfertEnvoye:
        return Icons.send;
      case TypeTransaction.transfertRecu:
        return Icons.south_west;
    }
  }

  Color get _couleurFondIcone {
    switch (transaction.type) {
      case TypeTransaction.repas:
        return Couleurs.fondIconeRepas;
      case TypeTransaction.rechargement:
        return Couleurs.fondIconeRechargement;
      case TypeTransaction.transfertRecu:
        return Couleurs.fondIconeTransfertRecu;
      case TypeTransaction.transfertEnvoye:
        return Couleurs.fondIconeTransfertEnvoye;
    }
  }

  Color get _couleurIcone {
    switch (transaction.type) {
      case TypeTransaction.repas:
        return Couleurs.iconeRepas;
      case TypeTransaction.rechargement:
        return Couleurs.iconeRechargement;
      case TypeTransaction.transfertRecu:
        return Couleurs.iconeTransfertRecu;
      case TypeTransaction.transfertEnvoye:
        return Couleurs.iconeTransfertEnvoye;
    }
  }

  bool get _estOuvrable {
    return transaction.type == TypeTransaction.repas ||
        transaction.type == TypeTransaction.rechargement;
  }

  @override
  Widget build(BuildContext context) {
    final styleMontant = transaction.estPositif
        ? StylesTexte.montantPositif
        : StylesTexte.montantNegatif;

    return Material(
      color: Couleurs.blanc,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: _estOuvrable ? onAppui : null,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(Dimensions.espaceM),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Couleurs.surfaceContainer),
            boxShadow: const [
              BoxShadow(
                color: Color(0x05000000),
                blurRadius: 20,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _couleurFondIcone,
                ),
                child: Icon(_icone, color: _couleurIcone, size: 24),
              ),
              const SizedBox(width: Dimensions.espaceM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.titre,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: StylesTexte.corps.copyWith(
                        color: Couleurs.vertFonce,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      Formateur.formaterDate(transaction.dateHeure),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: StylesTexte.corpsSecondaire.copyWith(
                        color: Couleurs.texteSecondaire.withOpacity(0.72),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: Dimensions.espaceS),
              Text(
                Formateur.formaterMontantTransaction(transaction.montant),
                textAlign: TextAlign.end,
                style: styleMontant.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EtatVide extends StatelessWidget {
  const _EtatVide();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.espaceL,
        vertical: Dimensions.espaceXL,
      ),
      decoration: BoxDecoration(
        color: Couleurs.blanc,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Couleurs.surfaceContainer),
      ),
      child: Column(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Couleurs.iconeGrise,
            ),
            child: const Icon(
              Icons.receipt_long,
              color: Couleurs.texteSecondaire,
            ),
          ),
          const SizedBox(height: Dimensions.espaceM),
          Text(
            'Aucune transaction',
            style: StylesTexte.corps.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: Dimensions.espaceXS),
          const Text(
            'Les opérations de cette période apparaîtront ici.',
            textAlign: TextAlign.center,
            style: StylesTexte.corpsSecondaire,
          ),
        ],
      ),
    );
  }
}
