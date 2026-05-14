import 'package:bcrypt/bcrypt.dart';
import 'package:orm/orm.dart';
import 'package:backend/generated/prisma/client.dart';
import 'package:backend/generated/prisma/prisma.dart';

final prisma = PrismaClient(
  datasourceUrl:
      'postgresql://flexfood_user:flexfood2024@localhost:5432/flexfood',
);

Future<void> main() async {
  print('Début du seed...');

  await _insererEtudiants();
  await _insererTransactions();

  await prisma.$disconnect();
  print('Seed terminé avec succès.');
}

Future<void> _insererEtudiants() async {
  final etudiants = [
    (
      matricule: '21-ESATIC-0045',
      nom: 'Thetika',
      prenom: 'Josua',
      solde: 10000,
      codeQr: 'FLEXFOOD-21-ESATIC-0045-a1b2c3d4',
      pin: '1234',
    ),
    (
      matricule: '22-ESATIC-0012',
      nom: 'Diallo',
      prenom: 'Kyra',
      solde: 5500,
      codeQr: 'FLEXFOOD-22-ESATIC-0012-b2c3d4e5',
      pin: '5678',
    ),
    (
      matricule: '21-ESATIC-0456',
      nom: 'Kouassi',
      prenom: 'Maman',
      solde: 2000,
      codeQr: 'FLEXFOOD-21-ESATIC-0456-c3d4e5f6',
      pin: '4321',
    ),
    (
      matricule: '23-ESATIC-0987',
      nom: 'Thetika',
      prenom: 'David',
      solde: 8000,
      codeQr: 'FLEXFOOD-23-ESATIC-0987-d4e5f6a7',
      pin: '1111',
    ),
    (
      matricule: '22-ESATIC-0543',
      nom: 'Gondo',
      prenom: 'Arnaud',
      solde: 3500,
      codeQr: 'FLEXFOOD-22-ESATIC-0543-e5f6a7b8',
      pin: '2222',
    ),
    (
      matricule: '20-ESATIC-0123',
      nom: 'Jay',
      prenom: 'Noah',
      solde: 1500,
      codeQr: 'FLEXFOOD-20-ESATIC-0123-f6a7b8c9',
      pin: '3333',
    ),
  ];

  for (final e in etudiants) {
    final hash = BCrypt.hashpw(e.pin, BCrypt.gensalt());
    await prisma.etudiant.upsert(
      where: EtudiantWhereUniqueInput(matricule: e.matricule),
      create: PrismaUnion.$1(
        EtudiantCreateInput(
          matricule: e.matricule,
          nom: e.nom,
          prenom: e.prenom,
          solde: e.solde,
          codeSecret: hash,
          codeQr: e.codeQr,
        ),
      ),
      update: PrismaUnion.$1(
        EtudiantUpdateInput(
          solde: PrismaUnion.$1(e.solde),
        ),
      ),
    );
    print('  ✓ ${e.prenom} ${e.nom} (${e.matricule})');
  }
}

Future<void> _insererTransactions() async {
  final etudiant = await prisma.etudiant.findUnique(
    where: EtudiantWhereUniqueInput(matricule: '21-ESATIC-0045'),
  );

  if (etudiant == null) {
    print('Étudiant principal introuvable');
    return;
  }

  final transactions = [
    (
      id: '#4503',
      type: 'transfert_recu',
      montant: 500,
      dateHeure: DateTime.now().subtract(const Duration(hours: 14)),
      autrePartiMatricule: '22-ESATIC-0012' as String?,
      service: null as String?,
    ),
    (
      id: '#4502',
      type: 'repas',
      montant: -200,
      dateHeure: DateTime(2025, 10, 25, 12, 45),
      autrePartiMatricule: null as String?,
      service: 'midi' as String?,
    ),
    (
      id: '#4501',
      type: 'rechargement',
      montant: 5000,
      dateHeure: DateTime(2025, 10, 25, 9, 12),
      autrePartiMatricule: null as String?,
      service: null as String?,
    ),
    (
      id: '#4500',
      type: 'transfert_envoye',
      montant: -200,
      dateHeure: DateTime(2025, 10, 24, 11, 30),
      autrePartiMatricule: '22-ESATIC-0012' as String?,
      service: null as String?,
    ),
    (
      id: '#4499',
      type: 'repas',
      montant: -200,
      dateHeure: DateTime(2025, 10, 24, 12, 45),
      autrePartiMatricule: null as String?,
      service: 'midi' as String?,
    ),
    (
      id: '#4498',
      type: 'transfert_envoye',
      montant: -1200,
      dateHeure: DateTime(2025, 10, 23, 18, 30),
      autrePartiMatricule: '22-ESATIC-0012' as String?,
      service: null as String?,
    ),
    (
      id: '#4497',
      type: 'repas',
      montant: -100,
      dateHeure: DateTime(2025, 10, 23, 7, 45),
      autrePartiMatricule: null as String?,
      service: 'matin' as String?,
    ),
  ];

  for (final t in transactions) {
    await prisma.transaction.upsert(
      where: TransactionWhereUniqueInput(id: t.id),
      create: PrismaUnion.$1(
        TransactionCreateInput(
          id: t.id,
          type: t.type,
          montant: t.montant,
          dateHeure: t.dateHeure,
          autrePartiMatricule: t.autrePartiMatricule != null
              ? PrismaUnion.$1(t.autrePartiMatricule!)
              : null,
          service:
              t.service != null ? PrismaUnion.$1(t.service!) : null,
          etudiant: EtudiantCreateNestedOneWithoutTransactionsInput(
            connect: EtudiantWhereUniqueInput(id: etudiant.id),
          ),
        ),
      ),
      update: PrismaUnion.$1(TransactionUpdateInput()),
    );
    print('  ✓ ${t.id} (${t.type})');
  }
}
