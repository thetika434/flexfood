import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'app_state.dart';
import 'common.dart';
import 'scan_screen.dart';
import 'depot_screen.dart';
import 'bilan_screen.dart';

class AccueilScreen extends StatefulWidget {
  const AccueilScreen({super.key});
  @override
  State<AccueilScreen> createState() => _AccueilScreenState();
}

class _AccueilScreenState extends State<AccueilScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AppState>().chargerBilan();
  }

  Future<void> _aller(Widget ecran) async {
    await Navigator.push(context, MaterialPageRoute(builder: (_) => ecran));
    if (mounted) context.read<AppState>().chargerBilan();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final nbrRepas = state.transactions.where((t) => t.type == 'repas').length;
    final totalRecharge = state.totalRechargements;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        titleSpacing: 20,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Bonjour,',
            style: TextStyle(color: AppColors.textMuted, fontSize: 12, fontWeight: FontWeight.normal),
          ),
          if (state.agentNom.isNotEmpty)
            Text(
              state.agentNom,
              style: const TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.bold),
            ),
        ]),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: const Icon(Icons.logout_outlined, color: AppColors.primary),
              tooltip: 'Déconnexion',
              onPressed: () => _confirmerLogout(context),
            ),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: AppColors.border),
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

            // Statistiques rapides
            Row(children: [
              Expanded(child: _statCard(
                icon: Icons.restaurant_outlined,
                label: 'Repas débités',
                value: '$nbrRepas',
                color: AppColors.primary,
              )),
              const SizedBox(width: 12),
              Expanded(child: _statCard(
                icon: Icons.account_balance_wallet_outlined,
                label: 'Total rechargé',
                value: fmtFCFA(totalRecharge),
                color: AppColors.success,
              )),
            ]),

            const SizedBox(height: 28),
            const Text(
              'ACTIONS',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.textMuted,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),

            // Débiter + Recharger côte à côte
            Row(children: [
              Expanded(child: _actionCard(
                icon: Icons.qr_code_scanner,
                label: 'Débiter',
                sub: 'Scanner un repas',
                color: AppColors.primary,
                onTap: () => _aller(const ScanScreen()),
              )),
              const SizedBox(width: 12),
              Expanded(child: _actionCard(
                icon: Icons.add_circle_outline,
                label: 'Recharger',
                sub: 'Ajouter du crédit',
                color: const Color(0xFF006E2A),
                onTap: () => _aller(const DepotScreen()),
              )),
            ]),

            const SizedBox(height: 12),

            // Bilan pleine largeur
            _actionCardWide(
              icon: Icons.bar_chart_outlined,
              label: 'Bilan du jour',
              sub: 'Statistiques et export PDF',
              onTap: () => _aller(const BilanScreen()),
            ),
          ]),
      ),
    );
  }

  Widget _statCard({required IconData icon, required String label,
      required String value, required Color color}) =>
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
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(height: 12),
        Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
        const SizedBox(height: 4),
        Text(value, style: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.bold)),
      ]),
    );

  Widget _actionCard({required IconData icon, required String label,
      required String sub, required Color color, required VoidCallback onTap}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: color.withValues(alpha: 0.3), blurRadius: 12, offset: const Offset(0, 4))],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: 44, height: 44,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 22),
          ),
          const SizedBox(height: 20),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(sub, style: TextStyle(color: Colors.white.withValues(alpha: 0.75), fontSize: 12)),
        ]),
      ),
    );

  Widget _actionCardWide({required IconData icon, required String label,
      required String sub, required VoidCallback onTap}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 8, offset: const Offset(0, 2))],
        ),
        child: Row(children: [
          Container(
            width: 48, height: 48,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.bar_chart_outlined, color: AppColors.primary, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label, style: const TextStyle(
                color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 3),
            Text(sub, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
          ])),
          const Icon(Icons.chevron_right, color: AppColors.textMuted, size: 20),
        ]),
      ),
    );

  void _confirmerLogout(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Déconnexion', style: TextStyle(fontWeight: FontWeight.bold)),
        content: const Text('Voulez-vous vous déconnecter ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Annuler', style: TextStyle(color: AppColors.textMuted)),
          ),
          ElevatedButton(
            onPressed: () { Navigator.pop(ctx); ctx.read<AppState>().logout(); },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              minimumSize: const Size(0, 40),
            ),
            child: const Text('Déconnexion', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
