import 'package:flutter/material.dart';
import '../constantes/couleurs.dart';
import '../constantes/dimensions.dart';
import '../constantes/styles_texte.dart';
import '../modeles/transaction.dart';
import '../utilitaires/formateur.dart';

class ElementTransaction extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback? onAppui;

  const ElementTransaction({
    super.key,
    required this.transaction,
    this.onAppui,
  });

  IconData _obtenirIcone() {
    switch (transaction.type) {
      case TypeTransaction.repas:
        return Icons.restaurant;
      case TypeTransaction.rechargement:
        return Icons.account_balance_wallet;
      case TypeTransaction.transfertEnvoye:
        return Icons.arrow_forward_ios;
      case TypeTransaction.transfertRecu:
        return Icons.arrow_back_ios;
    }
  }

  Color _obtenirCouleurIcone() {
    switch (transaction.type) {
      case TypeTransaction.transfertEnvoye:
        return Couleurs.iconeGrise;
      default:
        return Couleurs.vertVif;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAppui,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.espaceM,
          vertical: Dimensions.espaceM,
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _obtenirCouleurIcone(),
              ),
              child: Icon(_obtenirIcone(), color: Couleurs.blanc, size: 20),
            ),
            const SizedBox(width: Dimensions.espaceM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.titre,
                    style: StylesTexte.corps
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    Formateur.formaterDate(transaction.dateHeure),
                    style: StylesTexte.corpsSecondaire
                        .copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
            Text(
              Formateur.formaterMontantTransaction(transaction.montant),
              style: transaction.estPositif
                  ? StylesTexte.montantPositif
                  : StylesTexte.montantNegatif,
            ),
          ],
        ),
      ),
    );
  }
}
