import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../constantes/couleurs.dart';
import '../../constantes/styles_texte.dart';
import '../../navigation/routeur.dart';
import '../../services/service_transactions.dart';

class PageScannerQR extends StatefulWidget {
  const PageScannerQR({super.key});

  @override
  State<PageScannerQR> createState() => _PageScannerQREtat();
}

class _PageScannerQREtat extends State<PageScannerQR> {
  bool _traite = false;

  void _onDetection(BarcodeCapture capture) {
    if (_traite) return;
    final code = capture.barcodes.firstOrNull?.rawValue;
    if (code == null || !code.startsWith('FLEXFOOD-')) return;

    // Format : FLEXFOOD-{matricule}-{timestamp}
    // Le timestamp est toujours le dernier segment après le dernier tiret
    final sansPrefix = code.substring('FLEXFOOD-'.length);
    final dernierTiret = sansPrefix.lastIndexOf('-');
    if (dernierTiret == -1) return;
    final matricule = sansPrefix.substring(0, dernierTiret);

    setState(() => _traite = true);
    _naviguerVersTransfert(matricule);
  }

  Future<void> _naviguerVersTransfert(String matricule) async {
    final etudiant =
        await ServiceTransactions.chercherEtudiantParMatricule(matricule);
    if (etudiant == null) {
      setState(() => _traite = false);
      return;
    }
    if (!mounted) return;
    Navigator.pushReplacementNamed(
      context,
      Routes.montantTransfert,
      arguments: etudiant,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
        title: Text('Scanner le QR code',
            style: StylesTexte.titrePetit.copyWith(color: Couleurs.blanc)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          MobileScanner(onDetect: _onDetection),

          // Overlay avec cadre de scan
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Couleurs.vertCarte, width: 3),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),

          // Instruction en bas
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Text(
              'Placez le QR code dans le cadre',
              textAlign: TextAlign.center,
              style: StylesTexte.corps.copyWith(color: Couleurs.blanc),
            ),
          ),
        ],
      ),
    );
  }
}
