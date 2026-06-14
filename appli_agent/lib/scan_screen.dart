import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'app_state.dart';
import 'common.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});
  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final MobileScannerController _ctrl = MobileScannerController();
  bool _scanning = true;
  bool _processing = false;
  String? _erreur;

  @override
  void initState() {
    super.initState();
    _ctrl.start();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (!_scanning || _processing) return;
    final raw = capture.barcodes.firstOrNull?.rawValue;
    if (raw == null || !raw.startsWith('FLEXFOOD-')) return;
    _traiterQR(raw);
  }

  Future<void> _traiterQR(String codeQr) async {
    setState(() { _processing = true; _scanning = false; _erreur = null; });
    try {
      final data = await context.read<AppState>().effectuerRepas(codeQr);
      if (!mounted) return;
      setState(() { _processing = false; });
      _showSuccess(data);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _erreur = e.toString().replaceFirst('Exception: ', '');
        _processing = false;
      });
      Future.delayed(const Duration(seconds: 4), () {
        if (mounted) setState(() { _erreur = null; _scanning = true; });
      });
    }
  }

  void _showSuccess(Map<String, dynamic> data) {
    final etudiant = data['etudiant'] as Map<String, dynamic>;
    final montant   = (data['montant'] as int).abs();
    final solde     = etudiant['soldeApres'] as int;
    final prenom    = etudiant['prenom'] as String;
    final nom       = etudiant['nom'] as String;
    final service   = data['service'] as String? ?? '';

    String labelRepas = 'Repas';
    if (service == 'petit_dejeuner') labelRepas = 'Repas Matin';
    if (service == 'dejeuner') labelRepas = 'Repas Midi';
    if (service == 'diner') labelRepas = 'Repas Soir';

    showModalBottomSheet(
      context: context,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [

          // Icône succès
          Container(
            width: 72, height: 72,
            decoration: BoxDecoration(
              color: AppColors.successBg,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check_circle_outline, color: AppColors.success, size: 40),
          ),
          const SizedBox(height: 16),

          Text(
            labelRepas,
            style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '$prenom $nom',
            style: const TextStyle(color: AppColors.textMuted, fontSize: 14),
          ),
          const SizedBox(height: 20),

          // Montant débité
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Montant débité',
                    style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
                Text(
                  '- ${fmtFCFA(montant)}',
                  style: const TextStyle(
                    color: AppColors.error, fontSize: 15, fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Solde restant',
                    style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
                Text(
                  fmtFCFA(solde),
                  style: const TextStyle(
                    color: AppColors.primary, fontSize: 15, fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              setState(() { _erreur = null; _scanning = true; });
            },
            child: Container(
              width: double.infinity, height: 56,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text('Nouveau scan',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void _annuler() => setState(() { _erreur = null; _scanning = true; });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        MobileScanner(controller: _ctrl, onDetect: _onDetect),

        // Header translucide
        Positioned(
          top: 0, left: 0, right: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 12, 0),
              child: Row(children: [
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text('Scanner QR',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Débiter un repas étudiant',
                        style: TextStyle(color: Colors.white.withValues(alpha: 0.65), fontSize: 12)),
                  ]),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  tooltip: 'Fermer',
                  onPressed: () => Navigator.pop(context),
                ),
              ]),
            ),
          ),
        ),

        // Cadre de visée
        Center(
          child: SizedBox(
            width: 230, height: 230,
            child: CustomPaint(painter: _CoinsPainter()),
          ),
        ),

        // Texte indicatif
        Positioned(
          bottom: _erreur != null ? 140 : 80,
          left: 0, right: 0,
          child: Text(
            'Pointez le QR code de l\'étudiant',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white.withValues(alpha: 0.75), fontSize: 13),
          ),
        ),

        // Chargement
        if (_processing)
          Container(
            color: Colors.black54,
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),

        // Erreur
        if (_erreur != null)
          Positioned(
            bottom: 0, left: 0, right: 0,
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.errorBg,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.error.withValues(alpha: 0.4)),
              ),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Row(children: [
                  const Icon(Icons.error_outline, color: AppColors.error, size: 18),
                  const SizedBox(width: 8),
                  Expanded(child: Text(_erreur!,
                      style: const TextStyle(color: AppColors.error, fontSize: 13))),
                ]),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: _annuler,
                  child: Container(
                    width: double.infinity, height: 44,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.error),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text('Réessayer',
                          style: TextStyle(color: AppColors.error, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
              ]),
            ),
          ),
      ]),
    );
  }
}

class _CoinsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = Colors.white
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    const l = 36.0;
    canvas.drawLine(Offset.zero, const Offset(l, 0), p);
    canvas.drawLine(Offset.zero, const Offset(0, l), p);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width - l, 0), p);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, l), p);
    canvas.drawLine(Offset(0, size.height), Offset(l, size.height), p);
    canvas.drawLine(Offset(0, size.height), Offset(0, size.height - l), p);
    canvas.drawLine(Offset(size.width, size.height), Offset(size.width - l, size.height), p);
    canvas.drawLine(Offset(size.width, size.height), Offset(size.width, size.height - l), p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter _) => false;
}
