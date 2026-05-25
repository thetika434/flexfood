import 'package:flutter/material.dart';
import 'theme.dart';

// ─── Ligne transaction ───────────────────────────────────────────────────────
class TxRow extends StatelessWidget {
  final String nom;
  final String sub;
  final int montant;
  final bool isDepot;
  final bool isLast;
  const TxRow({super.key, required this.nom, required this.sub,
    required this.montant, required this.isDepot, this.isLast = false});

  @override
  Widget build(BuildContext context) => Column(children: [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(children: [
        Container(
          width: 40, height: 40,
          decoration: BoxDecoration(
            color: isDepot
                ? AppColors.successBg
                : AppColors.primary.withValues(alpha: 0.08),
            shape: BoxShape.circle,
          ),
          child: Icon(
            isDepot ? Icons.add : Icons.restaurant_outlined,
            color: isDepot ? AppColors.success : AppColors.primary,
            size: 18,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(nom, style: const TextStyle(
              fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textPrimary)),
          const SizedBox(height: 2),
          Text(sub, style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
        ])),
        Text(
          '${isDepot ? '+' : '-'}${fmtFCFA(montant)}',
          style: TextStyle(
            fontSize: 13, fontWeight: FontWeight.w600,
            color: isDepot ? AppColors.success : AppColors.error,
          ),
        ),
      ]),
    ),
    if (!isLast) const Divider(height: 1, indent: 16, endIndent: 16, color: AppColors.border),
  ]);
}

// ─── Formatteur montant ───────────────────────────────────────────────────────
String fmtFCFA(int m) =>
    '${m.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (x) => '${x[1]} ')} FCFA';
