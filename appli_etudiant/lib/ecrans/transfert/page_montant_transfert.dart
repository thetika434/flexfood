import 'package:flutter/material.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/dimensions.dart';
import '../../modeles/etudiant.dart';
import '../../composants/avatar_utilisateur.dart';
import '../../composants/clavier_numerique.dart';
import '../../composants/bouton_principal.dart';
import '../../navigation/routeur.dart';
import '../../services/service_transactions.dart';

class PageMontantTransfert extends StatefulWidget {
  final Etudiant etudiant;

  const PageMontantTransfert({super.key, required this.etudiant});

  @override
  State<PageMontantTransfert> createState() => _PageMontantTransfertEtat();
}

class _PageMontantTransfertEtat extends State<PageMontantTransfert> {
  String _montant = "";

  void _ajouterChiffre(String chiffre) {
    if (_montant.length < 6) {
      setState(() {
        _montant += chiffre;
      });
    }
  }

  void _effacer() {
    if (_montant.isNotEmpty) {
      setState(() {
        _montant = _montant.substring(0, _montant.length - 1);
      });
    }
  }

  void _valider() {
    if (_montant.isEmpty) return;
    int montantEntier = int.parse(_montant);

    if (montantEntier % 100 != 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Le montant doit être un multiple de 100 FCFA"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final transaction = ServiceTransactions.effectuerTransfert(
        widget.etudiant.matricule, montantEntier);

    if (transaction != null) {
      Navigator.pushReplacementNamed(
        context,
        Routes.confirmationTransfertEnvoye,
        arguments: transaction,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Solde insuffisant ou erreur de transfert"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Couleurs.fondPrincipal,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Couleurs.texte),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          children: [
            const Text(
              "TRANSFÉRER À",
              style: TextStyle(
                fontSize: 10,
                color: Couleurs.texteSecondaire,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              widget.etudiant.prenom.toLowerCase(),
              style: const TextStyle(
                fontSize: 16,
                color: Couleurs.texte,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Couleurs.texte),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: Dimensions.espaceL),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const AvatarUtilisateur(
                  taille: 90,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Couleurs.fondPrincipal,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(2),
                  child: const Icon(
                    Icons.check_circle,
                    color: Couleurs.vertFonce,
                    size: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: Dimensions.espaceXL),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  _montant.isEmpty ? "0" : _montant,
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Couleurs.texte,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  "FCFA",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Couleurs.vertFonce,
                  ),
                ),
              ],
            ),
            const Spacer(),
            ClavierNumerique(
              onChiffre: _ajouterChiffre,
              onEffacer: _effacer,
            ),
            const SizedBox(height: Dimensions.espaceM),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingPage,
                  vertical: Dimensions.espaceL),
              child: BoutonPrincipal(
                texte: "Envoyer",
                icone: Icons.send_outlined,
                onAppui: _valider,
              ),
            ),
            const SizedBox(height: Dimensions.espaceM),
          ],
        ),
      ),
    );
  }
}
