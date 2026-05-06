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
        return Icons.send;
      case TypeTransaction.transfertRecu:
        return Icons.south_west;
    }
  }

  Color _obtenirCouleurFondIcone() {
    switch (transaction.type) {
      case TypeTransaction.repas:
        return Couleurs.fondIconeRepas;
      case TypeTransaction.rechargement:
        return Couleurs.fondIconeRechargement;
      case TypeTransaction.transfertRecu:
        return Couleurs.fondIconeTransfertRecu;
      case TypeTransaction.transfertEnvoye:
        return Couleurs.fondIconeTransfertEnvoye;
    }
  }

  Color _obtenirCouleurSymbole() {
    switch (transaction.type) {
      case TypeTransaction.repas:
        return Couleurs.iconeRepas;
      case TypeTransaction.rechargement:
        return Couleurs.iconeRechargement;
      case TypeTransaction.transfertRecu:
        return Couleurs.iconeTransfertRecu;
      case TypeTransaction.transfertEnvoye:
        return Couleurs.iconeTransfertEnvoye;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAppui,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Couleurs.blanc,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Couleurs.surfaceContainer, width: 1),
          boxShadow: const [
            BoxShadow(
              color: Color(0x05000000),
              blurRadius: 20,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _obtenirCouleurFondIcone(),
              ),
              child: Icon(_obtenirIcone(), color: _obtenirCouleurSymbole(), size: 20),
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
