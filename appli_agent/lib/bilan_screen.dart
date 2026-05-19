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
  bool _exportPdf = false;
  bool _refreshing = false;

  Future<void> _actualiser() async {
    setState(() => _refreshing = true);
    await context.read<AppState>().chargerBilan();
    if (mounted) setState(() => _refreshing = false);
  }

  Future<void> _genPDF(AppState state) async {
    setState(() => _exportPdf = true);
    try {
      final logoEsatic = await imageFromAssetBundle('assets/logo_esatic.png');
      final logoFlexFood = await imageFromAssetBundle('assets/FLEX.png');

      final rechargements = state.listeRechargements;
      final totRecharge = state.totalRechargements;
      final nbrRecharge = rechargements.length;
      final nbrRepas = state.transactions.where((t) => t.type == 'repas').length;
      final today = DateFormat('dd/MM/yyyy').format(DateTime.now());
      final strNbr = '${nbrRecharge < 10 ? '0' : ''}$nbrRecharge DÉPÔTS';

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
          pw.Divider(color: PdfColor.fromHex('1B5E20'), thickness: 2),
          pw.SizedBox(height: 30),

          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              _pdfBox('Repas servis', '$nbrRepas REPAS', PdfColor.fromHex('00C853'), PdfColor.fromHex('E8F5E9')),
              pw.SizedBox(width: 40),
              _pdfBox('Total dépôts', strNbr, PdfColor.fromHex('00C853'), PdfColor.fromHex('E8F5E9')),
              pw.SizedBox(width: 40),
              _pdfBox('Solde rechargé', '+ ${fmtFCFA(totRecharge)}', PdfColor.fromHex('00C853'), PdfColor.fromHex('E8F5E9')),
            ],
          ),
          pw.SizedBox(height: 40),

          pw.Text('Détail des dépôts',
              style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex('1B5E20'))),
          pw.SizedBox(height: 12),
          if (rechargements.isEmpty)
            pw.Container(
              padding: const pw.EdgeInsets.all(16),
              decoration: pw.BoxDecoration(border: pw.Border.all(color: PdfColors.grey300),
                  borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8))),
              child: pw.Center(child: pw.Text('Aucun dépôt aujourd\'hui',
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
                  decoration: pw.BoxDecoration(color: PdfColor.fromHex('1B5E20')),
                  children: ['Étudiant', 'Matricule', 'Heure', 'Montant'].map((h) =>
                    pw.Padding(padding: const pw.EdgeInsets.all(8),
                      child: pw.Text(h, style: pw.TextStyle(
                          color: PdfColors.white, fontWeight: pw.FontWeight.bold, fontSize: 10))),
                  ).toList(),
                ),
                ...rechargements.asMap().entries.map((e) {
                  final t = e.value;
                  final bg = e.key % 2 == 0 ? PdfColors.white : PdfColor.fromHex('F9FBF9');
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

      final bytes = await pdf.save();
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
      decoration: pw.BoxDecoration(color: bg,
          borderRadius: const pw.BorderRadius.all(pw.Radius.circular(12))),
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
        title: const Text('Bilan du jour'),
        actions: [
          IconButton(
            icon: _refreshing
                ? const SizedBox(width: 18, height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                : const Icon(Icons.refresh),
            tooltip: 'Actualiser',
            onPressed: _refreshing ? null : _actualiser,
          ),
        ],
      ),
      body: Consumer<AppState>(builder: (_, state, __) {
        final totalRepas = state.totalRepas;
        final totalRecharge = state.totalRechargements;
        final nbrRepas = state.transactions.where((t) => t.type == 'repas').length;
        final nbrRecharge = state.listeRechargements.length;
        final toutes = state.transactions;

        return RefreshIndicator(
          onRefresh: _actualiser,
          color: AppColors.primary,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Aujourd\'hui · ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                  style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
              const SizedBox(height: 12),

              // Stats
              Row(children: [
                Expanded(child: _statCard(
                  icon: Icons.restaurant, label: 'Repas servis',
                  value: '$nbrRepas', sub: '- ${fmtFCFA(totalRepas)}',
                  color: AppColors.primary,
                )),
                const SizedBox(width: 12),
                Expanded(child: _statCard(
                  icon: Icons.add_circle_outline, label: 'Dépôts',
                  value: '$nbrRecharge', sub: '+ ${fmtFCFA(totalRecharge)}',
                  color: AppColors.success,
                )),
              ]),
              const SizedBox(height: 20),

              // Bouton PDF
              OutlinedButton.icon(
                onPressed: _exportPdf ? null : () => _genPDF(state),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: const BorderSide(color: AppColors.primary, width: 1.5),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                icon: _exportPdf
                    ? const SizedBox(width: 18, height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary))
                    : const Icon(Icons.picture_as_pdf_outlined),
                label: Text(_exportPdf ? 'Génération du PDF...' : 'Exporter le bilan en PDF'),
              ),
              const SizedBox(height: 24),

              // Liste de toutes les transactions
              const Text('Transactions du jour', style: TextStyle(
                  color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),

              if (toutes.isEmpty)
                const Card(child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(child: Text('Aucune transaction aujourd\'hui',
                      style: TextStyle(color: AppColors.textMuted))),
                ))
              else
                Card(child: Column(children: toutes.asMap().entries.map((e) => TxRow(
                  nom: e.value.nomEtudiant,
                  sub: '${e.value.matricule} · ${DateFormat('HH:mm').format(e.value.date)}',
                  montant: e.value.montant,
                  isDepot: e.value.type == 'rechargement',
                  isLast: e.key == toutes.length - 1,
                )).toList())),
            ]),
          ),
        );
      }),
    );
  }

  Widget _statCard({required IconData icon, required String label,
      required String value, required String sub, required Color color}) =>
    Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
        const SizedBox(height: 4),
        Text(value, style: TextStyle(color: color, fontSize: 26, fontWeight: FontWeight.bold)),
        Text(sub, style: TextStyle(color: color, fontSize: 12)),
      ]),
    );
}
