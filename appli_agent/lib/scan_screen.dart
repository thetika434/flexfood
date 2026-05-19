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
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) setState(() { _erreur = null; _scanning = true; });
      });
    }
  }

  void _showSuccess(Map<String, dynamic> data) {
    final etudiant = data['etudiant'] as Map<String, dynamic>;
    final montant = (data['montant'] as int).abs();
    final soldeApres = etudiant['soldeApres'] as int;
    final prenom = etudiant['prenom'] as String;
    final nom = etudiant['nom'] as String;

    showModalBottomSheet(
      context: context,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            width: 64, height: 64,
            decoration: BoxDecoration(
              color: AppColors.successBg,
              borderRadius: BorderRadius.circular(32),
            ),
            child: const Icon(Icons.check_circle, color: AppColors.success, size: 36),
          ),
          const SizedBox(height: 16),
          const Text('Repas débité',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          const SizedBox(height: 4),
          Text('$prenom $nom',
              style: const TextStyle(color: AppColors.textMuted, fontSize: 14)),
          const SizedBox(height: 8),
          Text('- ${fmtFCFA(montant)} débité',
              style: const TextStyle(color: AppColors.error, fontSize: 13)),
          const SizedBox(height: 4),
          Text('Solde restant : ${fmtFCFA(soldeApres)}',
              style: const TextStyle(color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.w600)),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() { _erreur = null; _scanning = true; });
            },
            child: const Text('Nouveau scan'),
          ),
        ]),
      ),
    );
  }

  void _annuler() => setState(() { _erreur = null; _scanning = true; });

  @override
  Widget build(BuildContext context) {
    final creneau = Creneaux.getActif();
    final isEnabled = context.watch<AppState>().scannerEnabled;

    if (isEnabled) {
      _ctrl.start();
    } else {
      _ctrl.stop();
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Scanner QR code'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Déconnexion',
            onPressed: () => _confirmerLogout(context),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            CreneauBanner(creneau: creneau),
            const SizedBox(height: 14),

            // Zone de scan
            Container(
              height: 260,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: creneau != null
                      ? AppColors.primary.withValues(alpha: 0.4)
                      : AppColors.border,
                  width: 2,
                ),
              ),
              child: creneau != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Stack(children: [
                        MobileScanner(controller: _ctrl, onDetect: _onDetect),
                        Center(
                          child: SizedBox(
                            width: 180, height: 180,
                            child: CustomPaint(painter: _CornersPainter()),
                          ),
                        ),
                        if (_processing)
                          Container(
                            color: Colors.black45,
                            child: const Center(
                              child: CircularProgressIndicator(color: Colors.white),
                            ),
                          ),
                      ]),
                    )
                  : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Icon(Icons.lock_clock, color: AppColors.neutral, size: 48),
                      const SizedBox(height: 12),
                      const Text('Scanner indisponible',
                          style: TextStyle(color: AppColors.textMuted, fontSize: 14)),
                      const Text('Revenez pendant un créneau de repas',
                          style: TextStyle(color: AppColors.neutral, fontSize: 12)),
                    ]),
            ),

            if (_erreur != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.errorBg,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                ),
                child: Row(children: [
                  const Icon(Icons.error_outline, color: AppColors.error, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(_erreur!,
                        style: const TextStyle(color: AppColors.error, fontSize: 13)),
                  ),
                ]),
              ),
              const SizedBox(height: 8),
              OutlinedButton(onPressed: _annuler, child: const Text('Réessayer')),
            ],

            const SizedBox(height: 24),

            // Liste créneaux
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Créneaux du jour',
                  style: TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 17,
                      fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 12),
            Card(
              child: Column(
                children: Creneaux.liste.asMap().entries.map((e) {
                  final c = e.value;
                  final isActif = creneau != null && creneau['nom'] == c['nom'];
                  return Column(children: [
                    ListTile(
                      leading: Text(c['emoji'] as String,
                          style: const TextStyle(fontSize: 22)),
                      title: Text(c['nom'] as String,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight:
                                isActif ? FontWeight.w700 : FontWeight.w500,
                            color: isActif
                                ? AppColors.primary
                                : AppColors.textPrimary,
                          )),
                      subtitle: Text('${c['debut']} – ${c['fin']}',
                          style: const TextStyle(
                              color: AppColors.textMuted, fontSize: 12)),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: isActif
                              ? AppColors.primary
                              : AppColors.surfaceVar,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('${c['prix']} FCFA',
                            style: TextStyle(
                              color: isActif ? Colors.white : AppColors.primary,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                    if (e.key < Creneaux.liste.length - 1)
                      const Divider(height: 1, indent: 14, endIndent: 14),
                  ]);
                }).toList(),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void _confirmerLogout(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (_) => AlertDialog(
        title: const Text('Déconnexion'),
        content: const Text('Voulez-vous vous déconnecter ?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Annuler')),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              ctx.read<AppState>().logout();
            },
            child: const Text('Déconnexion'),
          ),
        ],
      ),
    );
  }
}

class _CornersPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    const l = 28.0;
    canvas.drawLine(Offset.zero, const Offset(l, 0), p);
    canvas.drawLine(Offset.zero, const Offset(0, l), p);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width - l, 0), p);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, l), p);
    canvas.drawLine(Offset(0, size.height), Offset(l, size.height), p);
    canvas.drawLine(Offset(0, size.height), Offset(0, size.height - l), p);
    canvas.drawLine(Offset(size.width, size.height),
        Offset(size.width - l, size.height), p);
    canvas.drawLine(Offset(size.width, size.height),
        Offset(size.width, size.height - l), p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter _) => false;
}
