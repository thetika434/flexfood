import 'package:flutter/material.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/dimensions.dart';
import '../../constantes/styles_texte.dart';
import '../../composants/element_transaction.dart';
import '../../modeles/transaction.dart';
import '../../navigation/routeur.dart';
import '../../services/service_transactions.dart';
import '../../services/service_websocket.dart';
import '../../utilitaires/formateur.dart';

class PageHistorique extends StatefulWidget {
  const PageHistorique({super.key});

  @override
  State<PageHistorique> createState() => _PageHistoriqueEtat();
}

class _PageHistoriqueEtat extends State<PageHistorique> {
  List<Transaction> _transactions = [];
  bool _chargement = true;

  @override
  void initState() {
    super.initState();
    _charger();
    ServiceWebSocket.ajouterEcouteurTransactions(_charger);
  }

  @override
  void dispose() {
    ServiceWebSocket.retirerEcouteurTransactions(_charger);
    super.dispose();
  }

  Future<void> _charger() async {
    final transactions = await ServiceTransactions.obtenirTransactions();
    if (mounted) {
      setState(() {
        _transactions = transactions;
        _chargement = false;
      });
    }
  }

  void _naviguerVersDetail(BuildContext context, Transaction t) {
    switch (t.type) {
      case TypeTransaction.repas:
        Navigator.pushNamed(context, Routes.detailRepas, arguments: t);
      case TypeTransaction.transfertEnvoye:
        Navigator.pushNamed(context, Routes.confirmationTransfertEnvoye, arguments: t);
      case TypeTransaction.transfertRecu:
        Navigator.pushNamed(context, Routes.confirmationTransfertRecu, arguments: t);
      case TypeTransaction.rechargement:
        Navigator.pushNamed(context, Routes.confirmationRechargement, arguments: t);
    }
  }

  Map<String, List<Transaction>> _grouperParDate() {
    final Map<String, List<Transaction>> groupes = {};
    for (final t in _transactions) {
      final cle = Formateur.formaterDateGroupe(t.dateHeure);
      groupes.putIfAbsent(cle, () => []).add(t);
    }
    return groupes;
  }

  @override
  Widget build(BuildContext context) {
    final groupes = _grouperParDate();

    return Scaffold(
      backgroundColor: Couleurs.fondPrincipal,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Couleurs.blanc,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Couleurs.texte, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: Text('Historique', style: StylesTexte.titrePetit),
        centerTitle: true,
      ),
      body: SafeArea(
        child: _chargement
            ? const Center(child: CircularProgressIndicator())
            : _transactions.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.receipt_long_outlined,
                        size: 64,
                        color: Couleurs.texteSecondaire.withValues(alpha: 0.4)),
                    const SizedBox(height: Dimensions.espaceM),
                    Text('Aucune transaction',
                        style: StylesTexte.corpsSecondaire),
                  ],
                ),
              )
            : ListView(
                padding: const EdgeInsets.all(Dimensions.paddingPage),
                children: groupes.entries.map((entree) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: Dimensions.espaceS),
                        child: Text(entree.key, style: StylesTexte.label),
                      ),
                      ...entree.value.map((t) => Padding(
                            padding: const EdgeInsets.only(
                                bottom: Dimensions.espaceS),
                            child: ElementTransaction(
                              transaction: t,
                              onAppui: () => _naviguerVersDetail(context, t),
                            ),
                          )),
                      const SizedBox(height: Dimensions.espaceS),
                    ],
                  );
                }).toList(),
              ),
      ),
    );
  }
}
