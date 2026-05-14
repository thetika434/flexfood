import 'package:orm/orm.dart';
import 'package:backend/generated/prisma/client.dart';
import 'package:backend/generated/prisma/prisma.dart';

class ServiceTransactions {
  ServiceTransactions(this._prisma);

  final PrismaClient _prisma;

  Future<List<Map<String, dynamic>>> obtenirHistorique(int etudiantId) async {
    final transactions = await _prisma.transaction.findMany(
      where: TransactionWhereInput(
        etudiantId: PrismaUnion.$2(etudiantId),
      ),
      orderBy: PrismaUnion.$2(
        TransactionOrderByWithRelationInput(dateHeure: SortOrder.desc),
      ),
    );

    return transactions
        .map(
          (t) => {
            'id': t.id,
            'type': t.type,
            'montant': t.montant,
            'dateHeure': t.dateHeure?.toIso8601String(),
            'autrePartiMatricule': t.autrePartiMatricule,
            'service': t.service,
          },
        )
        .toList();
  }

  Future<Map<String, dynamic>> effectuerTransfert(
    int etudiantEmetteurId,
    String matriculeDestinataire,
    int montant,
  ) async {
    final emetteur = await _prisma.etudiant.findUnique(
      where: EtudiantWhereUniqueInput(id: etudiantEmetteurId),
    );
    if (emetteur == null) throw Exception('Émetteur introuvable');

    if ((emetteur.solde ?? 0) < montant) {
      throw SoldeInsuffisantException();
    }

    final destinataire = await _prisma.etudiant.findUnique(
      where: EtudiantWhereUniqueInput(matricule: matriculeDestinataire),
    );
    if (destinataire == null) throw Exception('Destinataire introuvable');

    final maintenant = DateTime.now();
    final idEnvoye = '#${_genererIdTransaction()}';
    final idRecu = '#${_genererIdTransaction()}';

    // Bloc atomique : soit tout réussit, soit tout est annulé
    await _prisma.$transaction((tx) async {
      await tx.etudiant.update(
        where: EtudiantWhereUniqueInput(id: etudiantEmetteurId),
        data: PrismaUnion.$1(
          EtudiantUpdateInput(
            solde: PrismaUnion.$1((emetteur.solde ?? 0) - montant),
          ),
        ),
      );

      await tx.etudiant.update(
        where: EtudiantWhereUniqueInput(id: destinataire.id),
        data: PrismaUnion.$1(
          EtudiantUpdateInput(
            solde: PrismaUnion.$1((destinataire.solde ?? 0) + montant),
          ),
        ),
      );

      await tx.transaction.create(
        data: PrismaUnion.$1(
          TransactionCreateInput(
            id: idEnvoye,
            type: 'transfert_envoye',
            montant: -montant,
            dateHeure: maintenant,
            autrePartiMatricule: PrismaUnion.$1(matriculeDestinataire),
            etudiant: EtudiantCreateNestedOneWithoutTransactionsInput(
              connect: EtudiantWhereUniqueInput(id: etudiantEmetteurId),
            ),
          ),
        ),
      );

      await tx.transaction.create(
        data: PrismaUnion.$1(
          TransactionCreateInput(
            id: idRecu,
            type: 'transfert_recu',
            montant: montant,
            dateHeure: maintenant,
            autrePartiMatricule: PrismaUnion.$1(emetteur.matricule!),
            etudiant: EtudiantCreateNestedOneWithoutTransactionsInput(
              connect: EtudiantWhereUniqueInput(id: destinataire.id),
            ),
          ),
        ),
      );
    });

    return {
      'id': idEnvoye,
      'type': 'transfert_envoye',
      'montant': -montant,
      'dateHeure': maintenant.toIso8601String(),
      'autrePartiMatricule': matriculeDestinataire,
    };
  }

  int _compteur = 0;

  String _genererIdTransaction() {
    _compteur++;
    final ms = DateTime.now().millisecondsSinceEpoch;
    return (ms * 10 + _compteur % 10).toString().substring(6);
  }
}

class SoldeInsuffisantException implements Exception {
  @override
  String toString() => 'Solde insuffisant';
}
