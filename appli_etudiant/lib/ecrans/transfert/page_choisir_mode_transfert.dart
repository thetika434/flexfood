import 'package:flutter/material.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/dimensions.dart';
import '../../constantes/styles_texte.dart';
import '../../composants/avatar_utilisateur.dart';
import '../../modeles/favori.dart';
import '../../modeles/etudiant.dart';
import '../../navigation/routeur.dart';
import '../../services/service_authentification.dart';
import '../../services/service_transactions.dart';

class PageChoisirModeTransfert extends StatefulWidget {
  const PageChoisirModeTransfert({super.key});

  @override
  State<PageChoisirModeTransfert> createState() => _PageChoisirModeTransfertEtat();
}

class _PageChoisirModeTransfertEtat extends State<PageChoisirModeTransfert> {
  late Future<List<Favori>> _favoris;

  @override
  void initState() {
    super.initState();
    _favoris = ServiceTransactions.obtenirFavoris();
    if (Session.etudiantConnecte?.estEnseignant ?? false) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) Navigator.pop(context);
      });
    }
  }

  void _allerVersEtudiant(Favori f) {
    final parties = f.nom.split(' ');
    final etudiant = Etudiant(
      matricule: f.matricule,
      nom: parties.length > 1 ? parties.last : f.nom,
      prenom: parties.first,
      solde: 0,
      codeQR: '',
    );
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
        title: Text('Envoyer de l\'argent', style: StylesTexte.titrePetit),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Dimensions.paddingPage),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _BoutonMode(
                icone: Icons.qr_code_scanner,
                titre: 'Scanner un QR code',
                description: 'Scannez le QR code du destinataire',
                couleurIcone: Couleurs.fondIconeTransfertRecu,
                onAppui: () => Navigator.pushNamed(context, Routes.scannerQR),
              ),
              const SizedBox(height: Dimensions.espaceM),
              _BoutonMode(
                icone: Icons.keyboard_alt_outlined,
                titre: 'Saisir le matricule',
                description: 'Entrez le matricule manuellement',
                couleurIcone: Couleurs.surfaceContainer,
                onAppui: () => Navigator.pushNamed(context, Routes.saisirMatricule),
              ),

              const SizedBox(height: Dimensions.espaceL),

              FutureBuilder<List<Favori>>(
                future: _favoris,
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  final liste = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Favoris', style: StylesTexte.titrePetit),
                      const SizedBox(height: Dimensions.espaceS),
                      ...liste.map((f) => _LigneFavori(
                            favori: f,
                            onAppui: () => _allerVersEtudiant(f),
                          )),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BoutonMode extends StatelessWidget {
  final IconData icone;
  final String titre;
  final String description;
  final Color couleurIcone;
  final VoidCallback onAppui;

  const _BoutonMode({
    required this.icone,
    required this.titre,
    required this.description,
    required this.couleurIcone,
    required this.onAppui,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAppui,
      child: Container(
        padding: const EdgeInsets.all(Dimensions.espaceM),
        decoration: BoxDecoration(
          color: Couleurs.blanc,
          borderRadius: BorderRadius.circular(Dimensions.rayonCarte),
          border: Border.all(color: Couleurs.surfaceContainer),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: couleurIcone,
              ),
              child: Icon(icone, color: Couleurs.vertFonce, size: 24),
            ),
            const SizedBox(width: Dimensions.espaceM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titre,
                      style: StylesTexte.corps
                          .copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 2),
                  Text(description, style: StylesTexte.corpsSecondaire),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios,
                size: 16, color: Couleurs.texteSecondaire),
          ],
        ),
      ),
    );
  }
}

class _LigneFavori extends StatelessWidget {
  final Favori favori;
  final VoidCallback onAppui;

  const _LigneFavori({required this.favori, required this.onAppui});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAppui,
      child: Container(
        margin: const EdgeInsets.only(bottom: Dimensions.espaceS),
        padding: const EdgeInsets.all(Dimensions.espaceM),
        decoration: BoxDecoration(
          color: Couleurs.blanc,
          borderRadius: BorderRadius.circular(Dimensions.rayonCarte),
          border: Border.all(color: Couleurs.surfaceContainer),
        ),
        child: Row(
          children: [
            AvatarUtilisateur(
              initiales: favori.nom.isNotEmpty
                  ? favori.nom[0].toUpperCase()
                  : '?',
              couleurFond: Couleurs.vertPrincipal,
            ),
            const SizedBox(width: Dimensions.espaceM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(favori.nom,
                      style: StylesTexte.corps
                          .copyWith(fontWeight: FontWeight.w600)),
                  Text(favori.matricule,
                      style: StylesTexte.corpsSecondaire),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios,
                size: 16, color: Couleurs.texteSecondaire),
          ],
        ),
      ),
    );
  }
}
