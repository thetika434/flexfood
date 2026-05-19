import 'package:flutter/material.dart';
import 'theme.dart';

// ─── Badge statut ────────────────────────────────────────────────────────────
class StatusBadge extends StatelessWidget {
  final String label;
  final Color color;
  final Color bg;
  const StatusBadge({super.key, required this.label, required this.color, required this.bg});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
    child: Text(label, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w600)),
  );
}

// ─── Carte info ──────────────────────────────────────────────────────────────
class InfoCard extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;
  const InfoCard({super.key, required this.label, required this.value, this.valueColor = AppColors.textPrimary});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.border),
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
      const SizedBox(height: 4),
      Text(value, style: TextStyle(color: valueColor, fontSize: 20, fontWeight: FontWeight.bold)),
    ]),
  );
}

// ─── Banner créneau ──────────────────────────────────────────────────────────
class CreneauBanner extends StatelessWidget {
  final Map<String, dynamic>? creneau;
  const CreneauBanner({super.key, required this.creneau});

  @override
  Widget build(BuildContext context) {
    if (creneau != null) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.successBg,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.success.withValues(alpha: 0.4)),
        ),
        child: Row(children: [
          Container(width: 8, height: 8,
              decoration: const BoxDecoration(color: AppColors.success, shape: BoxShape.circle)),
          const SizedBox(width: 10),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('${creneau!['emoji']} ${creneau!['nom']} en cours',
                style: const TextStyle(color: AppColors.primary, fontSize: 13, fontWeight: FontWeight.w600)),
            Text('${creneau!['debut']} – ${creneau!['fin']} · ${creneau!['prix']} FCFA',
                style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
          ])),
          StatusBadge(label: 'Actif', color: AppColors.success, bg: AppColors.successBg),
        ]),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surfaceVar,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: const Row(children: [
        Icon(Icons.lock_clock_outlined, color: AppColors.neutral, size: 18),
        SizedBox(width: 20),
        Text('Hors créneau — scan désactivé',
            style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
      ]),
    );
  }
}

// ─── Ligne transaction ───────────────────────────────────────────────────────
class TxRow extends StatelessWidget {
  final String nom;
  final String sub;
  final int montant;
  final bool isDepot;
  final bool isLast;
  const TxRow({super.key, required this.nom, required this.sub,
    required this.montant, required this.isDepot, this.isLast = false});

  String _fmt(int m) => '${m.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (m) => '${m[1]} ')} FCFA';

  @override
  Widget build(BuildContext context) => Column(children: [
    ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: isDepot ? AppColors.successBg : AppColors.primary.withValues(alpha: 0.1),
        child: Icon(isDepot ? Icons.add : Icons.remove,
            color: isDepot ? AppColors.success : AppColors.primary, size: 18),
      ),
      title: Text(nom, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textPrimary)),
      subtitle: Text(sub, style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
      trailing: Text(
        '${isDepot ? '+' : '-'}${_fmt(montant)}',
        style: TextStyle(
          fontSize: 13, fontWeight: FontWeight.w600,
          color: isDepot ? AppColors.success : AppColors.primary,
        ),
      ),
    ),
    if (!isLast) const Divider(height: 1, indent: 14, endIndent: 14),
  ]);
}

// ─── Formatteur montant ───────────────────────────────────────────────────────
String fmtFCFA(int m) =>
    '${m.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (x) => '${x[1]} ')} FCFA';