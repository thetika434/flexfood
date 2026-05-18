import 'package:flutter/material.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/dimensions.dart';
import '../../constantes/styles_texte.dart';
import '../../composants/bouton_principal.dart';
import '../../navigation/routeur.dart';
import '../../services/service_transactions.dart';

class PageSaisirMatricule extends StatefulWidget {
  const PageSaisirMatricule({super.key});

  @override
  State<PageSaisirMatricule> createState() => _PageSaisirMatriculeEtat();
}

class _PageSaisirMatriculeEtat extends State<PageSaisirMatricule> {
  final _controleur = TextEditingController();
  bool _chargement = false;
  String? _erreur;

  @override
  void dispose() {
    _controleur.dispose();
    super.dispose();
  }

  Future<void> _valider() async {
    final matricule = _controleur.text.trim();
    if (matricule.isEmpty) {
      setState(() => _erreur = 'Veuillez saisir un matricule');
      return;
    }

    setState(() {
      _chargement = true;
      _erreur = null;
    });

    final etudiant =
        await ServiceTransactions.chercherEtudiantParMatricule(matricule);

    setState(() => _chargement = false);

    if (etudiant == null) {
      setState(() => _erreur = 'Matricule introuvable');
      return;
    }

    if (!mounted) return;
    Navigator.pushNamed(context, Routes.montantTransfert, arguments: etudiant);
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
        title: Text('Saisir le matricule', style: StylesTexte.titrePetit),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingPage),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: Dimensions.espaceM),
              Text('Matricule du destinataire', style: StylesTexte.titreMoyen),
              const SizedBox(height: Dimensions.espaceS),
              Text(
                'Entrez le matricule ESATIC de la personne à qui vous souhaitez envoyer de l\'argent.',
                style: StylesTexte.corpsSecondaire,
              ),
              const SizedBox(height: Dimensions.espaceXL),
              TextField(
                controller: _controleur,
                autofocus: true,
                textCapitalization: TextCapitalization.characters,
                style: StylesTexte.corps,
                decoration: InputDecoration(
                  hintText: 'Ex : 21-ESATIC-0045',
                  hintStyle: StylesTexte.corpsSecondaire,
                  prefixIcon: const Icon(Icons.badge_outlined,
                      color: Couleurs.texteSecondaire, size: 20),
                  filled: true,
                  fillColor: Couleurs.blanc,
                  errorText: _erreur,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimensions.rayonChamp),
                    borderSide: const BorderSide(color: Couleurs.bordure),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimensions.rayonChamp),
                    borderSide: const BorderSide(color: Couleurs.bordure),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimensions.rayonChamp),
                    borderSide: const BorderSide(
                        color: Couleurs.vertPrincipal, width: 1.5),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimensions.rayonChamp),
                    borderSide: const BorderSide(color: Couleurs.rouge),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimensions.rayonChamp),
                    borderSide:
                        const BorderSide(color: Couleurs.rouge, width: 1.5),
                  ),
                ),
                onSubmitted: (_) => _valider(),
              ),
              const Spacer(),
              BoutonPrincipal(
                texte: _chargement ? 'Recherche...' : 'Continuer',
                icone: Icons.arrow_forward,
                onAppui: _chargement ? () {} : _valider,
              ),
              const SizedBox(height: Dimensions.espaceM),
            ],
          ),
        ),
      ),
    );
  }
}
