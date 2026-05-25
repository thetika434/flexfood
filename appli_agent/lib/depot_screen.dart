import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'app_state.dart';
import 'common.dart';

class DepotScreen extends StatefulWidget {
  const DepotScreen({super.key});
  @override
  State<DepotScreen> createState() => _DepotScreenState();
}

class _DepotScreenState extends State<DepotScreen> {
  final _matCtrl   = TextEditingController();
  final _amtCtrl   = TextEditingController();
  final _formKey   = GlobalKey<FormState>();

  bool _loading  = false;
  bool _success  = false;
  String? _erreur;
  int? _lastAmt;
  String? _lastMat;
  String? _lastNom;
  int? _soldeApres;
  int? _montantSelectionne;

  void _ouvrirScanner() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(children: [
          const SizedBox(height: 12),
          Container(
            width: 40, height: 4,
            decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(2)),
          ),
          const SizedBox(height: 16),
          const Text('Scanner le QR code étudiant',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
          const SizedBox(height: 12),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: MobileScanner(
                onDetect: (capture) {
                  final raw = capture.barcodes.firstOrNull?.rawValue;
                  if (raw == null) return;
                  String matricule;
                  if (raw.startsWith('FLEXFOOD-')) {
                    matricule = raw.substring('FLEXFOOD-'.length, raw.lastIndexOf('-'));
                  } else {
                    matricule = raw;
                  }
                  _matCtrl.text = matricule;
                  setState(() {});
                  Navigator.pop(ctx);
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void _selectMontant(int m) {
    setState(() { _montantSelectionne = m; _amtCtrl.text = m.toString(); });
  }

  Future<void> _depot() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() { _loading = true; _erreur = null; });
    final matricule = _matCtrl.text.trim();
    final montant   = int.parse(_amtCtrl.text.trim());
    try {
      final data = await context.read<AppState>().effectuerRechargement(matricule, montant);
      if (!mounted) return;
      final etudiant = data['etudiant'] as Map<String, dynamic>;
      setState(() {
        _loading    = false;
        _success    = true;
        _lastAmt    = montant;
        _lastMat    = etudiant['matricule'] as String? ?? matricule;
        _lastNom    = '${etudiant['prenom'] ?? ''} ${etudiant['nom'] ?? ''}'.trim();
        _soldeApres = etudiant['soldeApres'] as int?;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _erreur  = e.toString().replaceFirst('Exception: ', '');
      });
    }
  }

  void _reset() => setState(() {
    _success = false; _erreur = null; _montantSelectionne = null;
    _lastAmt = null; _lastMat = null; _lastNom = null; _soldeApres = null;
    _matCtrl.clear(); _amtCtrl.clear();
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.background,
    appBar: AppBar(
      backgroundColor: AppColors.surface,
      foregroundColor: AppColors.primary,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, size: 18),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text('Recharger un compte',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(height: 1, color: AppColors.border),
      ),
    ),
    body: _success ? _buildSuccess() : _buildForm(),
  );

  Widget _buildForm() {
    final amt = int.tryParse(_amtCtrl.text) ?? 0;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          _labelSection('DESTINATAIRE'),
          _carteChamp(
            icone: Icons.badge_outlined,
            label: 'Matricule étudiant',
            child: TextFormField(
              controller: _matCtrl,
              onChanged: (_) => setState(() => _erreur = null),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
              decoration: InputDecoration(
                border: InputBorder.none, isDense: true,
                hintText: 'Ex: 25-ESATIC-0042',
                hintStyle: const TextStyle(color: AppColors.textMuted, fontSize: 13),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.qr_code_scanner, color: AppColors.primary, size: 22),
                  onPressed: _ouvrirScanner,
                ),
              ),
              validator: (v) => v == null || v.trim().isEmpty ? 'Requis' : null,
            ),
          ),

          const SizedBox(height: 20),
          _labelSection('MONTANT'),
          _carteChamp(
            icone: Icons.payments_outlined,
            label: 'Montant à déposer',
            child: TextFormField(
              controller: _amtCtrl,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (_) => setState(() { _montantSelectionne = null; _erreur = null; }),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
              decoration: const InputDecoration(
                border: InputBorder.none, isDense: true,
                hintText: 'Ex: 5000',
                hintStyle: TextStyle(color: AppColors.textMuted, fontSize: 13),
                suffixText: 'FCFA',
                suffixStyle: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w500, fontSize: 13),
              ),
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Requis';
                final n = int.tryParse(v) ?? 0;
                if (n <= 0) return 'Montant invalide';
                if (n % 100 != 0) return 'Doit être un multiple de 100';
                return null;
              },
            ),
          ),

          const SizedBox(height: 12),

          // Boutons montants rapides
          GridView.count(
            shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4, mainAxisSpacing: 8, crossAxisSpacing: 8, childAspectRatio: 1.6,
            children: [1000, 2000, 5000, 10000].map((m) {
              final sel = _montantSelectionne == m;
              return GestureDetector(
                onTap: () => _selectMontant(m),
                child: Container(
                  decoration: BoxDecoration(
                    color: sel ? AppColors.primary : AppColors.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: sel ? AppColors.primary : AppColors.border),
                  ),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      m >= 1000 ? '${m ~/ 1000}k' : '$m',
                      style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700,
                        color: sel ? Colors.white : AppColors.primary,
                      ),
                    ),
                    Text('FCFA', style: TextStyle(
                        fontSize: 9, color: sel ? Colors.white.withValues(alpha: 0.75) : AppColors.textMuted)),
                  ]),
                ),
              );
            }).toList(),
          ),

          // Récap
          if (_matCtrl.text.isNotEmpty && amt > 0) ...[
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(children: [
                _ligneRecap('Matricule', _matCtrl.text.trim()),
                const SizedBox(height: 8),
                const Divider(color: AppColors.border, height: 1),
                const SizedBox(height: 8),
                _ligneRecap('Montant', fmtFCFA(amt), couleur: AppColors.primary),
              ]),
            ),
          ],

          // Erreur
          if (_erreur != null) ...[
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.errorBg,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
              ),
              child: Row(children: [
                const Icon(Icons.error_outline, color: AppColors.error, size: 18),
                const SizedBox(width: 8),
                Expanded(child: Text(_erreur!,
                    style: const TextStyle(color: AppColors.error, fontSize: 13))),
              ]),
            ),
          ],

          const SizedBox(height: 28),

          GestureDetector(
            onTap: _loading ? null : _depot,
            child: Container(
              width: double.infinity, height: 56,
              decoration: BoxDecoration(
                color: _loading ? AppColors.primary.withValues(alpha: 0.6) : AppColors.primary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: _loading
                    ? const SizedBox(height: 22, width: 22,
                        child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white))
                    : const Text('Valider le rechargement',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),
          ),

          const SizedBox(height: 28),
          _buildDerniersDepots(),
        ]),
      ),
    );
  }

  Widget _buildSuccess() => Center(
    child: Padding(
      padding: const EdgeInsets.all(28),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          width: 88, height: 88,
          decoration: const BoxDecoration(color: AppColors.successBg, shape: BoxShape.circle),
          child: const Icon(Icons.check_circle_outline, color: AppColors.success, size: 50),
        ),
        const SizedBox(height: 24),
        const Text('Rechargement réussi !',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
        const SizedBox(height: 12),
        Text(
          '+${fmtFCFA(_lastAmt!)}',
          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w900, color: AppColors.success),
        ),
        const SizedBox(height: 6),
        Text('Ajouté au compte de $_lastNom',
            style: const TextStyle(color: AppColors.textMuted, fontSize: 15)),
        Text(_lastMat!, style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
        if (_soldeApres != null) ...[
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text('Nouveau solde', style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
              Text(fmtFCFA(_soldeApres!),
                  style: const TextStyle(color: AppColors.primary, fontSize: 15, fontWeight: FontWeight.bold)),
            ]),
          ),
        ],
        const SizedBox(height: 36),
        GestureDetector(
          onTap: _reset,
          child: Container(
            width: double.infinity, height: 56,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(
              child: Text('Nouveau rechargement',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
            ),
          ),
        ),
      ]),
    ),
  );

  Widget _labelSection(String label) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Text(label, style: const TextStyle(
        fontSize: 11, color: AppColors.textMuted, fontWeight: FontWeight.w600, letterSpacing: 1.2)),
  );

  Widget _carteChamp({required IconData icone, required String label, required Widget child}) =>
    Container(
      padding: const EdgeInsets.fromLTRB(14, 10, 8, 10),
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Icon(icone, color: AppColors.primary, size: 20),
        const SizedBox(width: 10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label, style: const TextStyle(fontSize: 10, color: AppColors.textMuted, fontWeight: FontWeight.w500)),
          const SizedBox(height: 2),
          child,
        ])),
      ]),
    );

  Widget _ligneRecap(String cle, String val, {Color? couleur}) =>
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(cle, style: const TextStyle(fontSize: 13, color: AppColors.textMuted)),
      Text(val, style: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w600, color: couleur ?? AppColors.textPrimary)),
    ]);

  Widget _buildDerniersDepots() => Consumer<AppState>(builder: (_, state, __) {
    final rechargements = state.listeRechargements.take(3).toList();
    if (rechargements.isEmpty) return const SizedBox.shrink();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('DERNIERS RECHARGEMENTS', style: TextStyle(
          fontSize: 11, color: AppColors.textMuted, fontWeight: FontWeight.w600, letterSpacing: 1.2)),
      const SizedBox(height: 10),
      Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(children: rechargements.asMap().entries.map((e) => TxRow(
          nom: e.value.nomEtudiant,
          sub: '${e.value.matricule} · ${DateFormat('HH:mm').format(e.value.date)}',
          montant: e.value.montant,
          isDepot: true,
          isLast: e.key == rechargements.length - 1,
        )).toList()),
      ),
    ]);
  });

  @override
  void dispose() { _matCtrl.dispose(); _amtCtrl.dispose(); super.dispose(); }
}
