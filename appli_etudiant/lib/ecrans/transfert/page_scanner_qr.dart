// ============================================================
// DÉVELOPPEUR : Nabo
// ÉCRAN       : Page Scanner QR
// ============================================================
// DESIGN : Voir image "scanner_qr.png"
//
// IMPORTS À AJOUTER quand tu commences :
//   import 'package:mobile_scanner/mobile_scanner.dart';
//   import '../../constantes/couleurs.dart';
//   import '../../constantes/styles_texte.dart';
//   import '../../navigation/routeur.dart';
//   import '../../services/service_transactions.dart';
//
// LOGIQUE :
//   MobileScanner() → scanner la caméra
//   Format du QR : "FLEXFOOD-22-ESATIC-0012-b2c3d4e5"
//   Extraire matricule : parties[1] + '-' + parties[2] + '-' + parties[3]
//   ServiceTransactions.chercherEtudiantParMatricule(matricule)
//   → Navigator.pushNamed(context, Routes.montantTransfert, arguments: etudiant)
// ============================================================

import 'package:flutter/material.dart';

class PageScannerQR extends StatefulWidget {
  const PageScannerQR({super.key});

  @override
  State<PageScannerQR> createState() => _PageScannerQREtat();
}

class _PageScannerQREtat extends State<PageScannerQR> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page Scanner QR — À implémenter par Nabo'),
      ),
    );
  }
}
