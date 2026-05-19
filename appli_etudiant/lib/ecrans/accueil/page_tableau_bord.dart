import 'package:flutter/material.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/dimensions.dart';
import '../../constantes/styles_texte.dart';
import '../../composants/carte_qr_code.dart';
import '../../composants/element_transaction.dart';
import '../../modeles/transaction.dart';
import '../../navigation/routeur.dart';
import '../../services/service_authentification.dart';
import '../../services/service_transactions.dart';
import '../../utilitaires/formateur.dart';

class PageTableauBord extends StatefulWidget {
  const PageTableauBord({super.key});

  @override
  State<PageTableauBord> createState() => _PageTableauBordEtat();
}

class _PageTableauBordEtat extends State<PageTableauBord> {
  bool _soldeVisible = true;
  List<Transaction> _dernieresTransactions = [];
  bool _chargement = true;

  @override
  void initState() {
    super.initState();
    _charger();
  }

  Future<void> _charger() async {
    final transactions = await ServiceTransactions.obtenirDernieresTransactions();
    await ServiceTransactions.rafraichirEtudiant();
    if (mounted) {
      setState(() {
        _dernieresTransactions = transactions;
        _chargement = false;
      });
    }
  }

  void _basculerSolde() {
    setState(() {
      _soldeVisible = !_soldeVisible;
    });
  }

  Future<void> _confirmerDeconnexion(BuildContext context) async {
    final confirme = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Déconnexion'),
        content: const Text('Voulez-vous vraiment vous déconnecter ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Déconnecter',
                style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirme == true && context.mounted) {
      ServiceAuthentification.deconnecter();
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.connexion, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final etudiant = Session.etudiantConnecte;
    if (etudiant == null) return const SizedBox();

    return Scaffold(
      backgroundColor: Couleurs.fondPrincipal,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _charger,
          color: Couleurs.vertPrincipal,
          child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(Dimensions.paddingPage),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Menu en haut à droite : paramètres + déconnexion
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, Routes.changerCodeSecret),
                    child: const Icon(Icons.settings,
                        color: Couleurs.texte, size: 26),
                  ),
                  GestureDetector(
                    onTap: () => _confirmerDeconnexion(context),
                    child: const Icon(Icons.logout,
                        color: Couleurs.texteSecondaire, size: 24),
                  ),
                ],
              ),

              const SizedBox(height: Dimensions.espaceL),

              // Solde avec bouton œil
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _soldeVisible
                          ? '${Formateur.formaterSolde(etudiant.solde)} '
                          : '••••••••••',
                      style: StylesTexte.solde,
                    ),
                    const SizedBox(width: Dimensions.espaceS),
                    GestureDetector(
                      onTap: _basculerSolde,
                      child: Icon(
                        _soldeVisible ? Icons.visibility_off : Icons.visibility,
                        color: Couleurs.texteSecondaire,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: Dimensions.espaceL),

              // Carte QR Code
              CarteQRCode(
                donneesQR: etudiant.codeQR,
                onScannerAppui: () =>
                    Navigator.pushNamed(context, Routes.scannerQR),
              ),

              const SizedBox(height: Dimensions.espaceM),

              // Boutons d'action : Transfert + Historique
              Row(
                children: [
                  Expanded(
                    child: _BoutonAction(
                      icone: Icons.currency_exchange,
                      label: 'Transfert',
                      couleurFond: Couleurs.fondIconeTransfertRecu,
                      couleurIcone: Couleurs.texteSecondaire,
                      onAppui: () => Navigator.pushNamed(
                          context, Routes.choisirModeTransfert),
                    ),
                  ),
                  const SizedBox(width: Dimensions.espaceM),
                  Expanded(
                    child: _BoutonAction(
                      icone: Icons.receipt,
                      label: 'Historique',
                      couleurFond: Couleurs.iconeGrise.withValues(alpha: 0.25),
                      couleurIcone: Couleurs.texteSecondaire,
                      onAppui: () =>
                          Navigator.pushNamed(context, Routes.historique),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: Dimensions.espaceL),

              // Titre section transactions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Transactions Recentes', style: StylesTexte.titrePetit),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.historique),
                    child: Text('Voir Tout', style: StylesTexte.lien),
                  ),
                ],
              ),

              const SizedBox(height: Dimensions.espaceS),

              // Liste des transactions récentes
              if (_chargement)
                const Center(child: CircularProgressIndicator())
              else
              Column(
                children: _dernieresTransactions.map((transaction) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: Dimensions.espaceS),
                    child: ElementTransaction(
                      transaction: transaction,
                      onAppui: () {
                        switch (transaction.type) {
                          case TypeTransaction.repas:
                            Navigator.pushNamed(context, Routes.detailRepas, arguments: transaction);
                          case TypeTransaction.transfertEnvoye:
                            Navigator.pushNamed(context, Routes.confirmationTransfertEnvoye, arguments: transaction);
                          case TypeTransaction.transfertRecu:
                            Navigator.pushNamed(context, Routes.confirmationTransfertRecu, arguments: transaction);
                          case TypeTransaction.rechargement:
                            Navigator.pushNamed(context, Routes.confirmationRechargement, arguments: transaction);
                        }
                      },
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: Dimensions.espaceL),

              // Lien changer code secret en bas
              Center(
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, Routes.changerCodeSecret),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.lock_reset,
                          size: 16, color: Couleurs.texteSecondaire),
                      SizedBox(width: 6),
                      Text('Changer le code secret',
                          style: StylesTexte.corpsSecondaire),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: Dimensions.espaceL),
            ],
          ),
        ),
        ),
      ),
    );
  }
}

// Widget privé : bouton d'action (Transfert / Historique)
class _BoutonAction extends StatelessWidget {
  final IconData icone;
  final String label;
  final Color couleurFond;
  final Color couleurIcone;
  final VoidCallback onAppui;

  const _BoutonAction({
    required this.icone,
    required this.label,
    required this.couleurFond,
    required this.couleurIcone,
    required this.onAppui,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAppui,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: Couleurs.blanc,
          borderRadius: BorderRadius.circular(Dimensions.rayonCarte),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: couleurFond,
              ),
              child: Icon(icone, color: couleurIcone, size: 22),
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: StylesTexte.corps.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
