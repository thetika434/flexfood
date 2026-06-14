import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'app_state.dart';
import 'common.dart';

class BilanScreen extends StatefulWidget {
  const BilanScreen({super.key});
  @override
  State<BilanScreen> createState() => _BilanScreenState();
}

class _BilanScreenState extends State<BilanScreen> {
  bool _exportPdf   = false;
  bool _refreshing  = false;

  Future<void> _actualiser() async {
    setState(() => _refreshing = true);
    await context.read<AppState>().chargerBilan();
    if (mounted) setState(() => _refreshing = false);
  }

  Future<void> _genPDF(AppState state) async {
    setState(() => _exportPdf = true);
    try {
      final logoEsatic    = await imageFromAssetBundle('assets/logo_esatic.png');
      final logoFlexFood  = await imageFromAssetBundle('assets/FLEX.png');

      final rechargements = state.listeRechargements;
      final totRecharge   = state.totalRechargements;
      final nbrRecharge   = rechargements.length;
      final nbrRepas      = state.transactions.where((t) => t.type == 'repas').length;
      final today         = DateFormat('dd/MM/yyyy').format(DateTime.now());
      final strNbr        = '${nbrRecharge < 10 ? '0' : ''}$nbrRecharge DÉPÔTS';

      final pdf = pw.Document();
      pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(36),
        build: (ctx) => pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Image(logoEsatic, width: 120),
              pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.center, children: [
                pw.Text('BILAN DU JOUR', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 2),
                pw.Text(today, style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey600)),
                pw.SizedBox(height: 2),
                pw.Text('Généré le ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())}',
                    style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey400)),
              ]),
              pw.Image(logoFlexFood, width: 120),
            ],
          ),
          pw.SizedBox(height: 16),
          pw.Divider(color: PdfColor.fromHex('024618'), thickness: 2),
          pw.SizedBox(height: 30),

          pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
            _pdfBox('Repas servis', '$nbrRepas REPAS', PdfColor.fromHex('024618'), PdfColor.fromHex('B1F2B2')),
            pw.SizedBox(width: 40),
            _pdfBox('Total dépôts', strNbr, PdfColor.fromHex('024618'), PdfColor.fromHex('B1F2B2')),
            pw.SizedBox(width: 40),
            _pdfBox('Solde rechargé', '+ ${fmtFCFA(totRecharge)}', PdfColor.fromHex('024618'), PdfColor.fromHex('B1F2B2')),
          ]),
          pw.SizedBox(height: 40),

          pw.Text('Détail des rechargements',
              style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex('024618'))),
          pw.SizedBox(height: 12),
          if (rechargements.isEmpty)
            pw.Container(
              padding: const pw.EdgeInsets.all(16),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.grey300),
                borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
              ),
              child: pw.Center(child: pw.Text('Aucun rechargement aujourd\'hui',
                  style: const pw.TextStyle(color: PdfColors.grey600))),
            )
          else
            pw.Table(
              border: pw.TableBorder.all(color: PdfColors.grey200),
              columnWidths: {
                0: const pw.FlexColumnWidth(2.5),
                1: const pw.FlexColumnWidth(2.5),
                2: const pw.FlexColumnWidth(2),
                3: const pw.FlexColumnWidth(1.8),
              },
              children: [
                pw.TableRow(
                  decoration: pw.BoxDecoration(color: PdfColor.fromHex('024618')),
                  children: ['Étudiant', 'Matricule', 'Heure', 'Montant'].map((h) =>
                    pw.Padding(padding: const pw.EdgeInsets.all(8),
                      child: pw.Text(h, style: pw.TextStyle(
                          color: PdfColors.white, fontWeight: pw.FontWeight.bold, fontSize: 10))),
                  ).toList(),
                ),
                ...rechargements.asMap().entries.map((e) {
                  final t  = e.value;
                  final bg = e.key % 2 == 0 ? PdfColors.white : PdfColor.fromHex('F5FAF5');
                  return pw.TableRow(
                    decoration: pw.BoxDecoration(color: bg),
                    children: [
                      t.nomEtudiant, t.matricule,
                      DateFormat('HH:mm').format(t.date),
                      '+ ${fmtFCFA(t.montant)}',
                    ].map((v) => pw.Padding(padding: const pw.EdgeInsets.all(8),
                      child: pw.Text(v, style: const pw.TextStyle(fontSize: 10)))).toList(),
                  );
                }),
              ],
            ),
        ]),
      ));

      final bytes    = await pdf.save();
      final fileName = 'FlexFood_bilan_${DateFormat('yyyyMMdd').format(DateTime.now())}.pdf';
      await Printing.sharePdf(bytes: bytes, filename: fileName);
    } finally {
      if (mounted) setState(() => _exportPdf = false);
    }
  }

  pw.Widget _pdfBox(String lbl, String val, PdfColor color, PdfColor bg) =>
    pw.Container(
      width: 130,
      padding: const pw.EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: pw.BoxDecoration(
        color: bg,
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(12)),
      ),
      child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Text(lbl, style: pw.TextStyle(fontSize: 10, color: PdfColors.grey700)),
        pw.SizedBox(height: 6),
        pw.Text(val, style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: color)),
      ]),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Bilan du jour',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
        actions: [
          IconButton(
            icon: _refreshing
                ? const SizedBox(width: 18, height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary))
                : const Icon(Icons.refresh_outlined, color: AppColors.primary),
            onPressed: _refreshing ? null : _actualiser,
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: AppColors.border),
        ),
      ),
      body: Consumer<AppState>(builder: (_, state, __) {
        final totalRepas   = state.totalRepas;
        final totalRecharge = state.totalRechargements;
        final nbrRepas     = state.transactions.where((t) => t.type == 'repas').length;
        final nbrRecharge  = state.listeRechargements.length;
        final toutes       = state.transactions;

        return RefreshIndicator(
          onRefresh: _actualiser,
          color: AppColors.primary,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

              Text(
                'Aujourd\'hui · ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
              ),
              const SizedBox(height: 16),

              // Cartes stats
              Row(children: [
                Expanded(child: _carteStats(
                  icon: Icons.restaurant_outlined,
                  label: 'Repas servis',
                  valeur: '$nbrRepas',
                  sous: '- ${fmtFCFA(totalRepas)}',
                  couleur: AppColors.primary,
                )),
                const SizedBox(width: 12),
                Expanded(child: _carteStats(
                  icon: Icons.account_balance_wallet_outlined,
                  label: 'Rechargements',
                  valeur: '$nbrRecharge',
                  sous: '+ ${fmtFCFA(totalRecharge)}',
                  couleur: AppColors.success,
                )),
              ]),
              const SizedBox(height: 20),

              // Bouton export PDF
              GestureDetector(
                onTap: _exportPdf ? null : () => _genPDF(state),
                child: Container(
                  width: double.infinity, height: 52,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.primary, width: 1.5),
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    if (_exportPdf)
                      const SizedBox(width: 18, height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary))
                    else
                      const Icon(Icons.picture_as_pdf_outlined, color: AppColors.primary, size: 20),
                    const SizedBox(width: 10),
                    Text(
                      _exportPdf ? 'Génération...' : 'Exporter le bilan en PDF',
                      style: const TextStyle(
                          color: AppColors.primary, fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ]),
                ),
              ),
              const SizedBox(height: 28),

              // Transactions du jour
              const Text('TRANSACTIONS DU JOUR', style: TextStyle(
                  fontSize: 11, color: AppColors.textMuted, fontWeight: FontWeight.w600, letterSpacing: 1.2)),
              const SizedBox(height: 10),

              if (toutes.isEmpty)
                Container(
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: const Center(
                    child: Text('Aucune transaction aujourd\'hui',
                        style: TextStyle(color: AppColors.textMuted)),
                  ),
                )
              else
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(children: toutes.asMap().entries.map((e) => TxRow(
                    nom: e.value.nomEtudiant,
                    sub: '${e.value.matricule} · ${DateFormat('HH:mm').format(e.value.date)}',
                    montant: e.value.montant,
                    isDepot: e.value.type == 'rechargement',
                    isLast: e.key == toutes.length - 1,
                  )).toList()),
                ),
            ]),
          ),
        );
      }),
    );
  }

  Widget _carteStats({required IconData icon, required String label,
      required String valeur, required String sous, required Color couleur}) =>
    Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 36, height: 36,
          decoration: BoxDecoration(
            color: couleur.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: couleur, size: 20),
        ),
        const SizedBox(height: 12),
        Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
        const SizedBox(height: 4),
        Text(valeur, style: const TextStyle(
            color: AppColors.textPrimary, fontSize: 26, fontWeight: FontWeight.bold)),
        Text(sous, style: TextStyle(color: couleur, fontSize: 12, fontWeight: FontWeight.w500)),
      ]),
    );
}
