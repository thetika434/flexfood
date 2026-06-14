import 'package:bcrypt/bcrypt.dart';
import 'package:orm/orm.dart';
import 'package:backend/generated/prisma/client.dart';
import 'package:backend/generated/prisma/prisma.dart';

void main() async {
  final prisma = PrismaClient(
    datasourceUrl:
        'postgresql://flexfood_user:flexfood2024@localhost:5432/flexfood',
  );

  final etudiants = [
    {
      'matricule': '25-ESATIC0769WM',
      'nom': 'Kone',
      'prenom': 'Mohamed Dia',
      'code': '1341',
      'solde': 5000,
    },
  ];

  for (final e in etudiants) {
    final matricule = e['matricule'] as String;
    final hash = BCrypt.hashpw(e['code'] as String, BCrypt.gensalt());
    final codeQr = 'FLEXFOOD-$matricule-${DateTime.now().millisecondsSinceEpoch}';

    try {
      await prisma.etudiant.upsert(
        where: EtudiantWhereUniqueInput(matricule: matricule),
        create: PrismaUnion.$1(EtudiantCreateInput(
          matricule: matricule,
          nom: e['nom'] as String,
          prenom: e['prenom'] as String,
          solde: e['solde'] as int,
          codeSecret: hash,
          codeQr: codeQr,
        )),
        update: PrismaUnion.$1(EtudiantUpdateInput(
          nom: PrismaUnion.$1(e['nom'] as String),
          prenom: PrismaUnion.$1(e['prenom'] as String),
        )),
      );
      print('✅ ${e['prenom']} ${e['nom']} ($matricule) ajouté');
    } catch (err) {
      print('❌ Erreur pour $matricule : $err');
    }
  }

  await prisma.$disconnect();
  print('\nTerminé !');
}
