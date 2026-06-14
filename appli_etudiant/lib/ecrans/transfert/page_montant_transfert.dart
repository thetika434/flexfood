import 'package:flutter/material.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/dimensions.dart';
import '../../constantes/styles_texte.dart';
import '../../composants/clavier_numerique.dart';
import '../../composants/avatar_utilisateur.dart';
import '../../composants/bouton_principal.dart';
import '../../modeles/etudiant.dart';
import '../../navigation/routeur.dart';
import '../../services/service_transactions.dart';
import '../../utilitaires/formateur.dart';

class PageMontantTransfert extends StatefulWidget {
  final Etudiant etudiant;

  const PageMontantTransfert({super.key, required this.etudiant});

  @override
  State<PageMontantTransfert> createState() => _PageMontantTransfertEtat();
}

class _PageMontantTransfertEtat extends State<PageMontantTransfert> {
  String _saisie = '';
  String? _erreur;
  bool _chargement = false;

  int get _montant => int.tryParse(_saisie) ?? 0;

  void _ajouterChiffre(String chiffre) {
    if (_saisie.length >= 6) return;
    setState(() {
      _saisie += chiffre;
      _erreur = null;
    });
  }

  void _effacer() {
    if (_saisie.isEmpty) return;
    setState(() => _saisie = _saisie.substring(0, _saisie.length - 1));
  }

  Future<void> _valider() async {
    if (_montant <= 0) {
      setState(() => _erreur = 'Veuillez saisir un montant');
      return;
    }
    if (_montant % 100 != 0) {
      setState(() => _erreur = 'Le montant doit être un multiple de 100 FCFA');
      return;
    }

    setState(() {
      _chargement = true;
      _erreur = null;
    });

    try {
      final transaction = await ServiceTransactions.effectuerTransfert(
        widget.etudiant.matricule,
        _montant,
      );
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.confirmationTransfertEnvoye,
        (route) => route.settings.name == Routes.accueil,
        arguments: transaction,
      );
    } catch (e) {
      setState(() {
        _erreur = e.toString().replaceFirst('Exception: ', '');
        _chargement = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: Dimensions.espaceL),

            // Avatar + nom du destinataire
            AvatarUtilisateur(
              taille: Dimensions.tailleAvatarGrand,
              initiales: widget.etudiant.initiales,
              couleurFond: Couleurs.vertPrincipal,
            ),
            const SizedBox(height: Dimensions.espaceS),
            Text(widget.etudiant.nomComplet, style: StylesTexte.titrePetit),
            Text(widget.etudiant.matricule, style: StylesTexte.corpsSecondaire),

            const SizedBox(height: Dimensions.espaceXL),

            // Montant affiché
            Text(
              _saisie.isEmpty
                  ? '0 FCFA'
                  : '${Formateur.formaterSolde(_montant)} FCFA',
              style: StylesTexte.solde.copyWith(fontSize: 38),
            ),

            if (_erreur != null) ...[
              const SizedBox(height: Dimensions.espaceS),
              Text(_erreur!,
                  style: StylesTexte.corpsSecondaire
                      .copyWith(color: Couleurs.rouge)),
            ],

            const SizedBox(height: Dimensions.espaceS),
            Text('Multiple de 100 FCFA uniquement',
                style: StylesTexte.corpsSecondaire),

            const Spacer(),

            // Clavier numérique
            ClavierNumerique(
              onChiffre: _ajouterChiffre,
              onEffacer: _effacer,
            ),

            const SizedBox(height: Dimensions.espaceM),

            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingPage),
              child: BoutonPrincipal(
                texte: _chargement ? 'Envoi...' : 'Envoyer',
                icone: Icons.send,
                onAppui: _chargement ? () {} : _valider,
              ),
            ),
            const SizedBox(height: Dimensions.espaceL),
          ],
        ),
      ),
    );
  }
}
