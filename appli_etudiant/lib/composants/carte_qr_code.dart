import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../constantes/couleurs.dart';
import '../constantes/dimensions.dart';
import '../constantes/styles_texte.dart';

class CarteQRCode extends StatelessWidget {
  final String donneesQR;
  final VoidCallback? onScannerAppui;

  const CarteQRCode({
    super.key,
    required this.donneesQR,
    this.onScannerAppui,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onScannerAppui,
      child: Container(
      height: 210,
      decoration: BoxDecoration(
        color: Couleurs.vertCarte,
        borderRadius: BorderRadius.circular(Dimensions.rayonCarte),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimensions.rayonCarte),
        child: Stack(
          children: [
            // Fond décoratif avec formes organiques
            Positioned.fill(
              child: CustomPaint(painter: _PeintreFondCarte()),
            ),
            // QR code centré + bouton scanner
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Couleurs.blanc,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: QrImageView(
                      data: donneesQR,
                      size: 115,
                      backgroundColor: Couleurs.blanc,
                      eyeStyle: const QrEyeStyle(
                        eyeShape: QrEyeShape.square,
                        color: Couleurs.vertFonce,
                      ),
                      dataModuleStyle: const QrDataModuleStyle(
                        dataModuleShape: QrDataModuleShape.square,
                        color: Couleurs.vertFonce,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.camera_alt,
                          color: Couleurs.blanc, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        'Scanner',
                        style:
                            StylesTexte.corps.copyWith(color: Couleurs.blanc),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}

class _PeintreFondCarte extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final peinture = Paint()
      ..color = const Color(0xFF57D176)
      ..style = PaintingStyle.fill;

    // Cercles décoratifs
    canvas.drawCircle(
        Offset(size.width * 0.08, size.height * 0.15), 10, peinture);
    canvas.drawCircle(
        Offset(size.width * 0.92, size.height * 0.75), 14, peinture);
    canvas.drawCircle(
        Offset(size.width * 0.15, size.height * 0.82), 6, peinture);
    canvas.drawCircle(
        Offset(size.width * 0.88, size.height * 0.2), 8, peinture);
    canvas.drawCircle(
        Offset(size.width * 0.5, size.height * 0.06), 5, peinture);

    // Formes feuilles
    _dessinerFeuille(canvas, peinture,
        Offset(size.width * 0.05, size.height * 0.5), 8, 18, 0.3);
    _dessinerFeuille(canvas, peinture,
        Offset(size.width * 0.95, size.height * 0.45), 7, 15, -0.5);
    _dessinerFeuille(canvas, peinture,
        Offset(size.width * 0.2, size.height * 0.1), 6, 14, 1.2);
    _dessinerFeuille(canvas, peinture,
        Offset(size.width * 0.82, size.height * 0.9), 8, 16, -0.8);
    _dessinerFeuille(canvas, peinture,
        Offset(size.width * 0.1, size.height * 0.88), 5, 12, 0.6);
    _dessinerFeuille(canvas, peinture,
        Offset(size.width * 0.9, size.height * 0.1), 6, 14, 2.0);

    // Flèches
    _dessinerFleche(
        canvas, peinture, Offset(size.width * 0.25, size.height * 0.9), 10);
    _dessinerFleche(
        canvas, peinture, Offset(size.width * 0.75, size.height * 0.1), 8);

    // Rectangles arrondis
    _dessinerRectArrondi(canvas, peinture,
        Offset(size.width * 0.03, size.height * 0.32), 5, 13, 0.4);
    _dessinerRectArrondi(canvas, peinture,
        Offset(size.width * 0.97, size.height * 0.62), 5, 12, -0.4);
  }

  void _dessinerFeuille(Canvas canvas, Paint p, Offset centre, double larg,
      double haut, double rotation) {
    canvas.save();
    canvas.translate(centre.dx, centre.dy);
    canvas.rotate(rotation);
    final chemin = Path()
      ..moveTo(0, -haut)
      ..cubicTo(larg, -haut * 0.5, larg, haut * 0.5, 0, haut)
      ..cubicTo(-larg, haut * 0.5, -larg, -haut * 0.5, 0, -haut)
      ..close();
    canvas.drawPath(chemin, p);
    canvas.restore();
  }

  void _dessinerFleche(Canvas canvas, Paint p, Offset centre, double taille) {
    final chemin = Path()
      ..moveTo(centre.dx - taille, centre.dy)
      ..lineTo(centre.dx, centre.dy - taille)
      ..lineTo(centre.dx + taille, centre.dy)
      ..lineTo(centre.dx + taille * 0.5, centre.dy)
      ..lineTo(centre.dx + taille * 0.5, centre.dy + taille * 0.8)
      ..lineTo(centre.dx - taille * 0.5, centre.dy + taille * 0.8)
      ..lineTo(centre.dx - taille * 0.5, centre.dy)
      ..close();
    canvas.drawPath(chemin, p);
  }

  void _dessinerRectArrondi(Canvas canvas, Paint p, Offset centre, double larg,
      double haut, double rotation) {
    canvas.save();
    canvas.translate(centre.dx, centre.dy);
    canvas.rotate(rotation);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
            center: Offset.zero, width: larg * 2, height: haut * 2),
        const Radius.circular(4),
      ),
      p,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
