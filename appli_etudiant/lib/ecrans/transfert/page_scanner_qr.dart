import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../constantes/couleurs.dart';
import '../../constantes/dimensions.dart';
import '../../constantes/styles_texte.dart';
import '../../navigation/routeur.dart';
import '../../services/service_transactions.dart';

class PageScannerQR extends StatefulWidget {
  const PageScannerQR({super.key});

  @override
  State<PageScannerQR> createState() => _PageScannerQREtat();
}

class _PageScannerQREtat extends State<PageScannerQR> {
  final MobileScannerController _controleur = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
    detectionSpeed: DetectionSpeed.normal,
  );

  bool _scanVerrouille = false;

  @override
  void dispose() {
    _controleur.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Couleurs.fondPrincipal,
      appBar: AppBar(
        backgroundColor: Couleurs.fondPrincipal,
        elevation: 0,
        scrolledUnderElevation: 0,
        leadingWidth: 72,
        leading: IconButton(
          padding: const EdgeInsets.only(left: Dimensions.paddingPage),
          alignment: Alignment.centerLeft,
          onPressed: () => Navigator.maybePop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Couleurs.vertFonce,
            size: 32,
          ),
        ),
        actions: [
          _BoutonIconeAppBar(
            icone: Icons.flash_on,
            libelle: 'Flash',
            onAppui: () => _controleur.toggleTorch(),
          ),
          _BoutonIconeAppBar(
            icone: Icons.cameraswitch,
            libelle: 'Changer caméra',
            onAppui: () => _controleur.switchCamera(),
          ),
          const SizedBox(width: Dimensions.espaceS),
        ],
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            Dimensions.paddingPage,
            Dimensions.espaceS,
            Dimensions.paddingPage,
            Dimensions.espaceXL,
          ),
          children: [
            Text(
              'Scanner le QR code',
              style: StylesTexte.titreGrand.copyWith(
                color: Couleurs.vertFonce,
              ),
            ),
            const SizedBox(height: Dimensions.espaceS),
            const Text(
              'Placez le code QR du destinataire dans le cadre.',
              style: StylesTexte.corpsSecondaire,
            ),
            const SizedBox(height: Dimensions.espaceXL),
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.rayonCarte),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(Dimensions.rayonCarte),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      MobileScanner(
                        controller: _controleur,
                        fit: BoxFit.cover,
                        onDetect: _gererDetection,
                        placeholderBuilder: (context, _) =>
                            const _ChargementCamera(),
                        errorBuilder: (context, erreur, _) => _ErreurCamera(
                          message: erreur.errorDetails?.message ??
                              'Caméra indisponible pour le moment.',
                        ),
                      ),
                      const _CadreScanner(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: Dimensions.espaceM),
            OutlinedButton.icon(
              onPressed: () => Navigator.pushNamed(
                context,
                Routes.saisirMatricule,
              ),
              icon: const Icon(Icons.badge_outlined),
              label: const Text('Saisir le matricule'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _gererDetection(BarcodeCapture capture) async {
    if (_scanVerrouille) return;

    String? valeurQR;
    for (final code in capture.barcodes) {
      final valeur = code.rawValue;
      if (valeur != null && valeur.trim().isNotEmpty) {
        valeurQR = valeur.trim();
        break;
      }
    }

    if (valeurQR == null) return;

    _scanVerrouille = true;
    final matricule = _extraireMatricule(valeurQR);

    if (matricule == null) {
      _afficherMessage('QR code FlexFood invalide');
      _reactiverScanApresDelai();
      return;
    }

    // await obligatoire — chercherEtudiantParMatricule retourne un Future
    final etudiant =
        await ServiceTransactions.chercherEtudiantParMatricule(matricule);
    if (etudiant == null) {
      _afficherMessage('Matricule introuvable');
      _reactiverScanApresDelai();
      return;
    }

    unawaited(_controleur.stop());

    if (!mounted) return;

    await Navigator.pushNamed(
      context,
      Routes.montantTransfert,
      arguments: etudiant,
    );

    if (!mounted) return;
    _scanVerrouille = false;
    unawaited(_controleur.start());
  }

  // Fonctionne avec 25-ESATIC0761DG ET 25-ESATIC-0045
  String? _extraireMatricule(String donneesQR) {
    if (!donneesQR.startsWith('FLEXFOOD-')) return null;
    final sansPrefix = donneesQR.substring('FLEXFOOD-'.length);
    final dernierTiret = sansPrefix.lastIndexOf('-');
    if (dernierTiret == -1) return null;
    return sansPrefix.substring(0, dernierTiret);
  }

  void _afficherMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  void _reactiverScanApresDelai() {
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      _scanVerrouille = false;
    });
  }
}

class _CadreScanner extends StatelessWidget {
  const _CadreScanner();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.espaceXL),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Couleurs.blanc, width: 4),
            borderRadius: BorderRadius.circular(Dimensions.rayonCarte),
          ),
          child: const SizedBox.expand(),
        ),
      ),
    );
  }
}

class _ChargementCamera extends StatelessWidget {
  const _ChargementCamera();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: Couleurs.blanc),
    );
  }
}

class _ErreurCamera extends StatelessWidget {
  final String message;
  const _ErreurCamera({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingPage),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.camera_alt_outlined,
                color: Couleurs.blanc, size: 48),
            const SizedBox(height: Dimensions.espaceM),
            Text(
              message,
              style: StylesTexte.corps.copyWith(color: Couleurs.blanc),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _BoutonIconeAppBar extends StatelessWidget {
  final IconData icone;
  final String libelle;
  final VoidCallback onAppui;

  const _BoutonIconeAppBar({
    required this.icone,
    required this.libelle,
    required this.onAppui,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icone, color: Couleurs.vertFonce),
      tooltip: libelle,
      onPressed: onAppui,
    );
  }
}
